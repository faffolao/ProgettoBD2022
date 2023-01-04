-- +---------------------+
-- | query di Rossi Alan |
-- +---------------------+

-- QUERY DI INSERIMENTO
-- ====================

-- 1. Inserimento nuovo collaboratore

INSERT INTO Collaboratore(id, nome, cognome, email, cellulare)
VALUES (...);

-- 2. Inserimento nuovo sensore

INSERT INTO Sensore(matricola, tipologia, anno_produzione, descrizione, versione_firmware)
VALUES (...);

-- 3. Inserimento nuova sessione di campionamento

INSERT INTO SessioneCampionamento(id, data_ora, durata, media_misurazioni, id_zona)
VALUES (...);

-- 4. Inserimento dei dati ottenuti dalla sessione di campionamento

INSERT INTO Misurazione(id, valore_rilevato, id_sessione, matricola_sensore)
VALUES (...);

-- 5. Inserimento delle soglie minime di pericolo

UPDATE SessioneCampionamento
SET val_min = <valore minimo>, val_max = <valore massimo>
WHERE val_min IS NULL AND val_max IS NULL;

UPDATE SessioneCampionamento
SET val_max = <valore massimo>
WHERE val_min IS NULL;


-- QUERY DI SELEZIONE
-- ==================

-- 6. Selezione dei dati che rientrano nelle soglie minime di pericolo

SELECT *
FROM Misurazione
INNER JOIN SessioneCampionamento
ON Misurazione.id_sessione = SessioneCampionamento.id
WHERE valore_rilevato > val_min AND valore_rilevato > val_max;

-- 7. Selezione dei dati che superano le soglie minime di pericolo

SELECT *
FROM Misurazione
INNER JOIN SessioneCampionamento
ON Misurazione.id_sessione = SessioneCampionamento.id
WHERE valore_rilevato < val_min OR valore_rilevato > val_max;

-- 29. Visualizza lista dei post dei social network

SELECT *
FROM Post;

-- 30. Visualizza utente della piattaforma proprietaria

SELECT *
FROM UtentePiattaforma
WHERE id = <id utente piattaforma>;

-- 31. Visualizza diramazione allerta

SELECT *
FROM Allerta
WHERE id = <id allerta>;

-- QUERY DI MODIFICA
-- ======================

-- 17. Modifica dati collaboratore

UPDATE Collaboratore
SET nome = <nome>, cognome = <cognome>, email = <indirizzo e-mail>, cellulare = <numero di cellulare>;
WHERE id = <id collaboratore>

-- 18. Modifica dati sensore

UPDATE Sensore
SET tipologia = <tipologia>, anno_produzione = <anno di produzione>,
    descrizione = <descrizione>, versione_firmware = <versione del firmware>;
WHERE matricola = <matricola del sensore>

-- 19. Modifica utente della piattaforma proprietaria

UPDATE UtentePiattaforma
SET url = <url del profilo utente>, nome = <nome>, cognome = <cognome>,
    nickname = <nickname utente>, data_nascita = <data di nascita>,
    citta = <luogo di nascita>, password = <password>,
    email = <indirizzo e-mail>, cellulare = <numero di cellulare>
WHERE id = <id utente piattaforma>;

-- 20. Modifica dell'indice di affidabilità dell'utente

UPDATE Utente
SET grado_attendibilità = <nuovo grado di attendibilità>
WHERE id = <id utente>;

-- 21. Modifica dell'indice di attendibilià del contenuto testuale/multimediale

UPDATE Post
SET grado_attendibilita = <nuovo grado di attendibilità>
WHERE id = <id post>;

UPDATE FileMultimediale
SET grado_attendibilita = <nuovo grado di attendibilità>
WHERE id = <id file multimediale>;