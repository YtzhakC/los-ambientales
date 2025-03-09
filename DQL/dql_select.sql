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

-- Estadísticas de proyectos de investigación: costos, especies involucradas y equipos

-- 41. Cantidad de proyectos por especie:
SELECT e.nombre_vulgar AS especie, COUNT(pe.id_proyecto) AS cantidad_proyectos
FROM Especie e
JOIN Proyecto_Especie pe ON e.id = pe.id_especie
GROUP BY e.nombre_vulgar;

-- 42. Costo total de proyectos por especie:
SELECT e.nombre_vulgar AS especie, SUM(pi.presupuesto) AS costo_total
FROM Especie e
JOIN Proyecto_Especie pe ON e.id = pe.id_especie
JOIN Proyecto_Investigacion pi ON pe.id_proyecto = pi.id
GROUP BY e.nombre_vulgar;

-- 43. Especie con mayor cantidad de proyectos:
SELECT e.nombre_vulgar AS especie, COUNT(pe.id_proyecto) AS cantidad_proyectos
FROM Especie e
JOIN Proyecto_Especie pe ON e.id = pe.id_especie
GROUP BY e.nombre_vulgar
ORDER BY cantidad_proyectos DESC
LIMIT 1;

-- 44. Especie con mayor costo total de proyectos:
SELECT e.nombre_vulgar AS especie, SUM(pi.presupuesto) AS costo_total
FROM Especie e
JOIN Proyecto_Especie pe ON e.id = pe.id_especie
JOIN Proyecto_Investigacion pi ON pe.id_proyecto = pi.id
GROUP BY e.nombre_vulgar
ORDER BY costo_total DESC
LIMIT 1;

-- 45. Cantidad de especies involucradas por proyecto:
SELECT pi.id AS proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pi
JOIN Proyecto_Especie pe ON pi.id = pe.id_proyecto
GROUP BY pi.id;

-- 46. Costo total de proyectos por área:
SELECT a.nombre AS area, SUM(pi.presupuesto) AS costo_total
FROM Area a
JOIN Proyecto_Investigador pi ON a.id = pi.id_proyecto
JOIN Proyecto_Investigacion p ON pi.id_proyecto = p.id
GROUP BY a.nombre;

-- 47. Área con mayor costo total de proyectos:
SELECT a.nombre AS area, SUM(pi.presupuesto) AS costo_total
FROM Area a
JOIN Proyecto_Investigador pi ON a.id = pi.id_proyecto
JOIN Proyecto_Investigacion p ON pi.id_proyecto = p.id
GROUP BY a.nombre
ORDER BY costo_total DESC
LIMIT 1;

-- 48. Cantidad de proyectos por área:
SELECT a.nombre AS area, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Area a
JOIN Proyecto_Investigador pi ON a.id = pi.id_proyecto
GROUP BY a.nombre;

-- 49. Área con mayor cantidad de proyectos:
SELECT a.nombre AS area, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Area a
JOIN Proyecto_Investigador pi ON a.id = pi.id_proyecto
GROUP BY a.nombre
ORDER BY cantidad_proyectos DESC
LIMIT 1;

-- 50. Promedio de costo de proyectos por área:
SELECT a.nombre AS area, AVG(pi.presupuesto) AS costo_promedio
FROM Area a
JOIN Proyecto_Investigador pi ON a.id = pi.id_proyecto
JOIN Proyecto_Investigacion p ON pi.id_proyecto = p.id
GROUP BY a.nombre;

-- 51. Cantidad de proyectos por investigador:
SELECT p.nombre AS investigador, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
GROUP BY p.nombre;

-- 52. Investigador con mayor cantidad de proyectos:
SELECT p.nombre AS investigador, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
GROUP BY p.nombre
ORDER BY cantidad_proyectos DESC
LIMIT 1;

-- 53. Costo total de proyectos por investigador:
SELECT p.nombre AS investigador, SUM(pi.presupuesto) AS costo_total
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
JOIN Proyecto_Investigacion p ON pi.id_proyecto = p.id
GROUP BY p.nombre;

