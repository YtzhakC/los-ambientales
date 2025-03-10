USE ambientalistas;

DELIMITER //

-- Procedimiento 1: Agregar un departamento
CREATE PROCEDURE AddDepartamento(IN nombre VARCHAR(100))
BEGIN
    INSERT INTO Departamento (nombre) VALUES (nombre);
END //

-- Procedimiento 2: Agregar una entidad
CREATE PROCEDURE AddEntidad(IN nombre VARCHAR(100))
BEGIN
    INSERT INTO Entidad (nombre) VALUES (nombre);
END //

-- Procedimiento 3: Agregar un parque
CREATE PROCEDURE AddParque(IN nombre VARCHAR(100), IN fecha_declaracion DATE)
BEGIN
    INSERT INTO Parque (nombre, fecha_declaracion) VALUES (nombre, fecha_declaracion);
END //

-- Procedimiento 4: Agregar un área
CREATE PROCEDURE AddArea(IN id_parque INT, IN nombre VARCHAR(100), IN superficie DECIMAL(10,2))
BEGIN
    INSERT INTO Area (id_parque, nombre, superficie) VALUES (id_parque, nombre, superficie);
END //

-- Procedimiento 5: Agregar una especie
CREATE PROCEDURE AddEspecie(IN nombre_cientifico VARCHAR(100), IN nombre_vulgar VARCHAR(100))
BEGIN
    INSERT INTO Especie (nombre_cientifico, nombre_vulgar) VALUES (nombre_cientifico, nombre_vulgar);
END //

-- Procedimiento 6: Agregar personal
CREATE PROCEDURE AddPersonal(IN cedula VARCHAR(20), IN nombre VARCHAR(100), IN direccion VARCHAR(255), IN telefono VARCHAR(20), IN movil VARCHAR(20), IN sueldo DECIMAL(10,2), IN rol ENUM('Gestión', 'Vigilancia', 'Conservación', 'Investigación'))
BEGIN
    INSERT INTO Personal (cedula, nombre, direccion, telefono, movil, sueldo, rol) VALUES (cedula, nombre, direccion, telefono, movil, sueldo, rol);
END //

-- Procedimiento 7: Agregar un vehículo
CREATE PROCEDURE AddVehiculo(IN tipo VARCHAR(50), IN marca VARCHAR(50))
BEGIN
    INSERT INTO Vehiculo (tipo, marca) VALUES (tipo, marca);
END //

