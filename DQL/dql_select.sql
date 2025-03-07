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

-- Actividades del personal según tipo, áreas asignadas y sueldos

-- 21. Cantidad de personal por rol:
SELECT rol, COUNT(*) AS cantidad_personal
FROM Personal
GROUP BY rol;

-- 22. Sueldo promedio por rol:
SELECT rol, AVG(sueldo) AS sueldo_promedio
FROM Personal
GROUP BY rol;

-- 23. Personal con mayor sueldo:
SELECT nombre, sueldo
FROM Personal
ORDER BY sueldo DESC
LIMIT 1;

-- 24. Personal con menor sueldo:
SELECT nombre, sueldo
FROM Personal
ORDER BY sueldo ASC
LIMIT 1;

-- 25. Cantidad de personal por área:
SELECT a.nombre AS area, COUNT(p.id) AS cantidad_personal
FROM Area a
JOIN Proyecto_Investigador pi ON a.id = pi.id_proyecto
JOIN Personal p ON pi.id_personal = p.id
GROUP BY a.nombre;

-- 26. Sueldo total por área:
SELECT a.nombre AS area, SUM(p.sueldo) AS sueldo_total
FROM Area a
JOIN Proyecto_Investigador pi ON a.id = pi.id_proyecto
JOIN Personal p ON pi.id_personal = p.id
GROUP BY a.nombre;

-- 27. Rol con mayor cantidad de personal:
SELECT rol, COUNT(*) AS cantidad_personal
FROM Personal
GROUP BY rol
ORDER BY cantidad_personal DESC
LIMIT 1;

-- 28. Promedio de sueldo por área:
SELECT a.nombre AS area, AVG(p.sueldo) AS sueldo_promedio
FROM Area a
JOIN Proyecto_Investigador pi ON a.id = pi.id_proyecto
JOIN Personal p ON pi.id_personal = p.id
GROUP BY a.nombre;

-- 29. Personal asignado a más de un área:
SELECT p.nombre, COUNT(DISTINCT pi.id_proyecto) AS cantidad_areas
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
GROUP BY p.nombre
HAVING cantidad_areas > 1;

-- 30. Sueldo promedio del personal asignado a más de un área:
SELECT AVG(p.sueldo) AS sueldo_promedio
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
GROUP BY p.id
HAVING COUNT(DISTINCT pi.id_proyecto) > 1;

-- 31. Cantidad de personal por proyecto:
SELECT pi.id_proyecto, COUNT(pi.id_personal) AS cantidad_personal
FROM Proyecto_Investigador pi
GROUP BY pi.id_proyecto;

-- 32. Sueldo total por proyecto:
SELECT pi.id_proyecto, SUM(p.sueldo) AS sueldo_total
FROM Proyecto_Investigador pi
JOIN Personal p ON pi.id_personal = p.id
GROUP BY pi.id_proyecto;

-- 33. Rol con mayor sueldo promedio:
SELECT rol, AVG(sueldo) AS sueldo_promedio
FROM Personal
GROUP BY rol
ORDER BY sueldo_promedio DESC
LIMIT 1;

-- 34. Personal con mayor cantidad de proyectos asignados:
SELECT p.nombre, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
GROUP BY p.nombre
ORDER BY cantidad_proyectos DESC
LIMIT 1;

-- 35. Sueldo promedio del personal con más de un proyecto asignado:
SELECT AVG(p.sueldo) AS sueldo_promedio
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
GROUP BY p.id
HAVING COUNT(pi.id_proyecto) > 1;

-- 36. Cantidad de personal por departamento:
SELECT d.nombre AS departamento, COUNT(p.id) AS cantidad_personal
FROM Departamento d
JOIN Departamento_Entidad de ON d.id = de.id_departamento
JOIN Entidad e ON de.id_entidad = e.id
JOIN Personal p ON e.id = p.id
GROUP BY d.nombre;

-- 37. Sueldo total por departamento:
SELECT d.nombre AS departamento, SUM(p.sueldo) AS sueldo_total
FROM Departamento d
JOIN Departamento_Entidad de ON d.id = de.id_departamento
JOIN Entidad e ON de.id_entidad = e.id
JOIN Personal p ON e.id = p.id
GROUP BY d.nombre;

-- 38. Promedio de sueldo por departamento:
SELECT d.nombre AS departamento, AVG(p.sueldo) AS sueldo_promedio
FROM Departamento d
JOIN Departamento_Entidad de ON d.id = de.id_departamento
JOIN Entidad e ON de.id_entidad = e.id
JOIN Personal p ON e.id = p.id
GROUP BY d.nombre;

-- 39. Departamento con mayor cantidad de personal:
SELECT d.nombre AS departamento, COUNT(p.id) AS cantidad_personal
FROM Departamento d
JOIN Departamento_Entidad de ON d.id = de.id_departamento
JOIN Entidad e ON de.id_entidad = e.id
JOIN Personal p ON e.id = p.id
GROUP BY d.nombre
ORDER BY cantidad_personal DESC
LIMIT 1;

-- 40. Departamento con mayor sueldo total:
SELECT d.nombre AS departamento, SUM(p.sueldo) AS sueldo_total
FROM Departamento d
JOIN Departamento_Entidad de ON d.id = de.id_departamento
JOIN Entidad e ON de.id_entidad = e.id
JOIN Personal p ON e.id = p.id
GROUP BY d.nombre
ORDER BY sueldo_total DESC
LIMIT 1;

