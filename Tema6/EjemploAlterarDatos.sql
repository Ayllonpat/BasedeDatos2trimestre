CREATE TABLE producto (
	num_producto SERIAL,
	nombre TEXT,
	precio NUMERIC,
	CONSTRAINT pk_productos PRIMARY KEY (num_producto)
);

INSERT INTO producto VALUES (1, 'Queso', 9.99);

INSERT INTO producto (num_producto, nombre, precio) VALUES (2, 'Queso',
9.99);
INSERT INTO producto (nombre, precio, num_producto) VALUES ('Queso',
9.99, 3);

INSERT INTO producto (num_producto, nombre) VALUES (4, 'Cheese');
INSERT INTO producto VALUES (5, 'Cheese');

INSERT INTO producto (num_producto, nombre, precio) VALUES (6, 'Queso', DEFAULT);
INSERT INTO producto DEFAULT VALUES;

//INSERT INTO producto (num_producto, nombre, precio)
//SELECT num_producto, nombre, precio FROM nuevos_productos
//WHERE fecha_publicacion = 'today';

SELECT *
FROM producto;

ALTER SEQUENCE producto_num_producto_seq
RESTART WITH 1000;

INSERT INTO producto (nombre, precio) VALUES ('Queso', 9.99);

UPDATE producto SET precio = 10 WHERE precio = 5;

UPDATE producto SET precio = precio * 1.10 WHERE precio > 9;

UPDATE producto SET  precio = precio * 1.10
	WHERE precio = (
		SELECT MAX(precio)
		FROM producto
);

DELETE FROM producto
WHERE num_producto = 1;