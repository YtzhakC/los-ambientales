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

-- 1.6. Departamento con mayor cantidad de parques
SELECT d.nombre AS Departamento, COUNT(p.id_parque) AS Total_Parques
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
GROUP BY d.id_departamento
ORDER BY Total_Parques DESC
LIMIT 1;

-- 1.7. Departamento con mayor superficie total en parques
SELECT d.nombre AS Departamento, SUM(a.superficie) AS Superficie_Total
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY d.id_departamento
ORDER BY Superficie_Total DESC
LIMIT 1;

-- 1.8. Parques sin áreas asignadas (si existiesen)
SELECT p.nombre AS Parque
FROM Parque p
LEFT JOIN Area a ON p.id_parque = a.id_parque
WHERE a.id_area IS NULL;

-- 1.9. Superficie total declarada en todos los parques
SELECT SUM(a.superficie) AS Superficie_Total_General
FROM Area a;

-- 1.10. Porcentaje de la superficie de cada parque respecto al total global
SELECT p.nombre AS Parque, 
       (SUM(a.superficie) / (SELECT SUM(superficie) FROM Area)) * 100 AS Porcentaje_Superficie
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.id_parque;

-- 1.11. Número de parques por departamento con superficie promedio superior al promedio global
SELECT d.nombre AS Departamento, COUNT(p.id_parque) AS Parques_Con_Superficie_Alta
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY d.id_departamento
HAVING AVG(a.superficie) > (SELECT AVG(superficie) FROM Area);

-- 1.12. Parques ordenados de mayor a menor según superficie total
SELECT p.nombre AS Parque, SUM(a.superficie) AS Superficie_Total
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY p.id_parque
ORDER BY Superficie_Total DESC;

-- 1.13. Promedio de superficie de parques por departamento
SELECT d.nombre AS Departamento, AVG(Sub.TotalSuperficie) AS Promedio_Superficie
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN (
  SELECT p.id_parque, SUM(a.superficie) AS TotalSuperficie
  FROM Parque p
  JOIN Area a ON p.id_parque = a.id_parque
  GROUP BY p.id_parque
) AS Sub ON dp.id_parque = Sub.id_parque
GROUP BY d.id_departamento;

-- 1.14. Parques con superficie inferior al promedio de su departamento (consulta avanzada)
SELECT p.nombre AS Parque, SUM(a.superficie) AS Superficie
FROM Parque p
JOIN Area a ON p.id_parque = a.id_parque
WHERE SUM(a.superficie) < (
    SELECT AVG(Sub.TotalSuperficie)
    FROM (
      SELECT p2.id_parque, SUM(a2.superficie) AS TotalSuperficie
      FROM Parque p2
      JOIN Departamento_Parque dp2 ON p2.id_parque = dp2.id_parque
      JOIN Area a2 ON p2.id_parque = a2.id_parque
      WHERE dp2.id_departamento = (
         SELECT dp3.id_departamento FROM Departamento_Parque dp3 WHERE dp3.id_parque = p.id_parque LIMIT 1
      )
      GROUP BY p2.id_parque
    ) AS Sub
)
GROUP BY p.id_parque;

-- 1.15. Comparación de superficies: total en departamentos “urbanos” vs “rurales” (simulado)
SELECT 
    CASE WHEN d.nombre IN ('Cundinamarca', 'Antioquia', 'Valle del Cauca') THEN 'Urbano'
         ELSE 'Rural'
    END AS Tipo,
    SUM(a.superficie) AS Superficie_Total
FROM Departamento d
JOIN Departamento_Parque dp ON d.id_departamento = dp.id_departamento
JOIN Parque p ON dp.id_parque = p.id_parque
JOIN Area a ON p.id_parque = a.id_parque
GROUP BY Tipo;