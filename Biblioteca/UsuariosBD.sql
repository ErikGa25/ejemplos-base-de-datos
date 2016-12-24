/* Crear un nuevo usuario */
CREATE USER 'Usuario'@'localhost' IDENTIFIED BY 'password';
/* El usuario tendra todos los privilegios */
GRANT ALL PRIVILEGES ON * . * TO 'Usuario'@'localhost';
/* El usuario solo puede crear tablas o bases de datos, insertar registros en las tablas y consultar los registros de las tablas  */
GRANT CREATE, INSERT, SELECT ON * . * TO 'Usuario'@'localhost';
/* El usuario solo puede crear tablas, insertar registros en las tablas y consultar los registros de las tablas de una BD especifica  */
GRANT CREATE, INSERT, SELECT ON nombre_bd . * TO 'Usuario'@'localhost';
/* Refresca los privilegios */
FLUSH PRIVILEGES;
/* Eliminar un usuario */
DROP USER 'Usuario'@'localhost';