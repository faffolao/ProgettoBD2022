-- +---------------------------+
-- | MACRO BLOCCO MONITORAGGIO |
-- +---------------------------+
-- creazione tabella Collaboratore
CREATE TABLE Collaboratore (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    cellulare CHAR(10)
);

-- creazione tabella Sensore
CREATE TABLE Sensore (
    matricola VARCHAR(12) PRIMARY KEY,
    tipologia VARCHAR(50) NOT NULL,
    anno_produzione YEAR,
    descrizione TEXT,
    versione_firwmare DECIMAL(3, 1)
);

-- creazione tabella Riparazione
CREATE TABLE Riparazione (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_ora DATETIME NOT NULL,
    tipologia VARCHAR(30),
    esito BOOLEAN,
    descrizione TEXT,
    id_sensore VARCHAR(12),
    CONSTRAINT fk_id_sensore
        FOREIGN KEY (id_sensore) REFERENCES Sensore(matricola)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- creazione tabella SessioneCampionamento
CREATE TABLE SessioneCampionamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_ora DATETIME NOT NULL,
    durata DECIMAL(5, 2) NOT NULL,
    val_min FLOAT,
    val_max FLOAT,
    media_misurazioni FLOAT,
    id_zona INT,
    CONSTRAINT fk_id_zona
        FOREIGN KEY (id_zona) REFERENCES Zona(codice)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- creazione tabella Misurazione
CREATE TABLE Misurazione (
    id INT PRIMARY KEY AUTO_INCREMENT,
    valore_rilevato FLOAT NOT NULL,
    timestamp DATETIME NOT NULL,
    id_sessione INT,
    matricola_sensore VARCHAR(12),
    CONSTRAINT fk_id_sessione
        FOREIGN KEY (id_sessione) REFERENCES SessioneCampionamento(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_matricola_sensore
        FOREIGN KEY (matricola_sensore) REFERENCES Sensore(matricola)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- +---------------------------+
-- | MACRO BLOCCO SEGNALAZIONE |
-- +---------------------------+
-- creazione tabella Zona
CREATE TABLE Zona (
    codice INT PRIMARY KEY AUTO_INCREMENT,
    tipologia VARCHAR(30) NOT NULL,
    comune VARCHAR(40) NOT NULL,
    provincia VARCHAR(15) NOT NULL,
    regione VARCHAR(20) NOT NULL,
    latitudine DECIMAL(9, 7),
    longitudine DECIMAL(9, 7),
    quota DECIMAL(5, 1)
);

-- creazione tabella Allerta
CREATE TABLE Allerta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descrizione TEXT,
    data_ora DATETIME NOT NULL,
    tipologia VARCHAR(30) NOT NULL
);

-- +-----------------------------+
-- | MACRO BLOCCO SOCIAL NETWORK |
-- +-----------------------------+
-- creazione tabella Utente
CREATE TABLE Utente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    url TEXT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    grado_attendibilita DECIMAL (3, 1) DEFAULT NULL,
    CHECK (grado_attendibilita >= 0.0 AND grado_attendibilita <= 10.0)
);

-- creazione tabella FactChecker
CREATE TABLE FactChecker (
    id INT PRIMARY KEY AUTO_INCREMENT,
    url TEXT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    grado_attendibilita DECIMAL (3, 1) DEFAULT NULL,
    societa VARCHAR(30),
    CHECK (grado_attendibilita >= 0.0 AND grado_attendibilita <= 10.0)
);

-- creazione tabella UtentePiattaforma
CREATE TABLE UtentePiattaforma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    url TEXT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    grado_attendibilita DECIMAL (3, 1) DEFAULT NULL,
    data_nascita DATE,
    citta VARCHAR(40),
    password CHAR(255) NOT NULL,
    email VARCHAR(30),
    cellulare CHAR(10),
    CHECK (grado_attendibilita >= 0.0 AND grado_attendibilita <= 10.0)
);

