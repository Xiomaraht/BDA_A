call listF ( "Asus");
call listF ("Lenovo");
call listF ( "Hewlett-Packard");
call listF ("Samsung");
call listF ( "Seagate");
call listF ( "Crucial");
call listF ("Gigabyte");
call listF ( "Huawei");
call listF ( "Xiaomi");

call listP ("Disco duro Sata3 1TB", 86.99, 5 );
call listP ( "Memoria RAM DDR4 8GB", 120, 6 );
call listP ( "Disco SSD 1TB", 150.99, 4);
call listP ( "GeForce GTX 1050Ti", 185, 7);
call listP ( "GeForce GTX 1080 Xtreme", 755, 6 );
call listP ( "Monitor 24 LED Full HD", 202, 1);
call listP ( "Monitor 27 LED Full HD", 245.99, 1);
call listP ( "Portatil Yoga 520", 559, 2);
call listP ( "Portatil Ideapd 320", 444, 2);
call listP ( "Impresora HP Deskjet 3720", 59.99, 3);
call listP ( "Impresora HP Laserjet Pro M26nw", 180, 3);

Select * from Fabricante;
Select * from Producto;

 /*--1--*/
Select nombre from producto;

/*--2--*/
Select nombre, precio from producto;

/*--3--*/
Select * from producto;

/*--4--*/
Select nombre as "Nombre producto", 
		precio as " precio dolares",
		precio * 0.89 as "precio euros"
from producto;

/*--5--*/
Select nombre as " producto", 
		precio as " dolares",
		precio * 0.89 as " euros"
from producto;

/*--6--*/
Select upper(nombre) as "NOMBRE", 
precio from producto;

/*--7--*/
Select lower(nombre) as "nombre",
precio from producto;

/*--8--*/
Select nombre,   
upper(left (nombre, 2)) as  "primeros_caracteres" from producto;

/*--9--*/
Select nombre, 
round(precio) as precio_redondeado from producto;

/*--10--*/
Select nombre, 
truncate (precio, 0) as precio from producto; 

/*--11--*/
Select codigo_fabricante from producto;

/*--12--*/
Select distinct codigo_fabricante from producto;

/*--13--*/
Select nombre from producto order by nombre asc;

/*--14--*/
Select nombre from producto order by nombre desc;

/*--15--*/
Select  nombre, 
precio from producto order by nombre asc, precio desc;

/*--16--*/
Select * from fabricante limit 5;

/*--17--*/
Select * from fabricante limit 2 offset 3;

/*--18--*/
Select nombre, 
precio from producto order by precio asc limit 1;

/*--19 --*/
Select nombre, 
precio from producto order by precio desc limit 1;

/*--20--*/
Select nombre from producto where codigo_fabricante =2;

/*--21--*/
Select nombre  from producto where precio <=120;

/*--22--*/
Select nombre from producto where precio >=400;

/*--23--*/
Select nombre from producto where precio <400;

/*--24--*/
Select * from producto where precio >=80 and precio <=300;

/*--25--*/
Select * from producto where precio between 60 and 200;

/*--26--*/
Select * from producto where precio >200 and codigo_fabricante  = 6;

/*--27--*/
Select * from producto where codigo_fabricante =1 or codigo_fabricante =3 or codigo_fabricante =5;

/*--28--*/
Select * from producto where codigo_fabricante in (1, 3, 5);

/*--29--*/
Select nombre, precio * 100 as centimos from producto;

/*--30--*/
Select nombre from fabricante 
where nombre like 's%';

/*--31--*/
Select nombre from fabricante 
where nombre like '%e';

/*--32--*/
Select nombre from fabricante 
where  nombre like '%W%';

/*--33--*/
Select nombre from fabricante 
where length(nombre) =4;

/*--34--*/
Select nombre from producto 
where nombre like '%portatil%';

/*--35--*/
Select nombre from producto 
where nombre like '%monitor%' and precio <215;

/*--36--*/
Select nombre, precio from producto 
where precio >180 order by precio desc, nombre asc;

/*--1.1.4 consultas multitabla--*/

