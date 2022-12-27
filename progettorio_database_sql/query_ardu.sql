-- +---------------------------+
-- | query di Federico Arduini |
-- +---------------------------+

-- QUERY DI INSERIMENTO
-- ====================
-- 13.	Inserimento segnalazione Post inerente a un evento straordinario
INSERT INTO Segnalazione(commento, tipologia, url_post, situazione_di_pericolo, data_ora, grado_attendibilita, id_utente)
VALUES ('Aiuto aiuto, c\'è una forte bufera di neve qui a Cantiano!!! Che disastro!!!', 'Segnalazione neve', 'https://www.instagram.com/p/CmPL5_PuSul', true, '2022-12-27 12:00:00', 3.2, 1);

INSERT INTO Post(url, data_ora, piattaforma_provenienza, testo, grado_attendibilita, id_zona, id_utente)
VALUES ('https://www.instagram.com/p/CmPL5_PuSul', '2022-12-16 18:23:00', 'Instagram', 'If you had to choose one word to represent 2022, what would it be?', 8.9, 3, 1);

INSERT INTO FileMultimediale(url, tipologia, grado_attendibilita, id_post, id_segnalazione)
VALUES ('https://www.instagram.com/src/wiki.png', 'Immagine', 3.4, 1, 1);

-- 14.	Inserimento diramazione allerta
INSERT INTO Allerta(descrizione, data_ora, tipologia)
VALUES ('Forte vento e neve previsti negli ultimi 9 giorni', '2020-10-14 19:13:00', 'Allerta neve');

INSERT INTO DiramazioneAllerta VALUES (2, 5);
INSERT INTO DiramazioneAllerta VALUES (3, 5);

-- 15.	Inserimento dell’indice di affidabilità di Utente
UPDATE Utente SET grado_attendibilita = 9.0 WHERE id = 1 AND grado_attendibilita IS NULL;

-- 16.	Inserimento dell’indice di attendibilità del contenuto testuale/multimediale
UPDATE Post SET grado_attendibilita = 6.8 WHERE id = 1 AND grado_attendibilita IS NULL;

UPDATE FileMultimediale SET grado_attendibilita = 6.8 WHERE id_post = 1 AND grado_attendibilita IS NULL;