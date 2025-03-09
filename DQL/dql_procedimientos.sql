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

-- Procedimiento 13: Agregar una relación entre área y especie
CREATE PROCEDURE AddAreaEspecie(IN id_area INT, IN id_especie INT, IN cantidad_inventario INT)
BEGIN
    INSERT INTO Area_Especie (id_area, id_especie, cantidad_inventario) VALUES (id_area, id_especie, cantidad_inventario);
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

-- Procedimiento 19: Eliminar un departamento
CREATE PROCEDURE DeleteDepartamento(IN id_departamento INT)
BEGIN
    DELETE FROM Departamento WHERE id_departamento = id_departamento;
END //

-- Procedimiento 20: Eliminar una entidad
CREATE PROCEDURE DeleteEntidad(IN id_entidad INT)
BEGIN
    DELETE FROM Entidad WHERE id_entidad = id_entidad;
END //

DELIMITER ;

-- Procedimiento 1
CALL AddDepartamento('Nuevo Departamento');

-- Procedimiento 2
CALL AddEntidad('Nueva Entidad');

-- Procedimiento 3
CALL AddParque('Nuevo Parque', '2025-03-09');

-- Procedimiento 4
CALL AddArea(1, 'Nueva Área', 100.00);

-- Procedimiento 5
CALL AddEspecie('Nuevo Nombre Científico', 'Nuevo Nombre Vulgar');

-- Procedimiento 6
CALL AddPersonal('1234567890', 'Nuevo Personal', 'Nueva Dirección', '1234567', '987654321', 2000.00, 'Gestión');

-- Procedimiento 7
CALL AddVehiculo('Nuevo Tipo', 'Nueva Marca');

-- Procedimiento 8
CALL AddProyectoInvestigacion(100000.00, '2025-03-09', '2025-09-09');

-- Procedimiento 9
CALL AddVisitante('1234567890', 'Nuevo Visitante', 'Nueva Dirección', 'Nueva Profesión', '2025-03-09', '2025-03-10');

-- Procedimiento 10
CALL AddAlojamiento(1, 10, 'Nueva Categoría', '2025-03-09', '2025-03-10');

-- Procedimiento 11
CALL AddDepartamentoParque(1, 1);

-- Procedimiento 12
CALL AddDepartamentoEntidad(1, 1);

-- Procedimiento 13
CALL AddAreaEspecie(1, 1, 10);

-- Procedimiento 14
CALL AddProyectoInvestigador(1, 1);

-- Procedimiento 15
CALL AddProyectoEspecie(1, 1);

-- Procedimiento 16
CALL AddVisitanteAlojamiento(1, 1);

-- Procedimiento 17
CALL UpdateDepartamento(1, 'Departamento Actualizado');

-- Procedimiento 18
CALL UpdateEntidad(1, 'Entidad Actualizada');

-- Procedimiento 19
CALL UpdateParque(1, 'Parque Actualizado', '2025-03-09');

-- Procedimiento 20
CALL UpdateArea(1, 1, 'Área Actualizada', 200.00);