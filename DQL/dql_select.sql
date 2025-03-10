-- 1. Cantidad de parques por departamento
SELECT d.nombre AS departamento, COUNT(p.id_parque) AS cantidad_parques
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
GROUP BY d.nombre;

-- 2. Superficie total de parques por departamento
SELECT d.nombre AS departamento, SUM(a.superficie) AS superficie_total
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY d.nombre;

-- 3. Inventario de especies por área
SELECT a.nombre AS area, e.nombre_vulgar AS especie, ae.cantidad_inventario
FROM Area a
JOIN Area_Especie ae ON a.id_area = ae.id_area
JOIN Especie e ON ae.id_especie = e.id_especie;

-- 4. Cantidad de especies por área
SELECT a.nombre AS area, COUNT(ae.id_especie) AS cantidad_especies
FROM Area a
JOIN Area_Especie ae ON a.id_area = ae.id_area
GROUP BY a.nombre;

-- 5. Actividades del personal por tipo
SELECT rol, COUNT(id_personal) AS cantidad_personal
FROM Personal
GROUP BY rol;

-- 6. Sueldos promedio del personal por tipo
SELECT rol, AVG(sueldo) AS sueldo_promedio
FROM Personal
GROUP BY rol;

-- 7. Total de presupuesto por departamento
SELECT d.nombre AS departamento, SUM(pi.presupuesto) AS total_presupuesto
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
JOIN Area_Especie ae ON a.id_area = ae.id_area
JOIN Proyecto_Especie pe ON ae.id_especie = pe.id_especie
JOIN Proyecto_Investigacion pi ON pe.id_proyecto = pi.id_proyecto
GROUP BY d.nombre;

-- 8. Costos totales de proyectos de investigación
SELECT SUM(presupuesto) AS costo_total
FROM Proyecto_Investigacion;

-- 9. Cantidad de especies involucradas en proyectos de investigación
SELECT pr.id_proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pr
JOIN Proyecto_Especie pe ON pr.id_proyecto = pe.id_proyecto
GROUP BY pr.id_proyecto;

-- 10. Equipos de investigación por proyecto
SELECT pr.id_proyecto, COUNT(pi.id_personal) AS cantidad_investigadores
FROM Proyecto_Investigacion pr
JOIN Proyecto_Investigador pi ON pr.id_proyecto = pi.id_proyecto
GROUP BY pr.id_proyecto;

-- 11. Gestión de visitantes por parque
SELECT p.nombre AS parque, COUNT(v.id_visitante) AS cantidad_visitantes
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
JOIN Visitante_Alojamiento va ON a.id_alojamiento = va.id_alojamiento
JOIN Visitante v ON va.id_visitante = v.id_visitante
GROUP BY p.nombre;

-- 12. Ocupación de alojamientos por parque
SELECT p.nombre AS parque, COUNT(a.id_alojamiento) AS cantidad_alojamientos
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.nombre;

-- 13. Superficie promedio de áreas por parque
SELECT p.nombre AS parque, AVG(a.superficie) AS superficie_promedio
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.nombre;

-- 14. Total de visitantes por mes
SELECT MONTH(fecha_entrada) AS mes, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY MONTH(fecha_entrada);

-- 15. Total de visitantes por año
SELECT YEAR(fecha_entrada) AS año, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY YEAR(fecha_entrada);

-- 16. Especies más comunes en áreas
SELECT e.nombre_vulgar AS especie, COUNT(ae.id_area) AS cantidad_areas
FROM Especie e
JOIN Area_Especie ae ON e.id_especie = ae.id_especie
GROUP BY e.nombre_vulgar
ORDER BY cantidad_areas DESC;

-- 17. Personal con mayor sueldo
SELECT nombre, sueldo
FROM Personal
ORDER BY sueldo DESC
LIMIT 1;

-- 18. Proyectos de investigación más costosos
SELECT id_proyecto, presupuesto
FROM Proyecto_Investigacion
ORDER BY presupuesto DESC
LIMIT 5;

