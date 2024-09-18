## Consultas para la Base de Datos del Negocio de Antigüedades

**Consulta para listar todas las antigüedades disponibles para la venta:**

 "Obtén una lista de todas las piezas antiguas que están actualmente disponibles para la venta, incluyendo el nombre de la pieza, su categoría, precio y estado de conservación."

```sql
SELECT a.nombre, c.nombre AS "categoria", a.precio, e.nombre AS "estado_conservacion"  FROM antiguedad a
INNER JOIN categoria c ON c.id_categoria = a.categoria_id
INNER JOIN estado_conservacion e ON e.id_estado_conservacion = a.estado_conservacion_id
INNER JOIN disponibilidad d ON d.id_disponibilidad = a.disponibilidad_id
WHERE d.nombre = "En venta";
```

Salida

```
+-----------------------------------+------------+---------+---------------------+
| nombre                            | categoria  | precio  | estado_conservacion |
+-----------------------------------+------------+---------+---------------------+
| Silla renacentista                | Muebles    | 1200.00 | Excelente           |
| Anillo de oro barroco             | Joyería    | 3500.00 | Bueno               |
| Mesa barroca                      | Muebles    | 2500.00 | Excelente           |
| Collar renacentista               | Joyería    | 4500.00 | Bueno               |
| Pintura religiosa medieval        | Pinturas   | 3000.00 | Regular             |
| Escultura de mármol neoclásica    | Esculturas | 7500.00 | Excelente           |
| Jarrón de cerámica medieval       | Muebles    | 2200.00 | Bueno               |
| Anillo barroco con esmeralda      | Joyería    | 3800.00 | Excelente           |
| Escultura de mármol renacentista  | Esculturas | 8500.00 | Bueno               |
| Broche de oro neoclásico          | Joyería    | 1500.00 | Regular             |
| Paisaje barroco                   | Pinturas   | 5000.00 | Excelente           |
| Mesa renacentista de roble        | Muebles    | 6000.00 | Bueno               |
+-----------------------------------+------------+---------+---------------------+
```

**Consulta para buscar antigüedades por categoría y rango de precio:** 

"Busca todas las antigüedades dentro de una categoría específica (por ejemplo, 'Muebles') que tengan un precio dentro de un rango determinado (por ejemplo, entre 1000 y 3000 dólares)."

```sql
SELECT a.nombre, a.precio, a.origen, c.nombre AS "categoria", e.nombre AS "estado_conservacion" FROM antiguedad a
INNER JOIN categoria c ON c.id_categoria = a.categoria_id
INNER JOIN estado_conservacion e ON e.id_estado_conservacion = a.estado_conservacion_id
WHERE a.precio BETWEEN 1000 AND 3000;
```

Salida

```
+-------------------------------+---------+----------+-----------+---------------------+
| nombre                        | precio  | origen   | categoria | estado_conservacion |
+-------------------------------+---------+----------+-----------+---------------------+
| Silla renacentista            | 1200.00 | Italia   | Muebles   | Excelente           |
| Mesa barroca                  | 2500.00 | Francia  | Muebles   | Excelente           |
| Pintura religiosa medieval    | 3000.00 | España   | Pinturas  | Regular             |
| Jarrón de cerámica medieval   | 2200.00 | Alemania | Muebles   | Bueno               |
| Broche de oro neoclásico      | 1500.00 | Francia  | Joyería   | Regular             |
+-------------------------------+---------+----------+-----------+---------------------+
```

**Consulta para mostrar el historial de ventas de un cliente específico:** 

"Muestra todas las piezas antiguas que un cliente específico ha vendido, incluyendo la fecha de la venta, el precio de venta y el comprador."

```sql
SELECT a.nombre AS nombre_antiguedad, t.fecha, t.precio_venta, u.nombre AS comprador_nombre, u.apellido_uno AS comprador_apellido FROM transaccion t
JOIN antiguedad a ON t.antiguedad_id_t = a.id_antiguedad
JOIN usuario u ON t.comprador_id = u.id_usuario
WHERE a.propietario_id = 1 AND t.comprador_id <> 1;
```