-- 54. Investigador con mayor costo total de proyectos:
SELECT p.nombre AS investigador, SUM(pi.presupuesto) AS costo_total
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
JOIN Proyecto_Investigacion p ON pi.id_proyecto = p.id
GROUP BY p.nombre
ORDER BY costo_total DESC
LIMIT 1;

-- 55. Promedio de costo de proyectos por investigador:
SELECT p.nombre AS investigador, AVG(pi.presupuesto) AS costo_promedio
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
JOIN Proyecto_Investigacion p ON pi.id_proyecto = p.id
GROUP BY p.nombre;

-- 56. Cantidad de especies involucradas por investigador:
SELECT p.nombre AS investigador, COUNT(DISTINCT pe.id_especie) AS cantidad_especies
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
JOIN Proyecto_Especie pe ON pi.id_proyecto = pe.id_proyecto
GROUP BY p.nombre;

-- 57. Investigador con mayor cantidad de especies involucradas:
SELECT p.nombre AS investigador, COUNT(DISTINCT pe.id_especie) AS cantidad_especies
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
JOIN Proyecto_Especie pe ON pi.id_proyecto = pe.id_proyecto
GROUP BY p.nombre
ORDER BY cantidad_especies DESC
LIMIT 1;

-- 58. Cantidad de proyectos por entidad:
SELECT e.nombre AS entidad, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Entidad e
JOIN Personal p ON e.id = p.id
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
GROUP BY e.nombre;

-- 59. Entidad con mayor cantidad de proyectos:
SELECT e.nombre AS entidad, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Entidad e
JOIN Personal p ON e.id = p.id
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
GROUP BY e.nombre
ORDER BY cantidad_proyectos DESC
LIMIT 1;

-- 60. Costo total de proyectos por entidad:
SELECT e.nombre AS entidad, SUM(pi.presupuesto) AS costo_total
FROM Entidad e
JOIN Personal p ON e.id = p.id
JOIN Proyecto_Investigador pi ON p.id = pi.id_personal
JOIN Proyecto_Investigacion p ON pi.id_proyecto = p.id
GROUP BY e.nombre;

-- 61. Consultar la cantidad de visitantes por cada alojamiento.
SELECT id_alojamiento, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante_Alojamiento
GROUP BY id_alojamiento;

-- 62. Consultar el promedio de sueldos del personal por cada rol.
SELECT rol, AVG(sueldo) AS promedio_sueldo
FROM Personal
GROUP BY rol;

-- 63. Consultar la cantidad de especies por cada área.
SELECT id_area, COUNT(id_especie) AS cantidad_especies
FROM Area_Especie
GROUP BY id_area;