-- 19. Promedio de duración de proyectos de investigación
SELECT AVG(DATEDIFF(fecha_fin, fecha_inicio)) AS duracion_promedio
FROM Proyecto_Investigacion;

-- 20. Total de especies por proyecto de investigación
SELECT pr.id_proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pr
JOIN Proyecto_Especie pe ON pr.id_proyecto = pe.id_proyecto
GROUP BY pr.id_proyecto;

-- 21. Total de áreas por parque
SELECT p.nombre AS parque, COUNT(a.id_area) AS cantidad_areas
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.nombre;

-- 22. Total de especies por parque
SELECT p.nombre AS parque, COUNT(DISTINCT ae.id_especie) AS cantidad_especies
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
JOIN Area_Especie ae ON a.id_area = ae.id_area
GROUP BY p.nombre;

-- 23. Personal asignado a proyectos de investigación
SELECT p.nombre AS personal, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id_personal = pi.id_personal
GROUP BY p.nombre;

-- 24. Visitantes por profesión
SELECT profesion, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY profesion;

-- 25. Promedio de ocupación de alojamientos por parque
SELECT p.nombre AS parque, AVG(a.capacidad) AS capacidad_promedio
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.nombre;

-- 26. Cantidad de parques por departamento con más de 5 parques
SELECT d.nombre AS departamento, COUNT(p.id_parque) AS cantidad_parques
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
GROUP BY d.nombre
HAVING COUNT(p.id_parque) > 5;

-- 27. Superficie total de parques por departamento con más de 1000 hectáreas
SELECT d.nombre AS departamento, SUM(a.superficie) AS superficie_total
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY d.nombre
HAVING SUM(a.superficie) > 1000;

-- 28. Inventario de especies por área con más de 10 especies
SELECT a.nombre AS area, COUNT(ae.id_especie) AS cantidad_especies
FROM Area a
JOIN Area_Especie ae ON a.id_area = ae.id_area
GROUP BY a.nombre
HAVING COUNT(ae.id_especie) > 10;

-- 29. Especies por área ordenadas por cantidad de inventario
SELECT a.nombre AS area, e.nombre_vulgar AS especie, ae.cantidad_inventario
FROM Area a
JOIN Area_Especie ae ON a.id_area = ae.id_area
JOIN Especie e ON ae.id_especie = e.id_especie
ORDER BY ae.cantidad_inventario DESC;

-- 30. Actividades del personal por tipo con más de 5 empleados
SELECT rol, COUNT(id_personal) AS cantidad_personal
FROM Personal
GROUP BY rol
HAVING COUNT(id_personal) > 5;

-- 31. Sueldos totales del personal por tipo
SELECT rol, SUM(sueldo) AS sueldo_total
FROM Personal
GROUP BY rol;

-- 32. Cantidad de visitantes por parque y profesión:
SELECT p.nombre AS parque, v.profesion, COUNT(v.id_visitante) AS cantidad_visitantes
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
JOIN Visitante_Alojamiento va ON a.id_alojamiento = va.id_alojamiento
JOIN Visitante v ON va.id_visitante = v.id_visitante
GROUP BY p.nombre, v.profesion;

-- 33. Costos promedio de proyectos de investigación
SELECT AVG(presupuesto) AS costo_promedio
FROM Proyecto_Investigacion;

-- 34. Proyectos de investigación con más de 3 especies involucradas
SELECT pr.id_proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pr
JOIN Proyecto_Especie pe ON pr.id_proyecto = pe.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pe.id_especie) > 3;

-- 35. Equipos de investigación con más de 5 investigadores
SELECT pr.id_proyecto, COUNT(pi.id_personal) AS cantidad_investigadores
FROM Proyecto_Investigacion pr
JOIN Proyecto_Investigador pi ON pr.id_proyecto = pi.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pi.id_personal) > 5;

-- 36. Gestión de visitantes por parque con más de 100 visitantes
SELECT p.nombre AS parque, COUNT(v.id_visitante) AS cantidad_visitantes
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
JOIN Visitante_Alojamiento va ON a.id_alojamiento = va.id_alojamiento
JOIN Visitante v ON va.id_visitante = v.id_visitante
GROUP BY p.nombre
HAVING COUNT(v.id_visitante) > 100;

