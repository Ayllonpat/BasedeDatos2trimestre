CREATE TABLE alumnos(
	dni_alumno VARCHAR(12),
	nombre_alumno VARCHAR(250) NOT NULL,
	direccion_alumno VARCHAR(250) NOT NULL,
	telefono_alumno VARCHAR(14) NOT NULL,
	edad_alumno INTEGER,
	empresa VARCHAR(10) NOT NULL,
	CONSTRAINT pk_alumnos PRIMARY KEY (dni_alumno)
);
CREATE TABLE empresas(
	cif_empresa VARCHAR(10),
	nombre_empresa VARCHAR(300) NOT NULL,
	direccion_empresa VARCHAR(250),
	telefono_empresa VARCHAR(14) NOT NULL,
	CONSTRAINT pk_empresas PRIMARY KEY (cif_empresa)
);
CREATE TABLE cursos(
	n_concreto INTEGER, --SERIAL
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	dni_profesor VARCHAR(12) NOT NULL,
	tipo_curso INTEGER NOT NULL,
	CONSTRAINT pk_cursos PRIMARY KEY (n_concreto)
);
CREATE TABLE alumnos_asisten(
	dni_alumno VARCHAR(12),
	n_concreto INTEGER NOT NULL,
	CONSTRAINT pk_alumnos_asisten PRIMARY KEY (dni_alumno, n_concreto)
); 
CREATE TABLE profesores(
	dni_profesor VARCHAR(12),
	nombre_profesor VARCHAR(250) NOT NULL,
	apellido_profesor VARCHAR(250) NOT NULL,
	telefono_profesor VARCHAR(14) NOT NULL,
	direccion_profesor VARCHAR(250) NOT NULL,
	CONSTRAINT pk_profesor PRIMARY KEY (dni_profesor)
);
CREATE TABLE tipos_cursos(
	cod_curso SERIAL,
	duracion INTEGER NOT NULL,
	programa VARCHAR(100) NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	CONSTRAINT pk_tipos_cursos PRIMARY KEY (cod_curso)
);

ALTER TABLE alumnos ADD CONSTRAINT fk_alumnos_empresa 
FOREIGN KEY (empresa) REFERENCES empresas; --REFERENCES empresas(cif_empresa)

ALTER TABLE alumnos_asisten ADD CONSTRAINT fk_alumnos_asisten_dni
FOREIGN KEY (dni_alumno) REFERENCES alumnos;

ALTER TABLE alumnos_asisten ADD CONSTRAINT fk_cursos_n_concreto
FOREIGN KEY (n_concreto) REFERENCES cursos;

ALTER TABLE cursos ADD CONSTRAINT fk_profesores_dni
FOREIGN KEY (dni_profesor) REFERENCES profesores;

ALTER TABLE cursos ADD CONSTRAINT fk_tipos_cursos_cod
FOREIGN KEY (tipo_curso) REFERENCES tipos_cursos;

INSERT INTO empresas(nombre_empresa, cif_empresa, direccion_empresa, telefono_empresa)
VALUES ('HP', '567098345', 'Calle Silvio', '67987534'),
		('Mac', '789098456', 'Calle Betis', '89756786'),
		('Lenovo', '789078456', 'Calle Betis', '96456786');
INSERT INTO alumnos(nombre_alumno, dni_alumno, direccion_alumno, telefono_alumno, edad_alumno, empresa)-- EN EMPRESA HAY Q ESCRIBIR EL CIF
VALUES ('Jose Luis Martín', '67854321R', 'Calle Virgen de Fatima', '9546578932', 18, '567098345'),
		('Maria Luisa', '67674321R', 'Calle Rockero', '9646578932', 20, '567098345'),
		('Jorge Juan', '678345123R', 'Calle Reyes', '9546578932', 17, '567098345'),
		('Jose Luis Martín', '5854321R', 'Calle Virgen de Fatima', '9546578932', 18, '789098456'),
		('Maria Luisa', '67664321R', 'Calle Rockero', '9646578932', 20, '789098456'),
		('Jorge Juan', '678745123R', 'Calle Reyes', '9546578932', 17, '789098456'),
		('Jose Luis Martín', '67854821R', 'Calle Virgen de Fatima', '9546578932', 18, '789078456'),
		('Maria Luisa', '69674321R', 'Calle Rockero', '9646578932', 20, '789078456'),
		('Jorge Juan', '678045123R', 'Calle Reyes', '9546578932', 17, '789078456');
INSERT INTO tipo_cursos(titulo, programa, duracion)