DROP TABLE alumnos_modulos CASCADE;
DROP TABLE modulos CASCADE;
DROP TABLE cursos_ciclos CASCADE;
DROP TABLE alumnos CASCADE;
DROP TABLE profesores CASCADE;
DROP TABLE personas CASCADE;
DROP TABLE ciclos CASCADE;
DROP TABLE alumnos_modulos_historicos CASCADE;
DROP TABLE alumnos_historicos CASCADE;

CREATE TABLE ciclos (
    id serial primary key,
    nombre varchar(100),
    siglas varchar(5),
    tipo varchar(2)
);


CREATE TABLE personas (
    id serial primary key,
    nombre varchar(80),
    apellido1 varchar(80),
    apellido2 varchar(80),
    fecha_nacimiento date,
    email varchar(80),
    telefono bigint, 
    sexo char,
    pais varchar(80)
);


CREATE TABLE profesores (
    id serial primary key
) INHERITS (personas);

CREATE TABLE cursos_ciclos (
    id serial primary key,
    curso int,
    id_tutor int references profesores(id)  on delete cascade on update cascade,
    id_ciclo int references ciclos(id)  on delete cascade on update cascade
);

CREATE TABLE alumnos (
    id serial primary key,
    repetidor bool,
    matricula int,
    id_curso_ciclo int references cursos_ciclos(id)  on delete cascade on update cascade
) INHERITS (personas);



CREATE TABLE modulos (
    id serial primary key,
    nombre varchar(100),
    siglas varchar(5),
    id_curso_ciclo int references cursos_ciclos(id)  on delete cascade on update cascade,
    id_profesor int references profesores(id)  on delete cascade on update cascade
);

CREATE TABLE alumnos_modulos(
    id serial primary key,
    id_alumno int references alumnos(id)  on delete cascade on update cascade,
    id_modulo int references modulos(id)  on delete cascade on update cascade
);

CREATE TABLE alumnos_modulos_historicos(
    id serial primary key,
    fecha date DEFAULT CURRENT_DATE,
    id_alumno int,
    id_modulo int
);

CREATE TABLE alumnos_historicos(
    id serial primary key,
    fecha date DEFAULT CURRENT_DATE,
    nombre varchar(80),
    apellido1 varchar(80),
    apellido2 varchar(80),
    fecha_nacimiento date,
    email varchar(80),
    telefono bigint, 
    sexo char,
    pais varchar(80),
    repetidor bool,
    id_curso_ciclo int,
    matricula int
);
