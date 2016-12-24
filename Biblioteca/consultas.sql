/* Mostrar la versión de MySQL */
SELECT VERSION();
SELECT @@version;

/* Mostrar todas las bases de datos */
SHOW DATABASES;

/* Mostrar todas las tablas de una base de datos */
SHOW TABLES;

/* Mostrar la estructura de una tabla */
DESCRIBE Autor;
DESCRIBE Editorial;
DESCRIBE Tema;
DESCRIBE Socio;
DESCRIBE Libro;
DESCRIBE Prestamo;

/* Todos los socios que han realizado prestamos */
SELECT S.NombreCompleto, P.idSocio, COUNT(P.idSocio) AS NumeroPrestamos 
FROM Prestamo AS P, Socio AS S
WHERE P.idSocio = S.idSocio
GROUP BY idSocio 
ORDER BY NumeroPrestamos;

/* Socio que ha realizado mas prestamos */
SELECT S.NombreCompleto, P.idSocio, COUNT(P.idSocio) AS NumeroPrestamos 
FROM Prestamo AS P, Socio AS S
WHERE P.idSocio = S.idSocio
GROUP BY idSocio 
ORDER BY NumeroPrestamos DESC 
LIMIT 0,1;

/* Socio que ha realizado menos prestamos */
SELECT S.NombreCompleto, P.idSocio, COUNT(P.idSocio) AS NumeroPrestamos 
FROM Prestamo AS P, Socio AS S
WHERE P.idSocio = S.idSocio
GROUP BY idSocio 
ORDER BY NumeroPrestamos
LIMIT 0,1;

/* Socios que no ha realizado prestamos */
SELECT idSocio, NombreCompleto 
FROM Socio 
WHERE idSocio NOT IN (SELECT idSocio FROM Prestamo);

/* Libros que no han sido prestados */
SELECT idLibro, ISBN, Titulo 
FROM Libro 
WHERE idLibro NOT IN (SELECT idLibro FROM Prestamo);

/* Total de libros de la biblioteca */
SELECT SUM(NumeroEjemplares) AS Total_Libros FROM Libro;

/* Socios que no tiene correo */
SELECT * FROM Socio WHERE correo = '';

/* Libros con mayor y menor número de ejemplares */
SELECT Titulo, NumeroEjemplares FROM Libro WHERE NumeroEjemplares = (SELECT MAX(NumeroEjemplares) AS Mayor FROM Libro);
SELECT Titulo, NumeroEjemplares FROM Libro WHERE NumeroEjemplares = (SELECT MIN(NumeroEjemplares) AS Mayor FROM Libro);

/* Número de libros por tema */
SELECT L.idTema, T.NombreTema, SUM(L.NumeroEjemplares) AS Total_Por_Tema
FROM Libro AS L, Tema AS T
WHERE L.idTema = T.idTema
GROUP BY idTema;

/* Buscar todos los títulos que contengan la palabra Fundamentos */
SELECT * FROM Libro WHERE Titulo LIKE "%Fundamentos%";

/* Información sobre los prestamos que han realizado los socios */
SELECT NombreCompleto, FechaPrestamo, FechaEntrega, Titulo 
FROM Socio 
INNER JOIN Prestamo 
INNER JOIN Libro
ON Socio.idSocio = Prestamo.idSocio 
AND Libro.idLibro = Prestamo.idLibro
ORDER BY NombreCompleto;