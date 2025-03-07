CREATE DATABASE ambientalistas;
USE ambientalistas;

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Entidad (
    id_entidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Parque (
    id_parque INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    fecha_declaracion DATE NOT NULL
);

CREATE TABLE Area (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    id_parque INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    superficie DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_parque) REFERENCES Parque(id_parque)
);

-- Tabla de Especies
CREATE TABLE Especie (
    id_especie INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cientifico VARCHAR(100) NOT NULL,
    nombre_vulgar VARCHAR(100) NOT NULL
);

-- Tabla de Personal del Parque
CREATE TABLE Personal (
    id_personal INT PRIMARY KEY AUTO_INCREMENT,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    movil VARCHAR(20),
    sueldo DECIMAL(10,2) NOT NULL,
    rol ENUM('Gestión', 'Vigilancia', 'Conservación', 'Investigación') NOT NULL
);

-- Tabla de Vehículos de Vigilancia
CREATE TABLE Vehiculo (
    id_vehiculo INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL
);333 

-- Tabla de Proyectos de Investigación
CREATE TABLE Proyecto_Investigacion (
    id_proyecto INT PRIMARY KEY AUTO_INCREMENT,
    presupuesto DECIMAL(12,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

-- Tabla de Visitantes
CREATE TABLE Visitante (
    id_visitante INT PRIMARY KEY AUTO_INCREMENT,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    profesion VARCHAR(100),
    fecha_entrada date NOT NULL,
    fecha_salida date NOT NULL
);

-- Tabla de Alojamientos dentro de los Parques
CREATE TABLE Alojamiento (
    id_alojamiento INT PRIMARY KEY AUTO_INCREMENT,
    id_parque INT NOT NULL,
    capacidad INT NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    fecha_ingreso date NOT NULL,
    fecha_salida date NOT NULL,
    FOREIGN KEY (id_parque) REFERENCES Parque(id_parque)
);

-- Tablas intermedias para relaciones muchos a muchos

-- Relación entre Departamentos y Parques
CREATE TABLE Departamento_Parque (
    id_departamento INT,
    id_parque INT,
    PRIMARY KEY (id_departamento, id_parque),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
    FOREIGN KEY (id_parque) REFERENCES Parque(id_parque)
);

-- Relación entre Departamentos y Entidades Responsables
CREATE TABLE Departamento_Entidad (
    id_departamento INT,
    id_entidad INT,
    PRIMARY KEY (id_departamento, id_entidad),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
    FOREIGN KEY (id_entidad) REFERENCES Entidad(id_entidad)
);

-- Relación entre Áreas y Especies
CREATE TABLE Area_Especie (
    id_area INT,
    id_especie INT,
    cantidad_inventario INT NOT NULL,
    PRIMARY KEY (id_area, id_especie),
    FOREIGN KEY (id_area) REFERENCES Area(id_area),
    FOREIGN KEY (id_especie) REFERENCES Especie(id_especie)
);

-- Relación entre Proyectos de Investigación e Investigadores
CREATE TABLE Proyecto_Investigador (
    id_proyecto INT,
    id_personal INT,
    PRIMARY KEY (id_proyecto, id_personal),
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto_Investigacion(id_proyecto),
    FOREIGN KEY (id_personal) REFERENCES Personal(id_personal)
);

-- Relación entre Proyectos de Investigación y Especies estudiadas
CREATE TABLE Proyecto_Especie (
    id_proyecto INT,
    id_especie INT,
    PRIMARY KEY (id_proyecto, id_especie),
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto_Investigacion(id_proyecto),
    FOREIGN KEY (id_especie) REFERENCES Especie(id_especie)
);

-- Relación entre Visitantes y Alojamientos
CREATE TABLE Visitante_Alojamiento (
    id_visitante INT,
    id_alojamiento INT,
    PRIMARY KEY (id_visitante, id_alojamiento),
    FOREIGN KEY (id_visitante) REFERENCES Visitante(id_visitante),
    FOREIGN KEY (id_alojamiento) REFERENCES Alojamiento(id_alojamiento)
);