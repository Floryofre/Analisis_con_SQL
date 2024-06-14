--Paso 1 - Creación de BD

CREATE DATABASE FastFoodBD;

USE FastFoodBD; -- Me posiciono en la BD 

--Paso 2 - Creación de Tablas con código 10 en total
--Creación de Tablas sin FK 6 en total

CREATE TABLE Clientes (
	cliente_id INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(255) NOT NULL,
	direccion VARCHAR(255));

CREATE TABLE TiposPago (
	tipo_pago_id INT PRIMARY KEY IDENTITY,
	descripcion VARCHAR(255) NOT NULL);

CREATE TABLE OrigenesOrden (
	origen_id INT PRIMARY KEY IDENTITY,
	descripcion VARCHAR(255) NOT NULL);

CREATE TABLE Sucursales (
	sucursal_id INT PRIMARY KEY IDENTITY, 
	nombre VARCHAR(255) NOT NULL,
	dirección VARCHAR(255));

CREATE TABLE Mensajeros(
	mensajero_id INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(255) NOT NULL,
	es_externo BIT NOT NULL);

CREATE TABLE Categorias (
	categoria_id INT PRIMARY KEY IDENTITY, 
	nombre VARCHAR(255) NOT NULL);

--Creación de Tablas con FK 4 en total

CREATE TABLE Productos (
	producto_id INT PRIMARY KEY IDENTITY, -- el valor se incrementa de a 1 en 1
	nombre VARCHAR(255) NOT NULL,
	categoria_id INT, --FK a PK de Categorias
	precio_lista DECIMAL(10,2) NOT NULL);

CREATE TABLE Empleados (
	empleado_id INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(255) NOT NULL,
	posicion VARCHAR(255),
	departamento VARCHAR(255),
	sucursal_id INT, --FK
	rol VARCHAR(255));

CREATE TABLE DetalleOrdenes (
	orden_id INT,
	producto_id INT, 
	cantidad INT,
	precio_unitario DECIMAL(10,2),
	PRIMARY KEY (orden_id, producto_id)); -- Clave compuesta

CREATE TABLE Ordenes (
	orden_id INT PRIMARY KEY IDENTITY,
	cliente_id INT, --FK
	empleado_id INT, --FK - Vendedor que toma la orden
	sucursal_id INT, --FK
	mensajero_id INT, --FK
	tipo_pago_id INT, --FK
	origen_id INT, --FK
	horario_venta VARCHAR(50),--Mañana, Tarde, Noche 
	total_compra DECIMAL(10,2), 
	km_recorrer DECIMAL(10,2), --En caso de entrega a domicilio
	fecha_despacho DATETIME, --Fecha y hora de entrega al repartidor
	fecha_entrega DATETIME, --Fecha y hora de la orden entregada al cliente
	fecha_orden_tomada DATETIME, -- En caso de drive thru o presencial
	fecha_orden_lista DATETIME); --Hora y fecha en que estuvo lista la orden desde la cocina

SELECT * FROM Ordenes;

/*Paso 3 - CONEXIONES 10 en Total
1-	FK_Productos_Categorias - categoria_id
2-	FK_Ordenes_Sucursales - sucursal_id
3-	FK_Ordenes_Mensajeros - mensajero_id
4-	FK_Ordenes_Clientes - cliente_id
5-	FK_Ordenes_ Empleados - empleado_id
6-	FK_Ordenes_ OrigenesOrden - origen_id
7-	FK_Ordenes_ TiposPago - tipo_pago_id 
8-	FK_DetalleOrdenes_Productos - producto_id
9-	FK_DetalleOrdenes _Ordenes - orden_id
10-	FK_Empleados_Sucursales - sucursal_id*/

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Categorias -- Nombre representativo que yo le pongo
FOREIGN KEY(categoria_id) REFERENCES Categorias(categoria_id);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Sucursales 
FOREIGN KEY(sucursal_id) REFERENCES Sucursales(sucursal_id);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Mensajeros 
FOREIGN KEY(mensajero_id) REFERENCES Mensajeros(mensajero_id);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Clientes 
FOREIGN KEY(cliente_id) REFERENCES Clientes (cliente_id);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Empleados 
FOREIGN KEY(empleado_id) REFERENCES Empleados (empleado_id);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_OrigenesOrden 
FOREIGN KEY(origen_id) REFERENCES OrigenesOrden (origen_id);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_TiposPago
FOREIGN KEY(tipo_pago_id) REFERENCES TiposPago (tipo_pago_id);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FK_DetalleOrdenes_Productos
FOREIGN KEY(producto_id) REFERENCES Productos (producto_id);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FK_DetalleOrdenes_Ordenes
FOREIGN KEY(orden_id) REFERENCES Ordenes (orden_id);

ALTER TABLE Empleados
ADD CONSTRAINT FK_Empleados_Sucursales
FOREIGN KEY(sucursal_id) REFERENCES Sucursales (sucursal_id);





