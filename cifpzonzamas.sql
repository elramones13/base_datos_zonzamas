DROP RULE actu_cursos_ciclos1 on alumnos;
DROP RULE actu_cursos_ciclos2 on alumnos;
DROP RULE actu_cursos_ciclos3 on alumnos;
DROP RULE actu_cursos_ciclos4 on alumnos;
DROP RULE actu_cursos_ciclos5 on alumnos;
DROP RULE actu_cursos_ciclos6 on alumnos;
DROP RULE actu_cursos_ciclos7 on alumnos;
DROP RULE actu_cursos_ciclos8 on alumnos;

DROP RULE insert_alum on alumnos;
DROP RULE update_alum on alumnos;
DROP RULE delete_alum on alumnos;

DROP RULE insert_prof on alumnos;
DROP RULE insert_prof on alumnos;
DROP RULE insert_prof on alumnos;

DROP RULE insert_mod on alumnos;
DROP RULE insert_mod on alumnos;
DROP RULE insert_mod on alumnos;


DROP TABLE alumnos_modulos CASCADE;
DROP TABLE alumnos CASCADE;
DROP TABLE modulos CASCADE;
DROP TABLE cursos_ciclos CASCADE;
DROP TABLE profesores CASCADE;
DROP TABLE personas CASCADE;
DROP TABLE ciclos CASCADE;
DROP TABLE log_alumnos CASCADE;
DROP TABLE log_profesores CASCADE;
DROP TABLE log_modulos CASCADE;

CREATE TABLE ciclos (
    id serial PRIMARY KEY,
    nombre VARCHAR(180),
    siglas VARCHAR(4),
    tipo VARCHAR (2)
);

CREATE TABLE personas(
    id serial PRIMARY KEY,
    nombre VARCHAR(80),
    apellido1 VARCHAR(80),
    apellido2 VARCHAR(80),
    fecha_nacimiento date,
    email VARCHAR(100),
    telefono VARCHAR(12),
    sexo char(1),
    pais char(2),
    id_copy INT
);

CREATE TABLE profesores(
    id_profesor serial PRIMARY KEY
)INHERITS(personas);

