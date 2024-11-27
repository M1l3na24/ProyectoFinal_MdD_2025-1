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
select (FechaFin - FechaInicio) as DiasEnReparacion
from reservar
where extract(year from FechaInicio) = 2023
  and idtren in (
      select idtren
      from tren
      where cast(numerolinea as INT) % 2 = 0);


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
