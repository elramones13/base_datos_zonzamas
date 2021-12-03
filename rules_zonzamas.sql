/* ==================================== RULES PARA LOGS DE ALUMNOS ==================================== */
CREATE OR REPLACE RULE insert_alum AS 
ON INSERT TO alumnos DO ALSO 
INSERT INTO log_alumnos (accion,id_alumno,repetidor,id_curso_ciclo,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('INSERT',NEW.id_alumnos,NEW.repetidor,NEW.id_curso_ciclo,NEW.nombre,NEW.apellido1,NEW.apellido2,NEW.fecha_nacimiento,NEW.email,NEW.telefono,NEW.sexo,NEW.pais);

CREATE OR REPLACE RULE update_alum AS 
ON UPDATE TO alumnos DO ALSO 
INSERT INTO log_alumnos (accion,id_alumno,repetidor,id_curso_ciclo,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('UPDATE',NEW.id_alumnos,NEW.repetidor,NEW.id_curso_ciclo,NEW.nombre,NEW.apellido1,NEW.apellido2,NEW.fecha_nacimiento,NEW.email,NEW.telefono,NEW.sexo,NEW.pais);

CREATE OR REPLACE RULE delete_alum AS 
ON DELETE TO alumnos DO ALSO 
INSERT INTO log_alumnos (accion,id_alumno,repetidor,id_curso_ciclo,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('DELETE',OLD.id_alumnos,OLD.repetidor,OLD.id_curso_ciclo,OLD.nombre,OLD.apellido1,OLD.apellido2,OLD.fecha_nacimiento,OLD.email,OLD.telefono,OLD.sexo,OLD.pais);
/* ======================================================================================================= */

/* ==================================== RULES PARA LOGS DE PROFESORES ==================================== */
CREATE OR REPLACE RULE insert_prof AS 
ON INSERT TO profesores DO ALSO 
INSERT INTO log_profesores (accion,id_alumno,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('INSERT',NEW.id_profesor,NEW.nombre,NEW.apellido1,NEW.apellido2,NEW.fecha_nacimiento,NEW.email,NEW.telefono,NEW.sexo,NEW.pais);

CREATE OR REPLACE RULE update_prof AS 
ON UPDATE TO profesores DO ALSO 
INSERT INTO log_profesores (accion,id_alumno,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('UPDATE',NEW.id_profesor,NEW.nombre,NEW.apellido1,NEW.apellido2,NEW.fecha_nacimiento,NEW.email,NEW.telefono,NEW.sexo,NEW.pais);

CREATE OR REPLACE RULE delete_prof AS 
ON DELETE TO profesores DO ALSO 
INSERT INTO log_profesores (accion,id_alumno,nombre,apellido1,apellido2,fecha_nacimiento,email,telefono,sexo,pais) 
VALUES ('DELETE',OLD.id_profesor,OLD.nombre,OLD.apellido1,OLD.apellido2,OLD.fecha_nacimiento,OLD.email,OLD.telefono,OLD.sexo,OLD.pais);
/* ======================================================================================================= */

/* ==================================== RULES PARA LOGS DE MODULOS ==================================== */
CREATE OR REPLACE RULE insert_mod AS 
ON INSERT TO modulos DO ALSO 
INSERT INTO log_modulos (accion,nombre,siglas,id_curso_ciclo,id_prof)
VALUES ('INSERT',NEW.nombre,NEW.siglas,NEW.id_curso_ciclo,NEW.id_prof);

CREATE OR REPLACE RULE update_mod AS 
ON UPDATE TO modulos DO ALSO 
INSERT INTO log_modulos (accion,nombre,siglas,id_curso_ciclo, id_prof) 
VALUES ('UPDATE',NEW.nombre,NEW.siglas,NEW.id_curso_ciclo,NEW.id_prof);

CREATE OR REPLACE RULE delete_mod AS 
ON DELETE TO modulos DO ALSO 
INSERT INTO log_modulos (accion,nombre,siglas, id_curso_ciclo, id_prof) 
VALUES ('DELETE',OLD.nombre,OLD.siglas,OLD.id_curso_ciclo,OLD.id_prof);
/* ======================================================================================================= */