CREATE TABLE cursos_ciclos(
    id serial PRIMARY KEY,
    curso char(1),
    id_tutor int REFERENCES profesores(id_profesor) ON DELETE CASCADE ON UPDATE CASCADE,
    id_ciclo int REFERENCES ciclos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE modulos(
    id_modulo serial PRIMARY KEY,
    nombre VARCHAR(60),
    siglas VARCHAR(3),
    id_curso_ciclo int REFERENCES cursos_ciclos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    id_prof int REFERENCES profesores(id_profesor) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE alumnos(
    id_alumnos serial PRIMARY KEY,
    repetidor boolean default false,
    id_curso_ciclo int REFERENCES cursos_ciclos(id) ON DELETE CASCADE ON UPDATE CASCADE
)INHERITS(personas);

CREATE TABLE alumnos_modulos(
    id serial PRIMARY KEY,
    id_alumno int ,
    id_modulo int 
);

CREATE TABLE log_alumnos (
    id serial primary key,
    hora date DEFAULT CURRENT_DATE,
    accion varchar(80),
    id_alumno int,
    repetidor bool,
    id_curso_ciclo int,
    nombre varchar(80),
    apellido1 varchar(80),
    apellido2 varchar(80),
    fecha_nacimiento date,
    email varchar(80),
    telefono varchar(80), 
    sexo char,
    pais varchar(80)
);

CREATE TABLE log_profesores (
    id serial primary key,
    hora date DEFAULT CURRENT_DATE,
    accion varchar(80),
    id_alumno int,
    nombre varchar(80),
    apellido1 varchar(80),
    apellido2 varchar(80),
    fecha_nacimiento date,
    email varchar(80),
    telefono varchar(80), 
    sexo char,
    pais varchar(80)
);

CREATE TABLE log_modulos (
    id serial primary key,
    hora date DEFAULT CURRENT_DATE,
    accion varchar(80),
    nombre varchar(80),
    siglas VARCHAR(3),
    id_curso_ciclo int,
    id_prof int
);


CREATE OR REPLACE RULE actu_cursos_ciclos1 AS ON UPDATE TO alumnos where NEW.id_curso_ciclo = 1  DO ALSO insert into alumnos_modulos (id_alumno, id_modulo) VALUES (NEW.id_copy, 1), (NEW.id_copy, 2), (NEW.id_copy, 3), (NEW.id_copy, 4), (NEW.id_copy, 5), (NEW.id_copy, 6);
CREATE OR REPLACE RULE actu_cursos_ciclos2 AS ON UPDATE TO alumnos where NEW.id_curso_ciclo = 2  DO ALSO insert into alumnos_modulos (id_alumno, id_modulo) VALUES (NEW.id_copy, 7), (NEW.id_copy, 8), (NEW.id_copy, 9), (NEW.id_copy, 10), (NEW.id_copy, 11);
CREATE OR REPLACE RULE actu_cursos_ciclos3 AS ON UPDATE TO alumnos where NEW.id_curso_ciclo = 3  DO ALSO insert into alumnos_modulos (id_alumno, id_modulo) VALUES (NEW.id_copy, 12), (NEW.id_copy, 13), (NEW.id_copy, 14), (NEW.id_copy, 15), (NEW.id_copy, 16), (NEW.id_copy, 17), (NEW.id_copy, 18);
CREATE OR REPLACE RULE actu_cursos_ciclos4 AS ON UPDATE TO alumnos where NEW.id_curso_ciclo = 4  DO ALSO insert into alumnos_modulos (id_alumno, id_modulo) VALUES (NEW.id_copy, 19), (NEW.id_copy, 20), (NEW.id_copy, 21), (NEW.id_copy, 22), (NEW.id_copy, 23), (NEW.id_copy, 24);
CREATE OR REPLACE RULE actu_cursos_ciclos5 AS ON UPDATE TO alumnos where NEW.id_curso_ciclo = 5  DO ALSO insert into alumnos_modulos (id_alumno, id_modulo) VALUES (NEW.id_copy, 25), (NEW.id_copy, 26), (NEW.id_copy, 27), (NEW.id_copy, 28), (NEW.id_copy, 29);
CREATE OR REPLACE RULE actu_cursos_ciclos6 AS ON UPDATE TO alumnos where NEW.id_curso_ciclo = 6  DO ALSO insert into alumnos_modulos (id_alumno, id_modulo) VALUES (NEW.id_copy, 30), (NEW.id_copy, 31), (NEW.id_copy, 32), (NEW.id_copy, 33), (NEW.id_copy, 34);
CREATE OR REPLACE RULE actu_cursos_ciclos7 AS ON UPDATE TO alumnos where NEW.id_curso_ciclo = 7  DO ALSO insert into alumnos_modulos (id_alumno, id_modulo) VALUES (NEW.id_copy, 35), (NEW.id_copy, 36), (NEW.id_copy, 37), (NEW.id_copy, 38), (NEW.id_copy, 39), (NEW.id_copy, 40);
CREATE OR REPLACE RULE actu_cursos_ciclos8 AS ON UPDATE TO alumnos where NEW.id_curso_ciclo = 8  DO ALSO insert into alumnos_modulos (id_alumno, id_modulo) VALUES (NEW.id_copy, 41), (NEW.id_copy, 42), (NEW.id_copy, 43), (NEW.id_copy, 44), (NEW.id_copy, 45), (NEW.id_copy, 46);
/*
CREATE OR REPLACE RULE actu_ciclos1 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 1   DO ALSO insert into cursos_ciclos (curso, id_tutor, id_ciclo) VALUES ();
CREATE OR REPLACE RULE actu_ciclos2 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 2   DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 7), (NEW.id_copy, 8), (NEW.id_copy, 9), (NEW.id_copy, 10), (NEW.id_copy, 11);
CREATE OR REPLACE RULE actu_ciclos3 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 3   DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 12), (NEW.id_copy, 13), (NEW.id_copy, 14), (NEW.id_copy, 15), (NEW.id_copy, 16), (NEW.id_copy, 17), (NEW.id_copy, 18);
CREATE OR REPLACE RULE actu_ciclos4 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 4   DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 19), (NEW.id_copy, 20), (NEW.id_copy, 21), (NEW.id_copy, 22), (NEW.id_copy, 23), (NEW.id_copy, 24);
CREATE OR REPLACE RULE actu_ciclos5 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 5   DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 25), (NEW.id_copy, 26), (NEW.id_copy, 27), (NEW.id_copy, 28), (NEW.id_copy, 29);
CREATE OR REPLACE RULE actu_ciclos6 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 6   DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 30), (NEW.id_copy, 31), (NEW.id_copy, 32), (NEW.id_copy, 33), (NEW.id_copy, 34);
CREATE OR REPLACE RULE actu_ciclos7 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 7   DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 35), (NEW.id_copy, 36), (NEW.id_copy, 37), (NEW.id_copy, 38), (NEW.id_copy, 39), (NEW.id_copy, 40);
CREATE OR REPLACE RULE actu_ciclos8 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 8   DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 41), (NEW.id_copy, 42), (NEW.id_copy, 43), (NEW.id_copy, 44), (NEW.id_copy, 45), (NEW.id_copy, 46);
CREATE OR REPLACE RULE actu_ciclos1 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 9   DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 1), (NEW.id_copy, 2), (NEW.id_copy, 3), (NEW.id_copy, 4), (NEW.id_copy, 5), (NEW.id_copy, 6);
CREATE OR REPLACE RULE actu_ciclos2 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 10  DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 7), (NEW.id_copy, 8), (NEW.id_copy, 9), (NEW.id_copy, 10), (NEW.id_copy, 11);
CREATE OR REPLACE RULE actu_ciclos3 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 11  DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 12), (NEW.id_copy, 13), (NEW.id_copy, 14), (NEW.id_copy, 15), (NEW.id_copy, 16), (NEW.id_copy, 17), (NEW.id_copy, 18);
CREATE OR REPLACE RULE actu_ciclos4 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 12  DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 19), (NEW.id_copy, 20), (NEW.id_copy, 21), (NEW.id_copy, 22), (NEW.id_copy, 23), (NEW.id_copy, 24);
CREATE OR REPLACE RULE actu_ciclos5 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 13  DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 25), (NEW.id_copy, 26), (NEW.id_copy, 27), (NEW.id_copy, 28), (NEW.id_copy, 29);
CREATE OR REPLACE RULE actu_ciclos6 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 14  DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 30), (NEW.id_copy, 31), (NEW.id_copy, 32), (NEW.id_copy, 33), (NEW.id_copy, 34);
CREATE OR REPLACE RULE actu_ciclos7 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 15  DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 35), (NEW.id_copy, 36), (NEW.id_copy, 37), (NEW.id_copy, 38), (NEW.id_copy, 39), (NEW.id_copy, 40);
CREATE OR REPLACE RULE actu_ciclos8 AS ON UPDATE TO profesores where NEW.id_curso_ciclo = 16  DO ALSO insert into cursos_ciclos (id_alumno, id_modulo) VALUES (NEW.id_copy, 41), (NEW.id_copy, 42), (NEW.id_copy, 43), (NEW.id_copy, 44), (NEW.id_copy, 45), (NEW.id_copy, 46);
*/

INSERT INTO ciclos (nombre, siglas, tipo) VALUES ('Desarrollo de Aplicaciones Web', 'DAW', 'GS');
INSERT INTO ciclos (nombre, siglas, tipo) VALUES ('Administración de sistemas informáticos en red', 'ASIR', 'GS');
INSERT INTO ciclos (nombre, siglas, tipo) VALUES ('Sistemas Microinformáticos y Redes', 'SMR', 'GM');
INSERT INTO ciclos (nombre, siglas, tipo) VALUES ('Desarrollo de Aplicaciones Multiplataforma', 'DAM', 'GS');

INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Francisco Félix','Atoche', 'Bethencourt', '19830227', 'pacofelix@gmail.com', '648574903', 'M', 'ES');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('María del Carmen', 'Alonso', 'Suárez', '19780520', 'marialsu@gmail.com', '657368594', 'F', 'GB');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Juan Rafael', 'Curbelo', 'Arrocha', '19600723', 'juancura"gmail.com', '643958327', 'M', 'EC');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Etiel Juan', 'Domínguez', 'Sánchez', '19700227', 'etidosa@gmail.com', '648573674', 'M', 'HT');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Nieves', 'García', 'García', '19800512', 'nigaga@gmail.com', '648392658', 'F', 'IN');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Ana María', 'Rijo', 'García', '19750330', 'amariga@gmail.com', '648837258', 'F', 'ES');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Mario', 'Brito', 'Morales', '19841029', 'mabrimo@gmail.com', '658395018', 'M', 'FI');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('María Mercedes', 'González', 'Pérez', '19850523', 'mamegope@gmail.com', '647583902', 'F', 'GB');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Samuel', 'Naranjo', 'Pérez', '19600523', 'sanape@gmail.com', '657497305', 'M', 'ES');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Ana', 'Martín', 'Tenorio', '19600625', 'amate@gmail.com', '674328968', 'F', 'FM');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Gustavo Salvador', 'Medina', 'Perdomo', '19780214', 'gusamepe@gmail.com', '654378967', 'M', 'GN');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('María De La Paz', 'Fernández', 'Betancort', '19631231', 'mapafebe@gmail.com', '678543987', 'F', 'GB');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('María del Carmen', 'De Paízi', 'Pereyra', '19790523', 'macapape@gmail.com', '675849306', 'F', 'ES');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Raquel', 'Barrios', 'García', '19890524', 'rabaga@gmail.com', '678654567', 'F', 'ES');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Tibiabín', 'Hernández', 'Rodríguez', '19651029', 'tihero@gmail.com', '678659305', 'M', 'FR');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Raul', 'Martínez', 'Martínez', '19770912', 'ramama@gmail.com', '647597038', 'M', 'ES');
INSERT INTO profesores (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais ) VALUES ('Javier', 'Pérez', 'Campo', '19851205', 'japeca@gmail.com', '637594068', 'M', 'FR');

