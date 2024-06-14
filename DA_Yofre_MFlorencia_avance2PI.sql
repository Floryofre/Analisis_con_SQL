----------------------------- Me posiciono en la BD ------------------------------------

USE FastFoodBD;

------------------Poblaci�n de datos siguiendo el orden dado----------------------------

-- Insertar datos en Categorias
INSERT INTO Categorias (Nombre) VALUES
('Comida R�pida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafeter�a'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

-- Insertar datos en Productos
INSERT INTO Productos (nombre, categoria_id, precio_lista) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99), ('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada C�sar', 4, 5.99), ('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);

-- Insertar datos en Sucursales
INSERT INTO Sucursales (nombre, direcci�n) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Monta�a', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');

-- Insertar datos en Empleados
INSERT INTO Empleados (nombre, posicion, departamento, sucursal_id, rol) VALUES
('John Doe', 'Gerente', 'Administraci�n', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), ('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafeter�a', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Log�stica', 1, 'Mensajero'), ('Lucas Miller', 'Atenci�n al Cliente', 'Servicio', 1, 'Vendedor'), ('Olivia Garc�a', 'Encargado de Turno', 'Administraci�n', 1, 'Vendedor'), ('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), ('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

-- Insertar datos en Clientes
INSERT INTO Clientes (nombre, direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

-- Insertar datos en OrigenesOrden
INSERT INTO OrigenesOrden (descripcion) VALUES
('En l�nea'), ('Presencial'), ('Tel�fono'), ('Drive Thru'), ('App M�vil'),
('Redes Sociales'), ('Correo Electr�nico'), ('Publicidad'), ('Recomendaci�n'), ('Evento');

-- Insertar datos en TiposPago
INSERT INTO TiposPago (descripcion) VALUES
('Efectivo'), ('Tarjeta de Cr�dito'), ('Tarjeta de D�bito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cup�n de Descuento'), ('Pago M�vil');

-- Insertar datos en Mensajeros
INSERT INTO Mensajeros (nombre, es_externo) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);

-- Insertar datos en Ordenes
INSERT INTO Ordenes (cliente_id, empleado_id, sucursal_id, mensajero_id, tipo_pago_id, origen_id, horario_venta, total_compra, km_recorrer, fecha_despacho, fecha_entrega, fecha_orden_tomada, fecha_orden_lista) VALUES
(1, 1, 1, 1, 1, 1, 'Ma�ana', 50.00, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 75.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 20.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Ma�ana', 30.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 55.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 45.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Ma�ana', 65.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 85.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 95.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Ma�ana', 100.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

-- Insertar datos en DetalleOrdenes
INSERT INTO DetalleOrdenes (orden_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);

Select * from Sucursales;

------------------------ Consultas y Actualizaciones Solicitadas ------------------------------

-- Aumentar el precio de todos los productos en la categor�a 1 -- OK
UPDATE Productos SET precio_lista = precio_lista + 1 WHERE categoria_id = 1;

-- Cambiar la posici�n de todos los empleados del departamento 'Cocina' a 'Chef'-- OK
UPDATE Empleados SET posicion = 'Chef' WHERE departamento = 'Cocina';

-- Actualizar la direcci�n de una sucursal espec�fica --OK
UPDATE Sucursales SET direcci�n = '1234 New Address St' WHERE sucursal_id = 1;

--Eliminar una orden espec�fica --OK
Select * from Ordenes;

DELETE FROM DetalleOrdenes WHERE orden_id = 10; -- no elimino nada porque no habia Order_id = 10
DELETE FROM Ordenes WHERE orden_id = 10; -- Elimino 1 

Select * from Empleados;

-- Eliminar todos los productos de una categor�a espec�fica 

DELETE FROM Productos WHERE categoria_id = 2; /* NO se puede eliminar, ya que categoria_id es una clave foranea
y no puedo eliminarla por la integridad referencial*/

SELECT * FROM Ordenes;

-- Eliminar empleados de una sucursal que cerr� 
DELETE FROM Empleados WHERE sucursal_id = 10; -- No elimin� nada ya que no tengo empleados en la sucursal nro 10


--------------------------- Consultas de Negocio ------------------------------------------------

--1 Registros Unicos

SELECT COUNT(orden_id) AS TotalRegistrosUnicos  
FROM Ordenes; -- igual a 9

--2 Empleados por Departamento

SELECT departamento AS Departamento, COUNT(empleado_id) AS CantidadEmpleados
FROM Empleados
GROUP BY departamento; -- Administracion y Ventas tiene cada uno 2 empleados, el resto 1 

--3 Cantidad de Productos por Categoria

Select * from Ordenes;

SELECT categoria_id AS Categoria, COUNT(producto_id) AS CantidadProductos
FROM Productos
GROUP BY categoria_id; -- Cada categoria tiene 2 productos

--4 Cantidad Total de Clientes
SELECT COUNT(cliente_id) AS CantidadTotalClientes FROM Clientes; -- 10 Clientes

--5 Desempe�o por sucursal con promedios de Ventas y Km recorridos

SELECT sucursal_id AS Sucursal,
	AVG (total_compra) AS PromedioVentaOrden,
	AVG (km_recorrer) AS PromedioKM
FROM Ordenes
GROUP BY sucursal_id
HAVING AVG (total_compra) > 50
ORDER BY PromedioKM DESC;

------------------------------------ Fin AVANCE nro.2 --------------------------