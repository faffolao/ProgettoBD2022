-- 8.Inserimento nuovo utente dei social network
INSERT INTO Utente(url,nome,cognome,nickname)
VALUES('https://twitter.com/diobrando_en', 'Dio', 'Brando', 'diobrando_en');

-- 9.Inserimento contenuti testuali dei social network
INSERT INTO Post(
	url,
	data_ora,
	piattaforma_provenienza,
	testo,
	id_zona,
	id_utente
)
VALUES(
	'https://twitter.com/sulsitodisimone/status/1607975389732683777',
	-3124419596,
	'twitter',
	"28 Dicembre 1870 � A Roma si verifica un'inondazione per uno straordinario straripamento del Tevere",
	5,
	31
);

-- 10.Inserimento contenuti multimediali dei social network

INSERT INTO FileMultimediale(
	url,
	tipologia,
	id_post,
	id_segnalazione
)
VALUES(
	'https://pbs.twimg.com/media/FlCtGHLX0AIwTvQ?format=png',
	'post',
	15,
	null
);

-- 11.Inserimento nuovo utente della piattaforma proprietaria

INSERT INTO UtentePiattaforma(
	url,
	nome,
	cognome,
	nickname
)
VALUES(
	'https://piattaformaproprietariaprogettorio.eu/u/mario-mario-8273',
	'Mario',
	'Mario',
	'MarioMario#8273'
);

-- 12.Inserimento segnalazione evento straordinario

INSERT INTO Segnalazione(
	commento,
	tipologia,
	url_post,
	situazione_di_pericolo,
	data_ora,
	zona,
	grado_attendibilita,
	id_utente
)
VALUES(
	'fiume musone straripato a Porto Recanati',
	'evento',
	null,
	'inondazione',
	1970-01-01 00:00:00,
	51,
	null,
	42
);

-- 32.Visualizza lista collaboratori

SELECT * FROM Collaboratori;

-- 33.Visualizza lista Sensori

SELECT * FROM Sensori;

-- 34.Visualizza sessioni di campionamento

SELECT * FROM SessioneCampionamento;

-- 35.Visualizza dati ottenuti dalla sessione di campionamento

SELECT Misurazione.id, Misurazione.valore_rilevato, Misurazione.timestamp, Misurazione.matricola_sensore
FROM SessioneCampionamento
JOIN Misurazione ON SessioneCampionamento.id = Misurazione.id_sessione
WHERE SessioneCampionamento.data_ora = 2001-09-11 16:15;

-- 22.Cancellazione collaboratore

DELETE FROM Collaboratore WHERE id=420;

-- 23.Cancellazione sensore

DELETE FROM Sensore WHERE matricola=47;

-- 24.Cancellazione sessioni di campionamento effettuate in un certo anno

DELETE SessioneCampionamento,Misurazione
FROM SessioneCampionamento JOIN Misurazione
ON SessioneCampionamento.id=Misurazione.id_sessione
WHERE SessioneCampionamento.data_ora < 2019-01-01 00:00
AND SessioneCampionamento.data_ora >= 2018-01-01 00:00;

-- 25.Cancellazione contenuti testuali dei social network

DELETE FROM Post
WHERE data_ora < 2019-01-01 00:00
AND data_ora >= 2018-01-01 00:00;
