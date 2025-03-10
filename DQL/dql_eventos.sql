DELIMITER //

-- Evento 1: Limpiar registros antiguos de visitantes
CREATE EVENT CleanOldVisitantes
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM Visitante WHERE fecha_salida < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

-- Evento 2: Actualizar presupuesto de proyectos
CREATE EVENT UpdatePresupuestoProyectos
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    UPDATE Proyecto_Investigacion SET presupuesto = presupuesto * 1.05;
END //

-- Evento 3: Generar reporte mensual de visitantes
CREATE EVENT GenerateMonthlyVisitanteReport
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    INSERT INTO Reporte_Visitantes (mes, total_visitantes)
    SELECT MONTH(CURDATE()), COUNT(*) FROM Visitante WHERE MONTH(fecha_entrada) = MONTH(CURDATE());
END //

-- Evento 4: Limpiar registros antiguos de alojamientos
CREATE EVENT CleanOldAlojamientos
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM Alojamiento WHERE fecha_salida < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

-- Evento 5: Actualizar inventario de especies
CREATE EVENT UpdateInventarioEspecies
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    UPDATE Area_Especie SET cantidad_inventario = cantidad_inventario * 1.02;
END //

-- Evento 6: Generar reporte anual de proyectos
CREATE EVENT GenerateAnnualProjectReport
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    INSERT INTO Reporte_Proyectos (año, total_proyectos)
    SELECT YEAR(CURDATE()), COUNT(*) FROM Proyecto_Investigacion WHERE YEAR(fecha_inicio) = YEAR(CURDATE());
END //

-- Evento 7: Limpiar registros antiguos de personal
CREATE EVENT CleanOldPersonal
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM Personal WHERE fecha_salida < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

-- Evento 8: Actualizar sueldo de personal
CREATE EVENT UpdateSueldoPersonal
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    UPDATE Personal SET sueldo = sueldo * 1.03;
END //

-- Evento 9: Generar reporte mensual de especies
CREATE EVENT GenerateMonthlyEspecieReport
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    INSERT INTO Reporte_Especies (mes, total_especies)
    SELECT MONTH(CURDATE()), COUNT(*) FROM Especie WHERE MONTH(fecha_ingreso) = MONTH(CURDATE());
END //

-- Evento 10: Limpiar registros antiguos de vehículos
CREATE EVENT CleanOldVehiculos
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM Vehiculo WHERE fecha_salida < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

-- Evento 11: Actualizar inventario de áreas
CREATE EVENT UpdateInventarioAreas
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    UPDATE Area SET superficie = superficie * 1.01;
END //

-- Evento 12: Generar reporte anual de visitantes
CREATE EVENT GenerateAnnualVisitanteReport
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    INSERT INTO Reporte_Visitantes (año, total_visitantes)
    SELECT YEAR(CURDATE()), COUNT(*) FROM Visitante WHERE YEAR(fecha_entrada) = YEAR(CURDATE());
END //

-- Evento 13: Limpiar registros antiguos de proyectos
CREATE EVENT CleanOldProyectos
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM Proyecto_Investigacion WHERE fecha_fin < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

-- Evento 14: Actualizar presupuesto de áreas
CREATE EVENT UpdatePresupuestoAreas
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    UPDATE Area SET superficie = superficie * 1.02;
END //

-- Evento 15: Generar reporte mensual de personal
CREATE EVENT GenerateMonthlyPersonalReport
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    INSERT INTO Reporte_Personal (mes, total_personal)
    SELECT MONTH(CURDATE()), COUNT(*) FROM Personal WHERE MONTH(fecha_ingreso) = MONTH(CURDATE());
END //

-- Evento 16: Limpiar registros antiguos de especies
CREATE EVENT CleanOldEspecies
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM Especie WHERE fecha_salida < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

-- Evento 17: Actualizar inventario de visitantes
CREATE EVENT UpdateInventarioVisitantes
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    UPDATE Visitante SET direccion = CONCAT(direccion, ' - Actualizado');
END //

-- Evento 18: Generar reporte anual de áreas
CREATE EVENT GenerateAnnualAreaReport
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    INSERT INTO Reporte_Areas (año, total_areas)
    SELECT YEAR(CURDATE()), COUNT(*) FROM Area WHERE YEAR(fecha_ingreso) = YEAR(CURDATE());
END //

-- Evento 19: Limpiar registros antiguos de entidades
CREATE EVENT CleanOldEntidades
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM Entidad WHERE fecha_salida < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END //

-- Evento 20: Actualizar presupuesto de entidades
CREATE EVENT UpdatePresupuestoEntidades
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    UPDATE Entidad SET nombre = CONCAT(nombre, ' - Actualizado');
END //

DELIMITER ;

-- Hecho por: Ytzhak Carvajal