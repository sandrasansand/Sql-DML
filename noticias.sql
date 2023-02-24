DROP DATABASE IF EXISTS noticias;
CREATE DATABASE noticias;
USE noticias;

CREATE table usuario (
    id              INTEGER PRIMARY KEY,
    nombre          varchar(100) NOT NULL UNIQUE,
    nombre_completo varchar(400) NOT NULL,
    email           varchar(400) NOT NULL UNIQUE,
    fecha_registro  TIMESTAMP NOT NULL,
    foto            BLOB
);

CREATE table articulo (
    id                INTEGER PRIMARY KEY,
    titulo            varchar(200) NOT NULL,
    texto             TEXT NOT NULL,
    fecha_publicacion TIMESTAMP NOT NULL,
    autor             INTEGER NOT NULL
);

ALTER TABLE articulo ADD CONSTRAINT articulo_FK 
FOREIGN KEY (autor) REFERENCES usuario (id);

CREATE table comentario (
    id         INTEGER PRIMARY KEY,
    articulo   INTEGER NOT NULL,
    usuario    INTEGER NOT NULL,
    fecha      TIMESTAMP NOT NULL,
    texto      TEXT NOT NULL,
    valoracion INTEGER
);

ALTER TABLE comentario ADD CONSTRAINT comentario_FK 
FOREIGN KEY (articulo) REFERENCES articulo (id)
ON DELETE CASCADE;

ALTER TABLE comentario ADD CONSTRAINT comentario_FK2 
FOREIGN KEY (usuario) REFERENCES usuario (id)
ON DELETE CASCADE;

CREATE TABLE categoria (
    nombre     varchar(200) PRIMARY KEY,
    padre      varchar(200)
    );

ALTER TABLE categoria ADD CONSTRAINT categoria_FK1 
FOREIGN KEY (padre) REFERENCES categoria (nombre)
ON DELETE CASCADE;

CREATE table clasifica (
    articulo   INTEGER,
    categoria  varchar(200),
    PRIMARY KEY (articulo,categoria)
);

ALTER TABLE clasifica ADD CONSTRAINT clasifica_FK1 
FOREIGN KEY (articulo) REFERENCES articulo (id)
ON DELETE CASCADE;

ALTER TABLE clasifica ADD CONSTRAINT clasifica_FK2 
FOREIGN KEY (categoria) REFERENCES categoria (nombre);

INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('1', 'antonio', 'Antonio López', 'antonio@gmail.com','2012/02/26 13:24:33');
INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('2', 'bea', 'Bea López', 'bea@gmail.com', '2012/02/17 13:25:04');
INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('3', 'clara', 'Clara Sánchez', 'clara@gmail.com','2008/12/26 13:25:43');
INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('4', 'delia', 'Delia Sánchez', 'delia@gmail.com', '2009/10/22 13:28:10');
INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('5', 'emilia', 'Emilia Sánchez', 'emilia@gmail.com', '2007/10/22 09:26:17');
INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('6', 'josé', 'josé López', 'josé@gmail.com', '2007/09/21 13:28:27');
INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('7', 'gema', 'Gema Coslada, 'gema@gmail.com', '2011/12/22 13:28:35');
INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('8', 'helena', 'Helena Coslada', 'helena@gmail.com', '2009/09/21 13:28:48');
INSERT INTO noticias.usuario (id, nombre, nombre_completo, email, fecha_registro) VALUES ('9', 'inés', 'Inés López', 'ines@gmail.com', '2010/02/26 13:28:56');

INSERT INTO noticias.categoria (nombre) VALUES ('HARDWARE');
INSERT INTO noticias.categoria (nombre) VALUES ('SOFTWARE');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('DISCOS DUROS', 'HARDWARE');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('TARJETA GR FICA', 'HARDWARE');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('PLACA BASE', 'HARDWARE');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('ANTIVIRUS', 'SOFTWARE');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('SISTEMA OPERATIVO', 'SOFTWARE');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('JUEGOS', 'SOFTWARE');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('RPG', 'JUEGOS');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('FPS', 'JUEGOS');
INSERT INTO noticias.categoria (nombre, padre) VALUES ('ESTRATEGIA', 'JUEGOS');


INSERT INTO noticias.articulo (id, titulo, texto, fecha_publicacion, autor) VALUES ('1', 'The Witness contar  con m s de 400 puzles y entre 10-15 horas de juego', 'Jonathan Blow, el creador de Braid, ha hablado con el medio indiegames sobre su pr xima creaci n, The Witness, que tiene prevista su salida a lo largo del presente a o en iOS y PC.El t tulo contendr  alrededor de 440 puzles y durar  en torno a las 10-15 horas de experiencia de juego, con una reciente estimaci n donde precisaron de 9 horas y media para superar las dos grandes  reas del t tulo.Una versi n del juego para consolas no est  descartada, aunque su lanzamiento siempre estar a condicionado al posible  xito en iOS y PC.', '2012/02/23 13:38:27', '1');
INSERT INTO noticias.articulo (id, titulo, texto, fecha_publicacion, autor) VALUES ('2', 'El nuevo Command Conquer "tendr  la calidad de Bioware"', 'Bioware se est  encargando del desarrollo de la secuela de Command Conquer: Generals 2, t tulo en preparaci n para PC con un lanzamiento estimado en 2013.Ray Muzyka, uno de los responsables de Bioware, ha hablado con Kotaku sobre este nuevo videojuego asegurando que "tendr  la calidad propia  de los t tulos que ha desarrollado el estudio en los  ltimos tiempos. Queremos traer la calidad de Bioware. Deseamos ofrecer una historia convincente a una experiencia de juego de estrategia en tiempo real, es una oportunidad interesante para a adir m s historia en dicho espacio. Lo vemos como una oportunidad para innovar y dar a la gente m s, pero de una forma apropiada para el g nero , comenta.Las anteriores entregas de Command Conquer fueron desarrolladas por Westwood Studios y EA Los  ngeles.', '2012/02/22 13:38:32', '1');
INSERT INTO noticias.articulo (id, titulo, texto, fecha_publicacion, autor) VALUES ('3', 'Operation Raccoon City se estrenar  en PC el 18 de mayo', 'Capcom ha confirmado que el juego de acci n multijugador basado en el universo Resident Evil: Operation Raccoon City, se estrenar  en compatibles el pr ximo 18 de mayo.Esta versi n del juego dar  soporte a la tecnolog a 3D estereosc pica NVidIA 3D Vision, as  como presentar  unas texturas a mayor resoluci n que las vistas en consolas. El resto de opciones se mantendr n id nticas al juego de Xbox 360 y PlayStation 3, que se estrenar  el 20 de marzo.', '2012/02/19 13:38:36', '1');
INSERT INTO noticias.articulo (id, titulo, texto, fecha_publicacion, autor) VALUES ('4', 'El gratuito Shadow Company: The Mercenary War se lanzar  a finales de este a o', 'La compa  a Nexon ha anunciado que ser  la encargada de correr con los gastos y derechos de distribuci n del videojuego gratuito Shadow Company: The Mercenary War . El juego est  basado en el motor gr fico Unreal Engine y da soporte a un multijugador para hasta 24 usuarios con efectos de "luz din micos, animaci n de personajes" y ofreciendo "una fidelidad gr fica rara de ver en un juego gratuito", seg n declaran sus responsables.La compa  a Nexon ha anunciado que ser  la encargada de correr con los gastos y derechos de distribuci n del videojuego gratuito Shadow Company: The Mercenary War . "Distribuir Shadow Company: The Mercenary War en Europa es un gran paso para nosotros", han declarado los chicos de Nexon Europe, comandados por SungJin Kim, CEO del equipo. "Ser  un placer para nosotros ofrecer un juego de tan alta calidad a la comunidad europea con unos gr ficos rompedores".', '2012/02/20 13:38:41', '2');
INSERT INTO noticias.articulo (id, titulo, texto, fecha_publicacion, autor) VALUES ('5', 'La beta abierta de Mythos Global acumula ya m s de un mill n de mazmorras limpiadas de enemigos', 'Los chicos de Hanbitsoft han hecho p blico un curioso infogr fico con algunos de los datos y detalles m s relevantes de Mythos Global, el t tulo que desarrollan y que se encuentra ahora mismo en fase beta.A continuaci n los detallamos:General:Mazmorras limpiadas: 1,1 millones   tems desmantelados: 2,2 millones  N mero de aumentos: 19.265Personajes por g nero:  Hombres:52,5%  Mujeres: 47,5%Personajes por clase:  Bloodletter: el 40,2%  Gadgeteer: 31,4%  Pyromancer: 28,3%Personaje por raza:  Gremlin: 32,1% Humano: 30,9%  S tiro: 23,9%  C clope: 13,0%', '2012/01/20 13:38:41', '3');
INSERT INTO noticias.articulo (id, titulo, texto, fecha_publicacion, autor) VALUES ('6', 'Salen a la luz los bocetos art sticos del posible proyecto cancelado sobre Jack el Destripador de Visceral Games', 'Cuando Visceral Games termin  Dead Space uno de los primeros proyectos en los que se coment  que trabajar an, en paralelo a Dantes Inferno, fue un videojuego sobre Jack el Destripador que ahora sabemos que iba a responder al escueto nombre de The Ripper.El proyecto no lleg  a ser anunciado formalmente nunca, aunque las informaciones que lo rodeaban parec an garantizar su producci n, y finalmente ahora parece que tras unos meses sin dar se ales de vida podr a haber sido cancelado.The Ripper vuelve a ser noticia a d a de hoy por la publicaci n de manos de Joebot, uno de los principales artistas de Visceral Games, de unos interesantes bocetos sobre la faceta art stica del programa.', '2011/02/20 13:38:41', '1');
INSERT INTO noticias.articulo (id, titulo, texto, fecha_publicacion, autor) VALUES ('7', 'La media de juego de los usuarios de The Old Republic ronda las cuatro horas por partida', 'BioWare ha hecho p blicos unos interesantes datos alrededor de los aficionados que juegan a Star Wars: The Old Republic, revelando de este modo algunas caracter sticas y curiosidades sobre su perfil de usuario.Seg n declaran, la media de horas de juego por sesi n es de la friolera de cuatro horas, una cantidad exorbitada que ha sido calificada por sus responsables de "absurda". Y seg n declaran, as  mismo, el d a preferido para jugar es el domingo."Cuando juegan a The Old Republic sus sesiones son absurdas", declar  Greg Zeschuck, uno de los co-fundadores del estudio. "Lo que implica es que hemos conseguido crear en los aficionados esa sensaci n de `s lo una misi n m s, una  ltima cosa ... Me descubro a m  mismo a menudo haciendo igual. Es un juego que te atrapa".', '2012/02/18 13:38:41', '5');
INSERT INTO noticias.articulo (id, titulo, texto, fecha_publicacion, autor) VALUES ('8', 'Un poco cre ble rumor apunta a un hipot tico lanzamiento de Diablo III en abril', 'Los rumores tienen poco espacio en 3DJuegos, pero cuando  stos son sobre videojuegos tan importantes como Diablo III, la actualidad nos obliga a, como m nimo, rese arlos con muchas reservas por el enorme movimiento y atenci n que mueven. Es el caso de la poco convincente habladur a que ha rodeado al Action-RPG de Blizzard, que seg n una importante cadena comercial holandesa (duimschroef) podr a ponerse a la venta el d a 19 de abril: una fecha sin duda demasiado cercana para tom rsela en serio.', '2012/01/15 13:38:41', '2');

INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('1', 'SOFTWARE');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('1', 'JUEGOS');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('1', 'RPG');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('2', 'SOFTWARE');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('2', 'JUEGOS');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('2', 'FPS');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('3', 'SOFTWARE');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('3', 'JUEGOS');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('3', 'RPG');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('4', 'SOFTWARE');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('5', 'JUEGOS');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('6', 'JUEGOS');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('7', 'JUEGOS');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('8', 'SOFTWARE');
INSERT INTO noticias.clasifica (articulo, categoria) VALUES ('8', 'JUEGOS');

INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('1', '1', '2', '2012/02/19 11:57:25', 'Muy bien.', '5');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('2', '1', '3', '2012/02/20 11:57:40', 'Perfecto', '2');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('3', '1', '4', '2012/02/21 11:57:45', 'Me ha gustado mucho', '5');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('4', '1', '3', '2012/02/22 11:57:50', 'Tienes algunos fallos en el texto', '4');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto) VALUES ('5', '1', '2', '2012/02/22 13:57:54', 'A ver si es verdad');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto) VALUES ('6', '1', '3', '2012/02/25 11:58:06', 'Pronto llegar  la nueva versi n');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto) VALUES ('7', '1', '3', '2012/02/25 17:58:11', 'Eso hay que comprobarlo');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('8', '1', '1', '2012/02/26 11:58:22', 'No me ha gustado nada', '3');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('9', '1', '4', '2012/02/26 16:58:25', 'Est  bastante bien.', '2');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('10', '1', '5', '2012/02/27 11:58:31', ' Podr as ampliarlo?', '5');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto) VALUES ('11', '2', '6', '2012/02/24 11:58:35', 'Estoy de acuerdo');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('12', '2', '6', '2012/02/25 11:58:39', 'En todo', '1');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('13', '2', '2', '2012/02/26 11:58:45', 'No estoy conforme', '3');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('14', '2', '1', '2012/02/27 11:58:48', 'Vale.', '5');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('15', '3', '2', '2012/02/27 08:58:51', 'Algunas cosas tienes que mirarlas mejor', '2');
INSERT INTO noticias.comentario (id, articulo, usuario, fecha, texto, valoracion) VALUES ('16', '3', '5', '2012/02/27 11:58:55', 'Bien.', '3');

commit;
