# Los Ambientales – Sistema de Gestión de Parques Naturales

## Descripción del Proyecto
El proyecto **Los Ambientales** es una solución integral para gestionar de manera eficiente las operaciones relacionadas con parques naturales bajo la supervisión del Ministerio del Medio Ambiente. La base de datos permite administrar departamentos, parques, áreas, especies, personal, proyectos de investigación, visitantes y alojamientos. Con ella, se facilita la toma de decisiones críticas mediante consultas complejas y reportes que integran información de múltiples dimensiones del sistema.

---

## Requisitos del Sistema
- **MySQL**: Versión 8.0 o superior.
- **Cliente MySQL Workbench**: Para administración y visualización de la base de datos.
- **Sistema Operativo**: Compatible con Windows, Linux o macOS.
- **Git**: Para el manejo del repositorio y control de versiones (se recomienda GitHub).

---

## Instalación y Configuración
Sigue estos pasos para configurar el entorno y cargar la base de datos:

1. **Clonar el Repositorio**
   ```bash
   git clone https://github.com/YtzhakC/los-ambientales.git
   cd los-ambientales
   ```

2. **Crear la Base de Datos y Estructura de Tablas**
   - Abre MySQL Workbench y ejecuta el script `ddl.sql` para generar la estructura de la base de datos:
     ```sql
     SOURCE path/to/ddl.sql;
     ```

3. **Cargar los Datos Iniciales**
   - Ejecuta el script `dml.sql` para insertar los registros iniciales:
     ```sql
     SOURCE path/to/dml.sql;
     ```

4. **Ejecución de Consultas y Objetos SQL**
   - Las consultas se encuentran en el archivo `dql_select.sql`.
   - Los procedimientos almacenados están en `dql_procedimientos.sql`.
   - Las funciones SQL se encuentran en `dql_funciones.sql`.
   - Los triggers se definen en `dql_triggers.sql`.
   - Los eventos automáticos se encuentran en `dql_eventos.sql`.

---

## Estructura de la Base de Datos
La base de datos cuenta con las siguientes tablas y relaciones principales:

- **Departamentos**: Registra los departamentos y su respectivo ente responsable.
- **Parques Naturales**: Almacena la información de cada parque (nombre, fecha de declaración) y se relaciona con varios departamentos.
- **Áreas**: Cada parque se divide en áreas, las cuales tienen un nombre y una extensión (superficie).
- **Especies**: Contiene información de especies presentes en cada área, clasificadas en vegetales, animales y minerales, junto con su denominación científica, vulgar y número de inventario.
- **Personal**: Registra datos del personal (cédula, nombre, dirección, teléfonos, sueldo) y clasifica en: Personal de Gestión, Vigilancia, Conservación e Investigación.
- **Proyectos de Investigación**: Detalla proyectos con presupuesto, periodo de realización y las relaciones con investigadores y especies.
- **Visitantes**: Almacena la información de los visitantes (cédula, nombre, dirección, profesión).
- **Alojamientos**: Registra los alojamientos disponibles en los parques, incluyendo su capacidad y categoría.

Estas relaciones permiten realizar consultas complejas, como el análisis de la cantidad de parques por departamento, la superficie total de cada parque, el inventario de especies por área y la asignación de personal a proyectos y áreas específicas.

---

## Ejemplos de Consultas
Algunos ejemplos de consultas SQL implementadas son:

- **Cantidad de Parques por Departamento**  
  ```sql
  SELECT d.nombre AS Departamento, COUNT(p.id) AS Total_Parques
  FROM Departamentos d
  JOIN Parques p ON d.id = p.departamento_id
  GROUP BY d.nombre;
  ```
  *Esta consulta muestra el número de parques asociados a cada departamento.*

- **Superficie Total de Cada Parque**  
  ```sql
  SELECT p.nombre AS Parque, SUM(a.extension) AS Superficie_Total
  FROM Parques p
  JOIN Áreas a ON p.id = a.parque_id
  GROUP BY p.nombre;
  ```
  *Permite conocer la extensión total declarada de cada parque.*

- **Especies con Inventario Superior al Promedio**  
  ```sql
  SELECT e.denominacion_cientifica, e.numero_inventario
  FROM Especies e
  WHERE e.numero_inventario > (
      SELECT AVG(numero_inventario)
      FROM Especies
      WHERE parque_id = e.parque_id
  );
  ```
  *Lista aquellas especies cuyo número de inventario supera el promedio dentro de su parque.*

---

## Procedimientos, Funciones, Triggers y Eventos

- **Procedimientos Almacenados**  
  Ejemplos:
  - `sp_registrar_parque`: Registra un nuevo parque natural.
  - `sp_actualizar_area`: Actualiza la información de una determinada área.
  
- **Funciones SQL**  
  Ejemplos:
  - `fn_superficie_total_parque(departamento_id)`: Calcula la suma de las áreas de los parques de un departamento.
  - `fn_inventario_especies(area_id)`: Retorna el inventario total de especies en una determinada área.

- **Triggers**  
  Se han implementado triggers para:
  - Actualizar automáticamente el inventario de especies al registrar o modificar datos en las áreas.
  - Registrar movimientos y cambios en el salario del personal.

- **Eventos**  
  Ejemplos:
  - Generar reportes semanales de visitantes y ocupación de alojamientos.
  - Actualizar periódicamente los inventarios de especies.

---

## Roles de Usuario y Permisos
Se han definido cinco roles de usuario, cada uno con permisos específicos:

1. **Administrador**: Acceso total al sistema y a todas las funcionalidades.  
2. **Gestor de Parques**: Permite la gestión de parques, áreas y especies.  
3. **Investigador**: Acceso a datos y proyectos de investigación, pudiendo registrar y consultar información sobre especies y estudios.  
4. **Auditor**: Permite la consulta de reportes financieros y de gestión para auditorías.  
5. **Encargado de Visitantes**: Gestión y registro de visitantes, además de la asignación de alojamientos.

Para crear un usuario y asignarle permisos, se puede usar un comando similar al siguiente:

```sql
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'contraseña';
GRANT SELECT, INSERT, UPDATE, DELETE ON base_datos.* TO 'usuario'@'localhost';
-- Ajustar los permisos según el rol asignado
```

---

## Contribuciones
Este proyecto fue desarrollado por 1 persona:

- **Ytzhak**: Realización y estructuración del proyecto completo.
---

## Licencia y Contacto
- **Licencia**: Este proyecto se distribuye bajo la [Licencia MIT](https://opensource.org/licenses/MIT).
- **Contacto**:  
  Si tienes preguntas o encuentras algún problema con la implementación, puedes contactar a:  
  [ytzhakcc@gmail.com](mailto:ytzhakcc@gmail.com)


## Estructura del proyecto

```plaintext
LosAmbientales
├── DDL
│   └── ddl.sql                   # Script para la creación de la estructura de la base de datos
├── DML
│   └── dml.sql                   # Script para la inserción de datos
├── DQL
│   ├── dql_select.sql            # Consultas SQL (DQL)
│   ├── dql_procedimientos.sql    # Procedimientos almacenados
│   ├── dql_funciones.sql         # Funciones definidas por el usuario
│   ├── dql_triggers.sql          # Definición de triggers
│   └── dql_eventos.sql           # Definición de eventos
├── images
│   └── Diagrama.jpg              # Modelo de datos (diagrama entidad-relación)
└── README.md                     # Documentación del proyecto
```