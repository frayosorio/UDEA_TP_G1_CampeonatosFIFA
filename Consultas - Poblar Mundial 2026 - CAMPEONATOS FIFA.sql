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
	'Turquía');

--Listar paises organizadores del campeonato
SELECT campeonato, año, STRING_AGG(pais, ', ') paisesorganizadores
	FROM campeonato C
		JOIN campeonatopais CP ON C.id = CP.idcampeonato
		JOIN pais PO ON PO.id = CP.idpais
	WHERE C.campeonato = 'FIFA World Cup 2026'
	GROUP BY campeonato, año


--Listar campeonato con los grupos y los paises
SELECT campeonato, año
	FROM campeonato C
		JOIN grupo G ON G.idcampeonato = C.id
	WHERE C.campeonato = 'FIFA World Cup 2026'
	GROUP BY campeonato, año
	
	