-- 37. Ocupación de alojamientos por parque con más de 10 alojamientos
SELECT p.nombre AS parque, COUNT(a.id_alojamiento) AS cantidad_alojamientos
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_alojamiento) > 10;

-- 38. Superficie mínima de áreas por parque
SELECT p.nombre AS parque, MIN(a.superficie) AS superficie_minima
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.nombre;

-- 39. Total de visitantes por día
SELECT fecha_entrada, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY fecha_entrada;

-- 40. Total de visitantes por semana
SELECT YEARWEEK(fecha_entrada) AS semana, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY YEARWEEK(fecha_entrada);

-- 41. Especies menos comunes en áreas
SELECT e.nombre_vulgar AS especie, COUNT(ae.id_area) AS cantidad_areas
FROM Especie e
JOIN Area_Especie ae ON e.id_especie = ae.id_especie
GROUP BY e.nombre_vulgar
ORDER BY cantidad_areas ASC;

-- 42. Personal con menor sueldo
SELECT nombre, sueldo
FROM Personal
ORDER BY sueldo ASC
LIMIT 1;

-- 43. Proyectos de investigación menos costosos
SELECT id_proyecto, presupuesto
FROM Proyecto_Investigacion
ORDER BY presupuesto ASC
LIMIT 5;

-- 44. Duración máxima de proyectos de investigación
SELECT MAX(DATEDIFF(fecha_fin, fecha_inicio)) AS duracion_maxima
FROM Proyecto_Investigacion;

-- 45. Total de especies por proyecto de investigación con más de 5 especies
SELECT pr.id_proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pr
JOIN Proyecto_Especie pe ON pr.id_proyecto = pe.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pe.id_especie) > 5;

-- 46. Total de áreas por parque con más de 3 áreas
SELECT p.nombre AS parque, COUNT(a.id_area) AS cantidad_areas
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_area) > 3;

-- 47. Total de especies por parque con más de 10 especies
SELECT p.nombre AS parque, COUNT(DISTINCT ae.id_especie) AS cantidad_especies
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
JOIN Area_Especie ae ON a.id_area = ae.id_area
GROUP BY p.nombre
HAVING COUNT(DISTINCT ae.id_especie) > 10;

-- 48. Personal asignado a más de un proyecto de investigación
SELECT p.nombre AS personal, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id_personal = pi.id_personal
GROUP BY p.nombre
HAVING COUNT(pi.id_proyecto) > 1;

-- 49. Visitantes por profesión con más de 10 visitantes
SELECT profesion, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY profesion
HAVING COUNT(id_visitante) > 10;

-- 50. Promedio de ocupación de alojamientos por parque con más de 5 alojamientos
SELECT p.nombre AS parque, AVG(a.capacidad) AS capacidad_promedio
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_alojamiento) > 5;

-- 51. Cantidad de parques por departamento con menos de 5 parques
SELECT d.nombre AS departamento, COUNT(p.id_parque) AS cantidad_parques
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
GROUP BY d.nombre
HAVING COUNT(p.id_parque) < 5;

-- 52. Superficie total de parques por departamento con menos de 1000 hectáreas
SELECT d.nombre AS departamento, SUM(a.superficie) AS superficie_total
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY d.nombre
HAVING SUM(a.superficie) < 1000;

-- 53. Inventario de especies por área con menos de 10 especies
SELECT a.nombre AS area, COUNT(ae.id_especie) AS cantidad_especies
FROM Area a
JOIN Area_Especie ae ON a.id_area = ae.id_area
GROUP BY a.nombre
HAVING COUNT(ae.id_especie) < 10;

-- 54. Especies por área ordenadas por cantidad de inventario ascendente
SELECT a.nombre AS area, e.nombre_vulgar AS especie, ae.cantidad_inventario
FROM Area a
JOIN Area_Especie ae ON a.id_area = ae.id_area
JOIN Especie e ON ae.id_especie = e.id_especie
ORDER BY ae.cantidad_inventario ASC;

