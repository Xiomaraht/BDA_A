drop database  if exists Prueba_2;
create database Prueba_2;

use Prueba_2;

create table Fabricante(
	idfabricante int primary key auto_increment,
    nombre varchar(100)
);

create table Producto(
	idproducto int primary key auto_increment,
    nombre varchar (100),
    precio double,
    idfabricante int
);

alter table Producto
add foreign key  (idfabricante) references Fabricante(idfabricante);