/*--1--*/
Select p.nombre,
 p.precio, f.nombre 
 from producto p 
 join fabricante f on p.codigo_fabricante = f.codigo_fabricante;

/*--2--*/
Select p.nombre, 
p.precio, f.nombre as nombre_fab 
from producto p 
join fabricante f on p.codigo_fabricante = f.codigo_fabricante order by f.nombre asc;

/*--3--*/
Select
    p.codigo,
    p.nombre AS nombre_producto,
    f.codigo_fabricante,
    f.nombre AS nombre_fabricante
from Producto p
join Fabricante f ON p.codigo_fabricante = f.codigo_fabricante;

/*--4--*/
select p.nombre as producto,
p.precio,
f.nombre as fabricante
from Producto p
join Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where p.precio = (select min(precio) from Producto);

/*--5--*/
select p.nombre as producto,
p.precio,
f.nombre as fabricante
from Producto p
join Fabricante f on p.codigo_fabricante= f.codigo_fabricante
where p.precio = (select max(precio) from Producto);

/*--6--*/
select p.codigo,
p.nombre AS nombre_producto,
f.codigo_fabricante,
f.nombre AS nombre_fabricante
from Producto p
join Fabricante f ON p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Lenovo';

/*--7--*/
select p.codigo,
p.nombre AS nombre_producto, p.precio,
f.codigo_fabricante,
f.nombre AS nombre_fabricante
from Producto p
join Fabricante f ON p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Crucial' and p.precio >200;  

/*--8--*/
select
p.nombre AS nombre_producto,
f.nombre AS nombre_fabricante
from
Producto p
join
Fabricante f ON p.codigo_fabricante = f.codigo_fabricante
where
f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

/*--9--*/
select
p.nombre AS nombre_producto,
f.nombre AS nombre_fabricante
from
Producto p
join
Fabricante f ON p.codigo_fabricante = f.codigo_fabricante
where
f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

/*--10--*/
select
p.nombre as nombre_producto,
p.precio,
f.nombre as nombre_fabricante
from
Producto p
join
Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where
f.nombre like '%e';

/*--11--*/
select
p.nombre as nombre_producto,
p.precio,
f.nombre as nombre_fabricante
from
Producto p
join
Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where
f.nombre LIKE '%w%';

/*--12--*/
select p.nombre AS nombre_producto,
p.precio,
f.nombre AS nombre_fabricante
from Producto p
join Fabricante f ON p.codigo_fabricante = f.codigo_fabricante
where p.precio >= 180
order by p.precio desc, 
p.nombre asc;

/*--13--*/
select distinct f.codigo_fabricante,
f.nombre AS nombre_fabricante
from Fabricante f
join Producto p on f.codigo_fabricante = p.codigo_fabricante;

/*--1.1.5--*/

/*--1--*/
select f.codigo_fabricante,
f.nombre as nombre_fabricante,
p.codigo,
p.nombre as nombre_producto
from Fabricante f
left join
Producto p on f.codigo_fabricante = p.codigo_fabricante;


/*--2--*/
select f.codigo_fabricante,
f.nombre as nombre_fabricante
from Fabricante f
left join Producto p on f.codigo_fabricante = p.codigo_fabricante
where
p.codigo is null;


/*--3--*/
/*-- Si, si pueden haber productos que no esten relacionados con algun fabricante porque puede ser hecho por una persona independiente,
 en la cual no pertenezca a ninguna entidad o empresa o tambien puede haber productos creados por terceros--*/

/*--1-1.6--*/

/*--1--*/
select count(*) as total
from Producto;

/*--2--*/
select count(*) as fabricantes
from Fabricante;

/*--3--*/
select count(distinct codigo_fabricante) as total
from Producto;

/*--4--*/
select avg(precio) as media
from Producto;

/*--5--*/
select min(precio)
from Producto;

/*--6--*/
select max(precio) as precio
from Producto;

/*--7--*/
select nombre,
precio
from Producto
where precio = (select min(precio) from Producto);

/*--8--*/
select nombre,
precio
from Producto
where precio = (select max(precio) from Producto);

/*--9--*/
select sum(precio) as suma
from Producto;

/*--10--*/
select count(p.codigo)
from Producto p
join Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Asus';

