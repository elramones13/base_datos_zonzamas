drop function contador_alumnos;

do
    'declare
        n_alumnos integer :=0;
	modulo integer := 30;
	sexo VARCHAR:=''F'';
	tipo VARCHAR:=''GS'';
	pais VARCHAR:=''RU'';
    begin
        select count(*)  into n_alumnos
        from alumnos a, alumnos_modulos am where a.id_alumnos=am.id_alumno and am.id_modulo=modulo and a.sexo=''F'';
        raise notice ''El modulo es: %'', modulo;
	raise notice ''El numero de alumnos es: %'', n_alumnos;
end;';


/* ================================ FUNCIONES ================================ */

do
    'declare
        n_alumnos integer :=0;
	modulo integer := 30;
	sexo_sel VARCHAR:=''M'';
	tipo_sel VARCHAR:=''GS'';
    begin
        select count(*) into n_alumnos 
	from alumnos_modulos am
             ,alumnos a
             ,cursos_ciclos cc
             ,ciclos c 
 	where am.id_alumno=a.id_alumnos 
        and am.id_modulo=modulo 
        and a.sexo= sexo_sel
 	and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id and c.tipo= tipo_sel;
	raise notice ''El numero de alumnos es: %'', n_alumnos;

end;';


do $$
    declare
        n_alumnos integer :=0;
	modulo integer := 30;
	sexo_sel VARCHAR:='M';
	tipo_sel VARCHAR:='GS';
    begin
        select count(*) into n_alumnos 
	from alumnos_modulos am
             ,alumnos a
             ,cursos_ciclos cc
             ,ciclos c 
 	where am.id_alumno=a.id_alumnos 
        and am.id_modulo=modulo 
        and a.sexo= sexo_sel
 	and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id and c.tipo= tipo_sel;
	raise notice 'El numero de alumnos es: %', n_alumnos;

end;
$$;

/* ========================================================================== */


select count(*) from alumnos_modulos am, alumnos a, cursos_ciclos cc, ciclos c 
 where am.id_alumno=a.id_alumnos and am.id_modulo=30 and a.sexo='F' 
 and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id and c.tipo='GS';



create function contador_alumnos(
    id integer
) returns bigint
language plpgsql as 
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

select count(*) from alumnos_modulos am, alumnos a, cursos_ciclos cc, ciclos c where am.id_alumno=a.id_alumnos and am.id_modulo=30 and a.sexo='F' and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id;

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