-- Insertar datos en Tren (IDTren inicia en 100)
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica) VALUES
(100, '1', 'MarcaA', TRUE, 8, 2015),
(101, '2', 'MarcaB', TRUE, 6, 2016),
(102, '3', 'MarcaC', TRUE, 10, 2018),
(103, '4', 'MarcaD', TRUE, 8, 2017),
(104, '5', 'MarcaE', TRUE, 12, 2014),
(105, '6', 'MarcaF', TRUE, 9, 2020),
(106, '7', 'MarcaG', TRUE, 7, 2019),
(107, '8', 'MarcaH', TRUE, 5, 2021),
(108, '9', 'MarcaI', TRUE, 4, 2013),
(109, '8', 'MarcaJ', TRUE, 11, 2022),
(110, '1', 'MarcaK', TRUE, 6, 2020),
(111, '2', 'MarcaL', TRUE, 9, 2019),
(112, '3', 'MarcaM', TRUE, 10, 2018),
(113, '4', 'MarcaN', TRUE, 8, 2021),
(114, '5', 'MarcaO', TRUE, 7, 2017),
(115, '6', 'MarcaP', TRUE, 5, 2016),
(116, '7', 'MarcaQ', TRUE, 11, 2015),
(117, '8', 'MarcaR', TRUE, 4, 2022),
(118, '9', 'MarcaS', TRUE, 12, 2014),
(119, '8', 'MarcaT', TRUE, 6, 2013);

-- Insertar datos en Hangar (IDHangar inicia en 100, NúmeroEstacion de 1 a 78)
INSERT INTO Hangar (IDHangar, NumeroEstacion) VALUES
(400, 1),
(401, 2),
(402, 3),
(403, 4),
(404, 5),
(405, 6),
(406, 7),
(407, 8),
(408, 9),
(409, 10),
(410, 11),
(411, 12),
(412, 13),
(413, 14),
(414, 15),
(415, 16),
(416, 17),
(417, 18),
(418, 19),
(419, 20);

-- Insertar datos en Reservar (20 tuplas con FechaInicio = '2023-11-03')
INSERT INTO Reservar (IDTren, IDHangar, FechaInicio, FechaFin) VALUES
(100, 100, '2023-11-03', '2023-11-10'),
(101, 101, '2023-11-03', '2023-11-12'),
(102, 102, '2023-11-03', '2023-11-15'),
(103, 103, '2023-11-03', '2023-11-11'),
(104, 104, '2023-11-03', '2023-11-14'),
(105, 105, '2023-11-03', '2023-11-13'),
(106, 106, '2023-11-03', '2023-11-08'),
(107, 107, '2023-11-03', '2023-11-16'),
(108, 108, '2023-11-03', '2023-11-17'),
(109, 109, '2023-11-03', '2023-11-18'),
(110, 110, '2023-11-03', '2023-11-09'),
(111, 111, '2023-11-03', '2023-11-11'),
(112, 112, '2023-11-03', '2023-11-14'),
(113, 113, '2023-11-03', '2023-11-15'),
(114, 114, '2023-11-03', '2023-11-13'),
(115, 115, '2023-11-03', '2023-11-16'),
(116, 116, '2023-11-03', '2023-11-10'),
(117, 117, '2023-11-03', '2023-11-12'),
(118, 118, '2023-11-03', '2023-11-17'),
(119, 119, '2023-11-03', '2023-11-18');

