DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
	`dni` VARCHAR(10) NOT NULL,
	`nombre` varchar(25) NOT NULL,
	`apellidos` varchar(25) NOT NULL,
	PRIMARY KEY (`dni`)
);

DROP TABLE IF EXISTS `libros`;
CREATE TABLE `libros` (
	`isbn` varchar(10) NOT NULL,
	`titulo` varchar(30) NOT NULL,
	`autor` varchar(30) NOT NULL,
	`clientes_dni` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`isbn`)
);
DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(25) NOT NULL,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `categoriasLibros`;

CREATE TABLE `categoriasLibros` (
	`categorias_id` INT NOT NULL AUTO_INCREMENT,
	`libros_isbn` varchar(10) NOT NULL,
	PRIMARY KEY (`categorias_id`,`libros_isbn`)
);

ALTER TABLE `libros` ADD CONSTRAINT `libros_fk0` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes`(`dni`);

ALTER TABLE `CategoriasLibros` ADD CONSTRAINT `CategoriasLibros_fk0` FOREIGN KEY (`categorias_id`) REFERENCES `categorias`(`id`);

ALTER TABLE `CategoriasLibros` ADD CONSTRAINT `CategoriasLibros_fk1` FOREIGN KEY (`libros_isbn`) REFERENCES `libros`(`isbn`);