-- creazione tabella Post
CREATE TABLE Post (
    id INT PRIMARY KEY AUTO_INCREMENT,
    url TEXT NOT NULL,
    data_ora DATETIME NOT NULL,
    piattaforma_provenienza VARCHAR(15) NOT NULL,
    testo TEXT,
    grado_attendibilita DECIMAL (3, 1) DEFAULT NULL,
    id_zona INT,
    id_utente INT,
    CONSTRAINT fk_id_zona_post
        FOREIGN KEY (id_zona) REFERENCES Zona(codice)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_id_utente
        FOREIGN KEY (id_utente) REFERENCES Utente(id)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    CHECK (grado_attendibilita >= 0.0 AND grado_attendibilita <= 10.0)
);

-- creazione tabella File multimediale
CREATE TABLE FileMultimediale (
    id INT PRIMARY KEY AUTO_INCREMENT,
    url TEXT,
    tipologia VARCHAR(20) NOT NULL,
    grado_attendibilita DECIMAL (3, 1) DEFAULT NULL,
    id_post INT,
    id_segnalazione INT,
    CONSTRAINT fk_id_post_file_multimediale
        FOREIGN KEY (id_post) REFERENCES Post(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_id_segnalazione_file_multimediale
        FOREIGN KEY (id_segnalazione) REFERENCES Segnalazione(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK (grado_attendibilita >= 0.0 AND grado_attendibilita <= 10.0)
);

-- creazione tabella Segnalazione
CREATE TABLE Segnalazione (
    id INT PRIMARY KEY AUTO_INCREMENT,
    commento TEXT,
    tipologia VARCHAR(40) NOT NULL,
    url_post TEXT,
    situazione_di_pericolo BOOLEAN,
    data_ora DATETIME NOT NULL,
    grado_attendibilita DECIMAL (3, 1) DEFAULT NULL,
    id_utente INT,
    CONSTRAINT fk_id_utente_segnalazione
        FOREIGN KEY (id_utente) REFERENCES UtentePiattaforma(id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CHECK (grado_attendibilita >= 0.0 AND grado_attendibilita <= 10.0)
);

-- +---------------------------------------+
-- | ENTITA' DI COLLEGAMENTO MOLTI-A-MOLTI |
-- +---------------------------------------+

-- creazione tabella Esecuzione
CREATE TABLE EsecuzioneRiparazione (
    id_collaboratore INT,
    id_riparazione INT,
    PRIMARY KEY (id_collaboratore, id_riparazione),
    CONSTRAINT fk_riparatore
        FOREIGN KEY (id_collaboratore) REFERENCES Collaboratore(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_riparazione
        FOREIGN KEY (id_riparazione) REFERENCES Riparazione(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- creazione tabella Impiego
CREATE TABLE ImpiegoSensore (
    id_sessione INT,
    matricola_sensore VARCHAR(12),
    PRIMARY KEY (id_sessione, matricola_sensore),
    CONSTRAINT fk_sessione_campionamento
        FOREIGN KEY (id_sessione) REFERENCES SessioneCampionamento(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_sensore_impiegato
        FOREIGN KEY (matricola_sensore) REFERENCES Sensore(matricola)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- creazione tabella Avvio
CREATE TABLE AvvioSessione (
    id_collaboratore INT,
    id_sessione INT,
    PRIMARY KEY (id_collaboratore, id_sessione),
    CONSTRAINT fk_collaboratore_sessione
        FOREIGN KEY (id_collaboratore) REFERENCES Collaboratore(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_sessione_avviata
        FOREIGN KEY (id_sessione) REFERENCES SessioneCampionamento(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- creazione tabella Diramazione
CREATE TABLE DiramazioneAllerta (
    codice_zona INT,
    id_allerta INT,
    PRIMARY KEY (codice_zona, id_allerta),
    CONSTRAINT fk_zona_interessata
        FOREIGN KEY (codice_zona) REFERENCES Zona(codice)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_allerta_diramata
        FOREIGN KEY (id_allerta) REFERENCES Allerta(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- creazione tabella Verifica
CREATE TABLE VerificaPost (
    id_post INT,
    id_fact_checker INT,
    data_ora DATETIME,
    PRIMARY KEY (id_post, id_fact_checker),
    CONSTRAINT fk_post_verificato
        FOREIGN KEY (id_post) REFERENCES Post(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_fact_checker_verificatore
        FOREIGN KEY (id_fact_checker) REFERENCES FactChecker(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);