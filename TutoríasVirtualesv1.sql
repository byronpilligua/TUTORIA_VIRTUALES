CREATE TABLE public.empresa (
	id_empresa character(10) NOT NULL,
	ruc_empresa character(10),
	nom_empresa character(50),
	dirc_empresa character(60),
	telf_empresa character(15),
	email_empresa character(50),
	ciudad_empresa character(30),
	pais_empresa character(30),
	CONSTRAINT empresa_pk PRIMARY KEY (id_empresa)

);

CREATE TABLE public.tutor (
	id_tutor character(10) NOT NULL,
	nom_tutor character(50),
	apell_tutor character(50),
	email_tutor character(50),
	telf_tutor character(15),
	direc_tutor character(50),
	ciudad_tutor character(30),
	pais_tutor character(30),
	profesion_tutor character(30),
	residencia_tutor character(30),
	enlace_web_tutor character(100),
	grado_academico_tutor character(50),
	tipo_contrato_tutor character(3),
	CONSTRAINT tutor_pk PRIMARY KEY (id_tutor)

);

CREATE TABLE public.tutorado (
	id_tutorado character(10) NOT NULL,
	nom_tutorado character(50),
	apell_tutorado character(50),
	email_tutorado character(50),
	telf_tutorado character(15),
	direc_tutorado character(50),
	ciudad_tutorado character(30),
	provincia_tutorado character(30),
	pais_tutorado character(30),
	profesion_tutorado character(30),
	area_tutoria_tutorado character(30),
	residencia_tutorado character(30),
	id_institucion_institucion character(10) NOT NULL,
	CONSTRAINT tutorado_pk PRIMARY KEY (id_tutorado)

);

CREATE TABLE public.tutoria (
	id_tutoria character(10) NOT NULL,
	tema_tutoria character(60),
	descrip_tutoria character(60),
	duracion_tutoria character(20),
	hora_inicio_tutoria character(20),
	hora_final_tutoria character(20),
	grupo_sala_tutoria character(25),
	enlace_acceso_tutoria character(150),
	costo_tutoria numeric(5,2),
	id_tutorado_tutorado character(10) NOT NULL,
	id_empresa_empresa character(10) NOT NULL,
	id_tutor_tutor character(10) NOT NULL,
	id_servicio_servicio_online character(10) NOT NULL,
	CONSTRAINT tutoria_pk PRIMARY KEY (id_tutoria)

);

CREATE TABLE public.servicio_online (
	id_servicio character(10) NOT NULL,
	nomb_servicio character(30),
	costo_servicio numeric(5,2),
	id_empresa_empresa character(10) NOT NULL,
	CONSTRAINT servicios_online_pk PRIMARY KEY (id_servicio)

);

CREATE TABLE public.descripcion_tutoria (
	id_descripcion character(10) NOT NULL,
	fecha_tutoria date,
	estado_de_tutoria boolean,
	nivel_sastifaccion_tutoria character(20),
	id_tutoria_tutoria character(10) NOT NULL,
	CONSTRAINT descripcion_tutoria_pk PRIMARY KEY (id_descripcion)

);

CREATE TABLE public.institucion (
	id_institucion character(10) NOT NULL,
	ruc_institucion character(10),
	nom_institucion character(50),
	dirc_institucion character(60),
	telf_institucion character(15),
	email_institucion character(50),
	ciudad_institucion character(30),
	pais_institucion character(30),
	CONSTRAINT institucion_pk PRIMARY KEY (id_institucion)

);

ALTER TABLE public.tutorado ADD CONSTRAINT institucion_fk FOREIGN KEY (id_institucion_institucion)
REFERENCES public.institucion (id_institucion) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.tutoria ADD CONSTRAINT empresa_fk FOREIGN KEY (id_empresa_empresa)
REFERENCES public.empresa (id_empresa) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.tutoria ADD CONSTRAINT tutor_fk FOREIGN KEY (id_tutor_tutor)
REFERENCES public.tutor (id_tutor) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.tutoria ADD CONSTRAINT servicio_online_fk FOREIGN KEY (id_servicio_servicio_online)
REFERENCES public.servicio_online (id_servicio) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.tutoria ADD CONSTRAINT tutorado_fk FOREIGN KEY (id_tutorado_tutorado)
REFERENCES public.tutorado (id_tutorado) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.servicio_online ADD CONSTRAINT empresa_fk FOREIGN KEY (id_empresa_empresa)
REFERENCES public.empresa (id_empresa) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.descripcion_tutoria ADD CONSTRAINT tutoria_fk FOREIGN KEY (id_tutoria_tutoria)
REFERENCES public.tutoria (id_tutoria) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;




