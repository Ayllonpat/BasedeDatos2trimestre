CREATE TABLE docentes(
	dni_docentes VARCHAR(12),
	nombre_docente VARCHAR(300) NOT NULL,
	telefono_docente VARCHAR(14) NOT NULL,
	anio_ingreso DATE,
	CONSTRAINT pk_docente PRIMARY KEY (dni_docentes)
);
CREATE TABLE actividades(
	cod_actividad SERIAL,
	nombre_actividad VARCHAR(100) NOT NULL,
	duracion INTEGER,
	CONSTRAINT pk_actividades PRIMARY KEY (cod_actividad)
);
CREATE TABLE alumnos(
	cod_alumno SERIAL,
	nombre_alumno VARCHAR(300) NOT NULL,
	telefono_alumno VARCHAR(14) NOT NULL,
	nivel_alumno NUMERIC NOT NULL,
	CONSTRAINT pk_alumno PRIMARY KEY (cod_alumno)
);
CREATE TABLE asignacion_act(
	id_docente VARCHAR(12) NOT NULL,
	cod_actividad INTEGER NOT NULL,
	dia_semana VARCHAR(10) NOT NULL,
	hora TIMESTAMP NOT NULL,
	CONSTRAINT pk_asignacion PRIMARY KEY (id_docente, cod_actividad)
);
CREATE TABLE asistencia_act(
	id_alumno INTEGER NOT NULL,
	id_actividad INTEGER NOT NULL,
	id_docente INTEGER NOT NULL
);

ALTER TABLE asignacion_act ADD CONSTRAINT fk_id_docente 
	FOREIGN KEY (id_docente) REFERENCES docentes;

ALTER TABLE asignacion_act ADD CONSTRAINT fk_cod_actividad
	FOREIGN KEY (cod_actividad) REFERENCES actividades;
	
ALTER TABLE asistencia_act ADD CONSTRAINT fk_cod_actividad
	FOREIGN KEY (id_actividad) REFERENCES actividades;
	
ALTER TABLE asistencia_act ADD CONSTRAINT fk_cod_alumnos
	FOREIGN KEY (id_alumno) REFERENCES alumnos;
	
ALTER TABLE  asistencia_act ADD CONSTRAINT fk_cod_docente
	FOREIGN KEY (id_docente) REFERENCES docentes;