CREATE TABLE invitado(
	nro_invitado SERIAL,
	nombre_invitado VARCHAR(450) NOT NULL,
	categoria_invitado VARCHAR(100),
	origen_invitado VARCHAR(200),
	CONSTRAINT pk_invitado
		PRIMARY KEY (nro_invitado)
);

CREATE TABLE teatro(
	cod_teatro SERIAL,
	nombre_teatro VARCHAR(450) NOT NULL,
	direccion_teatro VARCHAR(450) NOT NULL,
	cant_asientos_teatro INTEGER,
	CONSTRAINT pk_teatro
		PRIMARY KEY (cod_teatro)
);

CREATE TABLE obra(
	cod_obra SERIAL,
	nombre_obra VARCHAR(450) NOT NULL,
	nombre_autor VARCHAR(450) NOT NULL,
	CONSTRAINT pk_obra
		PRIMARY KEY (cod_obra)
);

CREATE TABLE exhibe(
	cod_teatro SERIAL,
	fecha_exhibicion DATE NOT NULL,
	cod_obra INTEGER,
	CONSTRAINT pk_exhibe
		PRIMARY KEY (fecha_exhibicion),
	CONSTRAINT pk_exhibe
		PRIMARY KEY (cod_teatro)
);

CREATE TABLE tipo_asiento(
	tipo_asiento VARCHAR(100) NOT NULL,
	nombre_asiento VARCHAR(100),
	descripcion TEXT,
	CONSTRAINT pk_tipo_asiento
		PRIMARY KEY (tipo_asiento)
);

CREATE TABLE asiento_tipo(
	n_asiento SERIAL,
	tipo_asiento VARCHAR(100) NOT NULL,
	CONSTRAINT pk_asiento_tipo
		PRIMARY KEY (n_asiento)
);

CREATE TABLE precio(
	cod_teatro SERIAL,
	fecha_exhibicion DATE NOT NULL,
	tipo_asiento VARCHAR(100) NOT NULL,
	precio REAL
);

CREATE TABLE entrada(
	cod_teatro SERIAL,
	fecha_exhibicion DATE NOT NULL,
	n_asiento INTEGER,
	nro_invitado INTEGER
);

ALTER TABLE exhibe ADD FOREIGN KEY (cod_teatro) REFERENCES teatro;
ALTER TABLE exhibe ADD FOREIGN KEY (cod_obra) REFERENCES obra;

ALTER TABLE asiento_tipo ADD FOREIGN KEY (tipo_asiento) REFERENCES tipo_asiento;

ALTER TABLE precio ADD FOREIGN KEY (cod_teatro) REFERENCES exhibe;
ALTER TABLE precio ADD FOREIGN KEY (fecha_exhibicion) REFERENCES exhibe;
ALTER TABLE precio ADD FOREIGN KEY (tipo_asiento) REFERENCES tipo_asiento;

ALTER TABLE entrada ADD FOREIGN KEY (cod_teatro) REFERENCES exhibe;
ALTER TABLE entrada ADD FOREIGN KEY (fecha_exhibicion) REFERENCES exhibe;
ALTER TABLE entrada ADD FOREIGN KEY (n_asiento) REFERENCES asiento_tipo;
ALTER TABLE entrada ADD FOREIGN KEY (nro_invitado) REFERENCES invitado;