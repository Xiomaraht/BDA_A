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
Select idfabricante from producto;

/*--12--*/
Select distinct idfabricante from producto;

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
Select nombre from producto where idfabricante =2;

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
Select * from producto where precio >200 and idfabricante  = 6;

/*--27--*/
Select * from producto where idfabricante =1 or idfabricante =3 or idfabricante =5;

/*--28--*/
Select * from producto where idfabricante in (1, 3, 5);

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
Select nombre, precio, idfabricante from producto;

/*--2--*/
Select nombre, precio, idfabricante from producto order by idfabricante asc;

/*--3--*/
Select p.nombre, p.idproducto, f.nombre , f.idfabricante
from producto as p inner join fabricante as f on p.idproducto = f.idfabricante;

/*--4--*/