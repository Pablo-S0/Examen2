Create database Examen
use Examen

create table Cajeros
(
 Codigo int identity (1,1),
 Nombre nvarchar (55) not null,
 Apellido nvarchar (55) not null
 Constraint PK_CodigoC primary key (Codigo)
)

create table Productos
(
 Codigo int identity (1,1),
 Nombre nvarchar (100) not null,
 Precio Float default 0
 Constraint PK_CodigoP primary key (Codigo)
)

create table Maquinas_Registradora
(
 Codigo int identity (1,1),
 Piso int
 Constraint PK_CodigoM primary key (Codigo)
)

create table Venta
(
Codigo_venta int identity (1,1), 
Cajero int,
Mquina int,
Producto int,
Fecha date null constraint Def_fecha default getdate()
Constraint PK_CodigoV primary key (Codigo_venta)

Constraint FK_Cajero Foreign key (Cajero) references Cajeros (Codigo),
Constraint FK_Maquina Foreign key (Mquina) references Maquinas_Registradora (Codigo),
Constraint FK_Producto Foreign key (Producto) references Productos (Codigo)
)

--Con un Query Ingresar dos Cajeros, Tres productos y 2 máquinas
insert into Venta (Cajero,Mquina, Producto) values (1,1,1)

insert into Cajeros (Nombre, Apellido) values ('Federico','Sanchez'), ('Manolo','Sanchez')
insert into Productos(Nombre, Precio) values ('Bola',4300), ('Botella',5000),('Libro',5999)
insert into Maquinas_Registradora(Piso) values (5), (8)

select*from Cajeros
select*from Productos
select*from Maquinas_Registradora
select*from Venta

Update Productos set Nombre = 'Bola Edicion Especial', Precio = 7500 where Codigo = 1

select C.Nombre,P.Nombre,P.Precio,MR.Piso 
from Venta V 
inner join Cajeros C on V.Cajero = C.Codigo 
inner join Productos P on V.Producto = P.Codigo 
inner join Maquinas_Registradora MR on V.Mquina = MR.Codigo
