----------------Avance nro.3 Consultas con funciones de agregación-------------------------------

-- Me posiciono e la BD FastFoodBD
USE FastFoodBD;


---------------------------------- Consultas ----------------------------------------------------

--1: ¿Cuál es el total de ventas (TotalCompra) a nivel global?
SELECT SUM(total_compra) AS TotalVentas FROM Ordenes; 
-- RESPUESTA: El Total de ventas es 520.00


--2 ¿Cuál es el precio promedio de los productos dentro de cada categoría?
SELECT categoria_id AS Categoria,
	AVG (precio_lista) AS PromedioPrecioPorCategoria
FROM Productos
GROUP BY categoria_id;


--3 ¿Cuál es el valor de la orden mínima y máxima por cada sucursal? --Tabla Ordenes
SELECT sucursal_id AS Sucursal,
	MIN(total_compra) AS MinimoCompras,
	MAX(total_compra) AS MaximoCompras
FROM Ordenes
GROUP BY sucursal_id;


--4 ¿Cuál es el mayor número de kilómetros recorridos para una entrega?
SELECT MAX(km_recorrer) AS MayorKMRecorrido 
FROM Ordenes;
-- Resultado:El Mayor nro de Km recorridos para una entrega es de 12.50Km.


--5 ¿Cuál es la cantidad promedio de productos por orden?
SELECT orden_id AS NroOrden,
	AVG (cantidad) AS CantidadPromedioProductos
FROM DetalleOrdenes
GROUP BY orden_id;
-- Respuesta: La cantidad promedio de prod. por orden es 3.


--6 ¿Cuál es el total de ventas por cada tipo de pago?
SELECT tipo_pago_id AS TipoDePago, 
	   total_compra AS TotalVenta
FROM ordenes
ORDER BY tipo_pago_id;


--7 ¿Cuál sucursal tiene la venta promedio más alta?
SELECT TOP 1 sucursal_id AS Sucursal, --Resultado: Sucursal 9 promedio ventas 95.000
	AVG(total_compra) AS PromedioVentas
FROM Ordenes
GROUP BY sucursal_id
ORDER BY AVG(total_compra) DESC;
-- Respuesta: La sucursal con venta promedio mas alta es la Nro.9


/*8 ¿Cuáles son las sucursales que han generado ventas por orden por encima de $100, 
y cómo se comparan en términos del total de ventas?*/
SELECT sucursal_id, 
	COUNT(*) AS NumeroDeOrdenes, 
	SUM(total_compra) AS TotalVentas
FROM Ordenes
WHERE total_compra > 65 -- Se cambio el criterio a 65 ya que no tenemos ventas por encima de 100 
GROUP BY sucursal_id
ORDER BY SUM(total_compra) DESC;


-- 9 ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?
SELECT TOP 1 -- Para que muestre solo un resultado
    (SELECT AVG(total_compra) 
FROM Ordenes WHERE fecha_orden_tomada < '2023-07-01') AS PromedioVentasAntes01Julio2023,
    (SELECT AVG(total_compra) 
FROM Ordenes WHERE fecha_orden_tomada > '2023-07-01') AS PromedioVentasDespues01Julio2023;
-- RESULTADO: ANTES 45.83, DESPUES:81.66


/*10 ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, 
¿cuál es el valor promedio de estas ventas, y cuál ha sido la venta máxima alcanzada?*/
SELECT horario_venta AS HorarioVenta, 
	COUNT(orden_id) AS CantidadVentas,  -- 1 - cantidad de ventas por horario
	AVG(total_compra) AS PromedioVentas, -- 1 - Promedio de ventas por horario
	MAX(total_compra) AS MaximaVenta -- 1 - Maximo de ventas por horario
FROM Ordenes
GROUP BY horario_venta;

------------------------------Fin del AVANCE Nro.3 ------------------------------------------------



