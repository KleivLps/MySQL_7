/*consulta de tabla productos*/

select * from productos order by precio desc limit 10;

/*creando una tabla temporal de los empleados donde se unifiquen el nombre y apellido en una sola columna*/

create temporary table empleados_temp as select concat(nombre, ' ' , apellido) as nombre_completo
from empleados;

/*creando una tabla temporal de clientes que solo contenga la columna nombre*/

create temporary table cliente_temp as select nombre from clientes;

/*Realizando la union entre las tablas temporales de empleados y clientes*/

select e.nombre_completo, c.nombre as cliente_nombre from empleados_temp e
join cliente_temp c on 1 = 1; /*realiza un cartesiano entre empleados y clientes*/

/*creando una tabla temporal 'escuela_primaria' con los valores indicados*/

create temporary table escuela_primaria (
id int,
nombre varchar(50),
apellido varchar(50),
edad int,
grado int
);

insert into escuela_primaria (id, nombre, apellido, edad, grado) values

(1,'Alejandro', 'Gonzales', 11, 5),
(2,'Isabella', 'Lopez', 10, 4),
(3,'Lucas', 'Martinez', 11, 5),
(4,'Sofia', 'Rodriguez', 10, 4),
(5,'Mateo', 'Perez', 12, 6),
(6,'Valentina', 'Fernandez', 12, 6),
(7,'Diego', 'Torres', 10, 4),
(8,'Martina', 'Gomez', 11, 5),
(9,'Joaquin', 'Hernandez', 10, 4),
(10,'Valeria', 'Diaz', 11, 5);