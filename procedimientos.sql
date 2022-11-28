DROP DATABASE IF EXISTS procedimientos;
CREATE DATABASE procedimientos;
USE procedimientos;
CREATE TABLE interprete(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(64) NOT NULL,
apellidos VARCHAR(64) NOT NULL,
imdb VARCHAR(32) NOT NULL DEFAULT '\"',
PRIMARY KEY(id)
)ENGINE InnoDB;



