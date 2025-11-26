-- queries

-- 4.1 Obtener las citas atendidas por el médico 3 en el servicio 2.
SELECT *
FROM Citas
WHERE Id_medico = 3 AND Id_servicio = 2;

-- 4.2 Buscar pacientes cuyo nombre comience por "Ana".
SELECT *
FROM Pacientes
WHERE Nombre LIKE 'Ana%';

-- 4.3 Listar las citas programadas entre el 1 de mayo y el 25 de junio de 2025.
SELECT *
FROM Citas
WHERE Fecha BETWEEN '2025-05-01' AND '2025-06-25';

-- 4.4 Obtener los médicos cuya especialidad sea Cardiología, Neurología o Pediatría.
SELECT M.*
FROM Medicos M
JOIN Especialidades E ON M.Id_especialidad = E.Id_especialidad
WHERE E.Nombre_especialidad IN ('Cardiología', 'Neurología', 'Pediatría');

-- 4.5 Pacientes fallecidos: identificación, nombre y edad.
SELECT
  Id_paciente AS Identificacion,
  CONCAT(Nombre, ' ', Apellido) AS NombreCompleto,
  TIMESTAMPDIFF(YEAR, Fecha_nacimiento, CURDATE()) AS Edad
FROM Pacientes
WHERE Estado = 'Fallecido';
