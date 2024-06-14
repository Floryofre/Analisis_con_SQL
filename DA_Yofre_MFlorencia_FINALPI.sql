-----------------------------Consultas finales: -----------------------------------------

--Me posiciono en la BD FastFoodBD
USE FastFoodBD;


/*1.Eficiencia de los mensajeros: 
�Cu�l es el tiempo promedio desde el despacho hasta la entrega de los pedidos 
por los mensajeros? */
-- Respuesta: 30 minutos
SELECT AVG(DATEDIFF(MINUTE, fecha_despacho, fecha_entrega)) AS TiempoPromedioEntrega
FROM Ordenes
WHERE fecha_despacho IS NOT NULL AND fecha_entrega IS NOT NULL;


--2.An�lisis de Ventas por Origen de Orden: �Qu� canal de ventas genera m�s ingresos?
--Respuesta: El canal que genera mas ingresos es "Recomendaci�n".
SELECT 
	OrigenesOrden.descripcion AS OrigenDeOrden,
	SUM(total_compra) AS IngresosTotales 
	FROM Ordenes
INNER JOIN OrigenesOrden 
ON Ordenes.orden_id = OrigenesOrden.origen_id
GROUP BY OrigenesOrden.descripcion
ORDER BY SUM(total_compra) DESC;


--3.Productividad de los Empleados: �Cu�l es el volumen de ventas promedio gestionado por empleado? CANTIDAD  de PRODUCTOS 
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


/*4.An�lisis de Demanda por Horario y D�a: �C�mo var�a la demanda de productos a lo largo del d�a? 
NOTA:La cantidad de productos vendidos es de 32 por la ma�ana. 
por la tarde y la noche no hay productos vendidos */
SELECT 
	horario_venta,
	SUM(d.cantidad) AS [Demanda Productos]
FROM Ordenes AS o
LEFT JOIN DetalleOrdenes AS d
ON o.orden_id = d.orden_id
GROUP BY horario_venta;


/*5.Comparaci�n de Ventas Mensuales: 
�C�mo se comparan las ventas mensuales de este a�o con el a�o anterior?
NOTA: No hay en la BD ventas del a�o anterior, 
por lo que se comparan las ventas del a�o 2023 por mes*/

SELECT 
	FORMAT(fecha_orden_tomada,'yyyy-MM') AS Per�odo,
	SUM(total_compra) AS [Total Venta] 
FROM Ordenes
GROUP BY fecha_orden_tomada;


--6.An�lisis de Fidelidad del Cliente OK
/*NOTA: No hay informaci�n hist�rica para obtener la fidelidad del cliente, solo podemos 
observar que todos los clientes realizaron solo 1 orden*/
SELECT 
	cliente_id,
	COUNT(orden_id) AS [Numero Ordenes]
FROM Ordenes
GROUP BY cliente_id;

-------------------------------FIN del PI M2 --------------------------------------------