INSERT INTO cursos_ciclos (curso, id_tutor, id_ciclo) VALUES (1, 1, 1);
INSERT INTO cursos_ciclos (curso, id_tutor, id_ciclo) VALUES (2, 3, 1);
INSERT INTO cursos_ciclos (curso, id_tutor, id_ciclo) VALUES (1, 5, 2);
INSERT INTO cursos_ciclos (curso, id_tutor, id_ciclo) VALUES (2, 7, 2);
INSERT INTO cursos_ciclos (curso, id_tutor, id_ciclo) VALUES (1, 9, 3);
INSERT INTO cursos_ciclos (curso, id_tutor, id_ciclo) VALUES (2, 11, 3);
INSERT INTO cursos_ciclos (curso, id_tutor, id_ciclo) VALUES (1, 13, 4);
INSERT INTO cursos_ciclos (curso, id_tutor, id_ciclo) VALUES (2, 15, 4); 

INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Entornos de desarrollo', 'ETS', 1, 1);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Formación y orientación laboral', 'FOL', 1, 2);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Lenguajes de marcas y sistemas de gestión de información', 'LND', 1, 3);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Bases de datos', 'BAE', 1, 1);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Sistemas informáticos', 'SSF', 1, 4);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Programación', 'PRO', 1, 3); /*6*/
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Empresa e iniciativa emprendedora', 'EMR', 2, 5);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Despliegue de aplicaciones web', 'DPL', 2, 1);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Diseño de interfaces web', 'DOR', 2, 6);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Desarrollo web en entorno cliente', 'DEW', 2, 4);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Desarrollo web en entorno servidor', 'DSW', 2, 7); /*11*/
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Lengua extranjera (Inglés)', 'LNT', 3, 8);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Fundamentos de hardware','FUW', 3, 4);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Formación y orientación laboral','FOL', 3, 2);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Lenguajes de marcas y sistemas de gestión de información','LND', 3, 3);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Gestión de bases de datos','GTB', 3, 9);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Planificación y administración de redes','PNI', 3, 9);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Implantación de sistemas operativos','IDP', 3, 10); /*18*/
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Administración de sistemas gestores de bases de datos','ADE', 4, 3);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Empresa e iniciativa emprendedora','EMR', 4, 2);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Servicios de red e internet','SRD', 4, 11);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Administración de sistemas operativos','ADD', 4, 10);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Seguridad y alta disponibilidad','SGY', 4, 12);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Implantación de aplicaciones web','IMW', 4, 7); /*24*/
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Formación y orientación laboral','FOL', 5, 13);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Sistemas operativos monopuesto','SSV', 5, 14);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Redes locales','RDE', 5, 9);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Montaje y mantenimiento de equipo','MJE', 5, 6);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Aplicaciones ofimáticas','AIF', 5, 14);/*29*/
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Seguridad informática','SEG', 6, 15); 
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Servicios en red','SER', 6, 16);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Aplicaciones web','APW', 6, 17);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Sistemas operativos en red','SOR', 6, 14);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Empresa e iniciativa emprendedora','EMR', 6, 14); /*34*/
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Entornos de desarrollo','ETS', 7, 1); 
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Formación y orientación laboral','FOL', 7, 2);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Lenguajes de marcas y sistemas de gestión de información','LND', 7, 3);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Bases de datos', 'BAE', 7, 1);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Sistemas informáticos', 'SSF', 7, 4);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Programación','PRO', 7, 3); /*40*/
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Empresa e iniciativa emprendedora','EMR', 8, 5);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Acceso a datos','ADD', 8, 1);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Desarrollo de interfaces','DIT', 8, 6);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Programación multimedia y dispositivos móviles','PMD', 8, 4);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Programación de servicios y procesos','PSP', 8, 7);
INSERT INTO modulos (nombre, siglas, id_curso_ciclo, id_prof) VALUES ('Sistemas de gestión empresarial','SGE', 8, 5); /*46*/


insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Mayne', 'Matley', 'Somner', '19830723', 'msomner1@ted.com', '6473156189', 'M', 'CN', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Noam', 'Allam', 'Saberton', '19881223', 'nsaberton2@shinystat.com', '4317750450', 'M', 'CN', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Gabie', 'Lyst', 'McQuaid', '19951010', 'gmcquaid3@twitter.com', '3104018253', 'M', 'SE', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Leilah', 'Reightley', 'Ingliby', '19860707', 'lingliby4@jigsy.com', '1471315975', 'F', 'CN', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Brendin', 'Egger', 'Friese', '19830301', 'bfriese5@google.cn', '2779106199', 'M', 'JP', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Regan', 'Knapton', 'Bleckly', '19921123', 'rbleckly6@plala.or.jp', '5853882124', 'M', 'MX', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Kipp', 'Turmell', 'Baldam', '19810222', 'kbaldam7@bloglines.com', '3926972087', 'F', 'CN', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Loretta', 'Semark', 'Beardmore', '19961123', 'lbeardmore8@cbsnews.com', '5335281603', 'F', 'PL', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Paton', 'Ector', 'Werny', '19900319', 'pwerny9@ibm.com', '4382808595', 'M', 'RU', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Cary', 'Sheran', 'Meadmore', '19980102', 'cmeadmorea@unc.edu', '3785840391', 'M', 'MX', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Patrick', 'Dundendale', 'Desouza', '19971229', 'pdesouzab@cbslocal.com', '5657687760', 'M', 'AR', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ferd', 'Dibner', 'Embra', '19850609', 'fembrac@kickstarter.com', '9439328362', 'M', 'HR', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Tammie', 'Roget', 'Baxandall', '19860730', 'tbaxandalld@xing.com', '8028829417', 'M', 'CN', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Rosemary', 'Cato', 'Meysham', '19980915', 'rmeyshame@elpais.com', '7689295951', 'F', 'BY', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Armin', 'Geekie', 'Kamenar', '19890910', 'akamenarf@boston.com', '4666693841', 'M', 'SI', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Felix', 'Kaemena', 'Tinan', '19801209', 'ftinang@edublogs.org', '8468722742', 'M', 'CN', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Jannelle', 'Geach', 'Elsdon', '19891020', 'jelsdonh@nsw.gov.au', '4478157661', 'F', 'FM', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Jeniffer', 'Dellenbach', 'Skarr', '19951029', 'jskarri@theglobeandmail.com', '6604167932', 'F', 'PH', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Fayette', 'Degoey', 'Visick', '19821223', 'fvisickj@usatoday.com', '8047487643', 'F', 'US', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Yardley', 'Simonaitis', 'Perillo', '19951013', 'yperillok@ifeng.com', '4931517957', 'M', 'CN', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Salmon', 'Oleshunin', 'Partkya', '19810819', 'spartkyal@cargocollective.com', '9552543061', 'M', 'RU', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Emogene', 'Stuckow', 'Creswell', '19831126', 'ecreswellm@blinklist.com', '2036007291', 'F', 'SO', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Rose', 'Raatz', 'Brissenden', '19870210', 'rbrissendenn@thetimes.co.uk', '5814567222', 'F', 'PE', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Benoit', 'Wassung', 'Duggan', '19930809', 'bduggano@statcounter.com', '9553473020', 'M', 'ID', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Latrena', 'McElvine', 'Hartshorne', '19911110', 'lhartshornep@histats.com', '2008082732', 'F', 'GB', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ker', 'Seatter', 'Joder', '19900305', 'kjoderq@example.com', '9352051073', 'M', 'SE', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Jaclyn', 'Goch', 'Gillicuddy', '19980820', 'jgillicuddyr@nps.gov', '7219011488', 'F', 'PH', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Linnet', 'Gommes', 'McClosh', '19811008', 'lmccloshs@jalbum.net', '9792936923', 'F', 'CN', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Etti', 'Burlingham', 'Silcock', '19860730', 'esilcockt@prlog.org', '3739710214', 'F', 'FR', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ellene', 'Aery', 'Crowd', '19860531', 'ecrowdu@ow.ly', '4422242059', 'F', 'BR', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Caron', 'Brahmer', 'Quenby', '19900407', 'cquenbyv@amazon.com', '4181303776', 'F', 'JM', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ashley', 'Concklin', 'Earwaker', '19840618', 'aearwakerw@naver.com', '2043576171', 'F', 'RU', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Mariam', 'Munnion', 'Pinilla', '19890506', 'mpinillax@soup.io', '2511703502', 'F', 'CN', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Valaria', 'Gaylard', 'Tieman', '19960615', 'vtiemany@blogs.com', '3546139360', 'F', 'PT', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Orly', 'Bidmead', 'Abramin', '19980816', 'oabraminz@auda.org.au', '8979767084', 'F', 'CN', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Lorrin', 'Joicey', 'Fuidge', '19841109', 'lfuidge10@wordpress.com', '3318816059', 'F', 'CN', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Lalo', 'Butting', 'Pembry', '19981029', 'lpembry11@netvibes.com', '6012397960', 'M', 'MX', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Aubrey', 'Burress', 'Tidball', '19910623', 'atidball12@google.co.uk', '5088356614', 'F', 'CA', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ede', 'Edie', 'Chiverton', '19970805', 'echiverton13@virginia.edu', '8102623858', 'F', 'CN', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Antonio', 'Hadrill', 'Mitford', '19810911', 'amitford14@guardian.co.uk', '9609857955', 'M', 'CN', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Clemence', 'Sexty', 'Backson', '19820907', 'cbackson15@epa.gov', '7318381631', 'F', 'JP', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Terry', 'Edards', 'Tidridge', '19960804', 'ttidridge16@sbwire.com', '4193987220', 'M', 'JM', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Brooke', 'Valenta', 'Hance', '19970707', 'bhance17@php.net', '9161289047', 'M', 'BR', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Bendix', 'Tille', 'Scholfield', '19920108', 'bscholfield18@yelp.com', '5155006542', 'M', 'BR', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Cayla', 'Frizell', 'Fennessy', '19950501', 'cfennessy19@indiatimes.com', '2341509214', 'F', 'RS', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Angy', 'Woolnough', 'Aiton', '19960326', 'aaiton1a@marriott.com', '4936677822', 'F', 'SE', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Darrell', 'Olennikov', 'Rooney', '19830918', 'drooney1b@yellowpages.com', '3017650082', 'M', 'LV', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Zita', 'Morfett', 'Godsafe', '19970516', 'zgodsafe1c@sun.com', '9682954964', 'F', 'ZA', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Nikaniki', 'Greenham', 'Crackel', '19851027', 'ncrackel1d@w3.org', '6325416139', 'F', 'UA', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Aubrey', 'Lonnon', 'Johnys', '19890314', 'ajohnys1e@psu.edu', '6906445288', 'F', 'CN', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Hy', 'McCreadie', 'Samwaye', '20000617', 'hsamwaye1f@theatlantic.com', '6803142513', 'M', 'CN', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Shanie', 'Huke', 'Hryniewicz', '19961111', 'shryniewicz1g@youku.com', '7825738686', 'F', 'PL', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Flore', 'Bottomore', 'Recher', '19900113', 'frecher1h@exblog.jp', '7379671343', 'F', 'KM', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Rey', 'Heis', 'Fantone', '20000517', 'rfantone1i@facebook.com', '4334433631', 'F', 'CN', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ely', 'Bodill', 'Pierton', '20000522', 'epierton1j@furl.net', '1132802432', 'M', 'JP', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Kassandra', 'Taylor', 'Worster', '19810120', 'kworster1k@yandex.ru', '9461263248', 'F', 'CN', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Lenci', 'Harses', 'Lidell', '19901226', 'llidell1l@twitpic.com', '3371808565', 'M', 'ZA', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Olenolin', 'Barns', 'Douch', '19801126', 'odouch1m@godaddy.com', '3729186481', 'M', 'TH', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Vilma', 'Keningham', 'Di Roberto', '19810216', 'vdiroberto1n@people.com.cn', '9048310079', 'F', 'CN', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Hollis', 'Falk', 'Magson', '19981116', 'hmagson1o@skype.com', '6963028144', 'M', 'ID', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ricky', 'Danilishin', 'Lindner', '19830927', 'rlindner1p@youku.com', '4324894324', 'M', 'PL', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Gabbie', 'Lanon', 'Quincey', '19901126', 'gquincey1q@wikimedia.org', '5679490424', 'M', 'RU', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Hartwell', 'Sadler', 'Dedman', '20000728', 'hdedman1r@samsung.com', '2909920958', 'M', 'CN', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Alvie', 'Tommasuzzi', 'Krikorian', '19910726', 'akrikorian1s@netlog.com', '6923302734', 'M', 'IE', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Melisandra', 'MacAdam', 'Shwenn', '19810516', 'mshwenn1t@comcast.net', '5594115504', 'F', 'NZ', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Gavra', 'Kidgell', 'Cohen', '19890901', 'gcohen1u@usnews.com', '5987507117', 'F', 'AF', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Trudy', 'Leary', 'Grimbaldeston', '19990622', 'tgrimbaldeston1v@adobe.com', '7463853531', 'F', 'PH', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Dana', 'Ivanitsa', 'De Morena', '19991227', 'ddemorena1w@deviantart.com', '8696916387', 'M', 'AM', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Mab', 'Gaunt', 'Flaverty', '19981002', 'mflaverty1x@yahoo.com', '4833540799', 'F', 'CN', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Quinton', 'Mably', 'Clurow', '19860110', 'qclurow1y@instagram.com', '1466652633', 'M', 'BG', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Wallie', 'Hebblethwaite', 'Mignot', '19990809', 'wmignot1z@google.it', '4004439596', 'F', 'RU', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Raul', 'Wreight', 'Gofford', '19970223', 'rgofford20@dropbox.com', '8136902062', 'M', 'MY', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Leanna', 'Bohler', 'Blaschke', '19960209', 'lblaschke21@imgur.com', '8692978313', 'F', 'ID', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ashli', 'Bridgeman', 'Bleackly', '19990707', 'ableackly22@shoppro.jp', '9584445525', 'F', 'MU', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Joachim', 'Jagielski', 'Gregs', '19901213', 'jgregs23@cdbaby.com', '6346825045', 'M', 'SE', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Markos', 'Sazio', 'Brugh', '19840707', 'mbrugh24@etsy.com', '1682117695', 'M', 'PH', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ira', 'McNish', 'Alven', '19921107', 'ialven25@i2i.jp', '2115492113', 'F', 'RU', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Alicea', 'Skehan', 'Roobottom', '19880612', 'aroobottom26@walmart.com', '1889882886', 'F', 'NZ', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Pat', 'Lerego', 'Akast', '19910218', 'pakast27@ucla.edu', '7694048694', 'M', 'CX', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Kaylil', 'Ashby', 'Ehrat', '19901017', 'kehrat28@1und1.de', '4214958342', 'F', 'PT', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Malynda', 'Boissieux', 'Espada', '19920505', 'mespada29@smh.com.au', '2103297675', 'F', 'US', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Alvin', 'Bothams', 'Grayling', '19930227', 'agrayling2a@independent.co.uk', '1835281056', 'M', 'PH', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Laughton', 'Rabley', 'Ruegg', '19840714', 'lruegg2b@marketwatch.com', '7069791251', 'M', 'FR', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Hyman', 'Greenside', 'Shawcroft', '19990320', 'hshawcroft2c@time.com', '6019497228', 'M', 'CZ', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Aguste', 'Tesh', 'Valdes', '19940531', 'avaldes2d@ebay.com', '8973717981', 'M', 'BR', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Theodore', 'Glynn', 'Coarser', '19960726', 'tcoarser2e@wikia.com', '3604734484', 'M', 'ID', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Jerrie', 'Kepp', 'Austins', '19950628', 'jaustins2f@networkadvertising.org', '9148926741', 'M', 'NA', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Rivi', 'Godber', 'Skoate', '19820919', 'rskoate2g@bloglovin.com', '6104528662', 'F', 'JP', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Marysa', 'Gorges', 'Crich', '19841226', 'mcrich2h@cnn.com', '6518759345', 'F', 'CN', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Greg', 'Osorio', 'Dunan', '19900530', 'gdunan2i@meetup.com', '2391144384', 'M', 'BR', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Aurea', 'Risebarer', 'McBeath', '19921214', 'amcbeath2j@xrea.com', '6047943563', 'F', 'RU', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ophelia', 'Paulucci', 'Mushet', '19960122', 'omushet2k@123reg.co.uk', '3663510947', 'F', 'KM', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Spike', 'Guerrieri', 'Beasley', '19870516', 'sbeasley2l@msn.com', '9044142262', 'M', 'PH', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Chrysler', 'Swanbourne', 'Blasiak', '19860807', 'cblasiak2m@nytimes.com', '4624329171', 'F', 'MM', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Delores', 'Fantham', 'Foch', '19820421', 'dfoch2n@phpbb.com', '2523432689', 'F', 'BR', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Hy', 'Milward', 'Drohan', '19920927', 'hdrohan2o@seesaa.net', '3938068447', 'M', 'VE', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Bob', 'Edmondson', 'Suermeier', '19960222', 'bsuermeier2p@hibu.com', '1426386922', 'M', 'TH', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Tabbie', 'Asbury', 'Nuth', '19971112', 'tnuth2q@mysql.com', '2406066774', 'M', 'UY', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Teodor', 'Clell', 'Bunney', '19980304', 'tbunney2r@usnews.com', '4034188766', 'M', 'CM', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Flossie', 'Samways', 'Fosserd', '19871023', 'ffosserd2s@myspace.com', '6993215510', 'F', 'CZ', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Cass', 'Riddick', 'Jobe', '19891003', 'cjobe2t@wikimedia.org', '1387315032', 'F', 'NG', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Darb', 'Elen', 'Hulmes', '19860209', 'dhulmes2u@privacy.gov.au', '5648542183', 'M', 'CN', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Linda', 'Fley', 'Bobasch', '20001101', 'lbobasch2v@ed.gov', '8236497676', 'F', 'CZ', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Giorgia', 'McKee', 'Bareford', '19820102', 'gbareford2w@china.com.cn', '5334117309', 'F', 'CN', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ransom', 'Gascard', 'Kennefick', '19861104', 'rkennefick2x@clickbank.net', '2454748812', 'M', 'BR', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Vernor', 'Blabber', 'De Gouy', '20000709', 'vdegouy2y@erecht24.de', '3877391612', 'M', 'PA', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Abdul', 'Ulyatt', 'Janew', '19980716', 'ajanew2z@devhub.com', '6269300667', 'M', 'RU', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Michaela', 'Dodwell', 'Hartop', '19900709', 'mhartop30@pen.io', '8174874097', 'F', 'NG', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ashley', 'Summerskill', 'Tootell', '19950522', 'atootell31@auda.org.au', '3492956182', 'M', 'ID', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Patrice', 'Beatson', 'Dooler', '19940710', 'pdooler32@hexun.com', '4852069449', 'F', 'CN', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Marc', 'Stobbart', 'Cleeve', '19970223', 'mcleeve33@marketwatch.com', '7332983719', 'M', 'PL', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Clare', 'Dilliston', 'Matic', '19870501', 'cmatic34@sun.com', '7898858628', 'M', 'MY', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Demetrius', 'Shute', 'Hickenbottom', '19860814', 'dhickenbottom35@japanpost.jp', '6023610377', 'M', 'AR', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Roxi', 'Brighouse', 'Zielinski', '19820331', 'rzielinski36@discuz.net', '7081786186', 'F', 'RU', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Bertie', 'Lympenie', 'Cheeld', '19990725', 'bcheeld37@moonfruit.com', '1854008566', 'F', 'IE', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Krystalle', 'Normant', 'Burleigh', '19830813', 'kburleigh38@pinterest.com', '6936241697', 'F', 'ID', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Far', 'Ranns', 'Crowson', '19961116', 'fcrowson39@narod.ru', '1562989636', 'M', 'HN', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Patricio', 'Rudall', 'Bwye', '19940816', 'pbwye3a@dailymail.co.uk', '7947171424', 'M', 'CN', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Dyanna', 'Rankin', 'Jost', '19870506', 'djost3b@samsung.com', '2248741892', 'F', 'CO', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ellette', 'Landy', 'Hanniger', '19830116', 'ehanniger3c@google.fr', '9819448949', 'F', 'MK', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Iorgo', 'Dedam', 'Loachhead', '19830904', 'iloachhead3d@cnbc.com', '6479913770', 'M', 'CA', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Stafford', 'Gittens', 'D''Onisi', '19960126', 'sdonisi3e@sciencedaily.com', '3025920564', 'M', 'ZA', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Adam', 'Wreight', 'Volk', '19991226', 'avolk3f@macromedia.com', '4927432228', 'M', 'HR', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Saunders', 'Booeln', 'Grinov', '19920302', 'sgrinov3g@imageshack.us', '8792815548', 'M', 'CN', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Andrei', 'Corre', 'Tilio', '19960227', 'atilio3h@free.fr', '9982736903', 'F', 'CN', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Devondra', 'Crilley', 'Aldersey', '19880406', 'daldersey3i@facebook.com', '4475026560', 'F', 'CN', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Mora', 'Egarr', 'Petkov', '20000126', 'mpetkov3j@wix.com', '9661705548', 'F', 'CO', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Riordan', 'Pannaman', 'McHenry', '19890328', 'rmchenry3k@about.me', '8684065901', 'M', 'PE', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Daryle', 'Bugs', 'Oakenfall', '19891212', 'doakenfall3l@google.co.jp', '9156268138', 'M', 'US', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Boone', 'Borge', 'Labrone', '19970824', 'blabrone3m@smugmug.com', '1621322593', 'M', 'PL', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Jenni', 'de Mendoza', 'Acton', '19991229', 'jacton3n@usatoday.com', '1811679686', 'F', 'AR', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Tonya', 'Edgerley', 'Gino', '19890717', 'tgino3o@about.com', '2029902246', 'F', 'US', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Mychal', 'Toplin', 'Markushkin', '19970629', 'mmarkushkin3p@squidoo.com', '8951966770', 'M', 'BR', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Iorgos', 'Corre', 'Cobbe', '19990527', 'icobbe3q@reference.com', '4846975401', 'M', 'VE', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Chalmers', 'Fronczak', 'Bourdis', '19900622', 'cbourdis3r@woothemes.com', '6856825320', 'M', 'CN', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Aldous', 'Copnall', 'Krauze', '19910708', 'akrauze3s@cdc.gov', '8246430595', 'M', 'FR', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Sheilakathryn', 'McCadden', 'Cromblehome', '19961019', 'scromblehome3t@t.co', '7805419110', 'F', 'PH', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Elihu', 'Neesham', 'Cloy', '19980429', 'ecloy3u@weather.com', '5598289862', 'M', 'CN', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Mitzi', 'Schultes', 'McCrystal', '19950116', 'mmccrystal3v@hp.com', '8403045624', 'F', 'HU', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Giorgio', 'Woodhall', 'Klee', '19960927', 'gklee3w@blogs.com', '7268481318', 'M', 'RU', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Renard', 'Carvilla', 'Fairholm', '19910318', 'rfairholm3x@typepad.com', '7581207749', 'M', 'MA', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Dalston', 'Alfuso', 'Queste', '19910129', 'dqueste3y@unblog.fr', '6439764768', 'M', 'BD', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Karrah', 'Beneteau', 'Wolseley', '19931013', 'kwolseley3z@ft.com', '4139535380', 'F', 'PE', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Brig', 'McAneny', 'Hatherley', '19920327', 'bhatherley40@amazon.de', '2275401893', 'M', 'ID', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Byrom', 'Maine', 'Gladdish', '19840815', 'bgladdish41@delicious.com', '2987201255', 'M', 'CA', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Maria', 'Rosoni', 'Ravens', '19880204', 'mravens42@histats.com', '4684966870', 'F', 'PT', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Cobbie', 'Isson', 'Panketh', '19840919', 'cpanketh43@howstuffworks.com', '5139724704', 'M', 'PH', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Brandyn', 'Colville', 'Griffiths', '19891129', 'bgriffiths44@google.com.hk', '3864520591', 'M', 'ID', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Emelen', 'Abbate', 'McNeice', '20000701', 'emcneice45@clickbank.net', '3045940002', 'M', 'PH', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Reese', 'Hoggins', 'McGready', '19930715', 'rmcgready46@sina.com.cn', '8743790106', 'M', 'AR', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Deck', 'Upjohn', 'Mathias', '19920525', 'dmathias47@flavors.me', '8446059284', 'M', 'ID', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Dayle', 'O''Hallihane', 'Turnell', '19850805', 'dturnell48@ucoz.com', '8585280126', 'F', 'SD', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Eugene', 'Pervew', 'Fasset', '19880906', 'efasset49@w3.org', '4972406189', 'M', 'CN', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Glennis', 'Frankcom', 'Selland', '19851206', 'gselland4a@weibo.com', '6919557855', 'F', 'ID', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Dalt', 'O''Murtagh', 'Melbury', '19850902', 'dmelbury4b@photobucket.com', '3055206406', 'M', 'PH', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Mickie', 'Seyffert', 'Toolin', '19911119', 'mtoolin4c@ow.ly', '5914056976', 'M', 'NL', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Nolan', 'Bottrell', 'Binnie', '19830626', 'nbinnie4d@fema.gov', '4416897285', 'M', 'PH', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Merrel', 'Krolak', 'Klezmski', '19900713', 'mklezmski4e@icq.com', '6894855287', 'M', 'ID', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Eula', 'Hicklingbottom', 'Edgcombe', '19960831', 'eedgcombe4f@netlog.com', '7147971316', 'F', 'PT', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Dene', 'Lages', 'Dennison', '20000903', 'ddennison4g@usa.gov', '1162653165', 'M', 'CN', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Alexei', 'Dewane', 'Cornbell', '19930829', 'acornbell4h@google.nl', '9912478599', 'M', 'CN', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Sharleen', 'Radleigh', 'Bickford', '19970924', 'sbickford4i@domainmarket.com', '6198874201', 'F', 'RU', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Koenraad', 'Wrench', 'Alleway', '19881128', 'kalleway4j@desdev.cn', '5625945164', 'M', 'NG', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Lenard', 'Cherm', 'Casassa', '19840224', 'lcasassa4k@joomla.org', '6174685864', 'M', 'VN', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Terrie', 'Fromont', 'Gadd', '19921017', 'tgadd4l@amazon.com', '1937561744', 'F', 'CY', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Stefano', 'Hamner', 'Laundon', '19930126', 'slaundon4m@mit.edu', '5558176887', 'M', 'ID', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Llewellyn', 'Harbert', 'Klyner', '19961024', 'lklyner4n@yellowbook.com', '3552662154', 'M', 'YE', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Mariquilla', 'Fegan', 'Everly', '19981101', 'meverly4o@house.gov', '8724033608', 'F', 'AL', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Sigrid', 'Becom', 'Ernshaw', '19821211', 'sernshaw4p@joomla.org', '7768380413', 'F', 'AL', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Maddy', 'Lomasna', 'Cason', '19970424', 'mcason4q@indiatimes.com', '9413587677', 'M', 'KE', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Gannie', 'Dicken', 'Atwool', '19961015', 'gatwool4r@chronoengine.com', '8755328558', 'M', 'CN', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ilyse', 'Jelley', 'Nugent', '20000302', 'inugent4s@cafepress.com', '2523915158', 'F', 'ID', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Eldin', 'Moultrie', 'Endersby', '19970707', 'eendersby4t@spiegel.de', '3826966668', 'M', 'AR', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Melania', 'Brockie', 'Comford', '19951119', 'mcomford4u@sogou.com', '6998618595', 'F', 'BR', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Selig', 'Burbudge', 'Barrim', '19810907', 'sbarrim4v@tripod.com', '1343673060', 'M', 'JP', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Nancie', 'Mesant', 'Bradd', '19900826', 'nbradd4w@arstechnica.com', '9762348868', 'F', 'CN', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Kori', 'Bartlomiej', 'Buchan', '19890212', 'kbuchan4x@senate.gov', '6514352977', 'F', 'TZ', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Miner', 'Janz', 'Kirk', '19821225', 'mkirk4y@mayoclinic.com', '3007624121', 'M', 'ID', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Domenico', 'Newns', 'Pickrell', '19870731', 'dpickrell4z@rakuten.co.jp', '7342941249', 'M', 'ZM', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Hercule', 'Conway', 'Kopacek', '19981228', 'hkopacek50@upenn.edu', '1811972481', 'M', 'ID', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Judith', 'Barthrup', 'Marklew', '19830905', 'jmarklew51@addthis.com', '2819318710', 'F', 'BR', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Jolie', 'Norcott', 'Degan', '19960719', 'jdegan52@indiatimes.com', '2043702270', 'F', 'FR', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Cirillo', 'Beardsall', 'Flemyng', '19840217', 'cflemyng53@diigo.com', '8396099779', 'M', 'FI', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Petronella', 'Hector', 'Legh', '19850617', 'plegh54@hhs.gov', '8746848273', 'F', 'KR', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Carce', 'Enbury', 'Marjanski', '19980915', 'cmarjanski55@google.ca', '5152131179', 'M', 'MZ', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Orin', 'Atmore', 'O''Shee', '19840817', 'ooshee56@imdb.com', '3285593647', 'M', 'CN', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Dotty', 'Ellesmere', 'Tchaikovsky', '19860108', 'dtchaikovsky57@amazon.com', '2285398491', 'F', 'SV', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Jolee', 'Dumbleton', 'Haire', '19870719', 'jhaire58@marriott.com', '2893184294', 'F', 'UG', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Eustace', 'Pavitt', 'Puve', '19980612', 'epuve59@clickbank.net', '3816085459', 'M', 'ID', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ignacius', 'Prinett', 'Heinicke', '19901204', 'iheinicke5a@yelp.com', '5477475215', 'M', 'CR', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Caren', 'Hamblett', 'Nelius', '19920412', 'cnelius5b@icq.com', '9134213625', 'F', 'TH', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Rouvin', 'O''Harney', 'Krishtopaittis', '19941110', 'rkrishtopaittis5c@ed.gov', '5302376607', 'M', 'CN', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Olivero', 'Christofe', 'Robeiro', '19940702', 'orobeiro5d@digg.com', '1215407642', 'M', 'UA', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Lida', 'Godain', 'Itzakson', '19821228', 'litzakson5e@icq.com', '4539694145', 'F', 'BR', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Lee', 'Thoresby', 'Carty', '19861031', 'lcarty5f@craigslist.org', '2488740721', 'M', 'RU', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Arnie', 'Bartalucci', 'Skilton', '19930902', 'askilton5g@go.com', '5858880235', 'M', 'DO', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Diahann', 'Lewsam', 'Werrilow', '19830726', 'dwerrilow5h@a8.net', '8414018216', 'F', 'SE', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Thibaud', 'Dominici', 'Deverille', '19970322', 'tdeverille5i@bravesites.com', '6332647327', 'M', 'ID', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Baxter', 'Willimott', 'Pettus', '19911123', 'bpettus5j@themeforest.net', '9834711210', 'M', 'CN', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Letisha', 'Gelardi', 'Swyn', '19910501', 'lswyn5k@nationalgeographic.com', '6454627448', 'F', 'ID', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Emmye', 'Rattenbury', 'Epilet', '19810206', 'eepilet5l@wsj.com', '5226117977', 'F', 'CN', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Collen', 'Wildman', 'MacEvilly', '19840406', 'cmacevilly5m@newsvine.com', '6987095830', 'F', 'PH', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Adel', 'O''Donovan', 'Daulby', '19821227', 'adaulby5n@businessinsider.com', '5509895517', 'F', 'PL', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Innis', 'Maingot', 'Royal', '19980331', 'iroyal5o@who.int', '5063763425', 'M', 'KM', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Dev', 'Vyvyan', 'Lyal', '19920409', 'dlyal5p@merriamwebster.com', '3527212379', 'M', 'PH', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ninetta', 'Johns', 'Pfleger', '19920626', 'npfleger5q@latimes.com', '9112382004', 'F', 'PL', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Kial', 'Rodgman', 'Fend', '19940504', 'kfend5r@hud.gov', '6723673684', 'F', 'ID', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Lilllie', 'Hammond', 'Test', '19920124', 'ltest5s@istockphoto.com', '8275992525', 'F', 'ZM', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Erhard', 'Hechlin', 'Harbottle', '19950612', 'eharbottle5t@spotify.com', '8688988312', 'M', 'RU', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Fanya', 'Corradengo', 'Ranson', '19821103', 'franson5u@reverbnation.com', '8025328213', 'F', 'RU', true, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Lanny', 'Gillicuddy', 'Farriar', '19990115', 'lfarriar5v@google.es', '5594760763', 'M', 'PT', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Sibelle', 'Obert', 'Mapstone', '19840324', 'smapstone5w@redcross.org', '8035551195', 'F', 'CN', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Renate', 'Bunney', 'Gildersleeve', '20000528', 'rgildersleeve5x@pbs.org', '6733196190', 'F', 'HN', true, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Marketa', 'Cray', 'Uccelli', '19990826', 'muccelli5y@hao123.com', '5265426951', 'F', 'NP', true, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Kirsti', 'Mewes', 'Leigh', '19891126', 'kleigh5z@amazon.co.uk', '2886148858', 'F', 'ID', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Sib', 'Mariolle', 'Reese', '19820803', 'sreese60@ihg.com', '3566362606', 'F', 'CO', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Thelma', 'Folland', 'Gurton', '19871027', 'tgurton61@goo.gl', '8715578441', 'F', 'PT', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Roy', 'O''Beirne', 'Bagnall', '19901015', 'rbagnall62@gizmodo.com', '9064562388', 'M', 'MN', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ronny', 'Shieldon', 'Mocker', '19860320', 'rmocker63@wikia.com', '3122931589', 'F', 'ID', true, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Chev', 'Cackett', 'Curley', '19970817', 'ccurley64@goo.gl', '5202998132', 'M', 'CN', false, 4);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Sheff', 'Leythley', 'Goane', '19970123', 'sgoane65@domainmarket.com', '1086493650', 'M', 'CN', false, 7);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Shae', 'Jarred', 'Purle', '19890107', 'spurle66@netscape.com', '2166725080', 'M', 'AR', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Stacee', 'Shemmans', 'Dioniso', '19931029', 'sdioniso67@prnewswire.com', '8998436596', 'F', 'ID', true, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Kennett', 'Dericut', 'Reinhart', '19841215', 'kreinhart68@google.fr', '1659088670', 'M', 'PE', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Ramsay', 'Campa', 'Sly', '19910801', 'rsly69@desdev.cn', '8186268930', 'M', 'CN', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Kaleena', 'Trawin', 'Avison', '19960210', 'kavison6a@biglobe.ne.jp', '9341607920', 'F', 'RU', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Byran', 'Swidenbank', 'Bassill', '19931015', 'bbassill6b@hp.com', '9217443930', 'M', 'CZ', true, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Abeu', 'Drabble', 'Campa', '19900826', 'acampa6c@drupal.org', '1428425724', 'M', 'ID', true, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Zeb', 'Crosland', 'Puckett', '19890322', 'zpuckett6d@slideshare.net', '4283329937', 'M', 'PL', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Frank', 'Girodias', 'Strodder', '19960510', 'fstrodder6e@canalblog.com', '9256913983', 'M', 'ID', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Katharina', 'Crotty', 'Naptin', '19920905', 'knaptin6f@vimeo.com', '6719128982', 'F', 'AR', false, 8);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Boycie', 'Whiff', 'Rockingham', '19961026', 'brockingham6g@smh.com.au', '1829754705', 'M', 'NL', false, 2);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Boniface', 'Lantoph', 'Salman', '19810321', 'bsalman6h@bigcartel.com', '7207884358', 'M', 'BR', false, 5);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Benton', 'Kienlein', 'Issacoff', '19860919', 'bissacoff6i@accuweather.com', '5156308247', 'M', 'CZ', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Alastair', 'Willan', 'Crosseland', '19970830', 'acrosseland6j@chronoengine.com', '4059942071', 'M', 'CO', true, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Christyna', 'Flay', 'Seys', '19821003', 'cseys6k@theglobeandmail.com', '1401155347', 'F', 'TJ', false, 1);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Nil', 'Duchasteau', 'Tytterton', '19850307', 'ntytterton6l@storify.com', '7156469030', 'M', 'RU', false, 6);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Alfreda', 'Ghidoni', 'Cominello', '19980419', 'acominello6m@hexun.com', '4989933602', 'F', 'ID', false, 3);
insert into alumnos (nombre, apellido1, apellido2, fecha_nacimiento, email, telefono, sexo, pais, repetidor, id_curso_ciclo) values ('Antonius', 'Napolione', 'McCallion', '19851123', 'amccallion6n@nydailynews.com', '8138061277', 'M', 'CN', true, 6);