--								INSERT							--

--	EMPRESA
insert into empresa values ('empresa001','1768152560','Software para Educación',
							'calle 13 entre avenidas 7 y 8 edificio Luizan','+593 998878754',
							'softwareEducacion@gmail.com','Manta','Ecuador');


--	INSTITUCIÓN
insert into institucion values ('institu001','1715457584','ULEAM',
							'Av. Circunvalacion, Manta','(05) 262-0288',
							'contacto@uleam.edu.ec','Manta','Ecuador');


--TUTOR
insert into tutor values ('tutor00001','Juan Jose','Zambrano Lucas',
							'josezambrano@hotmail.com','+593 995787154',
							'calle 15 av 32', 'Manta','Ecuador', 'Lic en Comunicacion','Ecuador',
							'https://ec.linkedin.com/juan_zambrano', 'Cuarto nivel', 'int');
insert into tutor values ('tutor00002','Pedro Alexander','Macias Delgado',
							'pedromacias@hotmail.com','+593 998554125',
							'calle 32 av 12', 'Portoviejo','Ecuador', 'Ing Electrico','Ecuador',
							'https://ec.linkedin.com/pedro_macias', 'Cuarto nivel', 'int');
insert into tutor values ('tutor00003','Alexander Jesus','Palacios Andrade',
							'alexanderpalacios@hotmail.com','+593 993321541',
							'calle 2 av 15', 'Quito','Ecuador', 'Ing Sistemas','Ecuador',
							'https://ec.linkedin.com/alexanderpalacios', 'tercer nivel', 'int');
insert into tutor values ('tutor00004','Jesus Fernando','Santana Alcivar',
							'jesussantana@hotmail.com','+52 9931145457',
							'calle 18 av 4', 'CD MX','México', 'Ing Software','México',
							'https://ec.linkedin.com/jesussantana', 'Cuarto nivel', 'ext');
insert into tutor values ('tutor00005','Luis Fernando','Perez Lopez',
							'luislopez@hotmail.com','+51 9931145457',
							'calle 18 av 4', 'Ica','Perú', 'Ing Software','Colombia',
							'https://ec.linkedin.com/luisperez', 'Tercer nivel', 'ext');


--TUTORADO
insert into tutorado values ('tutord0001','Carlos Andres','Mendoza Palma',
							'carlosmendoza@hotmail.com','+593 998898745',
							'calle 15 av 32', 'Manta', 'Manabí','Ecuador', 'Estudiante IS','Matemáticas',
							'Ecuador', 'institu001');
insert into tutorado values ('tutord0002','Fabian Geovani','Zamora Jaume',
							'fabianzamora@hotmail.com','+593 993332121',
							'calle 5 av 11', 'Montecristi', 'Manabí','Ecuador', 'Estudiante IS','Gestión de DB',
							'Ecuador', 'institu001');
insert into tutorado values ('tutord0003','Geovani Leonel','Jaume Gonzalez',
							'geovanijaume@hotmail.com','+593 984575515',
							'calle 34 av 25', 'Portoviejo', 'Manabí','Ecuador', 'Estudiante TI','Ing Software',
							'Ecuador', 'institu001');
insert into tutorado values ('tutord0004','Alexander David','Fernandez Suarez',
							'alexanderdernandex@hotmail.com','+593 998885585',
							'calle 34 av 4', 'Guayaquil', 'Guayas','Ecuador', 'Estudiante TI','Ing Software',
							'Ecuador', 'institu001');
insert into tutorado values ('tutord0005','David Gustavo','Suarez Mendoza',
							'davidsuarez@hotmail.com','+593 900121210',
							'calle 34 av 25', 'Durán', 'Guayas','Ecuador', 'Estudiante SI','Gestión DB',
							'Ecuador', 'institu001');
insert into tutorado values ('tutord0006','Julio Cesar','Garcia Suarez',
							'juliogarcia@hotmail.com','+52 3541104445',
							'calle 34 av 4', 'Toluca', 'Estado de México','México', 'Estudiante TI','Ing Software',
							'México', 'institu001');