-- 55. Actividades del personal por tipo con menos de 5 empleados
SELECT rol, COUNT(id_personal) AS cantidad_personal
FROM Personal
GROUP BY rol
HAVING COUNT(id_personal) < 5;

-- 56. Sueldos mínimos del personal por tipo
SELECT rol, MIN(sueldo) AS sueldo_minimo
FROM Personal
GROUP BY rol;

-- 57. Promedio de sueldo del personal por departamento
SELECT d.nombre AS departamento, AVG(pers.sueldo) AS sueldo_promedio
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
JOIN Proyecto_Investigacion pi ON a.id_area = pi.id_proyecto
JOIN Proyecto_Investigador pr ON pi.id_proyecto = pr.id_proyecto
JOIN Personal pers ON pr.id_personal = pers.id_personal
GROUP BY d.nombre;

-- 58. Costos máximos de proyectos de investigación
SELECT MAX(presupuesto) AS costo_maximo
FROM Proyecto_Investigacion;

-- 59. Proyectos de investigación con menos de 3 especies involucradas
SELECT pr.id_proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pr
JOIN Proyecto_Especie pe ON pr.id_proyecto = pe.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pe.id_especie) < 3;

-- 60. Equipos de investigación con menos de 5 investigadores
SELECT pr.id_proyecto, COUNT(pi.id_personal) AS cantidad_investigadores
FROM Proyecto_Investigacion pr
JOIN Proyecto_Investigador pi ON pr.id_proyecto = pi.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pi.id_personal) < 5;

-- 61. Gestión de visitantes por parque con menos de 100 visitantes
SELECT p.nombre AS parque, COUNT(v.id_visitante) AS cantidad_visitantes
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
JOIN Visitante_Alojamiento va ON a.id_alojamiento = va.id_alojamiento
JOIN Visitante v ON va.id_visitante = v.id_visitante
GROUP BY p.nombre
HAVING COUNT(v.id_visitante) < 100;

-- 62. Ocupación de alojamientos por parque con menos de 10 alojamientos
SELECT p.nombre AS parque, COUNT(a.id_alojamiento) AS cantidad_alojamientos
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_alojamiento) < 10;

-- 63. Superficie máxima de áreas por parque
SELECT p.nombre AS parque, MAX(a.superficie) AS superficie_maxima
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.nombre;

-- 64. Total de visitantes por día de la semana
SELECT DAYOFWEEK(fecha_entrada) AS dia_semana, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY DAYOFWEEK(fecha_entrada);

-- 65. Total de visitantes por trimestre
SELECT QUARTER(fecha_entrada) AS trimestre, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY QUARTER(fecha_entrada);

-- 66. Especies más raras en áreas
SELECT e.nombre_vulgar AS especie, COUNT(ae.id_area) AS cantidad_areas
FROM Especie e
JOIN Area_Especie ae ON e.id_especie = ae.id_especie
GROUP BY e.nombre_vulgar
ORDER BY cantidad_areas ASC
LIMIT 5;

-- 67. Personal con sueldos entre 2000 y 5000
SELECT nombre, sueldo
FROM Personal
WHERE sueldo BETWEEN 2000 AND 5000;

-- 68. Proyectos de investigación con duración menor a 6 meses
SELECT id_proyecto, DATEDIFF(fecha_fin, fecha_inicio) AS duracion_dias
FROM Proyecto_Investigacion
WHERE DATEDIFF(fecha_fin, fecha_inicio) < 180;

-- 69. Duración mínima de proyectos de investigación
SELECT MIN(DATEDIFF(fecha_fin, fecha_inicio)) AS duracion_minima
FROM Proyecto_Investigacion;

-- 70. Total de especies por proyecto de investigación con menos de 5 especies
SELECT pr.id_proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pr
JOIN Proyecto_Especie pe ON pr.id_proyecto = pe.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pe.id_especie) < 5;

