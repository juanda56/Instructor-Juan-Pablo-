CREATE DATABASE biblioteca;
USE biblioteca;


CREATE TABLE IF NOT EXISTS usuarios(
    Id_usuario INT PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    direccion_usuario VARCHAR(150) NOT NULL
);


CREATE TABLE IF NOT EXISTS libros(
    Id_libro INT PRIMARY KEY,
    titulo_libro VARCHAR(200) NOT NULL,
    autor_libro VARCHAR(100) NOT NULL,
    año_publicacion INT NOT NULL
);


CREATE TABLE IF NOT EXISTS prestamos(
    Id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    Id_usuario INT NOT NULL,
    Id_libro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    
    CONSTRAINT fk_prestamo_usuario FOREIGN KEY (Id_usuario) REFERENCES usuarios(Id_usuario),
    CONSTRAINT fk_prestamo_libro FOREIGN KEY (Id_libro) REFERENCES libros(Id_libro)
);
