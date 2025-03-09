-- Procedimiento 1: Obtener cantidad de parques por departamento
DELIMITER $$
CREATE PROCEDURE ObtenerCantidadParquesPorDepartamento()
BEGIN
    SELECT d.nombre AS departamento, COUNT(p.id) AS cantidad_parques
    FROM Departamento d
    JOIN Parque p ON d.id = p.id_departamento
    GROUP BY d.nombre;
END $$
DELIMITER;

-- Procedimiento 2: Obtener superficie total de parques por departamento
DELIMITER $$
CREATE PROCEDURE ObtenerSuperficieParquesPorDepartamento()
BEGIN
    SELECT d.nombre AS departamento, SUM(a.superficie) AS superficie_total
    FROM Departamento d
    JOIN Parque p ON d.id = p.id_departamento
    JOIN Area a ON p.id = a.id_parque
    GROUP BY d.nombre;
END $$
DELIMITER;

-- Procedimiento 3: Obtener cantidad de especies por parque
DELIMITER $$
CREATE PROCEDURE ObtenerEspeciesPorParque()
BEGIN
    SELECT p.nombre AS parque, COUNT(e.id) AS cantidad_especies
    FROM Parque p
    JOIN Especie_Parque ep ON p.id = ep.id_parque
    JOIN Especie e ON ep.id_especie = e.id
    GROUP BY p.nombre;
END $$
DELIMITER;

-- Procedimiento 4: Obtener salario promedio por tipo de personal
DELIMITER $$
CREATE PROCEDURE ObtenerSalarioPromedioPorRol()
BEGIN
    SELECT rol, AVG(sueldo) AS salario_promedio
    FROM Personal
    GROUP BY rol;
END $$
DELIMITER;

-- Procedimiento 5: Obtener cantidad de visitantes por parque
DELIMITER $$
CREATE PROCEDURE ObtenerVisitantesPorParque()
BEGIN
    SELECT p.nombre AS parque, COUNT(v.id) AS cantidad_visitantes
    FROM Parque p
    JOIN Visitante_Parque vp ON p.id = vp.id_parque
    JOIN Visitante v ON vp.id_visitante = v.id
    GROUP BY p.nombre;
END $$
DELIMITER;

-- Procedimiento 6: Obtener la ocupación total de alojamientos por categoría
DELIMITER $$
CREATE PROCEDURE ObtenerOcupacionAlojamientos()
BEGIN
    SELECT categoria, SUM(capacidad) AS ocupacion_total
    FROM Alojamiento
    GROUP BY categoria;
END $$
DELIMITER;

-- Procedimiento 7: Obtener la inversión total en proyectos de investigación
DELIMITER $$
CREATE PROCEDURE ObtenerInversionProyectos()
BEGIN
    SELECT SUM(presupuesto) AS inversion_total FROM Proyecto_Investigacion;
END $$
DELIMITER;

-- Procedimiento 8: Obtener la cantidad de proyectos de investigación por año
DELIMITER $$
CREATE PROCEDURE ObtenerProyectosPorAnio()
BEGIN
    SELECT YEAR(fecha_inicio) AS anio, COUNT(id) AS cantidad_proyectos
    FROM Proyecto_Investigacion
    GROUP BY anio;
END $$
DELIMITER;

-- Procedimiento 9: Obtener el salario total del personal por área asignada
DELIMITER $$
CREATE PROCEDURE ObtenerSalarioTotalPorArea()
BEGIN
    SELECT area_asignada, SUM(sueldo) AS salario_total
    FROM Personal
    GROUP BY area_asignada;
END $$
DELIMITER;

-- Procedimiento 10: Obtener la cantidad de empleados por rol
DELIMITER $$
CREATE PROCEDURE ObtenerEmpleadosPorRol()
BEGIN
    SELECT rol, COUNT(id) AS cantidad_empleados
    FROM Personal
    GROUP BY rol;
END $$
DELIMITER;

