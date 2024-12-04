/*
 *
 * DBMS           :  MySQL Server
 * Base de Datos  :  Biblioteca
 * Descripción    :  Base de Datos de Presto para libros
 * Script         :  Crea la Base de Datos
 * Responsable    :  Jose David Gil Vasquez
 * Email          :  jose.gil@ukuepa.com
 * Fecha          :  4/12/2024
 *
*/

-- ==========================================================
-- Creación de la Base de Datos
-- ==========================================================
CREATE DATABASE biblioteca;
USE biblioteca;

-- ==========================================================
-- Crear la Tabla Libros
-- ==========================================================
CREATE TABLE Libros (
    ID_libro INT AUTO_INCREMENT PRIMARY KEY,  -- Clave primaria que se incrementa automáticamente
    titulo VARCHAR(255) NOT NULL,             -- Título del libro
    autor VARCHAR(255) NOT NULL,              -- Autor del libro
    genero VARCHAR(100),                      -- Género del libro
    anio_publicacion INT                      -- Año de publicación del libro
);
-- ==========================================================
-- Crear la Tabla de Usuarios
-- ==========================================================

CREATE TABLE Usuarios (
    ID_usuario INT AUTO_INCREMENT PRIMARY KEY,  -- Clave primaria que se incrementa automáticamente
    nombre VARCHAR(255) NOT NULL,                -- Nombre del usuario
    direccion VARCHAR(255),                      -- Dirección del usuario
    correo_electronico VARCHAR(255) UNIQUE NOT NULL  -- Correo electrónico único
);

-- ==========================================================
-- Crear la Tabla de Prestamos
-- ==========================================================

CREATE TABLE Prestamos (
    ID_prestamo INT AUTO_INCREMENT PRIMARY KEY,  -- Clave primaria que se incrementa automáticamente
    ID_usuario INT,                              -- Clave foránea que se relaciona con la tabla `Usuarios`
    ID_libro INT,                                -- Clave foránea que se relaciona con la tabla `Libros`
    fecha_prestamo DATE NOT NULL,                -- Fecha en que se realiza el préstamo
    fecha_devolucion DATE,                       -- Fecha de devolución del libro (puede ser NULL si no se ha devuelto)
    FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID_usuario),  -- Relación con la tabla `Usuarios`
    FOREIGN KEY (ID_libro) REFERENCES Libros(ID_libro)         -- Relación con la tabla `Libros`
);
