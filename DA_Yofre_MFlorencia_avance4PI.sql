---------------------------AVANCE 4- REVISAR EN CLASE ANTES-----------------------------------------
-- Me posiciono en la BD FastFoodBD
USE FastFoodBD;

-- 1.	Listar todos los productos y sus categorías -- 
/*Resultado: 10 productos en 5 categorias*/
SELECT 
p.nombre AS Producto,
c.nombre AS Categoría
FROM
 Productos AS p INNER JOIN Categorias AS c
 ON p.categoria_id = c.categoria_id;


 -- 2. Obtener empleados y su sucursal asignada -- 
 SELECT 
e.nombre AS Empleado,
s.nombre AS Sucursal,
e.departamento AS Departamento
FROM
 Empleados AS e INNER JOIN Sucursales AS s
ON e.sucursal_id = s.sucursal_id;


-- 3.	Identificar productos sin categoría asignada
-- Respuesta: No hay productos sin categoria asignada.
SELECT 
p.nombre AS Producto,
c.categoria_id AS Categoria
FROM 
	Productos AS p LEFT JOIN Categorias AS c
	ON p.categoria_id = c.categoria_id
	WHERE c.categoria_id IS NULL; -- si comento esta linea me muestra todos los productos y sus categorias.


-- 4.	Detalle completo de órdenes -- 
SELECT 
o.orden_id AS Orden,
s.nombre AS Sucursal,
m.nombre AS Mensajero,
c.nombre AS Cliente,
e.nombre AS Empleados,
oo.descripcion AS Origen, 
t.descripcion AS TipoPago,
o.horario_venta AS HsVenta,
o.total_compra AS TotalCompra,
o.km_recorrer,
o.fecha_despacho,
o.fecha_entrega,
o.fecha_orden_tomada,
o.fecha_orden_lista
FROM 
(Ordenes AS o 
INNER JOIN Sucursales AS s
	ON o.sucursal_id = s.sucursal_id
INNER JOIN Mensajeros AS m
	ON o.mensajero_id = m.mensajero_id
INNER JOIN Clientes AS c
	ON o.cliente_id = c.cliente_id
INNER JOIN Empleados AS e
	ON o.empleado_id = e.empleado_id
INNER JOIN OrigenesOrden AS oo
	ON o.origen_id = oo.origen_id
INNER JOIN TiposPago AS t
	ON o.tipo_pago_id = t.tipo_pago_id);

-- 5.	Productos de cada tipo, vendidos -- por cada sucursal
SELECT 
s.sucursal_id AS Sucursal,
c.nombre AS TIpoProducto, 
SUM(do.cantidad) AS TotalUnidadesVendidas

FROM Ordenes o
INNER JOIN DetalleOrdenes do ON o.orden_id = do.orden_id
INNER JOIN Sucursales s ON o.sucursal_id = s.sucursal_id
INNER JOIN Productos p ON do.producto_id = p.producto_id
INNER JOIN Categorias c ON p.categoria_id = c.categoria_id
GROUP BY s.sucursal_id, c.nombre
ORDER BY s.sucursal_id, c.nombre;

