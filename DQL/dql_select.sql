-- 1.1. Conteo de parques por departamento
SELECT d.nombre AS Departamento, COUNT(p.id_parque) AS Total_Parques
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
GROUP BY d.id_departamento;

-- 1.2. Superficie total declarada por cada parque (suma de áreas)
SELECT p.nombre AS Parque, SUM(a.superficie) AS Superficie_Total
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.id_parque;

-- 1.3. Promedio de superficie por parque
SELECT AVG(Sub.TotalSuperficie) AS Promedio_Superficie
FROM (
  SELECT SUM(a.superficie) AS TotalSuperficie
  FROM Parque p
  JOIN Area a ON p.id_parque = a.id_parque
  GROUP BY p.id_parque
) AS Sub;

-- 1.4. Parques con superficie total mayor a 200
SELECT p.nombre AS Parque, SUM(a.superficie) AS Superficie_Total
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.id_parque
HAVING Superficie_Total > 200;

-- 1.5. Listado de parques con su departamento y superficie total
SELECT d.nombre AS Departamento, p.nombre AS Parque, SUM(a.superficie) AS Superficie_Total
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY d.id_departamento, p.id_parque;