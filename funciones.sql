drop function contador_alumnos;

/* ================================ PROCESOS ================================ */
do
    'declare
        n_alumnos integer :=0;
	modulo integer := 40;
	sexo_sel VARCHAR:=''M'';
	tipo_sel VARCHAR:=''GS'';
    pais_sel VARCHAR:=''RU'';
    begin
        select count(*) into n_alumnos 
	from alumnos_modulos am
        ,alumnos a
        ,cursos_ciclos cc
        ,ciclos c 
 	where am.id_alumno=a.id_alumnos 
        and am.id_modulo=modulo 
        and a.sexo=sexo_sel
 	and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id and c.tipo=tipo_sel and a.pais=pais_sel;
	if n_alumnos <= 0 then
        raise notice ''El numero de alumnos es 0'';
        else
        raise notice ''El numero de alumnos es: %'', n_alumnos;
    END if;
end;';

do $$
    declare
        n_alumnos integer :=0;
	modulo integer := 40;
	sexo_sel VARCHAR:='M';
	tipo_sel VARCHAR:='GS';
    pais_sel VARCHAR:='RU';
    begin
        select count(*) into n_alumnos 
	from alumnos_modulos am
        ,alumnos a
        ,cursos_ciclos cc
        ,ciclos c 
 	where am.id_alumno=a.id_alumnos 
        and am.id_modulo=modulo 
        and a.sexo= sexo_sel
 	and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id and c.tipo= tipo_sel and a.pais=pais_sel ;
	if n_alumnos <= 0 then
        raise notice 'El numero de alumnos es 0';
        else
        raise notice 'El numero de alumnos es: %', n_alumnos;
    END if;
end;
$$;
/* =========================================================================== */

/* ================================ FUNCIONES ================================ */

create function contador_alumnos(
    n_alumnos integer
) returns int
$$
    declare
        n_alumnos integer :=0;
        modulo integer := 40;
        sexo_sel VARCHAR:='M';
        tipo_sel VARCHAR:='GS';
        pais_sel VARCHAR:='RU';
    begin
        select count(*) into n_alumnos 
    from alumnos_modulos am
        ,alumnos a
        ,cursos_ciclos cc
        ,ciclos c 
    where am.id_alumno=a.id_alumnos 
        and am.id_modulo=modulo 
        and a.sexo= sexo_sel
    and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id and c.tipo= tipo_sel and a.pais=pais_sel ;
    if n_alumnos <= 0 then
        raise notice 'El numero de alumnos es 0';
        else
        raise notice 'El numero de alumnos es: %', n_alumnos;
    END if;
$$
language 'plpgsql' VOLATILE;
/* ========================================================================== */

create function contador_alumnos(
    id integer
) returns bigint
language plpgsql as 
$$
    select count(id_alumno) from alumnos_modulos where id_modulo=3;
$$;



select count(id_alumno) from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='M';
select count(am.id_alumno), a.sexo, a.pais, a.id_curso_ciclo from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='F' group by am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo;
select am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='F' group by am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo;

select count(*) from alumnos_modulos am, alumnos a, cursos_ciclos cc, ciclos c where am.id_alumno=a.id_alumnos and am.id_modulo=30 and a.sexo='F' and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id;
