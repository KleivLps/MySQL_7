/*clientes que no han realizado ninguna compra*/

select c.nombre, c.direccion
from clientes c
left join ventas cp on c.id = cp.id
where cp.id is null;

/*nombre de productos que se han vendido mas veces que cualquier producto con un precio mayor
a 500*/

select p.nombre from productos p
join ventas cp on p.id = cp.id
group by p.id
having count(cp.id) > (
select max(ventas_cantidad)
from(
select count(cp2.id) as ventas_cantidad
from productos p2
join ventas cp2 on p2.id = cp2.id
where p2.precio > 500
group by p2.id
) as productos_vendidos
);

/*Encuentra los empleados cuya edad sea menor que la edad de al menos un empleado del departamento
de recursos humanos*/

select e.nombre, e.apellido, e.edad
from empleados e
where e.edad < (
select max(e2.edad)
from empleados e2
where e2.departamento_id = 'Recursos Humanos'
);

/*Encontrando los productos que cuesten menos a todos los productos con la palabra camara*/

select p.nombre, p.precio
from productos p
where p.precio <= all(
select p2.precio
from productos p2
where p2.nombre like '%camara%'
);

/*muestra el nombre y el salario de los empleados con salarios mayores al promedio de los de
mas empleados*/

select e.nombre, e.salario
from empleados e
where e.salario > (
select avg(salario)
from empleados
);

/*Encuentra el nombre y el salario de los empleados con salarios inferiores al promedio
de salarios de todos los empleados del departamento de ventas*/

select e.nombre, e.salario
from empleados e
where e.salario <(
select avg(salario)
from empleados
where departamento_id = 'ventas'
);

/*encuentra los clientes que han realizado compras de productos con un precio inferior
al precio promedio de todos los productos*/

select distinct c.nombre
from clientes c
join ventas cp on c.id = cp.id
join productos p on cp.id = p.id
where p.precio <(
select avg (precio)
from productos
);

/*Encontrar los empleados que tienen un salario igual al salario de al menos un empleado
del departamento de 'recursos humanos'*/

select e.nombre, e.salario
from empleados e
where e.salario = any(
select e2.salario
from empleados e2
where e2.departamento_id = 'Recursos humanos'
);

/*encuentra los productos cuyos precio es mayor oigual a todos los precios de los productos
con la palabra 'refrigeradora' en su nombre*/

select p.nombre, p.precio
from productos p
where p.precio >= all(
select p2.precio
from productos p2
where p2.nombre like '%Refrigeradora%'
);

/*muestra el nombre, apellido y salario del empleado con el salario mas alto que este por debajo 
del promedio salarial de los empleados*/

select e.nombre, e.apellido, e.salario
from empleados e
where e.salario <(
select avg(salario)
from empleados
)
order by e.salario desc
limit 1;