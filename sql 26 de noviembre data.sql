-- Pacientes
INSERT INTO Pacientes (Id_paciente, Nombre, Apellido, Fecha_nacimiento, Direccion, Telefono, Estado)
VALUES 
(1, 'Ana', 'Gómez', '1985-03-12', 'Calle 10 #5-20', '3001234567', 'Activo'),
(2, 'Luis', 'Martínez', '1990-07-25', 'Carrera 15 #8-40', '3019876543', 'Activo'),
(3, 'María', 'Fernández', '1978-11-02', 'Av. Central 45', '3024567890', 'Fallecido');

-- Especialidades
INSERT INTO Especialidades (Id_especialidad, Nombre_especialidad)
VALUES 
(1, 'Cardiología'),
(2, 'Neurología'),
(3, 'Pediatría');

-- Médicos
INSERT INTO Medicos (Id_medico, Nombre, Apellido, Id_especialidad)
VALUES 
(1, 'Carlos', 'Pérez', 1),
(2, 'Sofía', 'Ramírez', 2),
(3, 'Andrés', 'López', 3);

-- Servicios Médicos
INSERT INTO ServiciosMedicos (Id_servicio, Nombre_servicio, Descripcion)
VALUES 
(1, 'Consulta General', 'Atención médica básica'),
(2, 'Ecografía', 'Examen de diagnóstico por imágenes'),
(3, 'Rayos X', 'Examen radiológico');

-- Equipos Médicos
INSERT INTO EquiposMedicos (Id_equipo, Nombre_equipo, Tipo_equipo, Estado_equipo)
VALUES 
(1, 'Ecógrafo', 'Imagenología', 'Operativo'),
(2, 'Máquina Rayos X', 'Radiología', 'Operativo'),
(3, 'Monitor Cardíaco', 'Monitoreo', 'En mantenimiento');

-- Citas
INSERT INTO Citas (Id_cita, Fecha, Hora, Id_paciente, Id_medico, Id_servicio)
VALUES 
(1, '2025-05-10', '09:00:00', 1, 1, 1),
(2, '2025-05-12', '10:30:00', 2, 2, 2),
(3, '2025-06-01', '14:00:00', 1, 3, 3),
(4, '2025-06-15', '08:00:00', 3, 1, 1);

-- Servicios_Equipos (tabla intermedia N:M)
INSERT INTO Servicios_Equipos (Id_servicio, Id_equipo)
VALUES 
(2, 1), -- Ecografía usa Ecógrafo
(3, 2), -- Rayos X usa Máquina Rayos X
(1, 3); -- Consulta General usa Monitor Cardíaco
