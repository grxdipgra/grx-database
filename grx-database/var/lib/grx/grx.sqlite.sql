BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `telefononodo` (
	`idNodo`	mediumint ( 6 ) NOT NULL,
	`telefono`	varchar ( 16 ) NOT NULL,
	PRIMARY KEY(`idNodo`,`telefono`),
	FOREIGN KEY(`idNodo`) REFERENCES `nodo`(`id`)
);
CREATE TABLE IF NOT EXISTS `sicalwin` (
	`idMunicipio`	smallint ( 3 ) NOT NULL,
	`numeroServidores`	smallint ( 3 ) NOT NULL DEFAULT '0',
	`numeroClientes`	smallint ( 3 ) NOT NULL DEFAULT '0'
);
CREATE TABLE IF NOT EXISTS `programa` (
	`idNodo`	mediumint ( 6 ) NOT NULL,
	`anio`	varchar ( 5 ) NOT NULL DEFAULT 'xx/yy',
	`portalWeb`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`email`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`baseDatosJuridica`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`suscripcionDominio`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`perfilContratante`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`gestionMunicipal`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`gestionEconomica`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`soporte`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`sedeElectronica`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`epol`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`epolMovil`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	`siapol`	tinyint ( 1 ) NOT NULL DEFAULT '0',
	FOREIGN KEY(`idNodo`) REFERENCES `nodo`(`id`),
	PRIMARY KEY(`idNodo`,`anio`)
);
CREATE TABLE IF NOT EXISTS `poblacion` (
	`id`	smallint ( 3 ) NOT NULL,
	`idMunicipio`	smallint ( 3 ) NOT NULL,
	`idEla`	smallint ( 3 ) DEFAULT NULL,
	`nombre`	varchar ( 64 ) NOT NULL,
	`nombreId`	varchar ( 64 ) NOT NULL,
	FOREIGN KEY(`idMunicipio`) REFERENCES `municipio`(`id`),
	FOREIGN KEY(`idEla`) REFERENCES `municipio`(`id`),
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `nodo` (
	`id`	mediumint ( 6 ) NOT NULL,
	`idPoblacion`	smallint ( 3 ) NOT NULL,
	`idCentro`	smallint ( 3 ) DEFAULT NULL,
	`nombre`	varchar ( 128 ) NOT NULL,
	`CIF`	char ( 9 ) DEFAULT NULL,
	`codigoDIR3`	char ( 9 ) DEFAULT NULL,
	`tipoVia`	varchar ( 16 ) DEFAULT NULL,
	`nombreVia`	varchar ( 64 ) DEFAULT NULL,
	`numeroDireccion`	varchar ( 3 ) DEFAULT NULL,
	`letraDireccion`	char ( 1 ) DEFAULT NULL,
	`escaleraDireccion`	varchar ( 3 ) DEFAULT NULL,
	`pisoDireccion`	varchar ( 3 ) DEFAULT NULL,
	`puertaDireccion`	varchar ( 3 ) DEFAULT NULL,
	`codigoPostal`	char ( 5 ) DEFAULT NULL,
	`latitud`	varchar ( 12 ) DEFAULT NULL,
	`longitud`	varchar ( 12 ) DEFAULT NULL,
	`contacto`	varchar ( 128 ) DEFAULT NULL,
	`extension`	varchar ( 5 ) DEFAULT NULL,
	`fax`	varchar ( 16 ) DEFAULT NULL,
	`web`	varchar ( 128 ) DEFAULT NULL,
	`sede`	varchar ( 128 ) DEFAULT NULL,
	`tablon`	varchar ( 128 ) DEFAULT NULL,
	`portalTransparencia`	varchar ( 128 ) DEFAULT NULL,
	`adslLinea`	varchar ( 16 ) DEFAULT NULL,
	`numAdministrativoLinea`	varchar ( 16 ) DEFAULT NULL,
	`ipLinea`	varchar ( 16 ) DEFAULT NULL,
	`ipCifradoLinea`	varchar ( 16 ) DEFAULT NULL,
	`servicioLinea`	varchar ( 64 ) DEFAULT NULL,
	`caudalLinea`	varchar ( 64 ) DEFAULT NULL,
	`equipamientoLinea`	varchar ( 128 ) DEFAULT NULL,
	`numeroSerieRouter`	varchar ( 16 ) DEFAULT NULL,
	`dns1`	varchar ( 16 ) DEFAULT NULL,
	`dns2`	varchar ( 16 ) DEFAULT NULL,
	`proxy`	smallint ( 1 ) DEFAULT 0,
	`esAyuntamiento`	smallint ( 1 ) DEFAULT 0,
	FOREIGN KEY(`idPoblacion`) REFERENCES `poblacion`(`id`),
	PRIMARY KEY(`id`),
	FOREIGN KEY(`idCentro`) REFERENCES `centro`(`id`)
);
CREATE TABLE IF NOT EXISTS `municipio` (
	`id`	smallint ( 3 ) NOT NULL,
	`idComarca`	smallint ( 2 ) DEFAULT NULL,
	`nombre`	varchar ( 64 ) NOT NULL,
	`nombreId`	varchar ( 64 ) NOT NULL,
	`codigoINE`	mediumint ( 6 ) DEFAULT NULL,
	`numeroHabitantes`	mediumint ( 8 ) DEFAULT NULL,
	`superficie`	decimal ( 6 , 3 ) DEFAULT NULL,
	`altitud`	smallint ( 4 ) DEFAULT NULL,
	`latitud`	varchar ( 12 ) DEFAULT NULL,
	`longitud`	varchar ( 12 ) DEFAULT NULL,
	`urlBandera`	varchar ( 256 ) DEFAULT NULL,
	`urlEscudo`	varchar ( 256 ) DEFAULT NULL,
	`web`	varchar ( 128 ) DEFAULT NULL,
	`siglasPartidoPolitico`	varchar ( 16 ) DEFAULT NULL,
	`nombrePartidoPolitico`	varchar ( 64 ) DEFAULT NULL,
	`nombreAlcalde`	varchar ( 128 ) DEFAULT NULL,
	`fechaPosesion`	date DEFAULT NULL,
	PRIMARY KEY(`id`),
	FOREIGN KEY(`idComarca`) REFERENCES `comarca`(`id`)
);
CREATE TABLE IF NOT EXISTS `mancomunidadmunicipio` (
	`idMancomunidad`	smallint ( 2 ) NOT NULL,
	`idMunicipio`	smallint ( 3 ) NOT NULL,
	FOREIGN KEY(`idMancomunidad`) REFERENCES `mancomunidad`(`id`),
	FOREIGN KEY(`idMunicipio`) REFERENCES `municipio`(`id`),
	PRIMARY KEY(`idMancomunidad`,`idMunicipio`)
);
CREATE TABLE IF NOT EXISTS `mancomunidad` (
	`id`	smallint ( 2 ) NOT NULL,
	`nombre`	varchar ( 64 ) NOT NULL,
	`nombreId`	varchar ( 64 ) NOT NULL,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `horarionodo` (
	`idNodo`	mediumint ( 6 ) NOT NULL,
	`diaSemana`	tinyint ( 1 ) NOT NULL,
	`horaApertura`	time NOT NULL,
	`horaCierre`	time NOT NULL,
	PRIMARY KEY(`idNodo`,`diaSemana`,`horaApertura`)
);
CREATE TABLE IF NOT EXISTS `grupos` (
	`id_grupo`	int,
	`id_usuario`	int,
	`grupo`	varchar ( 100 ),
	`usuario`	varchar ( 100 )
);
CREATE TABLE IF NOT EXISTS `extensiontelefononodo` (
	`telefono`	varchar ( 16 ) NOT NULL,
	`numeroExtension`	tinyint ( 2 ) NOT NULL,
	`nombreExtension`	varchar ( 32 ) NOT NULL,
	PRIMARY KEY(`telefono`,`numeroExtension`)
);
CREATE TABLE IF NOT EXISTS `excepciones` (
	`ip`	vachar ( 16 ),
	`id`	INTEGER NOT NULL,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `emailnodo` (
	`idNodo`	mediumint ( 6 ) NOT NULL,
	`email`	varchar ( 128 ) NOT NULL,
	`tipo`	varchar ( 64 ) NOT NULL,
	`prioridad`	tinyint ( 1 ) NOT NULL,
	`notas`	varchar ( 64 ),
	FOREIGN KEY(`idNodo`) REFERENCES `nodo`(`id`),
	PRIMARY KEY(`idNodo`,`email`)
);
CREATE TABLE IF NOT EXISTS `diafestivopoblacion` (
	`idPoblacion`	smallint ( 3 ) NOT NULL,
	`diaFestivo`	date NOT NULL,
	`descripcion`	varchar ( 32 ) NOT NULL,
	PRIMARY KEY(`idPoblacion`,`diaFestivo`),
	FOREIGN KEY(`idPoblacion`) REFERENCES `poblacion`(`id`)
);
CREATE TABLE IF NOT EXISTS `comarca` (
	`id`	smallint ( 2 ) NOT NULL,
	`nombre`	varchar ( 64 ) NOT NULL,
	`nombreId`	varchar ( 64 ) NOT NULL,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `centro` (
	`id`	smallint ( 3 ) NOT NULL,
	`nombre`	varchar ( 32 ) NOT NULL,
	`direccion`	varchar ( 64 ) DEFAULT NULL,
	`telefono`	varchar ( 16 ) DEFAULT NULL,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `aplicacion` (
	`idNodo`	mediumint ( 6 ) NOT NULL,
	`atalaya`	smallint ( 4 ) DEFAULT NULL,
	`glpi`	smallint ( 4 ) DEFAULT NULL,
	`ocs`	smallint ( 4 ) DEFAULT NULL,
	FOREIGN KEY(`idNodo`) REFERENCES `nodo`(`id`),
	PRIMARY KEY(`idNodo`)
);
COMMIT;
