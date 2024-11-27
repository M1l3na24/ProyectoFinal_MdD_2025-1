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

-- Tabla Linea
CREATE TABLE Linea(
	-- Aqui se hace la misma observacion que en Tren con el num de linea
	NumeroLinea CHAR(2),-- 2 para que acepte el 12 
    Nombre VARCHAR(100)
);

-- Llave primaria
ALTER TABLE Linea ADD CONSTRAINT numerolineaPK
PRIMARY KEY (NumeroLinea);

-- Tabla Estacion
CREATE TABLE Estacion(
	NumeroEstacion INT,
	JefeEstacion VARCHAR(150),
    NombreEstacion VARCHAR(100),
    HoraApertura TIME,
    HoraCierre TIME,
	-- Aqui se hizo una correccion porque en el diagrama aparece como Time el telefono
    Telefono CHAR(10)
);

-- Llave primaria
ALTER TABLE Estacion ADD CONSTRAINT numeroestacionPK
PRIMARY KEY (NumeroEstacion);

-- Tabla Servicio
CREATE TABLE Servicio(
	IDServicio INT,
    Nombre VARCHAR(100),
    Tipo VARCHAR(100)
);

-- Llave primaria
ALTER TABLE Servicio ADD CONSTRAINT servicioPK
PRIMARY KEY (IDServicio);

-- Tabla Telefono
CREATE TABLE Telefono(
	CURP CHAR(18),
	-- un telefono sera de 10 digitos y no incluira otro tipo de caracter
    Telefono CHAR(10)
);

-- Llave compuesta
ALTER TABLE Telefono ADD CONSTRAINT CURPtelefonoPK
PRIMARY KEY (CURP,Telefono);

ALTER TABLE Telefono ADD CONSTRAINT CURP_FK 
FOREIGN KEY (CURP) REFERENCES Conductor(CURP) ON DELETE SET NULL
ON UPDATE CASCADE;




-- Tablas con llaves foraneas

