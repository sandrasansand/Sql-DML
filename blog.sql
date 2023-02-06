DROP DATABASE IF EXISTS Blog;
CREATE DATABASE Blog
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE Blog;

CREATE TABLE Usuarios(
NomUsuario VARCHAR(20) PRIMARY KEY,
email VARCHAR(50) NOT NULL UNIQUE,
email_2 VARCHAR(50),
Nombre_Real VARCHAR(80) NOT NULL,
Fecha_Nac DATE) ENGINE= INNODB;

CREATE TABLE Mensajes(
NomUsuarioEnvia VARCHAR(20),
NomUsuarioRecibe VARCHAR(20),
Fecha DATETIME NOT NULL,
Texto_Mensaje TEXT,
PRIMARY KEY(NomUsuarioEnvia,NomUsuarioRecibe,Fecha),
FOREIGN KEY(NomUsuarioRecibe) REFERENCES Usuarios(NomUsuario) ON DELETE
RESTRICT ON UPDATE CASCADE,
FOREIGN KEY(NomUsuarioEnvia) REFERENCES Usuarios(NomUsuario) ON DELETE
RESTRICT ON UPDATE CASCADE) ENGINE=INNODB;

CREATE TABLE Categorias(
NomCategoria VARCHAR(20) PRIMARY KEY,
NomCategoriaPadre VARCHAR(20)) ENGINE=INNODB;

ALTER TABLE Categorias
ADD FOREIGN KEY(NomCategoriaPadre) REFERENCES Categorias(NomCategoria)
ON UPDATE CASCADE ON DELETE RESTRICT;

CREATE TABLE Entradas(
ID_Entrada INT AUTO_INCREMENT PRIMARY KEY,
Titulo VARCHAR(30) NOT NULL,
Fecha DATE NOT NULL,
Texto_Entrada TEXT NOT NULL,
NomCategoria VARCHAR(20) NOT NULL,
NomUsuario VARCHAR(20) NOT NULL,
FOREIGN KEY (NomCategoria) REFERENCES Categorias (NomCategoria) ON UPDATE
CASCADE ON DELETE RESTRICT,
FOREIGN KEY (NomUsuario) REFERENCES Usuarios (NomUsuario) ON UPDATE CASCADE
ON DELETE RESTRICT) ENGINE=INNODB;

/*crear tabla comentarios*/

CREATE TABLE Comentarios(
ID_Comentario INT AUTO_INCREMENT PRIMARY KEY,
Texto_Comentario TEXT NOT NULL,
Fecha DATE NOT NULL,
NomUsuario VARCHAR(20) NOT NULL,
ID_EntradaResponde INT,
ID_ComentarioResponde INT,
FOREIGN KEY (NomUsuario) REFERENCES Usuarios(NomUsuario) ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (ID_EntradaResponde) REFERENCES Entradas(ID_Entrada) ON UPDATE
CASCADE ON DELETE RESTRICT) ENGINE=INNODB;

ALTER TABLE Comentarios
ADD FOREIGN KEY (ID_ComentarioResponde) REFERENCES Comentarios(ID_Comentario)
ON DELETE CASCADE ON UPDATE CASCADE;