CREATE TABLE traduccion
(
	IdTraduccion SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Descripcion NVARCHAR(100) NOT NULL,
	IdPalabra SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (IdTraduccion),
	KEY (IdPalabra)
) ;


CREATE TABLE categoria
(
	IdCategoria SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Nombre NVARCHAR(20) NOT NULL,
	Definicion NVARCHAR(100) NULL,
	PRIMARY KEY (IdCategoria)
) ;


CREATE TABLE palabra
(
	IdPalabra SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Descripcion NVARCHAR(30) NOT NULL,
	IdIdioma SMALLINT UNSIGNED NOT NULL,
	IdCategoria SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (IdPalabra),
	KEY (IdIdioma)
) ;


CREATE TABLE dialecto
(
	IdDialecto SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Nombre NVARCHAR(25) NOT NULL,
	IdIdioma SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (IdDialecto),
	KEY (IdIdioma)
) ;


CREATE TABLE idioma
(
	IdIdioma SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Nombre NVARCHAR(20) NOT NULL,
	Familia NVARCHAR(20) NULL,
	Estado NVARCHAR(15) NULL,
	PRIMARY KEY (IdIdioma)
) ;


CREATE TABLE Departamento
(
	IdDep SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Nombre NVARCHAR(20) NOT NULL,
	PRIMARY KEY (IdDep)
) ;


CREATE TABLE Tiene
(
	IdZona SMALLINT UNSIGNED NOT NULL,
	IdDep SMALLINT UNSIGNED NOT NULL,
	KEY (IdDep),
	KEY (IdZona)
) ;


CREATE TABLE zona
(
	IdZona SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Nombre NVARCHAR(30) NOT NULL,
	Descripcion NVARCHAR(100) NULL,
	PRIMARY KEY (IdZona)
) ;


CREATE TABLE etnia
(
	IdEtnia SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Nombre NVARCHAR(20) NOT NULL,
	Descripcion NVARCHAR(100) NULL,
	IdIdioma SMALLINT UNSIGNED NOT NULL,
	IdZona SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (IdEtnia),
	KEY (IdIdioma),
	KEY (IdZona)
) ;





ALTER TABLE traduccion ADD CONSTRAINT FK_traduccion_palabra 
	FOREIGN KEY (IdPalabra) REFERENCES palabra (IdPalabra);

ALTER TABLE palabra ADD CONSTRAINT FK_palabra_idioma 
	FOREIGN KEY (IdIdioma) REFERENCES idioma (IdIdioma);

ALTER TABLE dialecto ADD CONSTRAINT FK_Dialecto_idioma 
	FOREIGN KEY (IdIdioma) REFERENCES idioma (IdIdioma);

ALTER TABLE Tiene ADD CONSTRAINT FK_Tiene_Departamento 
	FOREIGN KEY (IdDep) REFERENCES Departamento (IdDep);

ALTER TABLE Tiene ADD CONSTRAINT FK_Tiene_zona 
	FOREIGN KEY (IdZona) REFERENCES zona (IdZona);

ALTER TABLE etnia ADD CONSTRAINT FK_etnia_idioma 
	FOREIGN KEY (IdIdioma) REFERENCES idioma (IdIdioma);

ALTER TABLE etnia ADD CONSTRAINT FK_etnia_zona 
	FOREIGN KEY (IdZona) REFERENCES zona (IdZona);
