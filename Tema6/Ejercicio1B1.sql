CREATE TABLE libro (
	ISBN VARCHAR(300),
	titulo_libro VARCHAR(300) NOT NULL,
	DNI_autor VARCHAR(9) NOT NULL,
	cod_genero INTEGER NOT NULL,
	cod_editorial INTEGER NOT NULL,
	CONSTRAINT pk_libro
		PRIMARY KEY (ISBN),
	CONSTRAINT fk_autor
		FOREIGN KEY (DNI_autor) REFERENCES autor
	CONSTRAINT fk_genero
		FOREIGN KEY (cod_genero) REFERENCES genero,
	CONSTRAINT fk_editorial
		FOREIGN KEY (cod_editorial)
);

CREATE TABLE autor (
	DNI_autor VARCHAR(9) NOT NULL,
	nombre_autor VARCHAR(450) NOT NULL,
	nacionalidad_autor VARCHAR(50)
);