UPDATE alumnos SET id_copy = id;
/* ==================================== RULES PARA LOGS DE ALUMNOS ==================================== */
CREATE OR REPLACE RULE insert_alum_zonzamas AS 
ON INSERT TO alumnos DO ALSO 
INSERT INTO log_alumnos (accion,id_alumno,repetidor,id_curso_ciclo,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('INSERT',NEW.id_alumnos,NEW.repetidor,NEW.id_curso_ciclo,NEW.nombre,NEW.apellido1,NEW.apellido2,NEW.fecha_nacimiento,NEW.email,NEW.telefono,NEW.sexo,NEW.pais);

CREATE OR REPLACE RULE update_alum_zonzamas AS 
ON UPDATE TO alumnos DO ALSO 
INSERT INTO log_alumnos (accion,id_alumno,repetidor,id_curso_ciclo,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('UPDATE',NEW.id_alumnos,NEW.repetidor,NEW.id_curso_ciclo,NEW.nombre,NEW.apellido1,NEW.apellido2,NEW.fecha_nacimiento,NEW.email,NEW.telefono,NEW.sexo,NEW.pais);

CREATE OR REPLACE RULE delete_alum_zonzamas AS 
ON DELETE TO alumnos DO ALSO 
INSERT INTO log_alumnos (accion,id_alumno,repetidor,id_curso_ciclo,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('DELETE',OLD.id_alumnos,OLD.repetidor,OLD.id_curso_ciclo,OLD.nombre,OLD.apellido1,OLD.apellido2,OLD.fecha_nacimiento,OLD.email,OLD.telefono,OLD.sexo,OLD.pais);
/* ======================================================================================================= */

/* ==================================== RULES PARA LOGS DE PROFESORES ==================================== */
CREATE OR REPLACE RULE insert_prof_zonzamas AS 
ON INSERT TO profesores DO ALSO 
INSERT INTO log_profesores (accion,id_alumno,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('INSERT',NEW.id_profesor,NEW.nombre,NEW.apellido1,NEW.apellido2,NEW.fecha_nacimiento,NEW.email,NEW.telefono,NEW.sexo,NEW.pais);

CREATE OR REPLACE RULE update_prof_zonzamas AS 
ON UPDATE TO profesores DO ALSO 
INSERT INTO log_profesores (accion,id_alumno,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('UPDATE',NEW.id_profesor,NEW.nombre,NEW.apellido1,NEW.apellido2,NEW.fecha_nacimiento,NEW.email,NEW.telefono,NEW.sexo,NEW.pais);

CREATE OR REPLACE RULE delete_prof_zonzamas AS 
ON DELETE TO profesores DO ALSO 
INSERT INTO log_profesores (accion,id_alumno,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('DELETE',OLD.id_profesor,OLD.nombre,OLD.apellido1,OLD.apellido2,OLD.fecha_nacimiento,OLD.email,OLD.telefono,OLD.sexo,OLD.pais);
/* ======================================================================================================= */

/* ==================================== RULES PARA LOGS DE MODULOS ==================================== */
CREATE OR REPLACE RULE insert_mod_zonzamas AS 
ON INSERT TO modulos DO ALSO 
INSERT INTO log_modulos (accion,nombre,siglas,id_curso_ciclo,id_prof)
VALUES ('INSERT',NEW.nombre,NEW.siglas,NEW.id_curso_ciclo,NEW.id_prof);

CREATE OR REPLACE RULE update_mod_zonzamas AS 
ON UPDATE TO modulos DO ALSO 
INSERT INTO log_modulos (accion,nombre,siglas,id_curso_ciclo, id_prof) 
VALUES ('UPDATE',NEW.nombre,NEW.siglas,NEW.id_curso_ciclo,NEW.id_prof);

CREATE OR REPLACE RULE delete_mod_zonzamas AS 
ON DELETE TO modulos DO ALSO 
INSERT INTO log_modulos (accion,nombre,siglas, id_curso_ciclo, id_prof) 
VALUES ('DELETE',OLD.nombre,OLD.siglas,OLD.id_curso_ciclo,OLD.id_prof);
/* ======================================================================================================= */
