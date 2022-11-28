USE videoteca;

DELETE FROM interpretes_por_pelicula;
DELETE FROM directores_por_pelicula;
DELETE FROM interpretes;
DELETE FROM directores;
DELETE FROM peliculas;
DELETE FROM soporte;
DELETE FROM genero;

INSERT INTO soporte(nombre,descripcion) VALUES ('DVD','Digital Versalite Disc');
INSERT INTO soporte(nombre,descripcion) VALUES('VHS','Video Home System');

INSERT INTO genero(nombre,descripcion) VALUES ('CF','Ciencia Ficción');
INSERT INTO genero(nombre,descripcion) VALUES ('A','Aventuras');
INSERT INTO genero(nombre,descripcion) VALUES ('C','Comedia');
INSERT INTO genero(nombre,descripcion) VALUES ('D','Drama');
INSERT INTO genero(nombre,descripcion) VALUES ('T','Terror');

INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Harrison','Ford','nm0000148');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Rusell','Crow','nm0000128');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Diane','Keaton','nm0000123');

INSERT INTO directores(nombre,apellidos,imdb) VALUES ('Ridley','Scott','nm0000631');
INSERT INTO directores(nombre,apellidos,imdb) VALUES ('Mike','Nichols','nm0001566');
INSERT INTO directores(nombre,apellidos,imdb) VALUES ('Woody','Allen','nm0001568');

INSERT INTO peliculas(titulo,idSoporte,idGenero) VALUES ('Blade Runner',1,1);
INSERT INTO peliculas(titulo,idSoporte,idGenero) VALUES ('Gladiator',1,2);
INSERT INTO peliculas(titulo,idSoporte,idGenero) VALUES ('A propósito de Henry',2,4);
INSERT INTO peliculas(titulo,idSoporte,idGenero) VALUES ('Manhatan',1,3);

INSERT INTO interpretes_por_pelicula(idPelicula,idInterprete) VALUES (1,1);
INSERT INTO interpretes_por_pelicula(idPelicula,idInterprete) VALUES (2,2);
INSERT INTO interpretes_por_pelicula(idPelicula,idInterprete) VALUES (3,1);
INSERT INTO interpretes_por_pelicula(idPelicula,idInterprete) VALUES (4,3);

INSERT INTO directores_por_pelicula(idPelicula,idDirector)VALUES(1,1);
INSERT INTO directores_por_pelicula(idPelicula,idDirector)VALUES(2,1);
INSERT INTO directores_por_pelicula(idPelicula,idDirector)VALUES(3,2);
INSERT INTO directores_por_pelicula(idPelicula,idDirector)VALUES(4,3);