-- 71. Total de áreas por parque con menos de 3 áreas
SELECT p.nombre AS parque, COUNT(a.id_area) AS cantidad_areas
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_area) < 3;

-- 72. Total de especies por parque con menos de 10 especies
SELECT p.nombre AS parque, COUNT(DISTINCT ae.id_especie) AS cantidad_especies
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
JOIN Area_Especie ae ON a.id_area = ae.id_area
GROUP BY p.nombre
HAVING COUNT(DISTINCT ae.id_especie) < 10;

-- 73. Personal asignado a solo un proyecto de investigación
SELECT p.nombre AS personal, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id_personal = pi.id_personal
GROUP BY p.nombre
HAVING COUNT(pi.id_proyecto) = 1;

-- 74. Visitantes por profesión con menos de 10 visitantes
SELECT profesion, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY profesion
HAVING COUNT(id_visitante) < 10;

-- 75. Promedio de ocupación de alojamientos por parque con menos de 5 alojamientos
SELECT p.nombre AS parque, AVG(a.capacidad) AS capacidad_promedio
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_alojamiento) < 5;

-- 76. Cantidad de parques por departamento con más de 10 parques
SELECT d.nombre AS departamento, COUNT(p.id_parque) AS cantidad_parques
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
GROUP BY d.nombre
HAVING COUNT(p.id_parque) > 10;

-- 77. Superficie total de parques por departamento con más de 2000 hectáreas
SELECT d.nombre AS departamento, SUM(a.superficie) AS superficie_total
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY d.nombre
HAVING SUM(a.superficie) > 2000;

-- 78. Inventario de especies por área con más de 20 especies
SELECT a.nombre AS area, COUNT(ae.id_especie) AS cantidad_especies
FROM Area a
JOIN Area_Especie ae ON a.id_area = ae.id_area
GROUP BY a.nombre
HAVING COUNT(ae.id_especie) > 20;

-- 79. Especies por área ordenadas por cantidad de inventario descendente
SELECT a.nombre AS area, e.nombre_vulgar AS especie, ae.cantidad_inventario
FROM Area a
JOIN Area_Especie ae ON a.id_area = ae.id_area
JOIN Especie e ON ae.id_especie = e.id_especie
ORDER BY ae.cantidad_inventario DESC;

-- 80. Actividades del personal por tipo con más de 10 empleados
SELECT rol, COUNT(id_personal) AS cantidad_personal
FROM Personal
GROUP BY rol
HAVING COUNT(id_personal) > 10;

-- 81. Sueldos máximos del personal por tipo
SELECT rol, MAX(sueldo) AS sueldo_maximo
FROM Personal
GROUP BY rol;

-- 82. Total de visitantes por parque y mes:
SELECT p.nombre AS parque, MONTH(v.fecha_entrada) AS mes, COUNT(v.id_visitante) AS cantidad_visitantes
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
JOIN Visitante_Alojamiento va ON a.id_alojamiento = va.id_alojamiento
JOIN Visitante v ON va.id_visitante = v.id_visitante
GROUP BY p.nombre, MONTH(v.fecha_entrada);

-- 83. Costos mínimos de proyectos de investigación
SELECT MIN(presupuesto) AS costo_minimo
FROM Proyecto_Investigacion;

-- 84. Proyectos de investigación con más de 5 especies involucradas
SELECT pr.id_proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pr
JOIN Proyecto_Especie pe ON pr.id_proyecto = pe.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pe.id_especie) > 5;

-- 85. Equipos de investigación con más de 10 investigadores
SELECT pr.id_proyecto, COUNT(pi.id_personal) AS cantidad_investigadores
FROM Proyecto_Investigacion pr
JOIN Proyecto_Investigador pi ON pr.id_proyecto = pi.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pi.id_personal) > 10;

-- 86. Gestión de visitantes por parque con más de 200 visitantes
SELECT p.nombre AS parque, COUNT(v.id_visitante) AS cantidad_visitantes
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
JOIN Visitante_Alojamiento va ON a.id_alojamiento = va.id_alojamiento
JOIN Visitante v ON va.id_visitante = v.id_visitante
GROUP BY p.nombre
HAVING COUNT(v.id_visitante) > 200;

