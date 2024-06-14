-----------------------------Consultas finales: -----------------------------------------

--Me posiciono en la BD FastFoodBD
USE FastFoodBD;


/*1.Eficiencia de los mensajeros: 
¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos 
por los mensajeros? */
-- Respuesta: 30 minutos
SELECT AVG(DATEDIFF(MINUTE, fecha_despacho, fecha_entrega)) AS TiempoPromedioEntrega
FROM Ordenes
WHERE fecha_despacho IS NOT NULL AND fecha_entrega IS NOT NULL;


--2.Análisis de Ventas por Origen de Orden: ¿Qué canal de ventas genera más ingresos?
--Respuesta: El canal que genera mas ingresos es "Recomendación".
SELECT 
	OrigenesOrden.descripcion AS OrigenDeOrden,
	SUM(total_compra) AS IngresosTotales 
	FROM Ordenes
INNER JOIN OrigenesOrden 
ON Ordenes.orden_id = OrigenesOrden.origen_id
GROUP BY OrigenesOrden.descripcion
ORDER BY SUM(total_compra) DESC;


--3.Productividad de los Empleados: ¿Cuál es el volumen de ventas promedio gestionado por empleado? CANTIDAD  de PRODUCTOS 
--Respuesta: Hay un solo empleado con ventas asignadas "John Doe - Promedio de ventas = 10 "
SELECT
	nombre,
	COUNT(o.orden_id) AS [Promedio de Ventas]
FROM Ordenes AS o 
JOIN Empleados AS e
ON o.empleado_id = e.empleado_id
JOIN DetalleOrdenes AS d
ON o.orden_id = d.orden_id
GROUP BY nombre; 


/*4.Análisis de Demanda por Horario y Día: ¿Cómo varía la demanda de productos a lo largo del día? 
NOTA:La cantidad de productos vendidos es de 32 por la mañana. 
por la tarde y la noche no hay productos vendidos */
SELECT 
	horario_venta,
	SUM(d.cantidad) AS [Demanda Productos]
FROM Ordenes AS o
LEFT JOIN DetalleOrdenes AS d
ON o.orden_id = d.orden_id
GROUP BY horario_venta;


/*5.Comparación de Ventas Mensuales: 
¿Cómo se comparan las ventas mensuales de este año con el año anterior?
NOTA: No hay en la BD ventas del año anterior, 
por lo que se comparan las ventas del año 2023 por mes*/

SELECT 
	FORMAT(fecha_orden_tomada,'yyyy-MM') AS Período,
	SUM(total_compra) AS [Total Venta] 
FROM Ordenes
GROUP BY fecha_orden_tomada;


--6.Análisis de Fidelidad del Cliente OK
/*NOTA: No hay información histórica para obtener la fidelidad del cliente, solo podemos 
observar que todos los clientes realizaron solo 1 orden*/
SELECT 
	cliente_id,
	COUNT(orden_id) AS [Numero Ordenes]
FROM Ordenes
GROUP BY cliente_id;

-------------------------------FIN del PI M2 --------------------------------------------