drop function contador_alumnos;

do
    'declare
        n_alumnos integer;
    begin
        select count(id_alumno)  into n_alumnos
        from alumnos_modulos where id_modulo=3;
        raise notice ''El numero de alumnos en el modulo es: %'', n_alumnos;
end;';

create function contador_alumnos(
    id integer
) returns bigint
language SQL as 
$$
    select count(id_alumno) from alumnos_modulos where id_modulo=3;
$$;


do
    'declare
        n_alumnos integer;
    begin
        select count(id_alumno)  into n_alumnos
        from alumnos_modulos where id_modulo=1;
        if n_alumnos <= 0 then
            raise notice ''El numero de alumnos es 0'';
            else
            raise notice ''El numero de alumnos es: %'', n_alumnos;
        END if;
end;';

select count(id_alumno) from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='M';
select count(am.id_alumno), a.sexo, a.pais, a.id_curso_ciclo from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='F' group by am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo;
select am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='F' group by am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo;



do
    'declare
        grado integer;
    begin
        select am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo into grado 
        from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=8 group by am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo;
        if grado <=4 then
            raise notice ''Grado superior'';
            else
            raise notice ''Grado medio'';
        END if;
end;';