-- Creación de la base de datos
CREATE DATABASE gestion_finanzas;

-- Cambiar a la base de datos recién creada
USE gestion_finanzas;

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    CONSTRAINT CHK_Password CHECK (
        LENGTH(password) >= 5 AND
        NOT password REGEXP '[0-9]{2,}'
    )
);

-- Creación de la tabla Categorias
CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Creación de la tabla Transacciones
CREATE TABLE Transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    categoria_id INT,
    usuario_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
