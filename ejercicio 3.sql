CREATE DATABASE hospital;
USE hospital;


CREATE TABLE IF NOT EXISTS pacientes(
    numero_historia_clinica INT PRIMARY KEY,
    nombre_paciente VARCHAR(100) NOT NULL,
    direccion_paciente VARCHAR(150) NOT NULL,
    telefono_paciente VARCHAR(20) NOT NULL
);


CREATE TABLE IF NOT EXISTS medicos(
    numero_colegiatura INT PRIMARY KEY,
    nombre_medico VARCHAR(100) NOT NULL,
    especialidad_medico VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS citas(
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    numero_historia_clinica INT NOT NULL,
    numero_colegiatura INT NOT NULL,
    fecha_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,

    CONSTRAINT fk_cita_paciente FOREIGN KEY (numero_historia_clinica) REFERENCES pacientes(numero_historia_clinica),
    CONSTRAINT fk_cita_medico FOREIGN KEY (numero_colegiatura) REFERENCES medicos(numero_colegiatura)
);