-- 87. Ocupación de alojamientos por parque con más de 20 alojamientos
SELECT p.nombre AS parque, COUNT(a.id_alojamiento) AS cantidad_alojamientos
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_alojamiento) > 20;

-- 88. Superficie promedio de áreas por parque con más de 5 áreas
SELECT p.nombre AS parque, AVG(a.superficie) AS superficie_promedio
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_area) > 5;

-- 89. Total de visitantes por día del mes
SELECT DAY(fecha_entrada) AS dia_mes, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY DAY(fecha_entrada);

-- 90. Total de visitantes por semestre
SELECT IF(MONTH(fecha_entrada) <= 6, 'Primer Semestre', 'Segundo Semestre') AS semestre, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY semestre;

-- 91. Especies más comunes en áreas con más de 5 áreas
SELECT e.nombre_vulgar AS especie, COUNT(ae.id_area) AS cantidad_areas
FROM Especie e
JOIN Area_Especie ae ON e.id_especie = ae.id_especie
GROUP BY e.nombre_vulgar
HAVING COUNT(ae.id_area) > 5
ORDER BY cantidad_areas DESC;

-- 92. Personal con sueldos mayores a 5000
SELECT nombre, sueldo
FROM Personal
WHERE sueldo > 5000;

-- 93. Proyectos de investigación con duración mayor a 1 año
SELECT id_proyecto, DATEDIFF(fecha_fin, fecha_inicio) AS duracion_dias
FROM Proyecto_Investigacion
WHERE DATEDIFF(fecha_fin, fecha_inicio) > 365;

-- 94. Total de proyectos de investigación por parque:
SELECT p.nombre AS parque, COUNT(DISTINCT pi.id_proyecto) AS cantidad_proyectos
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
JOIN Area_Especie ae ON a.id_area = ae.id_area
JOIN Proyecto_Especie pe ON ae.id_especie = pe.id_especie
JOIN Proyecto_Investigacion pi ON pe.id_proyecto = pi.id_proyecto
GROUP BY p.nombre;

-- 95. Total de especies por proyecto de investigación con más de 10 especies
SELECT pr.id_proyecto, COUNT(pe.id_especie) AS cantidad_especies
FROM Proyecto_Investigacion pr
JOIN Proyecto_Especie pe ON pr.id_proyecto = pe.id_proyecto
GROUP BY pr.id_proyecto
HAVING COUNT(pe.id_especie) > 10;

-- 96. Total de áreas por parque con más de 5 áreas
SELECT p.nombre AS parque, COUNT(a.id_area) AS cantidad_areas
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_area) > 5;

-- 97. Total de especies por parque con más de 20 especies
SELECT p.nombre AS parque, COUNT(DISTINCT ae.id_especie) AS cantidad_especies
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
JOIN Area_Especie ae ON a.id_area = ae.id_area
GROUP BY p.nombre
HAVING COUNT(DISTINCT ae.id_especie) > 20;

-- 98. Personal asignado a más de dos proyectos de investigación
SELECT p.nombre AS personal, COUNT(pi.id_proyecto) AS cantidad_proyectos
FROM Personal p
JOIN Proyecto_Investigador pi ON p.id_personal = pi.id_personal
GROUP BY p.nombre
HAVING COUNT(pi.id_proyecto) > 2;

-- 99. Visitantes por profesión con más de 20 visitantes
SELECT profesion, COUNT(id_visitante) AS cantidad_visitantes
FROM Visitante
GROUP BY profesion
HAVING COUNT(id_visitante) > 20;

-- 100. Promedio de ocupación de alojamientos por parque con más de 10 alojamientos
SELECT p.nombre AS parque, AVG(a.capacidad) AS capacidad_promedio
FROM Parque p
JOIN Alojamiento a ON p.id_parque = a.id_parque
GROUP BY p.nombre
HAVING COUNT(a.id_alojamiento) > 10;

-- Hecho por: Ytzhak Carvajal