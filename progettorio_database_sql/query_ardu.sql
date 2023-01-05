-- +---------------------------+
-- | query di Federico Arduini |
-- +---------------------------+

-- QUERY DI INSERIMENTO
-- ====================
-- 13.	Inserimento segnalazione Post inerente a un evento straordinario
INSERT INTO Segnalazione(commento, tipologia, url_post, situazione_di_pericolo, data_ora, grado_attendibilita, id_zona, id_utente)
VALUES ('Aiuto aiuto, c\'è una forte bufera di neve qui a Cantiano!!! Che disastro!!!', 'Segnalazione neve', 'https://www.instagram.com/p/CmPL5_PuSul', true, '2022-12-27 12:00:00', 3.2, 1, 1);

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

-- QUERY DI SELEZIONE
-- ==================
-- 36.	Ricerca tramite hashtag (fornisco, ad esempio, l'hashtag #book=
SELECT * FROM Post WHERE testo LIKE '%#book%';

-- 37.	Ricerca tramite key-words
SELECT * FROM Post WHERE (
    testo LIKE '%2022%'
    OR testo LIKE '%libri%'
);

-- 38.	Ricerca tramite posizione geografica
SELECT Post.id, Post.url, Post.data_ora, Post.piattaforma_provenienza, Post.testo, Post.grado_attendibilita,
       Post.id_utente, Zona.comune, Zona.provincia
FROM Post
JOIN Zona ON Post.id_zona = Zona.codice
WHERE Zona.comune LIKE '%NULL%' OR Zona.provincia LIKE '%Pesaro Urbino%';

-- 39.	Statistica dei valori ottenuti nel periodo di riferimento desiderato
SELECT SessioneCampionamento.id AS id_sessione, SessioneCampionamento.data_ora AS data_ora_sessione,
       Zona.comune AS zona_campionamento, SessioneCampionamento.media_misurazioni AS media_valori,
       COUNT(Misurazione.id) AS num_misurazioni, SUM(Misurazione.valore_rilevato) AS tot_valori,
       MAX(Misurazione.valore_rilevato) AS valore_max, MIN(Misurazione.valore_rilevato) AS valore_min
FROM SessioneCampionamento
JOIN Misurazione ON SessioneCampionamento.id = Misurazione.id_sessione
JOIN Zona ON SessioneCampionamento.id_zona = Zona.codice
WHERE SessioneCampionamento.data_ora BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY SessioneCampionamento.id;

-- 40.	Statistica dell’indice di attendibilità del contenuto testuale/multimediale
SELECT Post.grado_attendibilita AS grado_attendibilita_post, AVG(FileMultimediale.grado_attendibilita)
    AS grado_attendibilita_fm_avg
FROM Post
JOIN FileMultimediale on Post.id = FileMultimediale.id_post
WHERE Post.id = 2;

-- QUERY DI CANCELLAZIONE
-- ======================

-- 26 - Cancellazione contenuti multimediali dei social network
DELETE FROM FileMultimediale WHERE id = 8;

-- 27 - Cancellazione Utente della piattaforma proprietaria
DELETE FROM UtentePiattaforma WHERE id = 2;

-- 28 - Cancellazione diramazione allerta
DELETE FROM Allerta WHERE id = 4;