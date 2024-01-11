CREATE TABLE libro (
	ISBN VARCHAR(300),
	titulo_libro VARCHAR(300),
	DNI_autor VARCHAR(9),
	cod_genero INTEGER,
	cod_editorial INTEGER
);

CREATE TABLE autor (
	DNI_autor VARCHAR(9),
	nombre_autor VARCHAR(450),
	nacionalidad_autor VARCHAR(50)
);

CREATE TABLE editorial (
	cod_editorial INTEGER,
	nombre_editorial VARCHAR(450),
	direccion_editorial VARCHAR(500),
	poblacion_editorial VARCHAR(300)
);

CREATE TABLE genero (
	cod_genero INTEGER,
	nombre_genero VARCHAR(300),
	descripcion VARCHAR(500)
);

CREATE TABLE edicion (
	ISBN VARCHAR(300),
	fecha_publicacion DATE,
	cantidad INTEGER
);
