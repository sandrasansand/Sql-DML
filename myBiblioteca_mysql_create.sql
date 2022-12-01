CREATE TABLE `Clientes` (
	`dni` VARCHAR(10) NOT NULL,
	`nombre` varchar(25) NOT NULL,
	`apellidos` varchar(25) NOT NULL,
	PRIMARY KEY (`dni`)
);

CREATE TABLE `Libros` (
	`isbn` varchar(10) NOT NULL,
	`titulo` varchar(30) NOT NULL,
	`autor_dni` varchar(10) NOT NULL,
	PRIMARY KEY (`isbn`)
);

CREATE TABLE `Categorias` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(25) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `CategoriasLibros` (
	`categorias_id` INT NOT NULL AUTO_INCREMENT,
	`libros_isbn` varchar(10) NOT NULL,
	PRIMARY KEY (`categorias_id`,`libros_isbn`)
);

CREATE TABLE `Autores` (
	`dni` varchar(10) NOT NULL,
	`nombre` varchar(25) NOT NULL,
	`apellido1` varchar(25) NOT NULL,
	`apellido2` varchar(25) NOT NULL,
	PRIMARY KEY (`dni`)
);

CREATE TABLE `Ejemplares` (
	`numero` INT NOT NULL,
	`isbn` varchar(10) NOT NULL,
	PRIMARY KEY (`numero`,`isbn`)
);

CREATE TABLE `Socios` (
	`numero` INT NOT NULL AUTO_INCREMENT,
	`fecha` DATE NOT NULL,
	`email` varchar(100) NOT NULL,
	`clientes_dni` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`numero`)
);

CREATE TABLE `Alquileres` (
	`numero` INT NOT NULL AUTO_INCREMENT,
	`fecha_inicio` DATETIME NOT NULL,
	`clientes_dni` varchar(10) NOT NULL,
	PRIMARY KEY (`numero`)
);

CREATE TABLE `LineasAlquileres` (
	`numero` INT NOT NULL AUTO_INCREMENT,
	`alquileres_numero` INT NOT NULL,
	`ejemplares_numero` INT NOT NULL,
	`ejemplares_isbn` varchar(10) NOT NULL,
	`fecha_fin` DATE NOT NULL,
	PRIMARY KEY (`numero`,`alquileres_numero`)
);

CREATE TABLE `Devoluciones` (
	`linea_numero` INT NOT NULL,
	`alquileres_numero` INT NOT NULL,
	`fecha` DATE NOT NULL,
	`estado` BOOLEAN NOT NULL,
	`trabajadors_dni` varchar(10) NOT NULL,
	PRIMARY KEY (`linea_numero`,`alquileres_numero`)
);

CREATE TABLE `Trabajadores` (
	`dni` varchar(10) NOT NULL,
	`nombre` varchar(25) NOT NULL,
	`apellidos` varchar(25) NOT NULL,
	PRIMARY KEY (`dni`)
);

ALTER TABLE `Libros` ADD CONSTRAINT `Libros_fk0` FOREIGN KEY (`autor_dni`) REFERENCES `Autores`(`dni`);

ALTER TABLE `CategoriasLibros` ADD CONSTRAINT `CategoriasLibros_fk0` FOREIGN KEY (`categorias_id`) REFERENCES `Categorias`(`id`);

ALTER TABLE `CategoriasLibros` ADD CONSTRAINT `CategoriasLibros_fk1` FOREIGN KEY (`libros_isbn`) REFERENCES `Libros`(`isbn`);

ALTER TABLE `Ejemplares` ADD CONSTRAINT `Ejemplares_fk0` FOREIGN KEY (`isbn`) REFERENCES `Libros`(`isbn`);

ALTER TABLE `Socios` ADD CONSTRAINT `Socios_fk0` FOREIGN KEY (`clientes_dni`) REFERENCES `Clientes`(`dni`);

ALTER TABLE `Alquileres` ADD CONSTRAINT `Alquileres_fk0` FOREIGN KEY (`clientes_dni`) REFERENCES `Clientes`(`dni`);

ALTER TABLE `LineasAlquileres` ADD CONSTRAINT `LineasAlquileres_fk0` FOREIGN KEY (`alquileres_numero`) REFERENCES `Alquileres`(`numero`);

ALTER TABLE `LineasAlquileres` ADD CONSTRAINT `LineasAlquileres_fk1` FOREIGN KEY (`ejemplares_numero`) REFERENCES `Ejemplares`(`numero`);

ALTER TABLE `LineasAlquileres` ADD CONSTRAINT `LineasAlquileres_fk2` FOREIGN KEY (`ejemplares_isbn`) REFERENCES `Ejemplares`(`isbn`);

ALTER TABLE `Devoluciones` ADD CONSTRAINT `Devoluciones_fk0` FOREIGN KEY (`linea_numero`) REFERENCES `LineasAlquileres`(`numero`);

ALTER TABLE `Devoluciones` ADD CONSTRAINT `Devoluciones_fk1` FOREIGN KEY (`alquileres_numero`) REFERENCES `LineasAlquileres`(`alquileres_numero`);

ALTER TABLE `Devoluciones` ADD CONSTRAINT `Devoluciones_fk2` FOREIGN KEY (`trabajadors_dni`) REFERENCES `Trabajadores`(`dni`);












