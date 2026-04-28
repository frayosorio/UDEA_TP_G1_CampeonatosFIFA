--Buscar un país por el nombre
SELECT * FROM pais
	WHERE pais like '%Congo%'

--Buscar varios paises por el nombre
SELECT * FROM pais
	WHERE pais IN ('Colombia', 'Portugal', 'Uzbekistán', 'República Democrática del Congo')

--Listar los campeonatos
SELECT * FROM campeonato

--Listar los paises que organizan campeonatos
SELECT * FROM campeonatopais

--Listar cada campeonato con sus paises organizadores
SELECT campeonato, año, STRING_AGG(pais, ', ') paisesorganizadores
	FROM campeonato
		JOIN campeonatopais on campeonato.id = campeonatopais.idcampeonato
		JOIN pais on pais.id = campeonatopais.idpais
	GROUP BY campeonato, año
	ORDER BY 1

--listar los estadios con sus ciudades y paises
SELECT pais,ciudad,estadio,capacidad
	FROM pais
	JOIN ciudad on pais.id = ciudad.idpais
	JOIN estadio on ciudad.id = estadio.idciudad
	ORDER BY 1,2,3

--Listar Grupos y Paises del Campeonato con ID=12 (Mundial FIFA 2026)
SELECT campeonato,grupo,pais,G.id
	FROM campeonato C
	LEFT JOIN grupo G on C.id = G.idcampeonato
	LEFT JOIN grupopais GP on G.id = GP.idgrupo
	LEFT JOIN pais P on GP.idpais = P.id
	WHERE C.id = 12
	ORDER BY 2, 3

--Agregar el grupo K al Campeonato con ID=12 (Mundial FIFA 2026)
INSERT INTO grupo
	(grupo,idcampeonato)
	VALUES ('K',12)

--Agregar pais con ID=1 (Colombia) al grupo con ID=29 (K)
INSERT INTO grupopais
	(idgrupo,idpais)
	VALUES (29,1)

--Agregar pais con ID=38 (Portugal) al grupo con ID=29 (K)
INSERT INTO grupopais
	(idgrupo,idpais)
	VALUES (29,38)

--Agregar al pais 'Uzbekistán'
INSERT INTO pais
	(pais,entidad)
	VALUES ('Uzbekistán','Federación de Fútbol de Uzbekistán')

--Agregar pais con ID=69 (Uzbekistán) al grupo con ID=29 (K)
INSERT INTO grupopais
	(idgrupo,idpais)
	VALUES (29,69)

--Agregar al pais 'República Democrática del Congo'
INSERT INTO pais
	(pais,entidad)
	VALUES ('República Democrática del Congo','Federación de Fútbol de la República Democrática del Congo')

--Agregar pais con ID=72 (RD Congo) al grupo con ID=29 (K)
INSERT INTO grupopais
	(idgrupo,idpais)
	VALUES (29,72)


--Eliminar los paises que organizan el campeonato Mundial FIFA 2026
DELETE FROM campeonatopais
	WHERE idcampeonato=12

--Eliminar los paises del grupo K
DELETE FROM grupopais
	WHERE idgrupo=29;

--Eliminar los grupos del campeonato Mundial FIFA 2026
DELETE FROM grupo G
	USING campeonato C 
	WHERE G.idcampeonato=C.id
	AND C.id=12


--Eliminar los paises con ID>69
DELETE FROM pais
	WHERE id>=69

--Contar los paises que hay registrados
SELECT COUNT(*)
	FROM pais