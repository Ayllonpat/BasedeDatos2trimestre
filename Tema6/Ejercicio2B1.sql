ALTER TABLE libro ADD PRIMARY KEY (isbn);

ALTER TABLE libro ALTER COLUMN titulo_libro SET NOT NULL;

ALTER TABLE libro ALTER COLUMN dni_autor SET NOT NULL;

ALTER TABLE libro ADD FOREIGN KEY (dni_autor) REFERENCES autor;

ALTER TABLE libro ALTER COLUMN cod_genero SET NOT NULL;

ALTER TABLE libro ADD FOREIGN KEY (cod_genero) REFERENCES genero;

ALTER TABLE libro ALTER COLUMN cod_editorial SET NOT NULL;

ALTER TABLE libro ADD FOREIGN KEY (cod_editorial) REFERENCES editorial;

ALTER TABLE autor ADD PRIMARY KEY (dni_autor);

ALTER TABLE autor ALTER COLUMN nombre_autor SET NOT NULL;

ALTER TABLE editorial ADD PRIMARY KEY (cod_editorial);

ALTER TABLE editorial ALTER COLUMN nombre_editorial SET NOT NULL;

ALTER TABLE genero ADD PRIMARY KEY (cod_genero);

ALTER TABLE genero ALTER COLUMN nombre_genero SET NOT NULL;

ALTER TABLE edicion ADD PRIMARY KEY (isbn);

ALTER TABLE edicion ADD FOREIGN KEY (isbn) REFERENCES libro;

