-- 1. Cantidad de parques por departamento:
SELECT d.nombre AS departamento, COUNT(dp.id_parque) AS cantidad_parques
FROM Departamento d
JOIN Departamento_Parque dp ON d.id = dp.id_departamento
GROUP BY d.nombre;

-- 2. Superficie total de parques por departamento:
SELECT d.nombre AS departamento, SUM(a.superficie) AS superficie_total
FROM Departamento d
JOIN Departamento_Parque dp ON d.id = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id
JOIN Area a ON p.id = a.id_parque
GROUP BY d.nombre;

-- 3. Promedio de superficie de parques por departamento:
SELECT d.nombre AS departamento, AVG(a.superficie) AS superficie_promedio
FROM Departamento d
JOIN Departamento_Parque dp ON d.id = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id
JOIN Area a ON p.id = a.id_parque
GROUP BY d.nombre;

-- 4.  Cantidad de áreas por parque:
SELECT p.nombre AS parque, COUNT(a.id) AS cantidad_areas
FROM Parque p
JOIN Area a ON p.id = a.id_parque
GROUP BY p.nombre;

-- 5. Superficie total de áreas por parque:
SELECT p.nombre AS parque, SUM(a.superficie) AS superficie_total
FROM Parque p
JOIN Area a ON p.id = a.id_parque
GROUP BY p.nombre;

-- 6. Parque con mayor superficie total:
SELECT p.nombre AS parque, SUM(a.superficie) AS superficie_total
FROM Parque p
JOIN Area a ON p.id = a.id_parque
GROUP BY p.nombre
ORDER BY superficie_total DESC
LIMIT 1;

-- 7. Departamento con mayor cantidad de parques:
SELECT d.nombre AS departamento, COUNT(dp.id_parque) AS cantidad_parques
FROM Departamento d
JOIN Departamento_Parque dp ON d.id = dp.id_departamento
GROUP BY d.nombre
ORDER BY cantidad_parques DESC
LIMIT 1;

-- 8. Parque con mayor cantidad de áreas:
SELECT p.nombre AS parque, COUNT(a.id) AS cantidad_areas
FROM Parque p
JOIN Area a ON p.id = a.id_parque
GROUP BY p.nombre
ORDER BY cantidad_areas DESC
LIMIT 1;

-- 9. Superficie promedio de áreas por parque:
SELECT p.nombre AS parque, AVG(a.superficie) AS superficie_promedio
FROM Parque p
JOIN Area a ON p.id = a.id_parque
GROUP BY p.nombre;

-- 10. Cantidad de parques por categoría de alojamiento:
SELECT a.categoria, COUNT(DISTINCT a.id_parque) AS cantidad_parques
FROM Alojamiento a
GROUP BY a.categoria;

-- Inventarios de especies por áreas y tipos

-- 11. Cantidad de especies por área:
SELECT a.nombre AS area, COUNT(ae.id_especie) AS cantidad_especies
FROM Area a
JOIN Area_Especie ae ON a.id = ae.id_area
GROUP BY a.nombre;

-- 12. Cantidad total de inventario de especies por área:
SELECT a.nombre AS area, SUM(ae.cantidad_inventario) AS total_inventario
FROM Area a
JOIN Area_Especie ae ON a.id = ae.id_area
GROUP BY a.nombre;

-- 13. Área con mayor cantidad de especies:
SELECT a.nombre AS area, COUNT(ae.id_especie) AS cantidad_especies
FROM Area a
JOIN Area_Especie ae ON a.id = ae.id_area
GROUP BY a.nombre
ORDER BY cantidad_especies DESC
LIMIT 1;

-- 14. Área con mayor inventario de especies:
SELECT a.nombre AS area, SUM(ae.cantidad_inventario) AS total_inventario
FROM Area a
JOIN Area_Especie ae ON a.id = ae.id_area
GROUP BY a.nombre
ORDER BY total_inventario DESC
LIMIT 1;

-- 15. Cantidad de especies por parque:
SELECT p.nombre AS parque, COUNT(DISTINCT ae.id_especie) AS cantidad_especies
FROM Parque p
JOIN Area a ON p.id = a.id_parque
JOIN Area_Especie ae ON a.id = ae.id_area
GROUP BY p.nombre;

-- 16. Inventario total de especies por parque:
SELECT p.nombre AS parque, SUM(ae.cantidad_inventario) AS total_inventario
FROM Parque p
JOIN Area a ON p.id = a.id_parque
JOIN Area_Especie ae ON a.id = ae.id_area
GROUP BY p.nombre;

-- 17. Especie con mayor cantidad de inventario:
SELECT e.nombre_vulgar AS especie, SUM(ae.cantidad_inventario) AS total_inventario
FROM Especie e
JOIN Area_Especie ae ON e.id = ae.id_especie
GROUP BY e.nombre_vulgar
ORDER BY total_inventario DESC
LIMIT 1;

-- 18. Cantidad de especies por tipo de área:
SELECT a.nombre AS area, COUNT(DISTINCT ae.id_especie) AS cantidad_especies
FROM Area a
JOIN Area_Especie ae ON a.id = ae.id_area
GROUP BY a.nombre;

-- 19. Inventario total de especies por tipo de área:
SELECT a.nombre AS area, SUM(ae.cantidad_inventario) AS total_inventario
FROM Area a
JOIN Area_Especie ae ON a.id = ae.id_area
GROUP BY a.nombre;

-- 20. Especie con mayor cantidad de inventario en un área específica:
SELECT e.nombre_vulgar AS especie, ae.cantidad_inventario
FROM Especie e
JOIN Area_Especie ae ON e.id = ae.id_especie
WHERE ae.id_area = 1
ORDER BY ae.cantidad_inventario DESC
LIMIT 1;

