/* ---------- CREACION DE TABLAS ---------- */


CREATE TABLE MONEDA (
    id_divisa             INT NOT NULL,
    divisa_simbolo        VARCHAR(50),
    divisa_nombre         VARCHAR(60),
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

INSERT INTO MONEDA ( 
    id_divisa, 
    divisa_nombre, 
    divisa_simbolo
    )
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
    VALUES
        ('1','1','2','100','2024-04-05','1'),
        ('2','2','1','150','2024-04-06','2'),
        ('3','3','1','200','2024-04-07','3'),
        ('4','4','5','120','2024-04-08','1'),
        ('5','6','7','180','2024-04-09','2'),
        ('6','8','9','150','2024-04-10','3'),
        ('7','5','6','200','2024-04-11','1'),
        ('8','7','8','220','2024-04-12','2'),
        ('9','9','10','130','2024-04-13','3'),
        ('10','1','3','170','2024-04-14','1');

INSERT INTO USUARIO (
    id_usuario,
    nombre,
    correo_electronico,
    contrasena,
    saldo
    )
    VALUES
        ('1','Juan Pérez','juan@example.com','contraseña123','100'),
        ('2','María González','maria@example.com','password456','200'),
        ('3','Luis Ramírez','luis@example.com','clave789','150'),
        ('4','Ana Martínez','ana@example.com','password123','300'),
        ('5','Pedro López','pedro@example.com','contraseña456','250'),
        ('6','Laura Rodríguez','laura@example.com','password789','180'),
        ('7','David Sánchez','david@example.com','clave123','400'),
        ('8','Sofía García','sofia@example.com','contraseña789','350'),
        ('9','Diego Fernández','diego@example.com','password321','220'),
        ('10','Elena Pérez','elena@example.com','clave456','280');


/* ---------- FIN INSERT REGISTROS ---------- */

/* ---------- INICIO EJERCICIOS ---------- */


/* 1.- Consulta para obtener el nombre de la moneda elegida por un usuario especifico */
SELECT u.nombre AS nombre_usuario, mon.divisa_nombre
FROM USUARIO u
JOIN TRANSACCION t ON u.id_usuario = t.id_emisor OR u.id_usuario = t.id_receptor
JOIN MONEDA mon ON t.divisa_id = mon.id_divisa
WHERE u.nombre = 'Diego Fernández';--Juan Perez

/* Consulta para obtener los ID de usuario */
SELECT *
FROM USUARIO;

/* 2.- Consulta para obtener el nombre de la divisa elegida por un usuario especifico */
SELECT divisa_nombre
FROM MONEDA;
/* INNER JOIN MONEDA MON ON MON.id_divisa = USUARIO.divisa_id
WHERE USUARIO.id_usuario = 3; */


/* 3.- Consulta para obtener todas las transacciones registradas */
SELECT *
FROM TRANSACCION;

/* 4.- Consulta para obtener todas las transacciones realizadas por un usuario especifico */
SELECT *
FROM TRANSACCION
WHERE id_emisor = 1;
/* OR id_receptor = 1; */

/* 5.- Sentencia DML para modificar el campo correo electronico de un usuario especifico */
SELECT *
FROM USUARIO;
UPDATE USUARIO
SET correo_electronico = 'juan@example.com'
WHERE id_usuario = 1;

/* 6.- Sentencia para eliminar los datos de una transaccion (eliminado de la fila completa) */
SELECT *
FROM TRANSACCION;

DELETE FROM TRANSACCION
WHERE id_transaccion = 2

/* ---------- FIN EJERCICIOS ---------- */
