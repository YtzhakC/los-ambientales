DELIMITER //

-- Función 1: Obtener el nombre de un departamento por su ID
CREATE FUNCTION GetNombreDepartamento(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(100);
    SELECT nombre INTO nombre FROM Departamento WHERE id_departamento = id;
    RETURN nombre;
END //

-- Función 2: Obtener el nombre de una entidad por su ID
CREATE FUNCTION GetNombreEntidad(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(100);
    SELECT nombre INTO nombre FROM Entidad WHERE id_entidad = id;
    RETURN nombre;
END //

-- Función 3: Obtener el nombre de un parque por su ID
CREATE FUNCTION GetNombreParque(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(100);
    SELECT nombre INTO nombre FROM Parque WHERE id_parque = id;
    RETURN nombre;
END //

-- Función 4: Obtener el nombre de un área por su ID
CREATE FUNCTION GetNombreArea(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(100);
    SELECT nombre INTO nombre FROM Area WHERE id_area = id;
    RETURN nombre;
END //

-- Función 5: Obtener el nombre científico de una especie por su ID
CREATE FUNCTION GetNombreCientificoEspecie(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombre_cientifico VARCHAR(100);
    SELECT nombre_cientifico INTO nombre_cientifico FROM Especie WHERE id_especie = id;
    RETURN nombre_cientifico;
END //

-- Función 6: Obtener el nombre vulgar de una especie por su ID
CREATE FUNCTION GetNombreVulgarEspecie(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombre_vulgar VARCHAR(100);
    SELECT nombre_vulgar INTO nombre_vulgar FROM Especie WHERE id_especie = id;
    RETURN nombre_vulgar;
END //

-- Función 7: Obtener el nombre de un personal por su ID
CREATE FUNCTION GetNombrePersonal(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(100);
    SELECT nombre INTO nombre FROM Personal WHERE id_personal = id;
    RETURN nombre;
END //

-- Función 8: Obtener el tipo de un vehículo por su ID
CREATE FUNCTION GetTipoVehiculo(id INT) RETURNS VARCHAR(50)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE tipo VARCHAR(50);
    SELECT tipo INTO tipo FROM Vehiculo WHERE id_vehiculo = id;
    RETURN tipo;
END //

-- Función 9: Obtener la marca de un vehículo por su ID
CREATE FUNCTION GetMarcaVehiculo(id INT) RETURNS VARCHAR(50)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE marca VARCHAR(50);
    SELECT marca INTO marca FROM Vehiculo WHERE id_vehiculo = id;
    RETURN marca;
END //

-- Función 10: Obtener el presupuesto de un proyecto de investigación por su ID
CREATE FUNCTION GetPresupuestoProyecto(id INT) RETURNS DECIMAL(12,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE presupuesto DECIMAL(12,2);
    SELECT presupuesto INTO presupuesto FROM Proyecto_Investigacion WHERE id_proyecto = id;
    RETURN presupuesto;
END //

-- Función 11: Obtener la fecha de inicio de un proyecto de investigación por su ID
CREATE FUNCTION GetFechaInicioProyecto(id INT) RETURNS DATE
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE fecha_inicio DATE;
    SELECT fecha_inicio INTO fecha_inicio FROM Proyecto_Investigacion WHERE id_proyecto = id;
    RETURN fecha_inicio;
END //

-- Función 12: Obtener la fecha de fin de un proyecto de investigación por su ID
CREATE FUNCTION GetFechaFinProyecto(id INT) RETURNS DATE
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE fecha_fin DATE;
    SELECT fecha_fin INTO fecha_fin FROM Proyecto_Investigacion WHERE id_proyecto = id;
    RETURN fecha_fin;
END //

-- Función 13: Obtener el nombre de un visitante por su ID
CREATE FUNCTION GetNombreVisitante(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(100);
    SELECT nombre INTO nombre FROM Visitante WHERE id_visitante = id;
    RETURN nombre;
END //

-- Función 14: Obtener la dirección de un visitante por su ID
CREATE FUNCTION GetDireccionVisitante(id INT) RETURNS VARCHAR(255)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE direccion VARCHAR(255);
    SELECT direccion INTO direccion FROM Visitante WHERE id_visitante = id;
    RETURN direccion;
END //

-- Función 15: Obtener la profesión de un visitante por su ID
CREATE FUNCTION GetProfesionVisitante(id INT) RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE profesion VARCHAR(100);
    SELECT profesion INTO profesion FROM Visitante WHERE id_visitante = id;
    RETURN profesion;
END //

-- Función 16: Obtener la fecha de entrada de un visitante por su ID
CREATE FUNCTION GetFechaEntradaVisitante(id INT) RETURNS DATE
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE fecha_entrada DATE;
    SELECT fecha_entrada INTO fecha_entrada FROM Visitante WHERE id_visitante = id;
    RETURN fecha_entrada;
END //

-- Función 17: Obtener la fecha de salida de un visitante por su ID
CREATE FUNCTION GetFechaSalidaVisitante(id INT) RETURNS DATE
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE fecha_salida DATE;
    SELECT fecha_salida INTO fecha_salida FROM Visitante WHERE id_visitante = id;
    RETURN fecha_salida;
END //

-- Función 18: Obtener la capacidad de un alojamiento por su ID
CREATE FUNCTION GetCapacidadAlojamiento(id INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE capacidad INT;
    SELECT capacidad INTO capacidad FROM Alojamiento WHERE id_alojamiento = id;
    RETURN capacidad;
END //

-- Función 19: Obtener la categoría de un alojamiento por su ID
CREATE FUNCTION GetCategoriaAlojamiento(id INT) RETURNS VARCHAR(50)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE categoria VARCHAR(50);
    SELECT categoria INTO categoria FROM Alojamiento WHERE id_alojamiento = id;
    RETURN categoria;
END //

-- Función 20: Obtener la fecha de ingreso de un alojamiento por su ID
CREATE FUNCTION GetFechaIngresoAlojamiento(id INT) RETURNS DATE
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE fecha_ingreso DATE;
    SELECT fecha_ingreso INTO fecha_ingreso FROM Alojamiento WHERE id_alojamiento = id;
    RETURN fecha_ingreso;
END //

DELIMITER ;

-- Función 1
SELECT GetNombreDepartamento(1);

-- Función 2
SELECT GetNombreEntidad(1);

-- Función 3
SELECT GetNombreParque(1);

-- Función 4
SELECT GetNombreArea(1);

-- Función 5
SELECT GetNombreCientificoEspecie(1);

-- Función 6
SELECT GetNombreVulgarEspecie(1);

-- Función 7
SELECT GetNombrePersonal(1);

-- Función 8
SELECT GetTipoVehiculo(1);

-- Función 9
SELECT GetMarcaVehiculo(1);

-- Función 10
SELECT GetPresupuestoProyecto(1);

-- Función 11
SELECT GetFechaInicioProyecto(1);

-- Función 12
SELECT GetFechaFinProyecto(1);

-- Función 13
SELECT GetNombreVisitante(1);

-- Función 14
SELECT GetDireccionVisitante(1);

-- Función 15
SELECT GetProfesionVisitante(1);

-- Función 16
SELECT GetFechaEntradaVisitante(1);

-- Función 17
SELECT GetFechaSalidaVisitante(1);

-- Función 18
SELECT GetCapacidadAlojamiento(1);

-- Función 19
SELECT GetCategoriaAlojamiento(1);

-- Función 20
SELECT GetFechaIngresoAlojamiento(1);