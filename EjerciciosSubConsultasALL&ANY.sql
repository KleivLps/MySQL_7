/*encuentra los empleados que ganan mas que el salario promedio de los empleados del departamento de 'contabilidad'*/

select e.nombre, e.apellido, e.salario from empleados e
where e.salario > (
select avg(salario) from empleados where departamento_id = 'contabilidad'
);

/*Encontrar los producto que tienen un precio superior al precio de al menos uno de los productos
vendidos al cliente con nombre 'juan perez'*/

select p.nombre, p.precio from productos p 
where p.precio > (
select min(pr.precio) from productos pr join ventas cp on pr.id = cp.id
join clientes c on cp.id = c.id
where c.nombre ='juan perez'
);

/*Encontrar los departamentos en los que hay al menos un empleado menor de 30 años*/

select distinct e.departamento_id from empleados e
where e.edad < 30;

/*Mostrar la informacion del empleado mas joven entre los 3 empleados con mas ventas
incluyendo su nombre, apellido y edad*/

select e.nombre, e.apellido, e.edad from empleados e
join(
select id, count(id) as productos_vendidos
from ventas
group by id
order by productos_vendidos desc
limit 3
) top_empleados on e.id = top_empleados.id
order by e.edad asc limit 1;

/*Encontrar el empleado que realizo la venta con el monto mas alto, mostrar el nombre del cliente junto
con el nombre del empleado y el monto total*/

select c.nombre as cliente_nombre, e.nombre as empleado_nombre, max(cp.monto_total) as monto_total
from clientes c
join ventas cp on c.id = cp.id
join empleados e on cp.id = e.id
group by c.nombre, e.nombre
order by monto_total desc;