--Script para alimentar la información del Campeonato Mundial de la FIFA 2026 (Fase de Grupos)

--0. Asegurar que el autonumérico de los campos ID esté sincronizado
SELECT setval(
    pg_get_serial_sequence('pais', 'id'),
    (SELECT MAX(id) FROM pais)
	);

--1. Actualización de todos los paises

INSERT INTO pais
	(pais, entidad)
	VALUES 	('Australia', ''),
	('Irán', ''),
	('Irak', ''),
	('Japón', ''),
	('Jordania', ''),
	('Catar', ''),
	('Arabia Saudita', ''),
	('Corea del Sur', ''),
	('Uzbekistán', ''),
	('Argelia', ''),
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
	ON CONFLICT(pais) DO NOTHING ;

--2. Actualización del Campeonato
INSERT INTO campeonato
	(campeonato, año)
	VALUES('FIFA World Cup 2026', 2026)
	ON CONFLICT(campeonato) DO NOTHING ;

--3. Actualización de los Paises organizadores del Campeonato
INSERT INTO campeonatopais
	(idcampeonato, idpais)
	SELECT C.id, P.id
		FROM campeonato C, pais P
			WHERE pais IN ('México', 'Estados Unidos', 'Canadá')
				AND C.campeonato = 'FIFA World Cup 2026'
	ON CONFLICT(idcampeonato, idpais) DO NOTHING ;

--3. Actualización de Grupos
INSERT INTO grupo
	(idcampeonato, grupo)
	