/*--11--*/
select avg(p.precio) as precio
from Producto p
join Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Asus';

/*--12--*/
select min(p.precio) as precio
from Producto p
join Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Asus';

/*--13--*/
select max(p.precio) as precio
from Producto p
join Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Asus';

/*--14--*/
select sum(p.precio) as precio
from producto p
join fabricante f on p.codigo_fabricante= f.codigo_fabricante
where f.nombre = 'Asus';

/*--15--*/
select max(p.precio) as maximo,
min(p.precio) as minimo,
avg(p.precio) as media,
count(p.codigo) as total_productos_crucial
from Producto p
join Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Crucial';

/*--16--*/
select f.nombre as nombre_fabricante,
count(p.codigo) as numero_productos
from Fabricante f
left join
Producto p ON f.codigo_fabricante = p.codigo_fabricante
group by
f.nombre
order by
numero_productos desc;

/*--17--*/
select f.nombre as nombre,
max(p.precio) as maximo,
min(p.precio) as minimo,
avg(p.precio) as medio
from
Fabricante f
left join
Producto p on f.codigo_fabricante = p.codigo_fabricante
group by
f.nombre;

/*--18--*/
select f.codigo_fabricante as fabricante,
max(p.precio) as precio_maximo,
min(p.precio) as precio_minimo,
avg(p.precio) as precio_medio,
avg(p.precio) * 0.93 as aproximado,
count(p.codigo) as total_productos
from Fabricante f
join Producto p ON f.codigo_fabricante = p.codigo_fabricante
group by f.nombre
having avg(p.precio) * 0.93 > 200 and f.nombre <> 'Asus'; 

/*--19--*/
select f.nombre as fabricante,
max(p.precio) as precio_maximo,
min(p.precio) as precio_minimo,
avg(p.precio) as precio_medio,
avg(p.precio) * 0.93 as aproximado,
count(p.codigo) as total_productos
from Fabricante f
join Producto p ON f.codigo_fabricante = p.codigo_fabricante
group by f.nombre
having avg(p.precio) * 0.93 > 200 and f.nombre <> 'Asus'; 

/*--20--*/
Select count(*) from producto
where precio >=180;

/*--21--*/
Select f.nombre, count(p.codigo) from fabricante f left join
producto p on f.codigo_fabricante = p.codigo_fabricante
where precio >=180
group by f.nombre
order by p.codigo desc;

/*--22--*/
Select p.codigo_fabricante, avg(p.precio) as preciomed from fabricante f left join
producto p on f.codigo_fabricante = p.codigo_fabricante
group by f.codigo_fabricante;

/*--23--*/
Select p.nombre, avg(p.precio) as preciomed from fabricante f left join
producto p on f.codigo_fabricante = p.codigo_fabricante
group by f.codigo_fabricante;

/*--24--*/
Select f.nombre, count(p.codigo) from fabricante f left join
producto p on f.codigo_fabricante = p.codigo_fabricante
where precio >=150
group by f.nombre
order by p.codigo desc;

/*--25--*/
Select f.nombre from fabricante f left join
producto p on f.codigo_fabricante = p.codigo_fabricante
group by f.codigo_fabricante, f.nombre
having count(p.codigo) >=2;

/*--26--*/
Select f.nombre, count(p.codigo) from fabricante f left join
producto p on f.idcodigo_fabricante = p.codigo_fabricante
where precio >=220
group by f.nombre
order by p.codigo desc;

/*--27--*/
SELECT
    f.nombre AS nombre_fabricante,
    COUNT(CASE WHEN p.precio >= 220 THEN p.codigo_fabricante ELSE NULL END) AS numero_productos_caros
FROM
    Fabricante f
LEFT JOIN
    Producto p ON p.codigo_fabricante = f.codigo_fabricante
GROUP BY
    f.nombre
ORDER BY
    nombre_fabricante;
    
/*--28--*/
SELECT
    f.nombre AS nombre_fabricante
FROM
    Fabricante f
JOIN
    Producto p ON p.codigo_fabricante = f.codigo_fabricante
GROUP BY
    f.nombre
HAVING
    SUM(p.precio) > 1000;
    
    
