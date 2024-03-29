CREATE TABLE usuarios(
	dni_usuario VARCHAR(12),
	nombre_usuario VARCHAR(100) NOT NULL,
	apellidos_usuario VARCHAR(200) NOT NULL,
	direccion_usuario VARCHAR(100),
	telefono_usuario VARCHAR(14) NOT NULL,
	email_usuario VARCHAR(250) NOT NULL,
	passw VARCHAR(8),
	saldo_disponible NUMERIC NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY (dni_usuario),
	CONSTRAINT ck_passw_entr_4_y_8
		CHECK (LENGTH(passw)BETWEEN 4 AND 8),
	CONSTRAINT ck_espacios
		CHECK (passw NOT LIKE '% %')
);
CREATE TABLE estaciones(
	cod_estacion VARCHAR(12),
	num_estaciones SERIAL,
	direccion_estaciones VARCHAR(100) NOT NULL,
	latitud NUMERIC,
	longitud NUMERIC,
	CONSTRAINT pk_estaciones PRIMARY KEY (cod_estacion),
	CONSTRAINT ck_empieza_e
		CHECK (cod_estacion NOT LIKE 'E%')
);
CREATE TABLE bicicletas(
	cod_bicicleta SERIAL,
	marca VARCHAR(100) NOT NULL,
	modelo VARCHAR(100) NOT NULL,
	fecha_alta DATE NOT NULL,
	CONSTRAINT pk_bicicletas PRIMARY KEY (cod_bicicleta)
);
CREATE TABLE uso(
	estacion_salida VARCHAR(100) NOT NULL,
	fecha_salida TIMESTAMP,
	dni_usuario VARCHAR(100) NOT NULL,
	cod_bicicleta INTEGER NOT NULL,
	estacion_llegada VARCHAR(100) NOT NULL,
	fecha_llegada TIMESTAMP NOT NULL,
	CONSTRAINT pk_uso PRIMARY KEY (estacion_salida, fecha_salida, dni_usuario,
								 cod_bicicleta, estacion_llegada)
);
ALTER TABLE usuarios ADD COLUMN fecha_baja DATE;

ALTER TABLE uso ADD CONSTRAINT fk_uso_salida FOREIGN KEY (estacion_salida) REFERENCES estaciones;

ALTER TABLE uso ADD CONSTRAINT fk_dni FOREIGN KEY (dni_usuario) REFERENCES usuarios;

ALTER TABLE uso ADD CONSTRAINT fk_uso_bicicleta FOREIGN KEY (cod_bicicleta) REFERENCES bicicletas;

ALTER TABLE uso ADD CONSTRAINT fk_uso_llegada FOREIGN KEY (estacion_llegada) REFERENCES estaciones;