

DROP DATABASE IF EXISTS videoteca;
CREATE DATABASE videoteca;
USE videoteca;

CREATE TABLE IF NOT EXISTS genero (
  idGenero INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(3) NOT NULL,
  descripcion VARCHAR(3) NOT NULL,
  PRIMARY KEY (idGenero))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS soporte(
  idSoporte INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(3) NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (idSoporte))
ENGINE = InnoDB;


DROP TABLE IF EXISTS peliculas;
CREATE TABLE peliculas (
id INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR (64) NOT NULL,
idSoporte INT NOT NULL,
idGenero INT NOT NULL, 
PRIMARY KEY (id),
INDEX Fk_soporte_de(idSoporte),
INDEX Fk_genero_de(idGenero),
 CONSTRAINT Fk_soporte_de
    FOREIGN KEY (idSoporte)
    REFERENCES soporte (idSoporte)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT Fk_genero_de
    FOREIGN KEY (idGenero)
    REFERENCES genero (idGenero)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE InnoDB;


DROP TABLE IF EXISTS directores;
CREATE TABLE directores (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(64) NOT NULL,
  apellidos VARCHAR(64) NOT NULL,
  imdb VARCHAR(45) NOT NULL DEFAULT '\"',
  PRIMARY KEY (id))
ENGINE = InnoDB;


DROP TABLE IF EXISTS directores_por_pelicula;
CREATE TABLE directores_por_pelicula (
  idPelicula INT NOT NULL,
  idDirector INT NOT NULL,
  PRIMARY KEY (idPelicula, idDirector),
  
  CONSTRAINT Fk_directores_por_pelicula
    FOREIGN KEY (idDirector)
    REFERENCES directores (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Fk_peliculas_por_director
    FOREIGN KEY (idPelicula)
    REFERENCES peliculas (id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS interpretes;
CREATE TABLE  interpretes (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(64) NOT NULL,
  apellidos VARCHAR(64) NOT NULL,
  imdb VARCHAR(45) NOT NULL DEFAULT '\"',
  PRIMARY KEY (id))
ENGINE = InnoDB;

DROP TABLE IF EXISTS interpretes_por_pelicula;
CREATE TABLE  interpretes_por_pelicula (
  idInterpretre INT NOT NULL,
  idPelicula INT NOT NULL,
  PRIMARY KEY (idInterpretre, idPelicula),

  CONSTRAINT interprete_por_pelicula
    FOREIGN KEY (idInterpretre)
    REFERENCES interpretes (id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT peliculas_por_interprete
    FOREIGN KEY (idPelicula)
    REFERENCES peliculas (id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;