insert into tutorado values ('tutord0007','Gustavo A','Mendoza Lopez',
							'gustavosuarez@hotmail.com','+52 3541114478',
							'calle 34 av 25', 'Ecatepec', 'Estado de México','México', 'Estudiante SI','Gestión DB',
							'México', 'institu001');
														

--SERVICIO ONLINE
insert into servicio_online values ('servi00001','Zoom','40.00', 'empresa001');
insert into servicio_online values ('servi00002','Microsoft Teams','35.00', 'empresa001');
insert into servicio_online values ('servi00003','Skype ','40.00', 'empresa001');



--SERVICIO TUTORIA
insert into tutoria values ('tuto000001','Modelado de datos','Explicación del análisis y uso de los modelos de datos',
							'2 horas','08:00 am', '10:00 am', 'Grupo1', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0001','empresa001', 'tutor00003', 'servi00001');
insert into tutoria values ('tuto000002','Modelado de datos','Explicación del análisis y uso de los modelos de datos',
							'2 horas','08:00 am', '10:00 am', 'Grupo1', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0003','empresa001', 'tutor00001', 'servi00001');
insert into tutoria values ('tuto000003','Modelado de datos','Explicación del análisis y uso de los modelos de datos',
							'2 horas','08:00 am', '10:00 am', 'Grupo1', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0003','empresa001', 'tutor00003', 'servi00001');
insert into tutoria values ('tuto000004','Modelado de datos','Explicación del análisis y uso de los modelos de datos',
							'2 horas','10:00 am', '12:00 am', 'Grupo2', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0001','empresa001', 'tutor00004', 'servi00002');
insert into tutoria values ('tuto000005','Modelado de datos','Explicación del análisis y uso de los modelos de datos',
							'2 horas','10:00 am', '12:00 am', 'Grupo2', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0006','empresa001', 'tutor00004', 'servi00002');
insert into tutoria values ('tuto000006','Arquitectura ANSI/SPARC','Explicación de modelos de datos',
							'2 horas','14:00 pm', '16:00 pm', 'Grupo2', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0006','empresa001', 'tutor00004', 'servi00003');
insert into tutoria values ('tuto000007','Arquitectura ANSI/SPARC','Explicación de modelos de datos',
							'2 horas','14:00 pm', '16:00 pm', 'Grupo3', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0005','empresa001', 'tutor00005', 'servi00003');
insert into tutoria values ('tuto000008','Arquitectura ANSI/SPARC','Explicación de modelos de datos',
							'2 horas','14:00 pm', '16:00 pm', 'Grupo3', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0001','empresa001', 'tutor00005', 'servi00003');
insert into tutoria values ('tuto000009','Arquitectura ANSI/SPARC','Explicación de modelos de datos',
							'2 horas','14:00 pm', '16:00 pm', 'Grupo3', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0007','empresa001', 'tutor00005', 'servi00003');
insert into tutoria values ('tuto000010','Arquitectura ANSI/SPARC','Explicación de modelos de datos',
							'2 horas','14:00 pm', '16:00 pm', 'Grupo1', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0007','empresa001', 'tutor00004', 'servi00003');
insert into tutoria values ('tuto000011','Diagramas UML','Explicación de diagramas',
							'2 horas','14:00 pm', '16:00 pm', 'Grupo6', 'https://us04web.zoom.us/grupu1','5.00',
							'tutord0001','empresa001', 'tutor00001', 'servi00001');


--DESCRIPCION TUTORIA
insert into descripcion_tutoria values ('desc000001','22/12/2020','1', 'Excelente','tuto000001');
insert into descripcion_tutoria values ('desc000002','22/12/2020','1', 'Excelente','tuto000002');
insert into descripcion_tutoria values ('desc000003','25/12/2020','0', '','tuto000003');
insert into descripcion_tutoria values ('desc000004','10/01/2021','1', 'Bueno','tuto000004');
insert into descripcion_tutoria values ('desc000005','10/01/2020','1', 'Regular','tuto000005');
insert into descripcion_tutoria values ('desc000006','22/01/2021','1', 'Excelente','tuto000006');
insert into descripcion_tutoria values ('desc000007','22/01/2021','1', 'Excelente','tuto000007');
insert into descripcion_tutoria values ('desc000008','23/01/2021','0', '','tuto000008');
insert into descripcion_tutoria values ('desc000009','23/01/2021','1', 'Excelente','tuto000009');
insert into descripcion_tutoria values ('desc000010','24/02/2021','1', 'Excelente','tuto000010');
insert into descripcion_tutoria values ('desc000011','24/02/2021','1', 'Excelente','tuto000011');





--									CONSULTAS							--
/*
	Mostrar el top descendente a todos los profesores que han dado tutorías, 
	deben listarse primero el grupo de los tutores externos y luego los de contratación propia. 
*/
SELECT 
  tutor.id_tutor as codigo_tutor, 
  tutor.nom_tutor as nombre_tutor,
  count(id_tutorado) as cantidad_tutorias, 
  tutor.tipo_contrato_tutor as tutor_interno_externo
FROM public.descripcion_tutoria
	inner join public.tutoria on descripcion_tutoria.id_tutoria_tutoria = tutoria.id_tutoria
	inner join public.empresa on empresa.id_empresa = tutoria.id_empresa_empresa
	inner join public.servicio_online on servicio_online.id_servicio = tutoria.id_servicio_servicio_online
  	inner join public.tutor on   tutor.id_tutor = tutoria.id_tutor_tutor
  	inner join public.tutorado on tutorado.id_tutorado = tutoria.id_tutorado_tutorado
where 
	descripcion_tutoria.estado_de_tutoria != 'false'
	GROUP BY  id_tutor, estado_de_tutoria
	ORDER BY  tipo_contrato_tutor asc;
	
	


--	Mostrar por año y mes cuanto la empresa ha recibido en ingresos por tutorías.
SELECT 
  empresa.nom_empresa as nombre_empresa, 
  sum(servicio_online.costo_servicio) as ingresos
FROM public.descripcion_tutoria
	inner join public.tutoria on descripcion_tutoria.id_tutoria_tutoria = tutoria.id_tutoria
	inner join public.empresa on empresa.id_empresa = tutoria.id_empresa_empresa
	inner join public.servicio_online on servicio_online.id_servicio = tutoria.id_servicio_servicio_online
  	inner join public.tutor on   tutor.id_tutor = tutoria.id_tutor_tutor
  	inner join public.tutorado on tutorado.id_tutorado = tutoria.id_tutorado_tutorado
WHERE (descripcion_tutoria.fecha_tutoria >= '01/01/2020' AND 
	descripcion_tutoria.fecha_tutoria < '1/1/2021')
  Group by id_empresa, nombre_empresa;
	
	
-- 	Mostrar por país y por provincia la cantidad de estudiantes a los que el centro ha dado tutorías.
SELECT 
  empresa.nom_empresa,
  tutorado.provincia_tutorado as provincia, 
  tutorado.pais_tutorado as pais,
  count(id_tutorado) as cantidad_tutoria_provincia
FROM public.descripcion_tutoria
	inner join public.tutoria on descripcion_tutoria.id_tutoria_tutoria = tutoria.id_tutoria
	inner join public.empresa on empresa.id_empresa = tutoria.id_empresa_empresa
	inner join public.servicio_online on servicio_online.id_servicio = tutoria.id_servicio_servicio_online
  	inner join public.tutor on   tutor.id_tutor = tutoria.id_tutor_tutor
  	inner join public.tutorado on tutorado.id_tutorado = tutoria.id_tutorado_tutorado
 Where pais_tutorado = 'Ecuador' 
 Group by nom_empresa, provincia_tutorado, pais_tutorado
 Order by cantidad_tutoria_provincia desc;
 
 
--	Mostrar por año la cantidad de propuestas de tutoría rechazadas. 
SELECT 
  empresa.nom_empresa as nombre_empresa, 
  descripcion_tutoria.fecha_tutoria as fecha_tutoria,
  count(descripcion_tutoria.fecha_tutoria) as cantidad_rechazada,
  descripcion_tutoria.estado_de_tutoria as estado_tutoria
FROM public.descripcion_tutoria
	inner join public.tutoria on descripcion_tutoria.id_tutoria_tutoria = tutoria.id_tutoria
	inner join public.empresa on empresa.id_empresa = tutoria.id_empresa_empresa
	inner join public.servicio_online on servicio_online.id_servicio = tutoria.id_servicio_servicio_online
  	inner join public.tutor on   tutor.id_tutor = tutoria.id_tutor_tutor
  	inner join public.tutorado on tutorado.id_tutorado = tutoria.id_tutorado_tutorado
 Where (fecha_tutoria >= '01/01/2020' and fecha_tutoria < '01/01/2022') and (estado_de_tutoria != 'true')
 Group by fecha_tutoria, nom_empresa, estado_de_tutoria;
 
 