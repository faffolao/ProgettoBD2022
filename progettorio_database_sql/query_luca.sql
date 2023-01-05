-- 8.Inserimento nuovo utente dei social network
INSERT INTO Utente(url, nome, cognome, nickname)
VALUES('https://twitter.com/brandoboy_09', 'Brando', 'Della Rovere', 'brandoboy_09');

-- 9.Inserimento contenuti testuali dei social network
INSERT INTO Post(url, data_ora, piattaforma_provenienza, testo, id_zona, id_utente)
VALUES('https://twitter.com/sulsitodisimone/status/1607975389732683777', '2022-09-16', 'Twitter',
	'16 settembre 2022: A Senigallia si verifica un\'inondazione per uno straordinario straripamento del Misa', 5, 4);

-- 10.Inserimento contenuti multimediali dei social network
INSERT INTO FileMultimediale(url, tipologia, id_post, id_segnalazione)
VALUES ('https://pbs.twimg.com/card_img/1609632475663446017/UBf0h-fI?format=jpg&name=900x900', 'Immagine', 8, null);

-- 11.Inserimento nuovo utente della piattaforma proprietaria
INSERT INTO UtentePiattaforma(url, nome, cognome, nickname, data_nascita, citta, password, email, cellulare)
VALUES(null, 'Mario', 'Garofalo', 'MarioMario#8273', '1982-04-25', 'Gubbio', '7e0b88ff7d5aec355e5e19aaae46831db0ea7e06',
       'mario_garofalo_29@gmail.com', '2324345546');

-- 12.Inserimento segnalazione evento straordinario
INSERT INTO Segnalazione(commento, tipologia, situazione_di_pericolo, data_ora, grado_attendibilita, id_zona, id_utente)
VALUES ('Fiume Musone straripato a Porto Recanati', 'Segnalazione inondazione', 1, '2021-08-10 14:56:23', 5.6, 13,3);

-- 32.Visualizza lista collaboratori
SELECT * FROM Collaboratore;

-- 33.Visualizza lista Sensori
SELECT * FROM Sensore;

-- 34.Visualizza sessioni di campionamento
SELECT SessioneCampionamento.id, SessioneCampionamento.data_ora, SessioneCampionamento.durata,
       SessioneCampionamento.val_min, SessioneCampionamento.val_max, SessioneCampionamento.media_misurazioni,
       Zona.comune, Zona.provincia
FROM SessioneCampionamento
JOIN Zona ON SessioneCampionamento.id_zona = Zona.codice;

-- 35.Visualizza dati ottenuti dalla sessione di campionamento
SELECT Misurazione.id, Misurazione.valore_rilevato, Misurazione.timestamp, Misurazione.matricola_sensore
FROM SessioneCampionamento
JOIN Misurazione ON SessioneCampionamento.id = Misurazione.id_sessione
WHERE SessioneCampionamento.id = 2;

-- 22.Cancellazione collaboratore
DELETE FROM Collaboratore WHERE id = 420;

-- 23.Cancellazione sensore
DELETE FROM Sensore WHERE matricola = 47;

-- 24.Cancellazione sessioni di campionamento effettuate in un certo anno
DELETE FROM SessioneCampionamento
WHERE data_ora BETWEEN '2019-01-01 00:00' AND '2019-12-31 23:59';

-- 25.Cancellazione contenuti testuali dei social network
DELETE FROM Post
WHERE id = 2
AND (
        SELECT COUNT(*)
        FROM (SELECT * FROM Post) as ps
        JOIN FileMultimediale ON ps.id = FileMultimediale.id_post
        WHERE ps.id = 2
) = 0;
