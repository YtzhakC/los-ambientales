DELIMITER //

-- Trigger 1: Actualizar la fecha de modificación en la tabla Parque cuando se actualiza un registro
CREATE TRIGGER trg_update_parque_modificacion
BEFORE UPDATE ON Parque
FOR EACH ROW
BEGIN
    SET NEW.fecha_declaracion = NOW();
END //

-- Trigger 2: Registrar la eliminación de un visitante en una tabla de auditoría
CREATE TRIGGER trg_delete_visitante_auditoria
AFTER DELETE ON Visitante
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Visitante (id_visitante, accion, fecha) VALUES (OLD.id_visitante, 'DELETE', NOW());
END //

-- Trigger 3: Evitar la eliminación de un parque si tiene áreas asociadas
CREATE TRIGGER trg_prevent_delete_parque
BEFORE DELETE ON Parque
FOR EACH ROW
BEGIN
    DECLARE area_count INT;
    SELECT COUNT(*) INTO area_count FROM Area WHERE id_parque = OLD.id_parque;
    IF area_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar el parque porque tiene áreas asociadas';
    END IF;
END //

-- Trigger 4: Actualizar el presupuesto total de un proyecto de investigación al insertar un nuevo investigador
CREATE TRIGGER trg_insert_proyecto_investigador
AFTER INSERT ON Proyecto_Investigador
FOR EACH ROW
BEGIN
    UPDATE Proyecto_Investigacion SET presupuesto = presupuesto + 1000 WHERE id_proyecto = NEW.id_proyecto;
END //

-- Trigger 5: Registrar la inserción de un nuevo personal en una tabla de auditoría
CREATE TRIGGER trg_insert_personal_auditoria
AFTER INSERT ON Personal
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Personal (id_personal, accion, fecha) VALUES (NEW.id_personal, 'INSERT', NOW());
END //

-- Trigger 6: Evitar la inserción de un visitante con una cédula duplicada
CREATE TRIGGER trg_prevent_duplicate_visitante
BEFORE INSERT ON Visitante
FOR EACH ROW
BEGIN
    DECLARE cedula_count INT;
    SELECT COUNT(*) INTO cedula_count FROM Visitante WHERE cedula = NEW.cedula;
    IF cedula_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cédula del visitante ya existe';
    END IF;
END //

-- Trigger 7: Actualizar la capacidad disponible de un alojamiento al insertar un nuevo visitante
CREATE TRIGGER trg_insert_visitante_alojamiento
AFTER INSERT ON Visitante_Alojamiento
FOR EACH ROW
BEGIN
    UPDATE Alojamiento SET capacidad = capacidad - 1 WHERE id_alojamiento = NEW.id_alojamiento;
END //

-- Trigger 8: Registrar la actualización de un vehículo en una tabla de auditoría
CREATE TRIGGER trg_update_vehiculo_auditoria
AFTER UPDATE ON Vehiculo
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Vehiculo (id_vehiculo, accion, fecha) VALUES (NEW.id_vehiculo, 'UPDATE', NOW());
END //

-- Trigger 9: Evitar la eliminación de una especie si está asociada a un área
CREATE TRIGGER trg_prevent_delete_especie
BEFORE DELETE ON Especie
FOR EACH ROW
BEGIN
    DECLARE area_count INT;
    SELECT COUNT(*) INTO area_count FROM Area_Especie WHERE id_especie = OLD.id_especie;
    IF area_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar la especie porque está asociada a un área';
    END IF;
END //

-- Trigger 10: Actualizar la fecha de modificación en la tabla Alojamiento cuando se actualiza un registro
CREATE TRIGGER trg_update_alojamiento_modificacion
BEFORE UPDATE ON Alojamiento
FOR EACH ROW
BEGIN
    SET NEW.fecha_ingreso = NOW();
END //

-- Trigger 11: Registrar la eliminación de un proyecto de investigación en una tabla de auditoría
CREATE TRIGGER trg_delete_proyecto_auditoria
AFTER DELETE ON Proyecto_Investigacion
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Proyecto (id_proyecto, accion, fecha) VALUES (OLD.id_proyecto, 'DELETE', NOW());
END //

-- Trigger 12: Evitar la inserción de un área con un nombre duplicado en el mismo parque
CREATE TRIGGER trg_prevent_duplicate_area
BEFORE INSERT ON Area
FOR EACH ROW
BEGIN
    DECLARE area_count INT;
    SELECT COUNT(*) INTO area_count FROM Area WHERE nombre = NEW.nombre AND id_parque = NEW.id_parque;
    IF area_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre del área ya existe en el mismo parque';
    END IF;
END //

-- Trigger 13: Actualizar el inventario de especies al insertar una nueva especie en un área
CREATE TRIGGER trg_insert_area_especie
AFTER INSERT ON Area_Especie
FOR EACH ROW
BEGIN
    UPDATE Especie SET cantidad_inventario = cantidad_inventario + NEW.cantidad_inventario WHERE id_especie = NEW.id_especie;
END //

-- Trigger 14: Registrar la actualización de un departamento en una tabla de auditoría
CREATE TRIGGER trg_update_departamento_auditoria
AFTER UPDATE ON Departamento
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Departamento (id_departamento, accion, fecha) VALUES (NEW.id_departamento, 'UPDATE', NOW());
END //

-- Trigger 15: Evitar la eliminación de una entidad si está asociada a un departamento
CREATE TRIGGER trg_prevent_delete_entidad
BEFORE DELETE ON Entidad
FOR EACH ROW
BEGIN
    DECLARE departamento_count INT;
    SELECT COUNT(*) INTO departamento_count FROM Departamento_Entidad WHERE id_entidad = OLD.id_entidad;
    IF departamento_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar la entidad porque está asociada a un departamento';
    END IF;
END //

-- Trigger 16: Actualizar la fecha de modificación en la tabla Personal cuando se actualiza un registro
CREATE TRIGGER trg_update_personal_modificacion
BEFORE UPDATE ON Personal
FOR EACH ROW
BEGIN
    SET NEW.direccion = NOW();
END //

-- Trigger 17: Registrar la inserción de un nuevo proyecto de investigación en una tabla de auditoría
CREATE TRIGGER trg_insert_proyecto_auditoria
AFTER INSERT ON Proyecto_Investigacion
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Proyecto (id_proyecto, accion, fecha) VALUES (NEW.id_proyecto, 'INSERT', NOW());
END //

-- Trigger 18: Evitar la inserción de un vehículo con una marca duplicada
CREATE TRIGGER trg_prevent_duplicate_vehiculo
BEFORE INSERT ON Vehiculo
FOR EACH ROW
BEGIN
    DECLARE marca_count INT;
    SELECT COUNT(*) INTO marca_count FROM Vehiculo WHERE marca = NEW.marca;
    IF marca_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La marca del vehículo ya existe';
    END IF;
END //

-- Trigger 19: Actualizar la capacidad disponible de un alojamiento al eliminar un visitante
CREATE TRIGGER trg_delete_visitante_alojamiento
AFTER DELETE ON Visitante_Alojamiento
FOR EACH ROW
BEGIN
    UPDATE Alojamiento SET capacidad = capacidad + 1 WHERE id_alojamiento = OLD.id_alojamiento;
END //

-- Trigger 20: Registrar la actualización de una especie en una tabla de auditoría
CREATE TRIGGER trg_update_especie_auditoria
AFTER UPDATE ON Especie
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Especie (id_especie, accion, fecha) VALUES (NEW.id_especie, 'UPDATE', NOW());
END //

DELIMITER ;