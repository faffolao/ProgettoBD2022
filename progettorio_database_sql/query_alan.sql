-- +---------------------+
-- | query di Rossi Alan |
-- +---------------------+

-- QUERY DI INSERIMENTO
-- ====================

-- 1. Inserimento nuovo collaboratore - Testato

/*
INSERT INTO Collaboratore(nome, cognome, email, cellulare)
VALUES (...);
*/

INSERT INTO Collaboratore(nome, cognome, email, cellulare)
VALUES ('Mario', 'Rossi', 'mario.rossi@gmail.com', '3401256789');

-- 2. Inserimento nuovo sensore - Testato

/*
INSERT INTO Sensore(matricola, tipologia, anno_produzione, descrizione, versione_firwmare)
VALUES (...);
*/

INSERT INTO Sensore(matricola, tipologia, anno_produzione, descrizione, versione_firwmare)
VALUES ('1000000', 'idrometro', 2022, 'Asta graduata che serve a determinare la quota del pelo
        liquido di un corso d''acqua, rispetto a una quota di riferimento', 1.1);

-- 3. Inserimento nuova sessione di campionamento - Testato
-- NOTA: media_misurazioni a cosa fa riferimento visto che i sensori impiegati in una medesima
--       sessione di campionamento possono essere di tipologie diverse? (ovviare con una nota a pié di pagina)

/*
INSERT INTO SessioneCampionamento(data_ora, durata, id_zona)
VALUES (...);
*/

INSERT INTO SessioneCampionamento(data_ora, durata, id_zona)
VALUES ('2022-12-15 10:15:13', 30.00, 5);

-- 4. Inserimento dei dati ottenuti dalla sessione di campionamento - Testato

/*
INSERT INTO Misurazione(valore_rilevato, timestamp, id_sessione, matricola_sensore)
VALUES (...);

UPDATE SessioneCampionamento
SET media_misurazioni = (
    SELECT AVG(valore_rilevato)
    FROM Misurazione
    JOIN Sensore ON Misurazione.matricola_sensore = Sensore.matricola
    WHERE id_sessione = <id sessione di campionamento> AND Sensore.tipologia LIKE '%<tipologia sensore>%'
    )
WHERE id = <id sessione di campionamento>;
*/

INSERT INTO Misurazione(valore_rilevato, timestamp, id_sessione, matricola_sensore)
VALUES (5.4, '2022-12-15 10:15:13', 4, 4353246674);

UPDATE SessioneCampionamento
SET media_misurazioni = (
    SELECT AVG(valore_rilevato)
    FROM Misurazione
    JOIN Sensore ON Misurazione.matricola_sensore = Sensore.matricola
    WHERE id_sessione = 1 AND Sensore.tipologia LIKE '%radiometro per bacino d''acqua%'
    )
WHERE id = 1;

-- 5. Inserimento delle soglie minime di pericolo - Testato

/*
UPDATE SessioneCampionamento
SET val_min = <valore minimo>, val_max = <valore massimo>
WHERE val_min IS NULL AND val_max IS NULL;
*/

UPDATE SessioneCampionamento
SET val_min = 3.2, val_max = 8.7
WHERE val_min IS NULL AND val_max IS NULL;


-- QUERY DI SELEZIONE
-- ==================

-- 6. Selezione dei dati che rientrano nelle soglie minime di pericolo - Testato

SELECT *
FROM Misurazione
INNER JOIN SessioneCampionamento
ON Misurazione.id_sessione = SessioneCampionamento.id
WHERE valore_rilevato > val_min AND valore_rilevato < val_max;

-- 7. Selezione dei dati che superano le soglie minime di pericolo - Testato

SELECT *
FROM Misurazione
INNER JOIN SessioneCampionamento
ON Misurazione.id_sessione = SessioneCampionamento.id
WHERE valore_rilevato < val_min OR valore_rilevato > val_max;

-- 29. Visualizza lista dei post dei social network - Testato

SELECT *
FROM Post;

-- 30. Visualizza utente della piattaforma proprietaria - Testato

/*
SELECT *
FROM UtentePiattaforma
WHERE id = <id utente piattaforma>;
*/

SELECT *
FROM UtentePiattaforma
WHERE id = 3;

-- 31. Visualizza diramazione allerta - Testato

/*
SELECT *
FROM Allerta
WHERE id = <id allerta>;
*/

SELECT *
FROM Allerta
WHERE id = 2;

-- QUERY DI MODIFICA
-- ======================

-- 17. Modifica dati collaboratore - Testato

/*
UPDATE Collaboratore
SET nome = <nome>, cognome = <cognome>, email = <indirizzo e-mail>, cellulare = <numero di cellulare>
WHERE id = <id collaboratore>;
*/

UPDATE Collaboratore
SET nome = 'Mario', cognome = 'Rossi', email = 'mario.rossi@virgilio.it', cellulare = '3401256789'
WHERE id = 6;

-- 18. Modifica dati sensore - Testato

/*
UPDATE Sensore
SET tipologia = <tipologia>, anno_produzione = <anno di produzione>,
    descrizione = <descrizione>, versione_firmware = <versione del firmware>
WHERE matricola = <matricola del sensore>;
*/

UPDATE Sensore
SET tipologia = 'idrometro', anno_produzione = 2022,
    descrizione = 'Asta graduata che serve a determinare la quota del pelo liquido di un corso d''acqua, rispetto a una quota di riferimento',
    versione_firwmare = 1.2
WHERE matricola = 1000000;

-- 19. Modifica utente della piattaforma proprietaria

/*
UPDATE UtentePiattaforma
SET url = <url del profilo utente>, nome = <nome>, cognome = <cognome>,
    nickname = <nickname utente>, data_nascita = <data di nascita>,
    citta = <luogo di nascita>, password = <password>,
    email = <indirizzo e-mail>, cellulare = <numero di cellulare>
WHERE id = <id utente piattaforma>;
*/

-- 20. Modifica dell'indice di affidabilità dell'utente (da escludere utente piattaforma o integrare la query) - Testato

/*
UPDATE Utente
SET grado_attendibilità = <nuovo grado di attendibilità>
WHERE id = <id utente>;

UPDATE Utente
SET grado_attendibilità = <nuovo grado di attendibilità>
WHERE id = <id utente>;
*/

UPDATE Utente
SET grado_attendibilita = 9.5
WHERE id = 1;

-- 21. Modifica dell'indice di attendibilià del contenuto testuale/multimediale

/*
UPDATE Post
SET grado_attendibilita = <nuovo grado di attendibilità>
WHERE id = <id post>;

UPDATE FileMultimediale
SET grado_attendibilita = <nuovo grado di attendibilità>
WHERE id = <id file multimediale>;
*/