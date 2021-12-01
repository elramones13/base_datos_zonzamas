do
    'declare
        n_alumnos integer;
    begin
        select count(id_alumno)  into n_alumnos
        from alumnos_modulos where id_modulo=1;
        raise notice ''El numero de alumnos es: %'', n_alumnos;
end;';

create function contador_alumnos(
    id integer
) returns bigint
language SQL as 
$$
    select count(id_alumno) from alumnos_modulos where id_modulo=id;
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