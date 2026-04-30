--Listar los 48 paises del campeonato MUNDIAL FIFA 2026
SELECT * FROM pais
	WHERE pais IN 
	('Australia',
	'Irán',
	'Irak',
	'Japón',
	'Jordania',
	'Catar',
	'Arabia Saudita',
	'Corea del Sur',
	'Uzbekistán',
	'Argelia',
	'Cabo Verde',
	'República Democrática del Congo',
	'Egipto',
	'Ghana',
	'Costa de Marfil',
	'Marruecos',
	'Senegal',
	'Sudáfrica',
	'Túnez',
	'Canadá',
	'Curaçao',
	'Haití',
	'México',
	'Panamá',
	'Estados Unidos',
	'Argentina',
	'Brasil',
	'Colombia',
	'Ecuador',
	'Paraguay',
	'Uruguay',
	'Nueva Zelanda',
	'Austria',
	'Bélgica',
	'Bosnia y Herzegovina',
	'Croacia',
	'República Checa',
	'Inglaterra',
	'Francia',
	'Alemania',
	'Países Bajos',
	'Noruega',
	'Portugal',
	'Escocia',
	'España',
	'Suecia',
	'Suiza',
	'Turquía')
	ORDER BY pais;

--Listar paises organizadores del campeonato
SELECT C.id, campeonato, año, STRING_AGG(pais, ', ') paisesorganizadores
	FROM campeonato C
		JOIN campeonatopais CP ON C.id = CP.idcampeonato
		JOIN pais PO ON PO.id = CP.idpais
	WHERE C.campeonato = 'FIFA World Cup 2026'
	GROUP BY C.id, campeonato, año


--Listar campeonato con los grupos y los paises
SELECT campeonato, año, grupo, G.id, pais, P.id, P.entidad
	FROM campeonato C
		LEFT JOIN grupo G ON G.idcampeonato = C.id
		LEFT JOIN grupopais GP ON GP.idgrupo = G.id
		LEFT JOIN pais P ON P.id = GP.idpais
	WHERE C.campeonato = 'FIFA World Cup 2026'

SELECT campeonato, año, grupo, G.id, STRING_AGG(pais, ', ') paises
	FROM campeonato C
		LEFT JOIN grupo G ON G.idcampeonato = C.id
		LEFT JOIN grupopais GP ON GP.idgrupo = G.id
		LEFT JOIN pais P ON P.id = GP.idpais
	WHERE C.campeonato = 'FIFA World Cup 2026'
	GROUP BY campeonato, año, grupo, G.id

--Listar los grupos llamados 'A'
SELECT * FROM grupo
	WHERE grupo='A'

--Listar los estadios y sus ciudades
SELECT P.pais, C.ciudad, E.estadio, E.capacidad
	FROM pais P
		JOIN ciudad C ON P.id = C.idpais
		LEFT JOIN estadio E ON E.idciudad = C.id
	WHERE P.pais IN ('México', 'Estados Unidos', 'Canadá')
	

--Eliminar todos los paises de los grupos del campeonato con ID=12 (Campoenato Mundial 2026)
DELETE FROM grupopais GP
	USING grupo G
	WHERE GP.idgrupo = G.id
	  AND G.idcampeonato = 12;

--Eliminar todos los grupos del campeonato con ID=12 (Campeonato Mundial 2026)
DELETE FROM grupo
	WHERE idcampeonato=12

--Eliminar los encuentros jugados en los estadios y ciudades de los paises organizadores (Campeonato Mundial 2026)
DELETE FROM encuentro EN
	USING estadio ES
		JOIN ciudad C ON C.id = ES.idciudad
		JOIN pais P ON C.idpais = P.id
	WHERE EN.idestadio= ES.id
	  AND P.pais IN ('México', 'Estados Unidos', 'Canadá')


--Eliminar los estadios de ciudades de los paises organizadores (Campeonato Mundial 2026)
DELETE FROM estadio E
	USING ciudad C
		JOIN pais P ON C.idpais = P.id
	WHERE E.idciudad = C.id
	  AND P.pais IN ('México', 'Estados Unidos', 'Canadá')

--Eliminar las ciudades de los paises organizadores (Campeonato Mundial 2026)
DELETE FROM ciudad C
	USING pais P
	WHERE C.idpais = P.id
	  AND P.pais IN ('México', 'Estados Unidos', 'Canadá')


	