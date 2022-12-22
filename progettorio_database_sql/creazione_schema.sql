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

-- creazione tabella Utente
CREATE TABLE Utente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    url TEXT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    grado_attendibilita DECIMAL (3, 1) DEFAULT NULL
);

-- creazione tabella FactChecker
CREATE TABLE FactChecker (
    id INT PRIMARY KEY AUTO_INCREMENT,
    url TEXT,
    nome VARCHAR(20) NOT NULL,
    cognome VARCHAR(20) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    grado_attendibilita DECIMAL (3, 1) DEFAULT NULL,
    societa VARCHAR(30)
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
    cellulare CHAR(10)
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
        ON UPDATE CASCADE ON DELETE NO ACTION
);