SELECT a.nombre, c.nombre AS "categoria", a.precio, e.nombre AS "estado_conservacion"  FROM antiguedad a
INNER JOIN categoria c ON c.id_categoria = a.categoria_id
INNER JOIN estado_conservacion e ON e.id_estado_conservacion = a.estado_conservacion_id
INNER JOIN disponibilidad d ON d.id_disponibilidad = a.disponibilidad_id
WHERE d.nombre = "En venta";

-- consulta 2

SELECT a.nombre, a.precio, a.origen, c.nombre AS "categoria", e.nombre AS "estado_conservacion" FROM antiguedad a
INNER JOIN categoria c ON c.id_categoria = a.categoria_id
INNER JOIN estado_conservacion e ON e.id_estado_conservacion = a.estado_conservacion_id
WHERE a.precio BETWEEN 1000 AND 3000;

-- consulta 3

SELECT a.nombre AS nombre_antiguedad, t.fecha, t.precio_venta, u.nombre AS comprador_nombre, u.apellido_uno AS comprador_apellido FROM transaccion t
JOIN antiguedad a ON t.antiguedad_id_t = a.id_antiguedad
JOIN usuario u ON t.comprador_id = u.id_usuario
WHERE a.propietario_id = 1 AND t.comprador_id <> 1;

-- Consulta 4

SELECT SUM(precio_venta) AS "total ventas" FROM transaccion 
WHERE fecha BETWEEN "2024-02-12" AND "2024-04-05";

-- Consutla 5
SELECT u.nombre, u.apellido_uno, COUNT(t.id_transaccion) AS "total_compras" FROM transaccion t
INNER JOIN usuario u ON u.id_usuario = t.comprador_id
GROUP BY u.id_usuario
ORDER BY total_compras DESC
LIMIT 2;

-- Consulta 6
SELECT a.nombre, COUNT(v.id_valoracion) as "valoraciones" FROM valoracion v
INNER JOIN antiguedad a ON a.id_antiguedad = v.antiguedad_id_v
GROUP by a.nombre
ORDER BY valoraciones
LIMIT 3;

-- consulta 7
SELECT a.nombre AS "antiguedad", CONCAT_WS(' ', v.nombre, v.apellido_uno) AS "Vendedor", CONCAT_WS(' ', c.nombre, c.apellido_uno) AS "Comprador" FROM transaccion t
INNER JOIN antiguedad a ON a.id_antiguedad = t.antiguedad_id_t
INNER JOIN usuario v ON a.propietario_id = v.id_usuario
INNER JOIN usuario c ON c.id_usuario = t.comprador_id
WHERE fecha BETWEEN "2023-02-12" AND "2024-04-05";