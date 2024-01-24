CREATE TABLE producto(
	cod_producto SERIAL,
	nombre_producto VARCHAR(250) NOT NULL,
	descripcion_producto TEXT,
	pvp INTEGER NOT NULL, 
	categoria VARCHAR(200),
	CONSTRAINT pk_producto PRIMARY KEY (cod_producto)
);

CREATE TABLE categoria(
	id_categoria SERIAL,
	nombre_categoria VARCHAR(200) NOT NULL,
	descripcion_categoria TEXT,
	CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE trabajador(
	num_trabajador SERIAL,
	nombre_completo_trabajador VARCHAR(300) NOT NULL,
	email_trabajador VARCHAR(320),
	cuenta_corriente_trabajador VARCHAR(24),
	pass_trabajador VARCHAR(12),
	CONSTRAINT pk_trabajador PRIMARY KEY (num_trabajador),
	CONSTRAINT ck_email_trabajador CHECK (email_trabajador) 
	IS LIKE (%@%),
	CONSTRAINT ck_cuenta_corriente_trabajador_caracteres CHECK (cuenta_corriente_trabajador) = 24,
	CONSTRAINT ck_cuenta_corriente_trabajador_empezar CHECK (cuenta_corriente_trabajador) IS LIKE(ES%),	
	CONSTRAINT ck_trabajador_pass CHECK (pass_trbajador) IS NOT(%_%)
);

CREATE TABLE pedido(
	cod_pedido SERIAL,
	fecha_pedido DATE NOT NULL,
	num_trabajador INTEGER NOT NULL,
	dni_comprador VARCHAR(9) NOT NULL,
	CONSTRAINT pk_pedido PRIMARY KEY num_trabajador
);

CREATE TABLE detalle_pedido(
	cod_pedido INTEGER,
	num_detalle SERIAL,
	cantidad INTEGER, 
	cod_producto INTEGER,
	precio FLOAT NOT NULL,
	descuento FLOAT DEFAULT 0 NOT NULL,
	CONSTRAINT pk_detalle_pedido PRIMARY KEY (cod_dedido, num_detalle),
	CONSTRAINT ck_detalle_pedido_cantidad CHECK (cantidad) IN (cantidad>0));
	CONSTRAINT ck_detalle_pedido_precio CHECK (precio) IS LIKE(%.__)
);

CREATE TABLE comprador(
	dni_comprador VARCHAR(9),
	nombre_completo_comprador VARCHAR(300) NOT NULL,
	email_comprador VARCHAR(320),
	direccion_comprador VARCHAR(100),
	fecha_alta DATE,
	CONSTRAINT pk_comprador PRIMARY KEY (dni_comprador),
	CONSTRAINT ck_email_comprador CHECK (email_comprador) 
	IS LIKE (%@%)
);

ALTER TABLE producto ADD CONSTRAINT fk_categoria_producto FOREIGN KEY (categoria)
REFERENCES categoria;

ALTER TABLE pedido ADD CONSTRAINT fk_num_trabajador_pedido FOREIGN KEY(num_trabajdor)
REFERENCES trabajador;

ALTER TABLE pedido ADD CONSTRAINT fk_dni_comprador_pedido FOREIGN KEY(dni_comprador)
REFERENCES comprador;

ALTER TABLE detalle_pedido ADD CONSTRAINT fk_detalle_cod_producto FOREIGN KEY(cod_producto)
REFERENCES producto;

ALTER TABLE detalle_pedido ADD CONSTRAINT fk_detalle_cod_producto FOREIGN KEY(cod_pedido)
REFERENCES pedido;

INSERT INTO comprador(dni_comprador, nombre_completo_comprador, email_comprador)
VALUES ('98765434P','Fernando Fanegas','fernando.fanegas@yahoo.com')

INSERT INTO pedido(cod_pedido, fecha_pedido, num_trabajador, dni_comprador)
VALUES ('1','23/04/2020','1')

INSERT INTO detalle_pedido(cod_pedido, num_detalle, cantidad, cod_producto, precio)
VALUES 

INSERT INTO trabajador(	num_trabajador, nombre_completo_trabajador, email_trabajador, cuenta_corriente_trabajador, pass_trabajador)
VALUES 