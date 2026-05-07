DO $$
DECLARE
	nuevoIdPais INTEGER; nuevoIdCiudad INTEGER; nuevoIdEstadio INTEGER; nuevoIdEncuentro INTEGER;
	idRusia INTEGER; idCampeonatoRusia INTEGER;
	idCiudad1 INTEGER; idCiudad2 INTEGER; idCiudad3 INTEGER; idCiudad4 INTEGER; idCiudad5 INTEGER;
	idCiudad6 INTEGER; idCiudad7 INTEGER; idCiudad8 INTEGER; idCiudad9 INTEGER; idCiudad10 INTEGER; idCiudad11 INTEGER;
	idEstadio1 INTEGER; idEstadio2 INTEGER; idEstadio3 INTEGER; idEstadio4 INTEGER; idEstadio5 INTEGER; idEstadio6 INTEGER;	
	idEstadio7 INTEGER; idEstadio8 INTEGER; idEstadio9 INTEGER; idEstadio10 INTEGER; idEstadio11 INTEGER; idEstadio12 INTEGER;
	idGrupoA INTEGER; idPais1Grupo INTEGER; idPais2Grupo INTEGER; idPais3Grupo INTEGER; idPais4Grupo INTEGER;
	totalPaises INTEGER;
BEGIN
	--obtener el ID  para un nuevo PAIS
	SELECT MAX(id) + 1 INTO nuevoIdPais
		FROM pais;

	--obtener el pais organizador
	SELECT id INTO idRusia
		FROM pais
		WHERE pais='Rusia';
	IF idRusia IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'Rusia', 'Unión del Fútbol de Rusia');
		nuevoIdPais := nuevoIdPais + 1;
	END IF;
	
	--obtener el campeonato de RUSIA 2018
	SELECT id INTO idCampeonatoRusia
		FROM campeonato
		WHERE campeonato='FIFA World Cup 2018';
	IF idCampeonatoRusia IS NULL THEN
		SELECT MAX(id) + 1 INTO idCampeonatoRusia
			FROM campeonato;
		INSERT INTO campeonato
			(id, campeonato, idpais, año)
			VALUES(idCampeonatoRusia, 'FIFA World Cup 2018', idRusia, 2018);
	END IF;

	--Obtener Estadios
	SELECT MAX(id) + 1 INTO nuevoIdCiudad
		FROM ciudad;

	SELECT MAX(id) + 1 INTO nuevoIdEstadio
		FROM estadio;

	SELECT id INTO idCiudad1
		FROM ciudad
		WHERE ciudad='Moscú';
	IF idCiudad1 IS NULL THEN
		INSERT INTO ciudad
			(id, ciudad, idpais)
			VALUES(nuevoIdCiudad, 'Moscú', idRusia);
		idCiudad1 = nuevoIdCiudad;
		nuevoIdCiudad := nuevoIdCiudad + 1;
	END IF;

	SELECT id INTO idEstadio1
		FROM estadio
		WHERE estadio='Estadio Luzhniki';
	IF idEstadio1 IS NULL THEN
		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Estadio Luzhniki', idCiudad1, 78011);
		idEstadio1 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;

	SELECT id INTO idEstadio2
		FROM estadio
		WHERE estadio='Otkrytie Arena';
	IF idEstadio2 IS NULL THEN
		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Otkrytie Arena', idCiudad1, 44190);
		idEstadio2 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio3
		FROM estadio
		WHERE estadio='Estadio de San Petersburgo';
	IF idEstadio3 IS NULL THEN
		SELECT id INTO idCiudad2
			FROM ciudad
			WHERE ciudad='San Petersburgo';
		IF idCiudad2 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'San Petersburgo', idRusia);
			idCiudad2 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Estadio de San Petersburgo', idCiudad2, 64468);
		idEstadio3 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio4
		FROM estadio
		WHERE estadio='Estadio de Kaliningrado';
	IF idEstadio4 IS NULL THEN
		SELECT id INTO idCiudad3
			FROM ciudad
			WHERE ciudad='Kaliningrado';
		IF idCiudad3 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Kaliningrado', idRusia);
			idCiudad3 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Estadio de Kaliningrado', idCiudad3, 33973);
		idEstadio4 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio5
		FROM estadio
		WHERE estadio='Kazán Arena';
	IF idEstadio5 IS NULL THEN
		SELECT id INTO idCiudad4
			FROM ciudad
			WHERE ciudad='Kazán';
		IF idCiudad4 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Kazán', idRusia);
			idCiudad4 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Kazán Arena', idCiudad4, 42873);
		idEstadio5 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio6
		FROM estadio
		WHERE estadio='Óblast de Nizhni Nóvgorod';
	IF idEstadio6 IS NULL THEN
		SELECT id INTO idCiudad5
			FROM ciudad
			WHERE ciudad='Nizhni Nóvgorod';
		IF idCiudad5 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Nizhni Nóvgorod', idRusia);
			idCiudad5 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Óblast de Nizhni Nóvgorod', idCiudad5, 43319);
		idEstadio6 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio7
		FROM estadio
		WHERE estadio='Óblast de Samara';
	IF idEstadio7 IS NULL THEN
		SELECT id INTO idCiudad6
			FROM ciudad
			WHERE ciudad='Samara';
		IF idCiudad6 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Samara', idRusia);
			idCiudad6 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Óblast de Samara', idCiudad6, 41970);
		idEstadio7 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio8
		FROM estadio
		WHERE estadio='Óblast de Volgogrado';
	IF idEstadio8 IS NULL THEN
		SELECT id INTO idCiudad7
			FROM ciudad
			WHERE ciudad='Volgogrado';
		IF idCiudad7 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Volgogrado', idRusia);
			idCiudad7 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Óblast de Volgogrado', idCiudad7, 43713);
		idEstadio8 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio9
		FROM estadio
		WHERE estadio='Mordovia Arena';
	IF idEstadio9 IS NULL THEN
		SELECT id INTO idCiudad8
			FROM ciudad
			WHERE ciudad='Saransk';
		IF idCiudad8 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Saransk', idRusia);
			idCiudad8 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Mordovia Arena', idCiudad8, 41685);
		idEstadio9 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	


	SELECT id INTO idEstadio10
		FROM estadio
		WHERE estadio='Óblast de Rostov';
	IF idEstadio10 IS NULL THEN
		SELECT id INTO idCiudad9
			FROM ciudad
			WHERE ciudad='Rostov del Don';
		IF idCiudad9 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Rostov del Don', idRusia);
			idCiudad9 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Óblast de Rostov', idCiudad9, 43472);
		idEstadio10 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio11
		FROM estadio
		WHERE estadio='Krai de Krasnodar';
	IF idEstadio11 IS NULL THEN
		SELECT id INTO idCiudad10
			FROM ciudad
			WHERE ciudad='Sochi';
		IF idCiudad10 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Sochi', idRusia);
			idCiudad10 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Krai de Krasnodar', idCiudad10, 44287);
		idEstadio11 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	

	SELECT id INTO idEstadio12
		FROM estadio
		WHERE estadio='Ekaterimburgo Arena';
	IF idEstadio12 IS NULL THEN
		SELECT id INTO idCiudad11
			FROM ciudad
			WHERE ciudad='Ekaterimburgo';
		IF idCiudad11 IS NULL THEN
			INSERT INTO ciudad
				(id, ciudad, idpais)
				VALUES(nuevoIdCiudad, 'Ekaterimburgo', idRusia);
			idCiudad11 = nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;		

		INSERT INTO estadio
			(id, estadio, idciudad, capacidad)
			VALUES(nuevoIdEstadio, 'Ekaterimburgo Arena', idCiudad11, 33061);
		idEstadio12 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;	


	--obtener los grupos del campeonato
	SELECT id INTO idGrupoA
		FROM grupo
		WHERE grupo = 'A'
			AND idcampeonato = idCampeonatoRusia;

	IF idGrupoA IS NULL THEN
		SELECT MAX(id) + 1 INTO idGrupoA
			FROM grupo;
	
		INSERT INTO grupo
			(id, idcampeonato, grupo)
			VALUES
			(idGrupoA, idCampeonatoRusia, 'A'),
			(idGrupoA+1, idCampeonatoRusia, 'B'),
			(idGrupoA+2, idCampeonatoRusia, 'C'),
			(idGrupoA+3, idCampeonatoRusia, 'D'),
			(idGrupoA+4, idCampeonatoRusia, 'E'),
			(idGrupoA+5, idCampeonatoRusia, 'F'),
			(idGrupoA+6, idCampeonatoRusia, 'G'),
			(idGrupoA+7, idCampeonatoRusia, 'H');
	END IF;

	--obtener los paises del grupo A
	idPais1Grupo := idRusia;

	SELECT id INTO idPais2Grupo
		FROM pais
		WHERE pais='Arabia Saudita';
	IF idPais2Grupo IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'Arabia Saudita', '');
		idPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	SELECT id INTO idPais3Grupo
		FROM pais
		WHERE pais='Egipto';
	IF idPais3Grupo IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'Egipto', '');
		idPais3Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	SELECT id INTO idPais4Grupo
		FROM pais
		WHERE pais='Uruguay';
	IF idPais4Grupo IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'Uruguay', '');
		idPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE idgrupo = idGrupoA;
	IF totalPaises = 0 THEN
		INSERT INTO grupopais
			(idgrupo, idpais)
			VALUES
			(idGrupoA, idPais1Grupo),
			(idGrupoA, idPais2Grupo),
			(idGrupoA, idPais3Grupo),
			(idGrupoA, idPais4Grupo);
	END IF;

	--registrar los encuentros
	SELECT MAX(id) + 1 INTO nuevoIdEncuentro
			FROM encuentro;

	--Rusia 5 - 0 Arabia Saudita
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais1Grupo AND idpais2 = idPais2Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais1Grupo, 5, idPais2Grupo, 0, '2018-06-14', idEstadio1, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Egipto 0 - 1 Uruguay
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais3Grupo AND idpais2 = idPais4Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais3Grupo, 0, idPais4Grupo, 1, '2018-06-15', idEstadio12, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Rusia 3 - 1 Egipto
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais1Grupo AND idpais2 = idPais3Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais1Grupo, 3, idPais3Grupo, 1, '2018-06-19', idEstadio3, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Uruguay 1 - 0 Arabia Saudita
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais4Grupo AND idpais2 = idPais2Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais4Grupo, 1, idPais2Grupo, 0, '2018-06-20', idEstadio10, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Uruguay 3 - 0 Rusia
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais4Grupo AND idpais2 = idPais1Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais4Grupo, 3, idPais1Grupo, 0, '2018-06-25', idEstadio7, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Arabia Saudita 2 - 1 Egipto
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais2Grupo AND idpais2 = idPais3Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais2Grupo, 2, idPais3Grupo, 1, '2018-06-25', idEstadio8, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--obtener los paises del grupo B
	SELECT id INTO idPais1Grupo
		FROM pais
		WHERE pais='Marruecos';
	IF idPais1Grupo IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'Marruecos', '');
		idPais1Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	SELECT id INTO idPais2Grupo
		FROM pais
		WHERE pais='Irán';
	IF idPais2Grupo IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'Irán', '');
		idPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	SELECT id INTO idPais3Grupo
		FROM pais
		WHERE pais='Portugal';
	IF idPais3Grupo IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'Portugal', '');
		idPais3Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	SELECT id INTO idPais4Grupo
		FROM pais
		WHERE pais='España';
	IF idPais4Grupo IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'España', '');
		idPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	SELECT COUNT(*) INTO totalPaises
		FROM grupopais
		WHERE idgrupo = idGrupoA+1;
	IF totalPaises = 0 THEN
		INSERT INTO grupopais
			(idgrupo, idpais)
			VALUES
			(idGrupoA+1, idPais1Grupo),
			(idGrupoA+1, idPais2Grupo),
			(idGrupoA+1, idPais3Grupo),
			(idGrupoA+1, idPais4Grupo);
	END IF;

	--registrar los encuentros
	
	--Marruecos 0 - 1 Irán
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais1Grupo AND idpais2 = idPais2Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais1Grupo, 0, idPais2Grupo, 1, '2018-06-15', idEstadio3, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Portugal 3 - 3 España
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais3Grupo AND idpais2 = idPais4Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais3Grupo, 3, idPais4Grupo, 3, '2018-06-15', idEstadio11, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Portugal 1 - 0 Marruecos
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais3Grupo AND idpais2 = idPais1Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais3Grupo, 1, idPais1Grupo, 0, '2018-06-20', idEstadio1, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Irán 0 - 1 España
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais2Grupo AND idpais2 = idPais4Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais2Grupo, 0, idPais4Grupo, 1, '2018-06-20', idEstadio5, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--Irán 1 - 1 Portugal
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais2Grupo AND idpais2 = idPais3Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais2Grupo, 1, idPais3Grupo, 1, '2018-06-25', idEstadio9, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--España 2 - 2 Marruecos
	IF NOT EXISTS(SELECT * FROM encuentro
					WHERE idpais1 = idPais4Grupo AND idpais2 = idPais1Grupo
						AND idfase = 1 AND idcampeonato = idCampeonatoRusia) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES (nuevoIdEncuentro, idPais4Grupo, 2, idPais1Grupo, 2, '2018-06-25', idEstadio4, 1, idCampeonatoRusia);
		nuevoIdEncuentro = nuevoIdEncuentro + 1;
	END IF;

	--obtener los paises del grupo C
	INSERT INTO pais
		(id, pais, entidad)
		SELECT nuevoIdPais + ROW_NUMBER() OVER(), PN.pais, PN.entidad
			FROM(VALUES('Francia', ''),
						('Australia', ''),
						('Perú', ''),
						('Dinamarca', '')
				) PN(pais, entidad)
			WHERE NOT EXISTS(SELECT 1 FROM pais P WHERE P.pais=PN.pais);

	SELECT MAX(id) + 1 INTO nuevoIdPais
		FROM pais;
	
	SELECT id INTO idPais1Grupo
		FROM pais
		WHERE pais='Francia';
	SELECT id INTO idPais2Grupo
		FROM pais
		WHERE pais='Australia';
	SELECT id INTO idPais3Grupo
		FROM pais
		WHERE pais='Perú';
	SELECT id INTO idPais4Grupo
		FROM pais
		WHERE pais='Dinamarca';

	INSERT INTO grupopais
		(idgrupo, idpais)
		VALUES
		(idGrupoA+2, idPais1Grupo),
		(idGrupoA+2, idPais2Grupo),
		(idGrupoA+2, idPais3Grupo),
		(idGrupoA+2, idPais4Grupo)
	ON CONFLICT(idgrupo, idpais)
		DO NOTHING;

	--registrar los encuentros
	DROP TABLE IF EXISTS tmpEncuentros;
	
	CREATE TEMP TABLE tmpEncuentros(
		id int,
		idpais1 int, 
		idpais2 int, 
		idfase int, 
		idcampeonato int, 
		idestadio int, 
		fecha DATE, 
		goles1 int, 
		goles2 int
	);

	INSERT INTO tmpEncuentros
		(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
		VALUES(nuevoIdEncuentro, idPais1Grupo, 2, idPais2Grupo, 1, '2018-06-16', idestadio5, 1, idCampeonatoRusia),
			(nuevoIdEncuentro+1,  idPais3Grupo, 0, idPais4Grupo, 1, '2018-06-16', idestadio9, 1, idCampeonatoRusia),
			(nuevoIdEncuentro+2, idPais4Grupo, 1, idPais2Grupo, 1, '2018-06-21', idestadio7, 1, idCampeonatoRusia),
			(nuevoIdEncuentro+3, idPais1Grupo, 1, idPais3Grupo, 0, '2018-06-21', idestadio12, 1, idCampeonatoRusia),
			(nuevoIdEncuentro+4, idPais4Grupo, 0, idPais1Grupo, 0, '2018-06-26', idestadio1, 1, idCampeonatoRusia),
			(nuevoIdEncuentro+5, idPais2Grupo, 0, idPais3Grupo, 2, '2018-06-26', idestadio11, 1, idCampeonatoRusia);

	INSERT INTO encuentro
		(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
		SELECT id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato
			FROM tmpEncuentros
		ON CONFLICT(idpais1, idpais2, idfase, idcampeonato)
			DO UPDATE
				SET goles1 = EXCLUDED.goles1,
					goles2 = EXCLUDED.goles2,
					idestadio = EXCLUDED.idestadio,
					fecha = EXCLUDED.fecha;
	
	DROP TABLE IF EXISTS tmpEncuentros;
END $$;