/*--1.1.7.--*/
/*--1.1.7.1--*/
SELECT
    p.nombre AS nombre_producto,
    p.precio
FROM
    Producto p,
    Fabricante f
WHERE
    p.codigo_fabricante = f.codigo_fabricante AND f.nombre = 'Lenovo';
    
    /*--2--*/
SELECT
    p1.*
FROM
    Producto p1,
(SELECT MAX(p2.precio) AS precio_maximo_lenovo
from Producto p2, Fabricante f
where p2.codigo_fabricante = f.codigo_fabricante AND f.nombre = 'Lenovo') AS subconsulta_lenovo
where
    p1.precio = subconsulta_lenovo.precio_maximo_lenovo;

	
/*--3--*/


select .nombre as nombre_producto
from roducto p, abricante f
where p.codigo_fabricante = f.codigo_fabricante and f.nombre = 'Lenovo'
order by p.precio desc
limit 1;

/*--4--*/

select p.nombre AS nombre_producto
from Producto p
inner join Fabricante f ON p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Hewlett-Packard'
order by p.precio ASC
limit 1;

/*--5--*/
select p1.nombre as nombre_producto, p1.precio
from Producto p1
where
p1.precio >= (SELECT MAX(p2.precio)
from Producto p2
inner join Fabricante f ON p2.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Lenovo');

/*--6--*/
select p1.nombre AS nombre_producto, p1.precio
from Producto p1
inner join Fabricante f on p1.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Asus'
and p1.precio > (select avg(p2.precio)
from Producto p2
inner join Fabricante f2 on p2.codigo_fabricante = f2.codigo_fabricante
where f2.nombre = 'Asus');

/*--1.1.7.2*/
/*--7--*/

SELECT nombre as nombre_producto, precio
from Producto
where precio >= all (select precio from Producto);

/*--8--*/
SELECT nombre as nombre_producto, precio
from Producto
where precio <= all (select precio from Producto);

/*--9--*/
select distinct f.nombre AS nombre_fabricante
from Fabricante f
where f.codigo_fabricante = any (select distinct p.codigo_fabricante from Producto p);

/*--10--*/
select f.nombre as nombre_fabricante
from Fabricante f
where f.codigo_fabricante <> all (select distinct p.codigo_fabricante from Producto p where p.codigo_fabricante is not null);

/*--1.1.7.3*/
select distinct f.nombre as nombre_fabricante
from Fabricante f
where f.codigo_fabricante in (select distinct p.codigo_fabricante from Producto p);

/*--1.1.7.4--*/
select f.nombre AS nombre_fabricante
from Fabricante f
WHERE EXISTS (
    select 1 from Producto p where p.codigo_fabricante = f.codigo_fabricante
);

select f.nombre AS nombre_fabricante
from Fabricante f
where not exists (select 1 from Producto p where p.codigo_fabricante = f.codigo_fabricante
);

/*--1.1.7.5--*/
select
    f.nombre as nombre_fabricante,
(select p.nombre
from Producto p
where p.codigo_fabricante = f.codigo_fabricante
order by p.precio desc	
limit 1) AS producto,
    (SELECT p.precio
from Producto p
where p.codigo_fabricante = f.codigo_fabricante
order by p.precio desc
limit 1) as precio
from Fabricante f;

/*--16--*/

select p1.nombre AS nombre_producto, p1.precio, f.nombre AS nombre_fabricante
from Producto p1
join Fabricante f ON p1.codigo_fabricante = f.codigo_fabricante
where p1.precio >= (select avg(p2.precio)
from Producto p2
where p2.codigo_fabricante = p1.codigo_fabricante)
order by
    f.nombre, p1.nombre;
    
/*--17--*/
select p.nombre as nombre_producto
from Producto p
join Fabricante f on p.codigo_fabricante = f.codigo_fabricante
where f.nombre = 'Lenovo'
order by p.precio desc
limit 1;    

/*--18--*/
SELECT f.nombre
FROM fabricante f
JOIN producto p ON p.codigo_fabricante = f.codigo_fabricante
GROUP BY f.codigo_fabricante
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo_fabricante FROM fabricante WHERE nombre = 'Lenovo'
    )
);