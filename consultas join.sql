-- 5.1 Listar las citas con el nombre del paciente, del médico y el servicio médico.
SELECT
  C.Id_cita,
  C.Fecha,
  C.Hora,
  CONCAT(P.Nombre, ' ', P.Apellido) AS Paciente,
  CONCAT(M.Nombre, ' ', M.Apellido) AS Medico,
  S.Nombre_servicio AS Servicio
FROM Citas C
JOIN Pacientes P ON C.Id_paciente = P.Id_paciente
JOIN Medicos M ON C.Id_medico = M.Id_medico
JOIN ServiciosMedicos S ON C.Id_servicio = S.Id_servicio;

-- 5.2 Mostrar los médicos con su especialidad.
SELECT
  CONCAT(M.Nombre, ' ', M.Apellido) AS Medico,
  E.Nombre_especialidad AS Especialidad
FROM Medicos M
JOIN Especialidades E ON M.Id_especialidad = E.Id_especialidad;

-- 5.3 Listar los equipos usados por cada servicio médico.
SELECT
  S.Nombre_servicio AS Servicio,
  E.Nombre_equipo AS Equipo
FROM ServiciosMedicos S
JOIN Servicios_Equipos SE ON S.Id_servicio = SE.Id_servicio
JOIN EquiposMedicos E ON SE.Id_equipo = E.Id_equipo;

-- 5.4 Listar todos los pacientes y las citas que tengan (si no tienen, mostrar NULL).
SELECT
  P.Id_paciente,
  CONCAT(P.Nombre, ' ', P.Apellido) AS Paciente,
  C.Id_cita,
  C.Fecha,
  C.Hora
FROM Pacientes P
LEFT JOIN Citas C ON C.Id_paciente = P.Id_paciente
ORDER BY P.Id_paciente, C.Fecha;

-- 5.5 Todos los servicios médicos y los equipos asociados (aunque no tengan ninguno).
SELECT
  S.Id_servicio,
  S.Nombre_servicio,
  E.Id_equipo,
  E.Nombre_equipo
FROM ServiciosMedicos S
LEFT JOIN Servicios_Equipos SE ON SE.Id_servicio = S.Id_servicio
LEFT JOIN EquiposMedicos E ON SE.Id_equipo = E.Id_equipo
ORDER BY S.Id_servicio;

-- 5.6 Todos los médicos y las citas que atienden (aunque no tengan citas).
SELECT
  M.Id_medico,
  CONCAT(M.Nombre, ' ', M.Apellido) AS Medico,
  C.Id_cita,
  C.Fecha,
  C.Hora
FROM Medicos M
LEFT JOIN Citas C ON C.Id_medico = M.Id_medico
ORDER BY M.Id_medico, C.Fecha;

-- 5.7 Todas las citas y los pacientes que correspondan (si alguna cita no tiene paciente, aparece NULL).
SELECT
  C.Id_cita,
  C.Fecha,
  C.Hora,
  P.Id_paciente,
  CONCAT(P.Nombre, ' ', P.Apellido) AS Paciente
FROM Citas C
LEFT JOIN Pacientes P ON P.Id_paciente = C.Id_paciente
ORDER BY C.Fecha;

-- 5.8 Todas las especialidades y sus médicos (si alguna especialidad no tiene médicos, mostrarla igual).
SELECT
  E.Id_especialidad,
  E.Nombre_especialidad,
  M.Id_medico,
  CONCAT(M.Nombre, ' ', M.Apellido) AS Medico
FROM Especialidades E
LEFT JOIN Medicos M ON M.Id_especialidad = E.Id_especialidad
ORDER BY E.Id_especialidad;

-- 5.9 Todos los equipos médicos y los servicios donde se usan (aunque no pertenezcan a ningún servicio).
SELECT
  EQ.Id_equipo,
  EQ.Nombre_equipo,
  S.Id_servicio,
  S.Nombre_servicio
FROM EquiposMedicos EQ
LEFT JOIN Servicios_Equipos SE ON SE.Id_equipo = EQ.Id_equipo
LEFT JOIN ServiciosMedicos S ON S.Id_servicio = SE.Id_servicio
ORDER BY EQ.Id_equipo;
