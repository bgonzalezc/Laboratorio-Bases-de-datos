CREATE DATABASE TiendaTecnologicaDB;
USE TiendaTecnologicaDB;

CREATE TABLE Cliente (
	id_cliente INT PRIMARY KEY,
    nombre  VARCHAR(100),
    correo VARCHAR(100),
    comuna varchar(100)
);


CREATE TABLE Productos (
	id_producto INT PRIMARY KEY,
	nombre Varchar(100),
	categoria Varchar(50),
	precio Decimal(10,2)
);


CREATE TABLE Venta (
	id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    Fecha DATE,
    foreign key (id_cliente) references Cliente(id_cliente),
    foreign key (id_producto) references Productos(id_producto)
);


INSERT INTO Cliente VALUES
(1, 'Ana Perez', 'ana@gmail.com', 'Ñuñoa'),
(2, 'Juan Soto', 'juan@gmail.com', 'Maipu'),
(3, 'Sofía López', 'sofia@gmail.com', 'La Florida');

INSERT INTO Productos VALUES
(101,'Mouse Logitech','Accesorios',24990),
(102,'Monitor Samsung','Monitores',189990),
(103,'Teclado Redragon','Accesorios',45990);


INSERT INTO venta VALUES
(1001, 1, 101, '2026-09-02'),
(1002, 2, 102, '2026-09-03'),
(1003, 3, 103, '2026-09-05');

#ERROR 
insert INTO Venta value
(1004,99,101,'2026-09-10');

-- Campos relacionados para conbinar información (nombre y fecha de venta/compra)
SELECT Cliente.nombre, Venta.fecha
FROM Cliente
JOIN VENTA ON Cliente.id_cliente = venta.id_cliente;

-- Mostrar clientes de ñuñoa y las fechas de sus ventas
SELECT Cliente.nombre, Venta.fecha, Cliente.comuna
FROM Cliente
JOIN VENTA ON Cliente.id_cliente = venta.id_cliente
where Cliente.comuna= 'ñuñoa';

-- Consulta con 3 tablas
SELECT Cliente.nombre, Venta.fecha, Productos.nombre, Productos.precio
FROM Venta
JOIN Cliente ON Venta.id_cliente = Cliente.id_cliente
JOIN Productos ON Venta.id_producto = Productos.id_producto;

SELECT c.nombre, p.nombre, p.precio
FROM Venta v
JOIN Cliente c on v.id_cliente = c.id_cliente
join Productos p on v.id_producto = p.id_producto
where p.precio between 20000 AND 100000
order by p.precio DESC;


 



