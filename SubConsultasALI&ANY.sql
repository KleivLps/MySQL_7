/*nombres de clientes que han realizado compras con un precio superior a la media*/

SELECT c.nombre
FROM clientes c
JOIN ventas cp ON c.id = cp.cliente_id
JOIN productos p ON cp.producto_id = p.id
WHERE p.precio > (SELECT AVG(precio) FROM productos);

/*Encontrando los empleados cuyo salario sea mayor que al menos uno de los salarios
de los empleados del departamento de ventas*/

select e.nombre from empleados e where e.salario >(select min(salario)
from empleados where departamento_id = 'Ventas');

/*Encontrando los productos cuyos precios sean mayores que todos los precios de productos
con la palabra 'Movil' en su nombre*/

select p.nombre, p.precio from productos p
where p.precio > (select max(precio) from productos where 
nombre like '%Movil%');

/*Mostrar la informacion de los clientes que realizaron la compra con el monto total mas
alto incluyendo su nombre, direccion y el monto total de compras*/

select c.nombre, c.direccion, max(cp.monto_total) as monto_total
from clientes c join ventas cp on c.id = cp.id
group by c.nombre, c.direccion order by monto_total desc limit 1;

/*buscar el empleado con el salario mas alto y mostrar en que departamento esta*/

select d.nombre as departamento, e.nombre as empleado, e.salario from departamentos d
join empleados e on d.id = e.id
where e.salario =(select max(e2.salario) from empleados e2 where e2.id = d.id);