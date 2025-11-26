CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;

CREATE TABLE IF NOT EXISTS Pacientes (
  Id_paciente INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50) NOT NULL,
  Fecha_nacimiento DATE,
  Direccion VARCHAR(100),
  Telefono VARCHAR(20),
  Estado VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Especialidades (
  Id_especialidad INT NOT NULL PRIMARY KEY,
  Nombre_especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Medicos (
  Id_medico INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50) NOT NULL,
  Id_especialidad INT NOT NULL,
  CONSTRAINT fk_medicos_especialidades FOREIGN KEY (Id_especialidad) 
    REFERENCES Especialidades (Id_especialidad)
);

CREATE TABLE IF NOT EXISTS ServiciosMedicos (
  Id_servicio INT NOT NULL PRIMARY KEY,
  Nombre_servicio VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS EquiposMedicos (
  Id_equipo INT NOT NULL PRIMARY KEY,
  Nombre_equipo VARCHAR(50) NOT NULL,
  Tipo_equipo VARCHAR(50),
  Estado_equipo VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Citas (
  Id_cita INT NOT NULL PRIMARY KEY,
  Fecha DATE NOT NULL,
  Hora TIME NOT NULL,
  Id_paciente INT NOT NULL,
  Id_medico INT NOT NULL,
  Id_servicio INT NOT NULL,
  CONSTRAINT fk_citas_pacientes FOREIGN KEY (Id_paciente) 
    REFERENCES Pacientes (Id_paciente),
  CONSTRAINT fk_citas_medicos FOREIGN KEY (Id_medico) 
    REFERENCES Medicos (Id_medico),
  CONSTRAINT fk_citas_servicios FOREIGN KEY (Id_servicio) 
    REFERENCES ServiciosMedicos (Id_servicio)
);

CREATE TABLE IF NOT EXISTS Servicios_Equipos (
  Id_servicio INT NOT NULL,
  Id_equipo INT NOT NULL,
  PRIMARY KEY (Id_servicio, Id_equipo),
  CONSTRAINT fk_servicios_equipos_servicios FOREIGN KEY (Id_servicio) 
    REFERENCES ServiciosMedicos (Id_servicio),
  CONSTRAINT fk_servicios_equipos_equipos FOREIGN KEY (Id_equipo) 
    REFERENCES EquiposMedicos (Id_equipo)
);
