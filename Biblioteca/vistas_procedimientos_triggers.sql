/* PROCEDIMIENTOS */

CREATE PROCEDURE SociosSinPrestamos()
SELECT idSocio, NombreCompleto 
FROM Socio 
WHERE idSocio NOT IN (SELECT idSocio FROM Prestamo);

CREATE PROCEDURE LibrosPorTema()
SELECT L.idTema, T.NombreTema, SUM(L.NumeroEjemplares) AS Total_Por_Tema
FROM Libro AS L, Tema AS T
WHERE L.idTema = T.idTema
GROUP BY idTema;

CREATE PROCEDURE SocioInformacion(idSocioBuscado INT)
SELECT NombreCompleto, Correo, Telefono FROM Socio
WHERE idSocio = idSocioBuscado;

CALL SociosSinPrestamos();
CALL LibrosPorTema();
CALL SocioInformacion(2);

DROP PROCEDURE IF EXISTS LibrosPorTema;

/* VISTAS */

CREATE VIEW Prestasmos_Realizados AS
SELECT NombreCompleto, FechaPrestamo, FechaEntrega, Titulo 
FROM Socio 
INNER JOIN Prestamo 
INNER JOIN Libro
ON Socio.idSocio = Prestamo.idSocio 
AND Libro.idLibro = Prestamo.idLibro
ORDER BY NombreCompleto;

SELECT * FROM Prestasmos_Realizados;

DROP VIEW Prestasmos_Realizados;

/* TRIGGERS */

CREATE TRIGGER Actualizar_Libro_AU
AFTER UPDATE ON Libro 
FOR EACH ROW INSERT INTO  Actualizaciones_Libro
(
	ISBNAnterior,
	TituloAnterior,
	NumeroEjemplaresAnterior,
	ISBNNuevo,
	TituloNuevo,
	NumeroEjemplaresNuevo,
	Usuario,
	FechaModificacion
)
VALUES
(
	OLD.ISBN,
	OLD.Titulo,
	OLD.NumeroEjemplares,
	NEW.ISBN,
	NEW.Titulo,
	NEW.NumeroEjemplares,
	CURRENT_USER(),
	NOW()
);

DROP TRIGGER IF EXISTS Actualizar_Libro_AU;

SELECT * FROM Actualizar_Libro_AU;
UPDATE Libro SET Titulo = "El Lenguaje de Programación C", NumeroEjemplares = 25 WHERE IdLibro = 1;