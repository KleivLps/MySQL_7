/*agregando cliente nuevo*/

insert into clientes (nombre, direccion)
values ( 'Ana Rodriguez', 'San martin 2515, Mar de plata');

/*interseccion entre la tabla temporal de empleados y clientes*/

SELECT e.nombre_completo
FROM empleados_temp e
INTERSECT
SELECT c.nombre
FROM cliente_temp c;

/*excepcion entre tablas temporales(cliente y empleados)*/

select c.nombre from cliente_temp c
except select e.nombre_completo from empleados_temp e;

/*creando una tabla temporal 'Escuela_secundario' con los valores indicados*/

create temporary table escuela_secundaria (
id int,
nombre varchar(50),
apellido varchar(50),
edad int,
grado int
);

insert into escuela_secundaria (id, nombre, apellido, edad, grado) values 
( 1, 'Eduardo', 'Sanchez', 16, 10),
( 2, 'Camila', 'Martin', 17, 11),
( 3, 'Manuel', 'Guitierrez', 15, 8),
( 4, 'Laura', 'Garcia', 16, 10),
( 11, 'Pablo', 'Ortega', 17, 11),
( 12, 'Carmen', 'Ramirez', 15, 9),
( 13, 'Carlos', 'Molina', 16, 10),
( 14, 'Ana', 'Ruiz', 17, 11),
( 15, 'Luis', 'Fernandez', 15, 9),
( 16, 'Maria', 'Lopez', 16, 10);

/*interseccion de escuela primaria y secundaria para saber quienes fueron a primaria y secundaria*/

select p.nombre, p.apellido
from escuela_primaria p
intersect 
select s.nombre, s.apellido
from escuela_secundaria s;

/*excepcion de la escuela primaria con la secundaria para saber quienes no llevaron secundaria*/

select p.nombre, p.apellido from escuela_primaria p
except 
select s.nombre, s.apellido
from escuela_secundaria s;

/*excepcion de escuela secundaria y primaria para saber queiens no llevaron primaria*/

select s.nombre, s.apellido from escuela_secundaria s
except
select p.nombre, p.apellido from escuela_primaria p;

/*Union de escuela primaria y secundaria por la columna grado*/

select grado from escuela_primaria 
union
select grado from escuela_secundaria order by grado desc;
