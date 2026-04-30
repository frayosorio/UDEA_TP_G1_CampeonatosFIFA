--Script para alimentar la información del Campeonato Mundial de la FIFA 2026 (Fase de Grupos)

--0. Asegurar que el autonumérico de los campos ID esté sincronizado
SELECT setval(
    pg_get_serial_sequence('pais', 'id'),
    (SELECT MAX(id) FROM pais)
	);

SELECT setval(
    pg_get_serial_sequence('campeonato', 'id'),
    (SELECT MAX(id) FROM campeonato)
	);

SELECT setval(
    pg_get_serial_sequence('grupo', 'id'),
    (SELECT MAX(id) FROM grupo)
	);

--1. Actualización de todos los paises

INSERT INTO pais
	(pais, entidad)
	VALUES 	('Australia', 'Football Australia'),
	('Irán', 'Federación de Fútbol de Irán'),
	('Irak', 'Federación Iraquí de Fútbol'),
	('Japón', 'Asociación de Fútbol de Japón'),
	('Jordania', 'Federación de Fútbol de Jordania'),
	('Catar', ''),
	('Arabia Saudita', ''),
	('Corea del Sur', ''),
	('Uzbekistán', ''),
	('Argelia', 'Federación Argelina de Fútbol'),
	('Cabo Verde', ''),
	('República Democrática del Congo', ''),
	('Egipto', ''),
	('Ghana', ''),
	('Costa de Marfil', ''),
	('Marruecos', ''),
	('Senegal', ''),
	('Sudáfrica', ''),
	('Túnez', ''),
	('Canadá', ''),
	('Curaçao', ''),
	('Haití', ''),
	('México', ''),
	('Panamá', ''),
	('Estados Unidos', ''),
	('Argentina', ''),
	('Brasil', ''),
	('Colombia', ''),
	('Ecuador', ''),
	('Paraguay', ''),
	('Uruguay', ''),
	('Nueva Zelanda', ''),
	('Austria', ''),
	('Bélgica', ''),
	('Bosnia y Herzegovina', ''),
	('Croacia', ''),
	('República Checa', ''),
	('Inglaterra', ''),
	('Francia', ''),
	('Alemania', ''),
	('Países Bajos', ''),
	('Noruega', ''),
	('Portugal', ''),
	('Escocia', ''),
	('España', ''),
	('Suecia', ''),
	('Suiza', ''),
	('Turquía', '')
	ON CONFLICT(pais) 
	DO UPDATE
		SET entidad = excluded.entidad
		WHERE excluded.entidad<>'';

--2. Actualización del Campeonato
INSERT INTO campeonato
	(campeonato, año)
	VALUES('FIFA World Cup 2026', 2026)
	ON CONFLICT(campeonato) 
	DO UPDATE
		SET año = excluded.año;

--3. Actualización de los Paises organizadores del Campeonato
INSERT INTO campeonatopais
	(idcampeonato, idpais)
	SELECT C.id, P.id
		FROM campeonato C, pais P
			WHERE pais IN ('México', 'Estados Unidos', 'Canadá')
				AND C.campeonato = 'FIFA World Cup 2026'
	ON CONFLICT(idcampeonato, idpais) DO NOTHING ;

--4. Actualización de Grupos
INSERT INTO grupo
	(idcampeonato, grupo)
	SELECT C.id, G.grupo
		FROM campeonato C
			JOIN (
				VALUES('A'), ('B'), ('C'), ('D'),
        		('E'), ('F'), ('G'), ('H'),
				('I'), ('J'), ('K'), ('L')
			) G(grupo)
			ON C.campeonato = 'FIFA World Cup 2026'
	ON CONFLICT(idcampeonato, grupo) DO NOTHING;
	
--5. Actualización de los paises en los grupos
INSERT INTO grupopais
	(idgrupo, idpais)
	SELECT G.id, P.id
		FROM grupo G
			JOIN campeonato C
				ON C.id = G.idcampeonato AND C.campeonato = 'FIFA World Cup 2026'
			JOIN (
				VALUES
				('México', 'A'),
				('Sudáfrica', 'A'),
				('Corea del Sur','A'),
				('República Checa','A'),
		
				('Canadá','B'),
				('Suiza','B'),
				('Catar','B'),
				('Bosnia y Herzegovina','B'),
		
				('Brasil','C'),
				('Marruecos','C'),
				('Escocia','C'),
				('Haití','C'),
		
				('Estados Unidos','D'),
				('Paraguay','D'),
				('Australia','D'),
				('Turquía','D'),
		
				('Alemania','E'),
				('Ecuador','E'),
				('Costa de Marfil','E'),
				('Curaçao','E'),
		
				('Países Bajos','F'),
				('Japón','F'),
				('Suecia','F'),
				('Túnez','F'),
		
				('Bélgica','G'),
				('Egipto','G'),
				('Irán','G'),
				('Nueva Zelanda','G'),
		
				('España','H'),
				('Uruguay','H'),
				('Arabia Saudita','H'),
				('Cabo Verde','H'),
		
				('Francia','I'),
				('Senegal','I'),
				('Noruega','I'),
				('Irak','I'),
		
				('Argentina','J'),
				('Argelia','J'),
				('Austria','J'),
				('Jordania','J'),
		
				('Portugal','K'),
				('República Democrática del Congo','K'),
				('Uzbekistán','K'),
				('Colombia','K'),
		
				('Inglaterra','L'),
				('Croacia','L'),
				('Ghana','L'),
				('Panamá','L')
				) datos(pais, grupo)
				ON G.grupo = datos.grupo
			JOIN pais P
				ON datos.pais = P.pais
	ON CONFLICT(idgrupo, idpais) DO NOTHING;

--6. Actualización de Ciudades
INSERT INTO ciudad
	(ciudad, idpais)
	SELECT datos.ciudad, P.id
		FROM (
				VALUES
				('México D.F.','México'),
				('Guadalajara','México'),
				('Monterrey','México'),
				('Atlanta','Estados Unidos'),
				('Boston','Estados Unidos'),
				('Dallas','Estados Unidos'),
				('Houston','Estados Unidos'),
				('Kansas City','Estados Unidos'),
				('Los Ángeles','Estados Unidos'),
				('Miami','Estados Unidos'),
				('Nueva Jersey','Estados Unidos'),
				('Filadelfia','Estados Unidos'),
				('San Francisco','Estados Unidos'),
				('Seattle','Estados Unidos'),
				('Toronto','Canadá'),
				('Vancouver','Canadá')
				) datos(ciudad, pais)
			JOIN pais P
				ON P.pais = datos.pais
	ON CONFLICT(ciudad, idpais) DO NOTHING
				