drop database  if exists Prueba_2;
create database Prueba_2;

use Prueba_2;

create table Fabricante(
	codigo_fabricante int primary key auto_increment,
    nombre varchar(100)
);

create table Producto(
	codigo int primary key auto_increment,
    nombre varchar (100),
    precio double,
    codigo_fabricante int
);

alter table Producto
add foreign key  (codigo_fabricante) references Fabricante(codigo_fabricante);