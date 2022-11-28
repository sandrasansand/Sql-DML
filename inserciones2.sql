USE videoteca;

INSERT INTO soporte(nombre,descripcion) VALUES('LD','Laser Disc');

INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Lee','Marvin','nm0001511');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Clint','Eastwood','nm0000142');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Jean','Seberg','nm07811029');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Bruce','Dern','nm0001136');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Bruce','Boxleintner','nm0000310');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Rutger','Hauer','nm0000442');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Sean','Young','nm0000707');
INSERT INTO interpretes(nombre,apellidos,imdb) VALUES ('Matthew','McConaughey','nm0000190');

INSERT INTO directores(nombre,apellidos,imdb) VALUES ('Robert','Zemekis','nm0000709');
INSERT INTO directores(nombre,apellidos,imdb) VALUES ('Douglas','Trumbull','nm0874320');

INSERT INTO peliculas(titulo,idSoporte,idGenero) VALUES('Naves Misteriorsas',1,1);