/* Funciones para fecha y hora */
SELECT NOW();
SELECT CURRENT_TIMESTAMP();
SELECT UNIX_TIMESTAMP();
SELECT DAYNAME(NOW()); 
SELECT DAYOFMONTH(NOW());
SELECT DAYOFWEEK(NOW());
SELECT DAYOFYEAR(NOW());
SELECT MONTHNAME(NOW());
SELECT TIME_TO_SEC('00:30:00');
SELECT SEC_TO_TIME(1800);
SELECT ADDTIME('1:00:00', '00:29:00');
SELECT SUBTIME('1:30:00', '00:15:00');
SELECT ADDDATE('2008-01-02', INTERVAL 31 DAY);
SELECT SUBDATE('2008-02-02', INTERVAL 31 DAY);
SELECT DATE_FORMAT(NOW(), '%W, %D of %M, %Y');
SELECT DATE_FORMAT(NOW(), '%Y-%M-%d %T');
SELECT DATE_FORMAT(NOW(), '%d-%M-%Y %T');

/* Funciones Numericas */
SELECT 7 DIV 3;
SELECT 7 MOD 3;
SELECT 7 % 3;
SELECT POWER(7, 3);   /* elevar a un exponente */
SELECT POW(7, 3);    /* elevar a un exponente */
SELECT ABS(7);     /* valor absoluto */
SELECT SIGN(-7);  /*signo */
SELECT CONV(57, 10, 16);    /* converir a diferente base */
SELECT PI();   /* valor de pi */
SELECT ROUND(PI());    /* redondear */
SELECT TRUNCATE(PI(), 3);
SELECT CEIL(PI());    /*redondear hacia arriba*/
SELECT FLOOR(PI());    /* redondear hacia abajo */
SELECT RAND();    /* número aleatorio*/

/* Longitud */
LENGTH(campo);     /* Longitud del campo - número de bytes */
CHAR_LENGTH(campo);   /* Longitud del campo - número de caracteres */


/*
Para obtener subcadenas
primeros 3 caracteres - LEFT
últimos 3 caracteres - RIGHT
apartir del segundo carácter mostrara los siguientes 3 caracteres - MID
*/
LEFT(campo, 3);
RIGHT(campo, 3);
MID(campo, 2, 3);


/* Funciones de caracteres */
UPPER(campo);  /* convertir caracteres a mayusculas */
LOWER(campo);  /* convertir caracteres a minusculas */
CONCAT(campo1, campo2);   /* unir dos campos */
CONCAT_WS('-', campo1, campo2);  /* unir campos mediante algun carácter indicado */
LOCATE('palabra', campo);   /* busca un carácter o cadena dado y devuelve su posición */