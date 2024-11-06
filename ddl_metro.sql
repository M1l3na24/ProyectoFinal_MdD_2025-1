-- Ejercicio 1: Implementación del esquema de base de datos y poblamiento

-- Tabla Linea
CREATE TABLE Linea(
	-- Aqui se hace la misma observacion que en Tren con el num de linea
	NumeroLinea CHAR(1) PRIMARY KEY, 
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla Tren
CREATE TABLE Tren(
	IDTren INT PRIMARY KEY,
	-- Aqui el diagrama lo marcaba como INT pero hay lineas como A y B
	-- entonces lo puse como CHAR(1)
	NumeroLinea CHAR(1) REFERENCES Linea(NumeroLinea) ON DELETE SET NULL, 
	Marca VARCHAR(100) NOT NULL,
	Estatus BOOLEAN DEFAULT TRUE,
	Vagones INT CHECK (Vagones > 0),
	AnioFabrica INT
);

-- Tabla Conductor 
CREATE TABLE Conductor(
	CURP CHAR(18) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Paterno VARCHAR(100) NOT NULL,
    Materno VARCHAR(100),
	-- Sexo lo definiremos como 'M' = Masculino o 'F' = Femenino
    Sexo CHAR(1) NOT NULL CHECK (Sexo IN ('M', 'F')),
    Salario NUMERIC(10, 2) NOT NULL CHECK (Salario >= 0),
    Nacimiento DATE NOT NULL CHECK (Nacimiento <= CURRENT_DATE),
    Estado VARCHAR(100) NOT NULL
);

-- Tabla Conducir
CREATE TABLE Conducir(
-- ON DELETE CASCADE es para eliminar referencias en otras tablas en caso de eliminar en esta
	IDTren INT REFERENCES Tren(IDTren) ON DELETE CASCADE,
    CURP CHAR(18) REFERENCES Conductor(CURP) ON DELETE CASCADE,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL CHECK (HoraFin > HoraInicio),
    Fecha DATE NOT NULL,
	-- El turno lo definiremos como 'M' = Matutino, 'V' = Vespertino  y 'N'=nocturno
    Turno CHAR(1) NOT NULL CHECK (Turno IN ('M', 'V', 'N')),
    PRIMARY KEY (IDTren, CURP)
);

-- Tabla Pertenecer
CREATE TABLE Pertenecer(
	NumeroLinea CHAR(1) REFERENCES Linea(NumeroLinea) ON DELETE CASCADE,
    NumeroEstacion INT REFERENCES Estacion(NumeroEstacion) ON DELETE CASCADE,
    PRIMARY KEY (NumeroLinea, NumeroEstacion)
);

-- Tabla Estacion
CREATE TABLE Estacion(
	NumeroEstacion INT PRIMARY KEY,
	JefeEstacion VARCHAR(150) NOT NULL,
    NombreEstacion VARCHAR(100) NOT NULL,
    HoraApertura TIME NOT NULL,
    HoraCierre TIME NOT NULL CHECK (HoraCierre > HoraApertura),
	-- Aqui se hizo una correccion porque en el diagrama aparece como Time el telefono
    Telefono CHAR(10) CHECK (Telefono ~ '^[0-9]{10}$')
);

-- Tabla Hangar
CREATE TABLE Hangar(
	IDHangar INT PRIMARY KEY,
    NumeroEstacion INT REFERENCES Estacion(NumeroEstacion) ON DELETE SET NULL
);


-- Tabla Reservar 
CREATE TABLE Reservar(
	IDTren INT REFERENCES Tren(IDTren) ON DELETE CASCADE,
    IDHangar INT REFERENCES Hangar(IDHangar) ON DELETE CASCADE,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL CHECK (FechaFin >= FechaInicio),
    PRIMARY KEY (IDTren, IDHangar)
);

-- Tabla Telefono
CREATE TABLE Telefono(
	CURP CHAR(18) REFERENCES Conductor(CURP) ON DELETE CASCADE,
	-- un telefono sera de 10 digitos y no incluira otro tipo de caracter
    Telefono CHAR(10) NOT NULL CHECK (Telefono ~ '^[0-9]{10}$'),
    PRIMARY KEY (CURP, Telefono)
);

-- Tabla Servicio
CREATE TABLE Servicio(
	IDServicio INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(100) NOT NULL
);

-- Tabla Conectar
CREATE TABLE Conectar(
	NumeroEstacion INT REFERENCES Estacion(NumeroEstacion) ON DELETE CASCADE,
	IDServicio INT REFERENCES Servicio(IDServicio) ON DELETE CASCADE,
	PRIMARY KEY (NumeroEstacion, IDServicio)
);

-- Tabla Acceso
CREATE TABLE Acceso(
	NumeroAcceso INT PRIMARY KEY,
	NumeroEstacion INT REFERENCES Estacion(NumeroEstacion) ON DELETE CASCADE,
	HoraApertura TIME NOT NULL,
	HoraCierre TIME NOT NULL CHECK (HoraCierre > HoraApertura)
);