-- Procedimiento 8: Agregar un proyecto de investigación
CREATE PROCEDURE AddProyectoInvestigacion(IN presupuesto DECIMAL(12,2), IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    INSERT INTO Proyecto_Investigacion (presupuesto, fecha_inicio, fecha_fin) VALUES (presupuesto, fecha_inicio, fecha_fin);
END //

-- Procedimiento 9: Agregar un visitante
CREATE PROCEDURE AddVisitante(IN cedula VARCHAR(20), IN nombre VARCHAR(100), IN direccion VARCHAR(255), IN profesion VARCHAR(100), IN fecha_entrada DATE, IN fecha_salida DATE)
BEGIN
    INSERT INTO Visitante (cedula, nombre, direccion, profesion, fecha_entrada, fecha_salida) VALUES (cedula, nombre, direccion, profesion, fecha_entrada, fecha_salida);
END //

-- Procedimiento 10: Agregar un alojamiento
CREATE PROCEDURE AddAlojamiento(IN id_parque INT, IN capacidad INT, IN categoria VARCHAR(50), IN fecha_ingreso DATE, IN fecha_salida DATE)
BEGIN
    INSERT INTO Alojamiento (id_parque, capacidad, categoria, fecha_ingreso, fecha_salida) VALUES (id_parque, capacidad, categoria, fecha_ingreso, fecha_salida);
END //

-- Procedimiento 11: Agregar una relación entre departamento y parque
CREATE PROCEDURE AddDepartamentoParque(IN id_departamento INT, IN id_parque INT)
BEGIN
    INSERT INTO Departamento_Parque (id_departamento, id_parque) VALUES (id_departamento, id_parque);
END //

-- Procedimiento 12: Agregar una relación entre departamento y entidad
CREATE PROCEDURE AddDepartamentoEntidad(IN id_departamento INT, IN id_entidad INT)
BEGIN
    INSERT INTO Departamento_Entidad (id_departamento, id_entidad) VALUES (id_departamento, id_entidad);
END //

-- Procedimiento 13: Actualizar la capacidad de un alojamiento
CREATE PROCEDURE UpdateAlojamientoCapacidad(IN id_alojamiento INT, IN nueva_capacidad INT)
BEGIN
    UPDATE Alojamiento SET capacidad = nueva_capacidad WHERE id_alojamiento = id_alojamiento;
END //

-- Procedimiento 14: Agregar una relación entre proyecto de investigación e investigador
CREATE PROCEDURE AddProyectoInvestigador(IN id_proyecto INT, IN id_personal INT)
BEGIN
    INSERT INTO Proyecto_Investigador (id_proyecto, id_personal) VALUES (id_proyecto, id_personal);
END //

-- Procedimiento 15: Agregar una relación entre proyecto de investigación y especie
CREATE PROCEDURE AddProyectoEspecie(IN id_proyecto INT, IN id_especie INT)
BEGIN
    INSERT INTO Proyecto_Especie (id_proyecto, id_especie) VALUES (id_proyecto, id_especie);
END //

-- Procedimiento 16: Agregar una relación entre visitante y alojamiento
CREATE PROCEDURE AddVisitanteAlojamiento(IN id_visitante INT, IN id_alojamiento INT)
BEGIN
    INSERT INTO Visitante_Alojamiento (id_visitante, id_alojamiento) VALUES (id_visitante, id_alojamiento);
END //

-- Procedimiento 17: Actualizar el nombre de un departamento
CREATE PROCEDURE UpdateDepartamentoNombre(IN id_departamento INT, IN nuevo_nombre VARCHAR(100))
BEGIN
    UPDATE Departamento SET nombre = nuevo_nombre WHERE id_departamento = id_departamento;
END //

-- Procedimiento 18: Actualizar el nombre de una entidad
CREATE PROCEDURE UpdateEntidadNombre(IN id_entidad INT, IN nuevo_nombre VARCHAR(100))
BEGIN
    UPDATE Entidad SET nombre = nuevo_nombre WHERE id_entidad = id_entidad;
END //

-- Procedimiento 19: Eliminar un departamento y sus dependencias
CREATE PROCEDURE DeleteDepartamento(IN id_departamento INT)
BEGIN
    -- Eliminar filas dependientes en la tabla Departamento_Entidad
    DELETE FROM Departamento_Entidad WHERE id_departamento = id_departamento;
    
    -- Eliminar filas dependientes en la tabla Departamento_Parque
    DELETE FROM Departamento_Parque WHERE id_departamento = id_departamento;
    
    -- Eliminar filas dependientes en la tabla Auditoria_Departamento
    DELETE FROM Auditoria_Departamento WHERE id_departamento = id_departamento;
    
    -- Eliminar el departamento
    DELETE FROM Departamento WHERE id_departamento = id_departamento;
END //


-- Procedimiento 20: Eliminar una entidad
CREATE PROCEDURE DeleteEntidad(IN id_entidad INT)
BEGIN
    DELETE FROM Entidad WHERE id_entidad = id_entidad;
END //

DELIMITER ;

-- 1. Llamada al procedimiento AddDepartamento
CALL AddDepartamento('Departamento Ejemplo');

-- 2. Llamada al procedimiento AddEntidad
CALL AddEntidad('Entidad Ejemplo');

-- 3. Llamada al procedimiento AddParque
CALL AddParque('Parque Ejemplo', '2025-03-09');

-- 4. Llamada al procedimiento AddArea
CALL AddArea(1, 'Area Ejemplo', 123.45);

-- 5. Llamada al procedimiento AddEspecie
CALL AddEspecie('Especie Cientifica Ejemplo', 'Especie Vulgar Ejemplo');

-- 6. Llamada al procedimiento AddPersonal
CALL AddPersonal('12345678', 'Nombre Ejemplo', 'Direccion Ejemplo', '123456789', '987654321', 1500.00, 'Investigación');

-- 7. Llamada al procedimiento AddVehiculo
CALL AddVehiculo('Tipo Ejemplo', 'Marca Ejemplo');

-- 8. Llamada al procedimiento AddProyectoInvestigacion
CALL AddProyectoInvestigacion(10000.00, '2025-01-01', '2025-12-31');

-- 9. Llamada al procedimiento AddVisitante
CALL AddVisitante('87654321', 'Visitante Ejemplo', 'Direccion Ejemplo', 'Profesion Ejemplo', '2025-03-01', '2025-03-10');

-- 10. Llamada al procedimiento AddAlojamiento
CALL AddAlojamiento(1, 4, 'Categoria Ejemplo', '2025-03-01', '2025-03-10');

-- 11. Llamada al procedimiento AddDepartamentoParque
CALL AddDepartamentoParque(1, 1);

-- 12. Llamada al procedimiento AddDepartamentoEntidad
CALL AddDepartamentoEntidad(1, 1);

-- 13. Llamada al procedimiento UpdateAlojamientoCapacidad
CALL UpdateAlojamientoCapacidad(1, 50);

-- 14. Llamada al procedimiento AddProyectoInvestigador
CALL AddProyectoInvestigador(50, 1);

-- 15. Llamada al procedimiento AddProyectoEspecie
CALL AddProyectoEspecie(50, 1);

-- 16. Llamada al procedimiento AddVisitanteAlojamiento
CALL AddVisitanteAlojamiento(10, 1);

-- 17. Llamada al procedimiento UpdateDepartamentoNombre
CALL UpdateDepartamentoNombre(1, 'Nuevo Nombre Departamento');

-- 18. Llamada al procedimiento UpdateEntidadNombre
CALL UpdateEntidadNombre(1, 'Nuevo Nombre Entidad');

-- 19. Llamada al procedimiento DeleteDepartamento
CALL DeleteDepartamento(1);

-- 20. Llamada al procedimiento DeleteEntidad
CALL DeleteEntidad(1);

-- Hecho por: Ytzhak Carvajal