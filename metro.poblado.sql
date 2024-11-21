DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- EJERCICIO 1: Implementación del esquema de base de datos

-- Primero Tablas con puras llaves primarias

-- Tabla Conductor 
CREATE TABLE Conductor(
	CURP CHAR(18),
    Nombre VARCHAR(100),
    Paterno VARCHAR(100),
    Materno VARCHAR(100),
	-- Sexo lo definiremos como 'M' = Masculino o 'F' = Femenino
    Sexo CHAR(1),
    Salario NUMERIC(10, 2),
    Nacimiento DATE,
    Estado VARCHAR(100)
);

-- Llave primaria
ALTER TABLE Conductor ADD CONSTRAINT conductorPK
PRIMARY KEY (CURP);

-- Insert data into Conductor
INSERT INTO Conductor (CURP, Nombre, Paterno, Materno, Sexo, Salario, Nacimiento, Estado)
VALUES 
('ABC123456HDFG123456', 'Juan', 'Pérez', 'García', 'M', 15000.00, '1985-06-15', 'Jalisco'),
('DEF234567HDFG123456', 'María', 'López', 'Fernández', 'F', 16000.00, '1990-04-20', 'Guadalajara');

-- Tabla Linea
CREATE TABLE Linea(
	NumeroLinea CHAR(1), 
    Nombre VARCHAR(100)
);

-- Llave primaria
ALTER TABLE Linea ADD CONSTRAINT numerolineaPK
PRIMARY KEY (NumeroLinea);

-- Insert data into Linea
INSERT INTO Linea (NumeroLinea, Nombre)
VALUES 
('A', 'Línea 1'),
('B', 'Línea 2');

-- Tabla Estacion
CREATE TABLE Estacion(
	NumeroEstacion INT,
	JefeEstacion VARCHAR(150),
    NombreEstacion VARCHAR(100),
    HoraApertura TIME,
    HoraCierre TIME,
    Telefono CHAR(10)
);

-- Llave primaria
ALTER TABLE Estacion ADD CONSTRAINT numeroestacionPK
PRIMARY KEY (NumeroEstacion);

-- Insert data into Estacion
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono)
VALUES 
(1, 'Carlos López', 'Estación Central', '06:00:00', '22:00:00', '1234567890'),
(2, 'Ana Martínez', 'Estación Norte', '05:30:00', '21:30:00', '0987654321');

-- Tabla Servicio
CREATE TABLE Servicio(
	IDServicio INT,
    Nombre VARCHAR(100),
    Tipo VARCHAR(100)
);

-- Llave primaria
ALTER TABLE Servicio ADD CONSTRAINT servicioPK
PRIMARY KEY (IDServicio);

-- Insert data into Servicio
INSERT INTO Servicio (IDServicio, Nombre, Tipo)
VALUES 
(1, 'Servicio Expreso', 'Rápido'),
(2, 'Servicio Local', 'Normal');

-- Tabla Telefono
CREATE TABLE Telefono(
	CURP CHAR(18),
    Telefono CHAR(10)
);

-- Llave compuesta
ALTER TABLE Telefono ADD CONSTRAINT CURPtelefonoPK
PRIMARY KEY (CURP, Telefono);

ALTER TABLE Telefono ADD CONSTRAINT CURP_FK 
FOREIGN KEY (CURP) REFERENCES Conductor(CURP) ON DELETE SET NULL
ON UPDATE CASCADE;

-- Insert data into Telefono
INSERT INTO Telefono (CURP, Telefono)
VALUES 
('ABC123456HDFG123456', '9876543210'),
('DEF234567HDFG123456', '1234567890');

-- Tabla Tren
CREATE TABLE Tren(
	IDTren INT,
	NumeroLinea CHAR(1), 
	Marca VARCHAR(100),
	Estatus BOOLEAN,
	Vagones INT,
	AnioFabrica INT
);

-- Llave primaria
ALTER TABLE Tren ADD CONSTRAINT idtrenPK
PRIMARY KEY (IDTren);

-- Llave foranea
ALTER TABLE Tren ADD CONSTRAINT numerolineaFK
FOREIGN KEY (NumeroLinea) REFERENCES Linea(NumeroLinea) ON DELETE SET NULL
ON UPDATE CASCADE;

-- Insert data into Tren
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica)
VALUES 
(1, 'A', 'Marca X', TRUE, 5, 2020),
(2, 'B', 'Marca Y', FALSE, 4, 2019);

-- Tabla Conducir
CREATE TABLE Conducir(
	IDTren INT,
    CURP VARCHAR(18),
    HoraInicio TIME,
    HoraFin TIME,
    Fecha