-- Active: 1712327622375@@127.0.0.1@3306@alkeWallet

/* ---------- CREACION DE TABLAS ---------- */


CREATE TABLE MONEDA (
    id_divisa             INT NOT NULL,
    divisa_nombre         VARCHAR(60),
    divisa_simbolo        VARCHAR(50),
    PRIMARY KEY (id_divisa)
);

CREATE TABLE TRANSACCION (
    id_transaccion        INT,
    id_emisor             INT,
    id_receptor           INT,
    importe               INT,
    fecha_transaccion     DATE,
    divisa_id             INT,
    PRIMARY KEY (id_transaccion),
    FOREIGN KEY (id_emisor) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_receptor) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (divisa_id) REFERENCES MONEDA(id_divisa)
);

CREATE TABLE USUARIO (
    id_usuario            INT NOT NULL,
    nombre                VARCHAR(60),
    correo_electronico    VARCHAR(50),
    contrasena            VARCHAR(30),
    saldo                 INT,
    PRIMARY KEY (id_usuario)
);
/* ---------- FIN CREACION DE TABLAS ---------- */

/* ---------- INSERT REGISTROS ---------- */

INSERT INTO MONEDA ( id_divisa, divisa_nombre, divisa_simbolo)
VALUES
    (1, 'USD', 'Dólar estadounidense'),
    (2, 'EUR', 'Euro'),
    (3, 'JPY', 'Yen japonés');

INSERT INTO TRANSACCION (
    id_transaccion, 
    id_emisor,
    id_receptor,
    importe,
    fecha_transaccion,
    divisa_id
    )

/* ---------- FIN INSERT REGISTROS ---------- */

/* ---------- INICIO EJERCICIOS ---------- */


/* 1.- Consulta para obtener el nombre de la moneda elegida por un usuario específico */
SELECT u.nombre AS nombre_usuario, mon.divisa_nombre
FROM USUARIO u
JOIN TRANSACCION t ON u.id_usuario = t.id_emisor OR u.id_usuario = t.id_receptor
JOIN MONEDA mon ON t.divisa_id = mon.id_divisa
WHERE u.nombre = 'Diego Fernández';--Juan Perez

/* Consulta para obtener los ID de usuario */
SELECT *
FROM USUARIO;

/* 2.- Consulta para obtener el nombre de la divisa elegida por un usuario específico */
SELECT divisa_nombre
FROM `MONEDA`;
/* INNER JOIN MONEDA MON ON MON.id_divisa = USUARIO.divisa_id
WHERE USUARIO.id_usuario = 3; */


/* 3.- Consulta para obtener todas las transacciones registradas */
SELECT *
FROM TRANSACCION;

/* 4.- Consulta para obtener todas las transacciones realizadas por un usuario específico */

SELECT *
FROM TRANSACCION
WHERE id_emisor = 1;
/* OR id_receptor = 1; */
/* 5.- Sentencia DML para modificar el campo correo electrónico de un usuario específico */

SELECT *
FROM USUARIO;
UPDATE USUARIO
SET correo_electronico = 'juan@example.com'
WHERE id_usuario = 1;

/* 6.- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa) */

SELECT *
FROM TRANSACCION;

DELETE FROM TRANSACCION
WHERE id_transaccion = 2

/* ---------- FIN EJERCICIOS ---------- */

