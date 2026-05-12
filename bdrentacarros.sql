-- Script de creación de Base de Datos: bdrentacarros
-- Generado para Gestión de Renta de Vehículos

CREATE DATABASE IF NOT EXISTS bdrentacarros;
USE bdrentacarros;

-- 1. CATEGORIA (Define tipos de autos y precios base)
CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    costo_dia DECIMAL(10, 2) NOT NULL,
    costo_seguro_dia DECIMAL(10, 2) NOT NULL
);

-- 2. SUCURSAL (Ubicaciones físicas)
CREATE TABLE SUCURSAL (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(20),
    ciudad VARCHAR(50),
    activa BOOLEAN DEFAULT TRUE
);

-- 3. VEHICULO (Flota disponible)
CREATE TABLE VEHICULO (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(17) UNIQUE NOT NULL,
    placa VARCHAR(15) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    color VARCHAR(30),
    kilometraje INT NOT NULL,
    estado ENUM('Disponible', 'Rentado', 'Mantenimiento', 'Baja') DEFAULT 'Disponible',
    id_categoria INT,
    id_sucursal_base INT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
    FOREIGN KEY (id_sucursal_base) REFERENCES SUCURSAL(id_sucursal)
);

-- 4. EMPLEADO (Personal de atención)
CREATE TABLE EMPLEADO (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    puesto VARCHAR(50),
    email VARCHAR(100),
    id_sucursal INT,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_sucursal) REFERENCES SUCURSAL(id_sucursal)
);

-- 5. CLIENTE (Usuarios del servicio)
CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    num_licencia VARCHAR(30) UNIQUE NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion TEXT
);

-- 6. RENTA (Entidad Pivot / Núcleo del negocio)
CREATE TABLE RENTA (
    id_renta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vehiculo INT NOT NULL,
    id_sucursal_entrega INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin_prevista DATETIME NOT NULL,
    fecha_fin_real DATETIME,
    estado ENUM('Reserva', 'Activa', 'Finalizada', 'Cancelada') DEFAULT 'Activa',
    total_estimado DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_vehiculo) REFERENCES VEHICULO(id_vehiculo),
    FOREIGN KEY (id_sucursal_entrega) REFERENCES SUCURSAL(id_sucursal),
    FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado)
);

-- 7. INSPECCION (Control de daños y estado del vehículo)
CREATE TABLE INSPECCION (
    id_inspeccion INT AUTO_INCREMENT PRIMARY KEY,
    id_renta INT NOT NULL,
    tipo ENUM('Salida', 'Retorno') NOT NULL,
    fecha_inspeccion DATETIME DEFAULT CURRENT_TIMESTAMP,
    nivel_combustible VARCHAR(20),
    kilometraje_registro INT NOT NULL,
    danos_observados TEXT,
    limpieza_optima BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_renta) REFERENCES RENTA(id_renta)
);

-- 8. PAGO (Gestión financiera)
CREATE TABLE PAGO (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_renta INT NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    monto DECIMAL(10, 2) NOT NULL,
    metodo_pago ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    referencia_transaccion VARCHAR(100),
    FOREIGN KEY (id_renta) REFERENCES RENTA(id_renta)
);

-- 9. MANTENIMIENTO (Historial de reparaciones)
CREATE TABLE MANTENIMIENTO (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_vehiculo INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    descripcion TEXT NOT NULL,
    costo DECIMAL(10, 2),
    tipo_mantenimiento ENUM('Preventivo', 'Correctivo') NOT NULL,
    FOREIGN KEY (id_vehiculo) REFERENCES VEHICULO(id_vehiculo)
);

-- 10. TARIFA_ADICIONAL (Servicios extra)
CREATE TABLE TARIFA_ADICIONAL (
    id_tarifa_extra INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    costo_fijo DECIMAL(10, 2) NOT NULL
);

-- Tabla intermedia para Renta y Tarifas Adicionales
CREATE TABLE RENTA_DETALLE_ADICIONAL (
    id_renta INT,
    id_tarifa_extra INT,
    cantidad INT DEFAULT 1,
    PRIMARY KEY (id_renta, id_tarifa_extra),
    FOREIGN KEY (id_renta) REFERENCES RENTA(id_renta),
    FOREIGN KEY (id_tarifa_extra) REFERENCES TARIFA_ADICIONAL(id_tarifa_extra)
);