--Más Alonsos--
INSERT INTO Conductor (CURP, Nombre, Paterno, Materno, Sexo, Salario, Nacimiento, Estado) VALUES 
('MOHA911006ZFQ12', 'Alonso', 'Morales', 'Hernández', 'M', 26645.83, '1991-10-06', 'Ciudad de México'),
('RAMA600802IGG13', 'Alonso', 'Ramírez', 'Mendoza', 'M', 23825.16, '1960-08-02', 'Veracruz'),
('MOHA151023EBI14', 'Alonso', 'Morales', 'Hernández', 'M', 26643.86, '2015-10-23', 'Jalisco'),
('RUPA630510HXB15', 'Alonso', 'Ruiz', 'Pérez', 'M', 28013.74, '1963-05-10', 'Guanajuato'),
('LÓPA750128IHP29', 'Alonso', 'López', 'Pérez', 'M', 25648.37, '1975-01-28', 'Yucatán'),
('LÓPA050215KTL30', 'Alonso', 'López', 'Pérez', 'M', 20008.83, '2005-02-15', 'Veracruz'),
('HELV850409DCK01', 'Verónica', 'Hernández', 'López', 'F', 23170.43, '1985-04-09', 'Puebla'),
('CRHV000418ALT02', 'Verónica', 'Cruz', 'Hernández', 'F', 27766.38, '2000-04-18', 'Chihuahua'),
('MEVA670409EBD03', 'Alonso', 'Mendoza', 'Vargas', 'M', 29548.86, '1967-04-09', 'Yucatán'),
('CRHA650106SDN04', 'Alonso', 'Cruz', 'Hernández', 'M', 20759.48, '1965-01-06', 'Yucatán'),
('RALV860126UTY05', 'Verónica', 'Ramírez', 'López', 'F', 25008.8, '1986-01-26', 'Guanajuato'),
('RAMV160813KDD06', 'Verónica', 'Ramírez', 'Morales', 'F', 27904.93, '2016-08-13', 'Ciudad de México'),
('HEGV940104WDD07', 'Verónica', 'Hernández', 'García', 'F', 29689.54, '1994-01-04', 'Chihuahua'),
('PÉMA530228GHS08', 'Alonso', 'Pérez', 'Morales', 'M', 24958.8, '1953-02-28', 'Veracruz'),
('VACV890404QLV09', 'Verónica', 'Vargas', 'Cruz', 'F', 26375.09, '1989-04-04', 'Nuevo León'),
('PÉRA040729WGU10', 'Alonso', 'Pérez', 'Ruiz', 'M', 28281.57, '2004-07-29', 'Puebla'),
('MORA920718PDF11', 'Alonso', 'Morales', 'Ramírez', 'M', 23251.93, '1992-07-18', 'Jalisco'),
('VARA691029QIO12', 'Alonso', 'Vargas', 'Ramírez', 'M', 24839.7, '1969-10-29', 'Jalisco'),
('LÓMV880105GDJ13', 'Verónica', 'López', 'Morales', 'F', 22218.76, '1988-01-05', 'Jalisco'),
('RARV841212RSX14', 'Verónica', 'Ramírez', 'Ruiz', 'F', 28633.67, '1984-12-12', 'Guanajuato'),
('LÓMA510211KGN15', 'Alonso', 'López', 'Mendoza', 'M', 29040.91, '1951-02-11', 'Nuevo León'),
('MOMA610620KHM16', 'Alonso', 'Morales', 'Mendoza', 'M', 20122.51, '1961-06-20', 'Nuevo León'),
('GACV720926ABE17', 'Verónica', 'García', 'Cruz', 'F', 23775.94, '1972-09-26', 'Jalisco'),
('RALA920413NOF18', 'Alonso', 'Ramírez', 'López', 'M', 23155.3, '1992-04-13', 'Veracruz'),
('MELV880130OSL19', 'Verónica', 'Mendoza', 'López', 'F', 20032.43, '1988-01-30', 'Guanajuato'),
('GAHA511124DOO20', 'Alonso', 'García', 'Hernández', 'M', 29167.94, '1951-11-24', 'Guanajuato'),
('HEMV950804NWA21', 'Verónica', 'Hernández', 'Morales', 'F', 29252.12, '1995-08-04', 'Ciudad de México'),
('MERV811223BVX22', 'Verónica', 'Mendoza', 'Ruiz', 'F', 26738.53, '1981-12-23', 'Yucatán'),
('CRMV110517MGR23', 'Verónica', 'Cruz', 'Morales', 'F', 24947.35, '2011-05-17', 'Ciudad de México'),
('MELA040511EIW24', 'Alonso', 'Mendoza', 'López', 'M', 22630.22, '2004-05-11', 'Guanajuato'),
('PÉCA990419LEB25', 'Alonso', 'Pérez', 'Cruz', 'M', 25515.38, '1999-04-19', 'Puebla'),
('PÉRV650101FZM26', 'Verónica', 'Pérez', 'Ruiz', 'F', 23977.15, '1965-01-01', 'Nuevo León'),
('MOLV630821NUY27', 'Verónica', 'Morales', 'López', 'F', 26575.67, '1963-08-21', 'Puebla'),
('HEVA050702DHX28', 'Alonso', 'Hernández', 'Vargas', 'M', 28612.95, '2005-07-02', 'Jalisco'),
('MEHA190110PCT29', 'Alonso', 'Mendoza', 'Hernández', 'M', 29794.91, '2019-01-10', 'Veracruz'),
('MELV801225AXQ30', 'Verónica', 'Mendoza', 'López', 'F', 22758.41, '1980-12-25', 'Veracruz');


