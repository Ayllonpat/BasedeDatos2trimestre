CREATE TABLE Restaurante(
	id_restaurante SERIAL,
	id_propietario INTEGER,
	ubicacion VARCHAR(100),
	num_trabajdores SMALLINT,
	CONSTRAINT pk_restaurante PRIMARY KEY (id_restaurante)
);
CREATE TABLE Propietario(
	id_propietario SERIAL,
	nombre VARCHAR(100),
	CONSTRAINT pk_propietario PRIMARY KEY (id_propietario)
);
CREATE TABLE Empleado(
	id_empleado SERIAL,
	nombre VARCHAR(100),
	id_restaurante INTEGER,
	CONSTRAINT pk_empleado PRIMARY KEY (id_empleado)
);
CREATE TABLE Trabajador_Departamento(
	id_empleado INTEGER,
	fecha_inicio DATE,
	CONSTRAINT pk_trabajador_departamento PRIMARY KEY (id_empleado)
);
CREATE TABLE Personal_Cocina(
	id_empleado INTEGER,
	rango VARCHAR(100),
	CONSTRAINT pk_personal_cocina PRIMARY KEY (id_empleado)
);
CREATE TABLE Camarero(
	id_empleado INTEGER,
	rol VARCHAR(50),
	CONSTRAINT pk_camarero PRIMARY KEY (id_empleado)
);
CREATE TABLE Turno(
	id_empleado INTEGER,
	id_zona INTEGER,
	fecha_hora TIMESTAMP,
	CONSTRAINT pk_turno PRIMARY KEY (id_empleado, id_zona)
);
CREATE TABLE Zona(
	id_zona INTEGER,
	id_restaurante INTEGER,
	nombre VARCHAR(100),
	superficie NUMERIC,
	CONSTRAINT pk_zona PRIMARY KEY (id_zona, id_restaurante)
);
CREATE TABLE Mesa(
	num_mesa SERIAL,
	id_zona INTEGER,
	mesa_que_tiene INTEGER,
	CONSTRAINT pk_mesa PRIMARY KEY (num_mesa)
);
CREATE TABLE Reserva(
	id_cuenta INTEGER,
	num_mesa INTEGER,
	id_reserva INTEGER,
	nombre_cliente VARCHAR(100),
	fecha DATE,
	hora TIME,
	CONSTRAINT pk_reserva PRIMARY KEY (id_cuenta, num_mesa, id_reserva)
);
CREATE TABLE Cuenta(
	id_cuenta SERIAL,
	precio NUMERIC,
	fecha DATE,
	CONSTRAINT pk_cuenta PRIMARY KEY (id_cuenta)
);
CREATE TABLE Departamento(
	id_departamento SERIAL,
	id_restaurante INTEGER,
	nombre VARCHAR(100),
	CONSTRAINT pk_departamento PRIMARY KEY (id_departamento, id_restaurante)
);
CREATE TABLE Compra(
	id_suministro INTEGER,
	id_restaurante INTEGER,
	id_compra SERIAL,
	precio NUMERIC,
	fecha DATE, 
	CONSTRAINT pk_compra PRIMARY KEY (id_suministro, id_restaurante, id_compra)
);
CREATE TABLE Suministro(
	id_suministro SERIAL,
	nombre VARCHAR (100),
	cantidad SMALLINT,
	id_proveedor INTEGER,
	CONSTRAINT pk_suministro PRIMARY KEY (id_suministro, id_proveedor)
);
CREATE TABLE Vende(
	id_suministro INTEGER,
	id_proveedor INTEGER,
	CONSTRAINT pk_vende PRIMARY KEY (id_suministro, id_proveedor)
);
CREATE TABLE Proveedor(
	id_proveedor SERIAL,
	nombre VARCHAR (100),
	direccion VARCHAR (100),
	CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor)
);
CREATE TABLE Utilaje(
	id_utilaje SERIAL,
	CONSTRAINT pk_utilaje PRIMARY KEY (id_utilaje)
);
CREATE TABLE Ingrediente(
	id_ingrediente SERIAL,
	CONSTRAINT pk_ingrediente PRIMARY KEY (id_ingrediente)
);
CREATE TABLE Tiene(
	id_utilaje INTEGER,
	id_alergeno INTEGER,
	CONSTRAINT pk_tiene PRIMARY KEY (id_utilaje, id_alergeno)
);
CREATE TABLE Alergeno(
	id_alergeno	SERIAL,
	nombre_alergeno	VARCHAR(100),
	CONSTRAINT pk_alergeno PRIMARY KEY (id_alergeno)
);
CREATE TABLE Pedido(
	id_pedido		SERIAL,
	id_cuenta		INTEGER,
	precio_venta		NUMERIC,
	cantidad			SMALLINT,
	CONSTRAINT pk_pedido PRIMARY KEY (id_pedido, id_cuenta)
);
CREATE TABLE Menu(
	id_menu		SERIAL,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	CONSTRAINT pk_menu PRIMARY KEY (id_pedido, id_cuenta, id_menu)
);
CREATE TABLE Plato(
	id_plato		SERIAL,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	nombre		VARCHAR(100),
	precio		NUMERIC,
	CONSTRAINT pk_plato PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_plato)
);
CREATE TABLE Bebida(
	id_bebida		SERIAL,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	nombre		VARCHAR(100),
	precio		NUMERIC,
	CONSTRAINT pk_bebida PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_bebida)
);
CREATE TABLE Postre(
	id_postre		SERIAL,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	nombre		VARCHAR(100),
	precio		NUMERIC,
	CONSTRAINT pk_postre PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_postre)
);
CREATE TABLE Reposteria(
	id_ingrediente	INTEGER,
	id_postre		INTEGER,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	nombre		VARCHAR(100),
	CONSTRAINT pk_reposteria PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_ingrediente, id_postre)
);
CREATE TABLE Otros(
	id_ingrediente	INTEGER,
	id_plato		INTEGER,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	nombre		VARCHAR(100),
	CONSTRAINT pk_otros PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_plato, id_ingrediente)
);
CREATE TABLE Condimento(
	id_ingrediente	INTEGER,
	id_plato		INTEGER,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	nombre		VARCHAR(100),
	CONSTRAINT pk_condimento PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_plato, id_ingrediente)
);
CREATE TABLE Verdura(
	id_ingrediente	INTEGER,
	id_plato		INTEGER,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	nombre		VARCHAR(100),
	CONSTRAINT pk_verdura PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_plato, id_ingrediente)
);
CREATE TABLE Pescado(
	id_ingrediente	INTEGER,
	id_plato		INTEGER,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	tipo		VARCHAR(100),
	CONSTRAINT pk_pescado PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_plato, id_ingrediente)
);
CREATE TABLE Carne(
	id_ingrediente	INTEGER,
	id_plato		INTEGER,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	tipo		VARCHAR(100),
	CONSTRAINT pk_carne PRIMARY KEY (id_pedido, id_cuenta, id_menu, id_plato, id_ingrediente)
);
CREATE TABLE Tiene_Menu(
	id_bebida	INTEGER,
	id_menu		INTEGER,
	id_pedido	INTEGER,
	id_cuenta	INTEGER,
	id_suministro	INTEGER,
	id_alergeno		INTEGER,
	CONSTRAINT pk_tiene_menu PRIMARY KEY (id_bebida, id_cuenta, id_menu, id_suministro, id_alergeno)
);
ALTER TABLE Restaurante ADD CONSTRAINT fk_restaurante 
FOREIGN KEY (id_propietario) REFERENCES Propietario;
ALTER TABLE Departamento ADD CONSTRAINT fk_departamento 
FOREIGN KEY (id_restaurante) REFERENCES Restaurante;
ALTER TABLE Empleado ADD CONSTRAINT fk_empleado
FOREIGN KEY (id_restaurante) REFERENCES Restaurante;
ALTER TABLE Camarero ADD CONSTRAINT fk_camarero
FOREIGN KEY (id_empleado) REFERENCES Empleado;
ALTER TABLE Personal_Cocina ADD CONSTRAINT fk_personal_cocina
FOREIGN KEY (id_empleado) REFERENCES Empleado;
ALTER TABLE Trabajador_Departamento ADD CONSTRAINT fk_trabajador_departamento
FOREIGN KEY (id_empleado) REFERENCES Empleado;
ALTER TABLE Turno ADD CONSTRAINT fk_turno_e
FOREIGN KEY (id_empleado) REFERENCES Empleado;
ALTER TABLE Turno ADD CONSTRAINT fk_turno_z
FOREIGN KEY (id_zona) REFERENCES Zona;
ALTER TABLE Zona ADD CONSTRAINT fk_zona
FOREIGN KEY (id_restaurante) REFERENCES Restaurante;
ALTER TABLE Mesa ADD CONSTRAINT fk_mesa
FOREIGN KEY (id_zona) REFERENCES Zona;
ALTER TABLE Reserva ADD CONSTRAINT fk_reserva_c
FOREIGN KEY (id_cuenta) REFERENCES Cuenta;
ALTER TABLE Reserva ADD CONSTRAINT fk_reserva_m
FOREIGN KEY (num_mesa) REFERENCES Mesa;
ALTER TABLE Pedido ADD CONSTRAINT fk_pedido
FOREIGN KEY (id_cuenta) REFERENCES Cuenta;
ALTER TABLE Menu ADD CONSTRAINT fk_menu_c
FOREIGN KEY (id_cuenta) REFERENCES Cuenta;
ALTER TABLE Menu ADD CONSTRAINT fk_menu_p
FOREIGN KEY (id_pedido) REFERENCES Pedido; 