Salida

```
+--------------------+------------+--------------+------------------+--------------------+
| nombre_antiguedad  | fecha      | precio_venta | comprador_nombre | comprador_apellido |
+--------------------+------------+--------------+------------------+--------------------+
| Silla renacentista | 2023-09-01 |         1200 | María            | López              |
| Silla renacentista | 2024-04-05 |         1400 | María            | López              |
| Silla renacentista | 2024-02-12 |         1250 | Luis             | Martínez           |
+--------------------+------------+--------------+------------------+--------------------+
```

**Consulta para obtener el total de ventas realizadas en un periodo de tiempo:**

 "Calcula el total de ventas realizadas en un período específico, por ejemplo, durante el último mes."

```sql
SELECT SUM(precio_venta) AS "total ventas" FROM transaccion 
WHERE fecha BETWEEN "2024-02-12" AND "2024-04-05";
```

Salida

```
+--------------+
| total ventas |
+--------------+
|         3750 |
+--------------+
```

**Consulta para encontrar los clientes más activos (con más compras realizadas):** 

"Identifica los clientes que han realizado la mayor cantidad de compras en la plataforma."

```sql
SELECT u.nombre, u.apellido_uno, COUNT(t.id_transaccion) AS "total_compras" FROM transaccion t
INNER JOIN usuario u ON u.id_usuario = t.comprador_id
GROUP BY u.id_usuario
ORDER BY total_compras DESC
LIMIT 2;
```

Salida

```
+--------+--------------+---------------+
| nombre | apellido_uno | total_compras |
+--------+--------------+---------------+
| Carlos | Pérez        |             3 |
| María  | López        |             3 |
+--------+--------------+---------------+
```

**Consulta para listar las antigüedades más populares por número de visitas o consultas:** 

"Muestra las piezas antiguas que han recibido la mayor cantidad de visitas o consultas por parte de los usuarios."

```sql
SELECT a.nombre, COUNT(v.id_valoracion) as "valoraciones" FROM valoracion v
INNER JOIN antiguedad a ON a.id_antiguedad = v.antiguedad_id_v
GROUP by a.nombre
ORDER BY valoraciones
LIMIT 3;
```

Salida

```sql
+-----------------------+--------------+
| nombre                | valoraciones |
+-----------------------+--------------+
| Silla renacentista    |            1 |
| Anillo de oro barroco |            1 |
| Retrato neoclásico    |            1 |
+-----------------------+--------------+
```

**Consulta para listar las antigüedades vendidas en un rango de fechas específico:**

 "Obtén una lista de todas las piezas antiguas que se han vendido dentro de un rango de fechas específico, incluyendo la información del vendedor y comprador."

```sql
SELECT a.nombre AS "antiguedad", CONCAT_WS(' ', v.nombre, v.apellido_uno) AS "Vendedor", CONCAT_WS(' ', c.nombre, c.apellido_uno) AS "Comprador" FROM transaccion t
INNER JOIN antiguedad a ON a.id_antiguedad = t.antiguedad_id_t
INNER JOIN usuario v ON a.propietario_id = v.id_usuario
INNER JOIN usuario c ON c.id_usuario = t.comprador_id
WHERE fecha BETWEEN "2023-02-12" AND "2024-04-05";
```

Salida

```
+-----------------------+----------------+----------------+
| antiguedad            | Vendedor       | Comprador      |
+-----------------------+----------------+----------------+
| Silla renacentista    | Carlos Pérez   | María López    |
| Retrato neoclásico    | Luis Martínez  | Carlos Pérez   |
| Anillo de oro barroco | María López    | Luis Martínez  |
| Anillo de oro barroco | María López    | María López    |
| Retrato neoclásico    | Luis Martínez  | Carlos Pérez   |
| Silla renacentista    | Carlos Pérez   | Luis Martínez  |
| Silla renacentista    | Carlos Pérez   | Carlos Pérez   |
| Silla renacentista    | Carlos Pérez   | María López    |
+-----------------------+----------------+----------------+
```

