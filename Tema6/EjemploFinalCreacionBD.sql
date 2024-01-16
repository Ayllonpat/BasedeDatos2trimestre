CREATE TABLE emp(
	id_emp SERIAL,
	nombre VARCHAR(100),
	cod_dep INTEGER,
	id_jefe INTEGER,
	CONSTRAINT pk_emp_emp PRIMARY KEY (id_emp)
);

CREATE TABLE dep(
	cod_dep SERIAL,
	nombre VARCHAR(100),
	id_jefe_dep INTEGER,
	CONSTRAINT pk_dep_dep PRIMARY KEY (cod_dep)
);

ALTER TABLE emp
	ADD CONSTRAINT fk_dep FOREIGN KEY (id_jefe) 
		REFERENCES emp (id_emp),
	ADD CONSTRAINT fk_emp_dep FOREIGN KEY (cod_dep)
		REFERENCES dep (cod_dep);
		
ALTER TABLE dep
	ADD CONSTRAINT fk_dep_emp FOREIGN KEY (id_jefe_dep)
		REFERENCES emp(id_emp);
