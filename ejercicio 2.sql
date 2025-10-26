CREATE DATABASE universidad;
USE universidad;


CREATE TABLE IF NOT EXISTS estudiantes(
    numero_matricula INT PRIMARY KEY,
    nombre_estudiante VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS profesores(
    codigo_profesor INT PRIMARY KEY,
    nombre_profesor VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS cursos(
    codigo_curso INT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    numero_creditos INT NOT NULL,
    codigo_profesor INT NOT NULL,

    CONSTRAINT fk_curso_profesor FOREIGN KEY (codigo_profesor) REFERENCES profesores(codigo_profesor)
);


CREATE TABLE IF NOT EXISTS inscripciones(
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    numero_matricula INT NOT NULL,
    codigo_curso INT NOT NULL,

    CONSTRAINT fk_inscripcion_estudiante FOREIGN KEY (numero_matricula) REFERENCES estudiantes(numero_matricula),
    CONSTRAINT fk_inscripcion_curso FOREIGN KEY (codigo_curso) REFERENCES cursos(codigo_curso)
);