-- Insertar nuevos trenes
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica)
VALUES
(200, '2', 'MarcaX', FALSE, 8, 2010),
(201, '4', 'MarcaY', FALSE, 10, 2012),
(202, '6', 'MarcaZ', FALSE, 6, 2008),
(203, '8', 'MarcaW', FALSE, 12, 2015),
(204, '12', 'MarcaA', FALSE, 7, 2018),
(205, '2', 'MarcaB', FALSE, 9, 2020),
(206, '4', 'MarcaC', FALSE, 8, 2011),
(207, '6', 'MarcaD', FALSE, 10, 2013),
(208, '8', 'MarcaE', FALSE, 11, 2016),
(209, '12', 'MarcaF', FALSE, 8, 2019),
(210, '2', 'MarcaG', FALSE, 9, 2005),
(211, '4', 'MarcaH', FALSE, 10, 2007),
(212, '6', 'MarcaI', FALSE, 8, 2014),
(213, '8', 'MarcaJ', FALSE, 6, 2009),
(214, '12', 'MarcaK', FALSE, 7, 2021),
(215, '2', 'MarcaL', FALSE, 12, 2010),
(216, '4', 'MarcaM', FALSE, 9, 2017),
(217, '6', 'MarcaN', FALSE, 10, 2008),
(218, '8', 'MarcaO', FALSE, 11, 2012),
(219, '12', 'MarcaP', FALSE, 7, 2023);

-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

--Consultas--

--Ej a--
select a.NumeroLinea, count(b.NumeroEstacion) as NumeroEstaciones
from Linea a
join Pertenecer b on a.NumeroLinea = b.NumeroLinea
group by a.NumeroLinea
order by NumeroLinea asc;

--Ej c--
select a.IDTren, a.NumeroLinea, a.Marca, b.FechaInicio as FechaReparacion, c.IDHangar, c.NumeroEstacion
from Tren a
inner join Reservar b on a.IDTren = b.IDTren
inner join Hangar c on b.IDHangar = c.IDHangar
where b.FechaInicio = '2023-11-03';


--Ej e--
select distinct E.*
from Estacion E
join Acceso A on E.NumeroEstacion = A.NumeroEstacion
where A.HoraApertura = E.HoraApertura and A.HoraCierre = E.HoraCierre;


--Ej g--
select t.NumeroLinea, (r.FechaFin - r.FechaInicio) AS DiasEnReparacion
from Reservar r
join Tren t on r.IDTren = t.IDTren
where extract(year from r.FechaInicio) = 2023 and t.NumeroLinea in ('2', '4', '6', '8', '12');


--Ej i--
select *
from Estacion a
join Conectar b on a.NumeroEstacion = b.NumeroEstacion;


--Ej k--
select a.*, b.Telefono
from Conductor a
join Telefono b on a.CURP = b.CURP
where a.Sexo = 'F' and a.CURP not in (
      select CURP
      from Conducir
      where Turno <> 'M')
order by a.Nombre asc;


--Ej m--
select a.NumeroEstacion, b.*IDHangar, c.*, d.*
from Estacion a, Hangar b, Reservar c, Tren d
where a.NumeroEstacion = b.NumeroEstacion and b.IDHangar = c.IDHangar and c.IDTren = d.IDTren and a.NumeroEstacion % 2 = 1
order by a.NumeroEstacion asc;


--Ej o--
select Estado,Sexo,
count(*) as NumeroConductores
from Conductor
where DATE_PART('year', AGE(Nacimiento)) < 30
group by Estado, Sexo
order by Estado, Sexo;

--Ej q--
select *
from Conductor
where (Nombre ilike '%ALONSO%' or Paterno ilike '%ALONSO%' or Materno ilike '%ALONSO%') and Salario > (select avg(Salario) from Conductor);

--Ej s--
select a.*
from Conductor a
join Conducir b on a.CURP = b.CURP
join Tren c on b.IDTren = c.IDTren
where c.AnioFabrica > 2021
order by a.Nombre asc;

--Ej u--
select *
from Tren a
where a.Estatus = FALSE and not exists (
      select *
      from Conducir b
      where b.IDTren = a.IDTren and b.Fecha <= '2023-11-03');

--Ej w--
update Conductor
set Salario = Salario * 1.10
where DATE_PART('year', AGE(Nacimiento)) = 50;


--Ej y--
insert into Tren
values
    (1, 'A', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (2, 'A', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (3, 'A', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (4, 'A', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (5, 'A', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (6, 'B', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (7, 'B', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (8, 'B', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (9, 'B', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023),
    (10, 'B', 'Construcciones y Auxiliar de Ferrocarriles (CAF)', TRUE, 10, 2023);
