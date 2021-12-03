drop function contador_alumnos;
drop function contador_alumnos2;

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

CREATE OR REPLACE FUNCTION contador_alumnos(modulo int, sexo_sel varchar(1), tipo_sel varchar(2), pais_sel varchar(2)) 
returns int
language plpgsql 
as
$$
declare
    n_alumnos int :=0;
begin
    select count(*) into n_alumnos 
from alumnos_modulos am
    ,alumnos a
    ,cursos_ciclos cc
    ,ciclos c 
where am.id_alumno=a.id_alumnos 
    and am.id_modulo=modulo 
    and a.sexo= sexo_sel
    and a.id_curso_ciclo=cc.id_ciclo 
    and cc.id_ciclo=c.id 
    and c.tipo= tipo_sel 
    and a.pais=pais_sel ;
if n_alumnos <= 0 then
    raise notice 'No existe ningún alumno';
else
    raise notice 'El numero de alumnos es: %', n_alumnos;
end if;
return n_alumnos;
end;
$$;


CREATE OR REPLACE FUNCTION contador_alumnos2(modulo int, sexo_sel varchar(1), tipo_sel varchar(2), pais_sel varchar(2)) 
returns int
language plpgsql 
as
'
declare
    n_alumnos int :=0;
begin
    select count(*) into n_alumnos 
from alumnos_modulos am
    ,alumnos a
    ,cursos_ciclos cc
    ,ciclos c 
where am.id_alumno=a.id_alumnos 
    and am.id_modulo=modulo 
    and a.sexo=''sexo_sel''
    and a.id_curso_ciclo=cc.id_ciclo 
    and cc.id_ciclo=c.id 
    and c.tipo=''tipo_sel'' 
    and a.pais=''pais_sel'' ;
if n_alumnos <= 0 then
    raise notice ''No existe ningún alumno'';
else
    raise notice ''El numero de alumnos es: %'', n_alumnos;
end if;
return n_alumnos;
end;';

/* ========================================================================== */



/* ================================ PRUEBAS ================================ */

select count(id_alumno) from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='M';
select count(am.id_alumno), a.sexo, a.pais, a.id_curso_ciclo from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='F' group by am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo;
select am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo from alumnos_modulos am, alumnos a where am.id_alumno=a.id_alumnos and am.id_modulo=1 and a.sexo='F' group by am.id_alumno, a.sexo, a.pais, a.id_curso_ciclo;

select count(*) from alumnos_modulos am, alumnos a, cursos_ciclos cc, ciclos c where am.id_alumno=a.id_alumnos and am.id_modulo=30 and a.sexo='F' and a.id_curso_ciclo=cc.id_ciclo and cc.id_ciclo=c.id;
/* ========================================================================== */