-- 64. Consultar el total de visitantes por cada parque.
SELECT Alojamiento.id_parque, COUNT(Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Alojamiento
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Alojamiento.id_parque;

-- 65. Consultar la cantidad de proyectos de investigación por cada especie.
SELECT id_especie, COUNT(id_proyecto) AS cantidad_proyectos
FROM Proyecto_Especie
GROUP BY id_especie;

-- 66. Consultar el total de presupuesto por cada proyecto de investigación.
SELECT id_proyecto, SUM(presupuesto) AS total_presupuesto
FROM Proyecto_Investigacion
GROUP BY id_proyecto;

-- 67. Consultar la cantidad de alojamientos por cada parque.
SELECT id_parque, COUNT(id_alojamiento) AS cantidad_alojamientos
FROM Alojamiento
GROUP BY id_parque;

-- 68. Consultar el total de visitantes por cada departamento.
SELECT Departamento_Parque.id_departamento, COUNT(Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Departamento_Parque
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Departamento_Parque.id_departamento;

-- 69. Consultar el total de especies por cada departamento.
SELECT Departamento_Parque.id_departamento, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Departamento_Parque
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Area_Especie ON Alojamiento.id_parque = Area_Especie.id_area
GROUP BY Departamento_Parque.id_departamento;

-- 70. Consultar el total de proyectos de investigación por cada departamento.
SELECT Departamento_Parque.id_departamento, COUNT(DISTINCT Proyecto_Investigacion.id_proyecto) AS total_proyectos
FROM Departamento_Parque
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Proyecto_Investigacion ON Alojamiento.id_parque = Proyecto_Investigacion.id_proyecto
GROUP BY Departamento_Parque.id_departamento;

-- 71. Consultar el total de personal por cada departamento.
SELECT Departamento_Parque.id_departamento, COUNT(DISTINCT Personal.cedula) AS total_personal
FROM Departamento_Parque
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Proyecto_Investigador ON Alojamiento.id_parque = Proyecto_Investigador.id_proyecto
JOIN Personal ON Proyecto_Investigador.id_personal = Personal.cedula
GROUP BY Departamento_Parque.id_departamento;

-- 72. Consultar el total de visitantes por cada tipo de alojamiento.
SELECT Alojamiento.categoria, COUNT(Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Alojamiento
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Alojamiento.categoria;

-- 73. Consultar el total de especies por cada tipo de área.
SELECT Area_Especie.id_area, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Area_Especie
GROUP BY Area_Especie.id_area;

-- 74. Consultar el total de proyectos de investigación por cada tipo de área.
SELECT Area_Especie.id_area, COUNT(DISTINCT Proyecto_Investigacion.id_proyecto) AS total_proyectos
FROM Area_Especie
JOIN Proyecto_Especie ON Area_Especie.id_especie = Proyecto_Especie.id_especie
JOIN Proyecto_Investigacion ON Proyecto_Especie.id_proyecto = Proyecto_Investigacion.id_proyecto
GROUP BY Area_Especie.id_area;

-- 75. Consultar el total de personal por cada tipo de área.
SELECT Area_Especie.id_area, COUNT(DISTINCT Personal.cedula) AS total_personal
FROM Area_Especie
JOIN Proyecto_Especie ON Area_Especie.id_especie = Proyecto_Especie.id_especie
JOIN Proyecto_Investigador ON Proyecto_Especie.id_proyecto = Proyecto_Investigador.id_proyecto
JOIN Personal ON Proyecto_Investigador.id_personal = Personal.cedula
GROUP BY Area_Especie.id_area;

-- 76. Consultar el total de visitantes por cada tipo de área.
SELECT Area_Especie.id_area, COUNT(DISTINCT Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Area_Especie
JOIN Alojamiento ON Area_Especie.id_area = Alojamiento.id_parque
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Area_Especie.id_area;

-- 77. Consultar el total de especies por cada tipo de alojamiento.
SELECT Alojamiento.categoria, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Alojamiento
JOIN Area_Especie ON Alojamiento.id_parque = Area_Especie.id_area
GROUP BY Alojamiento.categoria;

-- 78. Consultar el total de proyectos de investigación por cada tipo de alojamiento.
SELECT Alojamiento.categoria, COUNT(DISTINCT Proyecto_Investigacion.id_proyecto) AS total_proyectos
FROM Alojamiento
JOIN Proyecto_Investigacion ON Alojamiento.id_parque = Proyecto_Investigacion.id_proyecto
GROUP BY Alojamiento.categoria;

-- 79. Consultar el total de personal por cada tipo de alojamiento.
SELECT Alojamiento.categoria, COUNT(DISTINCT Personal.cedula) AS total_personal
FROM Alojamiento
JOIN Proyecto_Investigador ON Alojamiento.id_parque = Proyecto_Investigador.id_proyecto
JOIN Personal ON Proyecto_Investigador.id_personal = Personal.cedula
GROUP BY Alojamiento.categoria;

-- 80. Consultar el total de visitantes por cada tipo de alojamiento.
SELECT Alojamiento.categoria, COUNT(DISTINCT Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Alojamiento
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Alojamiento.categoria;

-- 81. Consultar el total de especies por cada tipo de parque.
SELECT Alojamiento.id_parque, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Alojamiento
JOIN Area_Especie ON Alojamiento.id_parque = Area_Especie.id_area
GROUP BY Alojamiento.id_parque;

-- 82. Consultar el total de proyectos de investigación por cada tipo de parque.
SELECT Alojamiento.id_parque, COUNT(DISTINCT Proyecto_Investigacion.id_proyecto) AS total_proyectos
FROM Alojamiento
JOIN Proyecto_Investigacion ON Alojamiento.id_parque = Proyecto_Investigacion.id_proyecto
GROUP BY Alojamiento.id_parque;

-- 83. Consultar el total de personal por cada tipo de parque.
SELECT Alojamiento.id_parque, COUNT(DISTINCT Personal.cedula) AS total_personal
FROM Alojamiento
JOIN Proyecto_Investigador ON Alojamiento.id_parque = Proyecto_Investigador.id_proyecto
JOIN Personal ON Proyecto_Investigador.id_personal = Personal.cedula
GROUP BY Alojamiento.id_parque;

-- 84. Consultar el total de visitantes por cada tipo de parque.
SELECT Alojamiento.id_parque, COUNT(DISTINCT Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Alojamiento
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Alojamiento.id_parque;

-- 85. Consultar el total de especies por cada tipo de departamento.
SELECT Departamento_Parque.id_departamento, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Departamento_Parque
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Area_Especie ON Alojamiento.id_parque = Area_Especie.id_area
GROUP BY Departamento_Parque.id_departamento;

-- 86. Consultar el total de proyectos de investigación por cada tipo de departamento.
SELECT Departamento_Parque.id_departamento, COUNT(DISTINCT Proyecto_Investigacion.id_proyecto) AS total_proyectos
FROM Departamento_Parque
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Proyecto_Investigacion ON Alojamiento.id_parque = Proyecto_Investigacion.id_proyecto
GROUP BY Departamento_Parque.id_departamento;

-- 87. Consultar el total de personal por cada tipo de departamento.
SELECT Departamento_Parque.id_departamento, COUNT(DISTINCT Personal.cedula) AS total_personal
FROM Departamento_Parque
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Proyecto_Investigador ON Alojamiento.id_parque = Proyecto_Investigador.id_proyecto
JOIN Personal ON Proyecto_Investigador.id_personal = Personal.cedula
GROUP BY Departamento_Parque.id_departamento;

-- 88. Consultar el total de visitantes por cada tipo de departamento.
SELECT Departamento_Parque.id_departamento, COUNT(DISTINCT Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Departamento_Parque
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Departamento_Parque.id_departamento;

-- 89. Consultar el total de especies por cada tipo de entidad.
SELECT Departamento_Entidad.id_entidad, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Departamento_Entidad
JOIN Departamento_Parque ON Departamento_Entidad.id_departamento = Departamento_Parque.id_departamento
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Area_Especie ON Alojamiento.id_parque = Area_Especie.id_area
GROUP BY Departamento_Entidad.id_entidad;

-- 90. Consultar el total de proyectos de investigación por cada tipo de entidad.
SELECT Departamento_Entidad.id_entidad, COUNT(DISTINCT Proyecto_Investigacion.id_proyecto) AS total_proyectos
FROM Departamento_Entidad
JOIN Departamento_Parque ON Departamento_Entidad.id_departamento = Departamento_Parque.id_departamento
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Proyecto_Investigacion ON Alojamiento.id_parque = Proyecto_Investigacion.id_proyecto
GROUP BY Departamento_Entidad.id_entidad;

-- 91. Consultar el total de personal por cada tipo de entidad.
SELECT Departamento_Entidad.id_entidad, COUNT(DISTINCT Personal.cedula) AS total_personal
FROM Departamento_Entidad
JOIN Departamento_Parque ON Departamento_Entidad.id_departamento = Departamento_Parque.id_departamento
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Proyecto_Investigador ON Alojamiento.id_parque = Proyecto_Investigador.id_proyecto
JOIN Personal ON Proyecto_Investigador.id_personal = Personal.cedula
GROUP BY Departamento_Entidad.id_entidad;

-- 92. Consultar el total de visitantes por cada tipo de entidad.
SELECT Departamento_Entidad.id_entidad, COUNT(DISTINCT Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Departamento_Entidad
JOIN Departamento_Parque ON Departamento_Entidad.id_departamento = Departamento_Parque.id_departamento
JOIN Alojamiento ON Departamento_Parque.id_parque = Alojamiento.id_parque
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Departamento_Entidad.id_entidad;

-- 93. Consultar el total de especies por cada tipo de proyecto.
SELECT Proyecto_Investigacion.id_proyecto, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Proyecto_Investigacion
JOIN Proyecto_Especie ON Proyecto_Investigacion.id_proyecto = Proyecto_Especie.id_proyecto
JOIN Area_Especie ON Proyecto_Especie.id_especie = Area_Especie.id_especie
GROUP BY Proyecto_Investigacion.id_proyecto;

-- 94. Consultar el total de personal por cada tipo de proyecto.
SELECT Proyecto_Investigacion.id_proyecto, COUNT(DISTINCT Personal.cedula) AS total_personal
FROM Proyecto_Investigacion
JOIN Proyecto_Investigador ON Proyecto_Investigacion.id_proyecto = Proyecto_Investigador.id_proyecto
JOIN Personal ON Proyecto_Investigador.id_personal = Personal.cedula
GROUP BY Proyecto_Investigacion.id_proyecto;

-- 95. Consultar el total de visitantes por cada tipo de proyecto.
SELECT Proyecto_Investigacion.id_proyecto, COUNT(DISTINCT Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Proyecto_Investigacion
JOIN Alojamiento ON Proyecto_Investigacion.id_proyecto = Alojamiento.id_parque
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Proyecto_Investigacion.id_proyecto;

-- 96. Consultar el total de especies por cada tipo de personal.
SELECT Personal.rol, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Personal
JOIN Proyecto_Investigador ON Personal.cedula = Proyecto_Investigador.id_personal
JOIN Proyecto_Especie ON Proyecto_Investigador.id_proyecto = Proyecto_Especie.id_proyecto
JOIN Area_Especie ON Proyecto_Especie.id_especie = Area_Especie.id_especie
GROUP BY Personal.rol;

-- 97. Consultar el total de proyectos de investigación por cada tipo de personal.
SELECT Personal.rol, COUNT(DISTINCT Proyecto_Investigacion.id_proyecto) AS total_proyectos
FROM Personal
JOIN Proyecto_Investigador ON Personal.cedula = Proyecto_Investigador.id_personal
JOIN Proyecto_Investigacion ON Proyecto_Investigador.id_proyecto = Proyecto_Investigacion.id_proyecto
GROUP BY Personal.rol;

-- 98. Consultar el total de visitantes por cada tipo de personal.
SELECT Personal.rol, COUNT(DISTINCT Visitante_Alojamiento.id_visitante) AS total_visitantes
FROM Personal
JOIN Proyecto_Investigador ON Personal.cedula = Proyecto_Investigador.id_personal
JOIN Alojamiento ON Proyecto_Investigador.id_proyecto = Alojamiento.id_parque
JOIN Visitante_Alojamiento ON Alojamiento.id_alojamiento = Visitante_Alojamiento.id_alojamiento
GROUP BY Personal.rol;

-- 99. Consultar el total de especies por cada tipo de visitante.
SELECT Visitante.profesion, COUNT(DISTINCT Area_Especie.id_especie) AS total_especies
FROM Visitante
JOIN Visitante_Alojamiento ON Visitante.cedula = Visitante_Alojamiento.id_visitante
JOIN Alojamiento ON Visitante_Alojamiento.id_alojamiento = Alojamiento.id_alojamiento
JOIN Area_Especie ON Alojamiento.id_parque = Area_Especie.id_area
GROUP BY Visitante.profesion;

-- 100. Consultar el total de proyectos de investigación por cada tipo de visitante.
SELECT Visitante.profesion, COUNT(DISTINCT Proyecto_Investigacion.id_proyecto) AS total_proyectos
FROM Visitante
JOIN Visitante_Alojamiento ON Visitante.cedula = Visitante_Alojamiento.id_visitante
JOIN Alojamiento ON Visitante_Alojamiento.id_alojamiento = Alojamiento.id_alojamiento
JOIN Proyecto_Investigacion ON Alojamiento.id_parque = Proyecto_Investigacion.id_proyecto
GROUP BY Visitante.profesion;