-- Tabla Tren
CREATE TABLE Tren(
	IDTren INT,
	-- Aqui el diagrama lo marcaba como INT pero hay lineas como A y B entonces lo puse como CHAR(1)
	NumeroLinea CHAR(2), 
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


-- Tabla Conducir
CREATE TABLE Conducir(
	IDTren INT,
    CURP VARCHAR(18),
    HoraInicio TIME ,
    HoraFin TIME,
    Fecha DATE,
	-- El turno lo definiremos como 'M' = Matutino, 'V' = Vespertino  y 'N'=nocturno
    Turno CHAR(1)
);

-- Llaves foranes
ALTER TABLE Conducir ADD CONSTRAINT IDTrenFK
FOREIGN KEY (IDTren) REFERENCES Tren(IDTren) ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Conducir ADD CONSTRAINT CURPFK
FOREIGN KEY (CURP) REFERENCES Conductor(CURP) ON DELETE SET NULL
ON UPDATE CASCADE;

-- Tabla Pertenecer
CREATE TABLE Pertenecer(
	-- nuevamente se cambio de INT a CHAR(1)
	NumeroLinea CHAR(2),
    NumeroEstacion INT
);

-- Llaves foranes
ALTER TABLE Pertenecer ADD CONSTRAINT numerolineaFK
FOREIGN KEY (NumeroLinea) REFERENCES Linea(NumeroLinea) ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Pertenecer ADD CONSTRAINT numeroestacionFK
FOREIGN KEY (NumeroEstacion) REFERENCES Estacion(NumeroEstacion) ON DELETE SET NULL
ON UPDATE CASCADE;


-- Tabla Hangar
CREATE TABLE Hangar(
	IDHangar INT,
    NumeroEstacion INT
);

-- Llave primaria
ALTER TABLE Hangar ADD CONSTRAINT idhangarPK
PRIMARY KEY (IDHangar);
-- Llave foranea
ALTER TABLE Hangar ADD CONSTRAINT numeroestacionFK
FOREIGN KEY (NumeroEstacion) REFERENCES Estacion(NumeroEstacion) ON DELETE SET NULL
ON UPDATE CASCADE;

-- Tabla Reservar 
CREATE TABLE Reservar(
	IDTren INT,
    IDHangar INT,
    FechaInicio DATE,
    FechaFin DATE
);

-- Llaves foranes
ALTER TABLE Reservar ADD CONSTRAINT idtrenFK
FOREIGN KEY (IDTren) REFERENCES Tren(IDTren) ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Reservar ADD CONSTRAINT idhangarFK
FOREIGN KEY (IDHangar) REFERENCES Hangar(IDHangar) ON DELETE SET NULL
ON UPDATE CASCADE;


-- Tabla Conectar
CREATE TABLE Conectar(
	NumeroEstacion INT,
	IDServicio INT
);

-- Tabla Acceso
CREATE TABLE Acceso(
	NumeroAcceso INT,
	NumeroEstacion INT,
	HoraApertura TIME,
	HoraCierre TIME
);
-- Llave primaria
ALTER TABLE Acceso ADD CONSTRAINT numeroaccesoPK
PRIMARY KEY (NumeroAcceso);

--para eliminar: ALTER TABLE Conectar DROP CONSTRAINT numeroestacionFK_estacion;
--ALTER TABLE Conectar DROP CONSTRAINT numeroestacionFK_acceso;

-- Las siguiente son de Conectar pero las defini despues para evitar marcar error
-- Llaves foranes
ALTER TABLE Conectar ADD CONSTRAINT numeroestacionFK_estacion
FOREIGN KEY (NumeroEstacion) REFERENCES Estacion(NumeroEstacion) ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Conectar ADD CONSTRAINT idservicioFK
FOREIGN KEY (IDServicio) REFERENCES Servicio(IDServicio) ON DELETE SET NULL
ON UPDATE CASCADE;

-- Las siguientes son de acceso
-- Llave foranea
ALTER TABLE Acceso ADD CONSTRAINT numeroestacionFK_acceso
FOREIGN KEY (NumeroEstacion) REFERENCES Estacion(NumeroEstacion) ON DELETE SET NULL
ON UPDATE CASCADE;





-- Restricciones de dominio

-- Conductor
ALTER TABLE Conductor ALTER COLUMN CURP SET NOT NULL;
ALTER TABLE Conductor ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Conductor ALTER COLUMN Paterno SET NOT NULL;
ALTER TABLE Conductor ALTER COLUMN Materno SET NOT NULL;
ALTER TABLE Conductor ALTER COLUMN Sexo SET NOT NULL;
ALTER TABLE Conductor ADD CONSTRAINT dominio01 CHECK(Sexo IN ('M', 'F'));
ALTER TABLE Conductor ALTER COLUMN Salario SET NOT NULL;
ALTER TABLE Conductor ADD CONSTRAINT dominio02 CHECK(Salario >= 0);
ALTER TABLE Conductor ALTER COLUMN Nacimiento SET NOT NULL;
ALTER TABLE Conductor ADD CONSTRAINT dominio03 CHECK(Nacimiento <= CURRENT_DATE);
ALTER TABLE Conductor ALTER COLUMN Estado SET NOT NULL;

-- Linea
ALTER TABLE Linea ALTER COLUMN NumeroLinea SET NOT NULL;
ALTER TABLE Linea ALTER COLUMN Nombre SET NOT NULL;

-- Estacion
ALTER TABLE Estacion ALTER COLUMN NumeroEstacion SET NOT NULL;
ALTER TABLE Estacion ALTER COLUMN JefeEstacion SET NOT NULL;
ALTER TABLE Estacion ALTER COLUMN NombreEstacion SET NOT NULL;
ALTER TABLE Estacion ALTER COLUMN HoraApertura SET NOT NULL;
ALTER TABLE Estacion ALTER COLUMN HoraCierre SET NOT NULL;
ALTER TABLE Estacion ADD CONSTRAINT dominio01 CHECK(HoraCierre > HoraApertura);
ALTER TABLE Estacion ALTER COLUMN Telefono SET NOT NULL;
ALTER TABLE Estacion ADD CONSTRAINT dominio02 CHECK(Telefono ~ '^[0-9]{10}$');

-- Servicio
ALTER TABLE Servicio ALTER COLUMN IDServicio SET NOT NULL;
ALTER TABLE Servicio ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Servicio ALTER COLUMN Tipo SET NOT NULL;

-- Telefono
ALTER TABLE Telefono ALTER COLUMN CURP SET NOT NULL;
ALTER TABLE Telefono ALTER COLUMN Telefono SET NOT NULL;
ALTER TABLE Telefono ADD CONSTRAINT dominio01 CHECK(Telefono ~ '^[0-9]{10}$');

-- Tren
ALTER TABLE Tren ALTER COLUMN IDTren SET NOT NULL;
ALTER TABLE Tren ALTER COLUMN NumeroLinea DROP NOT NULL;
ALTER TABLE Tren ALTER COLUMN Marca SET NOT NULL;
ALTER TABLE Tren ALTER COLUMN Estatus SET NOT NULL;
ALTER TABLE Tren ALTER COLUMN Estatus SET DEFAULT TRUE;
ALTER TABLE Tren ALTER COLUMN Vagones SET NOT NULL;
ALTER TABLE Tren ADD CONSTRAINT dominio01 CHECK(Vagones >= 0);
ALTER TABLE Tren ALTER COLUMN AnioFabrica SET NOT NULL;


-- Conducir
ALTER TABLE Conducir ALTER COLUMN IDTren DROP NOT NULL;
ALTER TABLE Conducir ALTER COLUMN CURP DROP NOT NULL;
ALTER TABLE Conducir ALTER COLUMN HoraInicio SET NOT NULL;
ALTER TABLE Conducir ALTER COLUMN HoraFin SET NOT NULL;
ALTER TABLE Conducir ADD CONSTRAINT dominio01 CHECK(HoraFin > HoraInicio);
ALTER TABLE Conducir ALTER COLUMN Fecha SET NOT NULL;
ALTER TABLE Conducir ALTER COLUMN Turno SET NOT NULL;
ALTER TABLE Conducir ADD CONSTRAINT dominio02 CHECK(Turno IN ('M', 'V', 'N'));

--Pertenecer: NOTA se considero no necesario

-- Hangar
ALTER TABLE Hangar ALTER COLUMN IDHangar SET NOT NULL;
ALTER TABLE Hangar ALTER COLUMN NumeroEstacion DROP NOT NULL;

-- Reservar
ALTER TABLE Reservar ALTER COLUMN IDTren DROP NOT NULL;
ALTER TABLE Reservar ALTER COLUMN IDHangar DROP NOT NULL;
ALTER TABLE Reservar ALTER COLUMN FechaInicio SET NOT NULL;
ALTER TABLE Reservar ALTER COLUMN FechaFin SET NOT NULL;
ALTER TABLE Reservar ADD CONSTRAINT dominio01 CHECK(FechaFin >= FechaInicio);

-- Conectar
ALTER TABLE Conectar ALTER COLUMN NumeroEstacion DROP NOT NULL;
ALTER TABLE Conectar ALTER COLUMN IDServicio DROP NOT NULL;

-- Acceso
ALTER TABLE Acceso ALTER COLUMN NumeroAcceso SET NOT NULL;
ALTER TABLE Acceso ALTER COLUMN NumeroEstacion DROP NOT NULL;
ALTER TABLE Acceso ALTER COLUMN HoraApertura SET NOT NULL;
ALTER TABLE Acceso ALTER COLUMN HoraCierre SET NOT NULL;
ALTER TABLE Acceso ADD CONSTRAINT dominio01 CHECK(HoraCierre > HoraApertura);

