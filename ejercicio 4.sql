CREATE DATABASE tienda_en_linea;
USE tienda_en_linea;


CREATE TABLE IF NOT EXISTS clientes(
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS productos(
    codigo_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion_producto TEXT NOT NULL,
    precio_producto DECIMAL(10,2) NOT NULL
);


CREATE TABLE IF NOT EXISTS pedidos(
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,

    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


CREATE TABLE IF NOT EXISTS detalle_pedido(
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    codigo_producto INT NOT NULL,
    cantidad INT NOT NULL,

    CONSTRAINT fk_detalle_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
);
