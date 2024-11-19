--Ej a--
select a.NumeroLinea, b.NumeroEstacion
from Linea a, Pertenecer b
where a.NumeroLinea = b.NumeroLinea;

--Ej c--
select a.IDTren, a.NumeroLinea, a.Marca, b.FechaInicio as FechaReparacion, c.IDHangar, c.NumeroEstacion
from Tren a
inner join Reservar b on a.IDTren = b.IDTren
inner join Hangar c on b.IDHangar = c.IDHangar
where b.FechaInicio = '2023-11-03';


--Ej e--
select *
from Estacion
where NumeroEstacion in (
    select NumeroEstacion
    from Acceso
    where HoraApertura = (select HoraApertura from Estacion where Acceso.NumeroEstacion = Estacion.NumeroEstacion)
    and HoraCierre = (select HoraCierre from Estacion where Acceso.NumeroEstacion = Estacion.NumeroEstacion));

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
      where Turno <> 'M');


--Ej m--
select *
from Estacion a, Hangar b, Reservar c, Tren d
where a.NumeroEstacion = b.NumeroEstacion and b.IDHangar = c.IDHangar and c.IDTren = d.IDTren and a.NumeroEstacion % 2 = 1;

--Ej o--
select count(*) 
from conductor a
where date_part('year', age(a.nacimiento)) < 30;

--Ej q--
select *
from Conductor
where (Nombre ilike '%ALONSO%' or Paterno ilike '%ALONSO%' or Materno ilike '%ALONSO%') and Salario > (select avg(Salario) from Conductor);

--Ej s--
select a.*
from Conductor a
join Conducir b on a.CURP = b.CURP
join Tren c on b.IDTren = c.IDTren
where c.AnioFabrica > 2021;

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
insert into Linea (NumeroLinea, Nombre)
values 
    ('A', 'Línea A'), 
    ('B', 'Línea B');

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


