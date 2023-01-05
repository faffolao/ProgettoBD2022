-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Gen 05, 2023 alle 16:29
-- Versione del server: 8.0.31
-- Versione PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ProgettoRIO`
--
CREATE DATABASE IF NOT EXISTS `ProgettoRIO` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ProgettoRIO`;

-- --------------------------------------------------------

--
-- Struttura della tabella `Allerta`
--

CREATE TABLE IF NOT EXISTS `Allerta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descrizione` text,
  `data_ora` datetime NOT NULL,
  `tipologia` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ;

--
-- Dump dei dati per la tabella `Allerta`
--

INSERT INTO `Allerta` (`id`, `descrizione`, `data_ora`, `tipologia`) VALUES
(1, 'Prefisto forte vento nella costa marchigiana in un\'area compresa tra Pesaro e Senigallia', '2022-12-23 18:51:21', 'Allerta vento'),
(2, 'A causa di un anticiclone incombente, potrebbero verificarsi forti piogge e probabili allagamenti nelle basse Marche', '2022-04-13 14:49:19', 'Allerta temporale'),
(3, 'Previsti 90 cm di neve nelle colline urbinati nei prossimi 3 giorni', '2022-12-23 18:53:45', 'Allerta neve'),
(5, 'Forte vento e neve previsti negli ultimi 9 giorni', '2020-10-14 19:13:00', 'Allerta neve');

-- --------------------------------------------------------

--
-- Struttura della tabella `AvvioSessione`
--

CREATE TABLE IF NOT EXISTS `AvvioSessione` (
  `id_collaboratore` int NOT NULL,
  `id_sessione` int NOT NULL,
  PRIMARY KEY (`id_collaboratore`,`id_sessione`),
  KEY `fk_sessione_avviata` (`id_sessione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `AvvioSessione`
--

INSERT INTO `AvvioSessione` (`id_collaboratore`, `id_sessione`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(5, 2),
(2, 3),
(4, 3),
(5, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `Collaboratore`
--

CREATE TABLE IF NOT EXISTS `Collaboratore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `cellulare` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Collaboratore`
--

INSERT INTO `Collaboratore` (`id`, `nome`, `cognome`, `email`, `cellulare`) VALUES
(1, 'Federico', 'Arduini', 'federicoarduini@protonmail.com', '2831287863'),
(2, 'Alan', 'Rossi', 'alanred092@hotmail.com', '3278687367'),
(3, 'Luca', 'Pigliacampo', 'luca_bmw_highlander@msn.net', '3423423423'),
(4, 'Romeo', 'Pierantoni', 'locorotondo@live.it', '4867278547'),
(5, 'Arnaldo', 'Mondadori', 'arnaldo283@gmail.com', '3267163867'),
(6, 'Mario', 'Rossi', 'mario.rossi@virgilio.it', '3401256789');

-- --------------------------------------------------------

--
-- Struttura della tabella `DiramazioneAllerta`
--

CREATE TABLE IF NOT EXISTS `DiramazioneAllerta` (
  `codice_zona` int NOT NULL,
  `id_allerta` int NOT NULL,
  PRIMARY KEY (`codice_zona`,`id_allerta`),
  KEY `fk_allerta_diramata` (`id_allerta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `DiramazioneAllerta`
--

INSERT INTO `DiramazioneAllerta` (`codice_zona`, `id_allerta`) VALUES
(1, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 2),
(9, 2),
(10, 2),
(11, 3),
(2, 5),
(3, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `EsecuzioneRiparazione`
--

CREATE TABLE IF NOT EXISTS `EsecuzioneRiparazione` (
  `id_collaboratore` int NOT NULL,
  `id_riparazione` int NOT NULL,
  PRIMARY KEY (`id_collaboratore`,`id_riparazione`),
  KEY `fk_riparazione` (`id_riparazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `EsecuzioneRiparazione`
--

INSERT INTO `EsecuzioneRiparazione` (`id_collaboratore`, `id_riparazione`) VALUES
(1, 1),
(2, 2),
(4, 3),
(1, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `FactChecker`
--

CREATE TABLE IF NOT EXISTS `FactChecker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` text,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `grado_attendibilita` decimal(3,1) DEFAULT NULL,
  `societa` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

--
-- Dump dei dati per la tabella `FactChecker`
--

INSERT INTO `FactChecker` (`id`, `url`, `nome`, `cognome`, `nickname`, `grado_attendibilita`, `societa`) VALUES
(1, NULL, 'Francesco', 'Prinzi', 'fra_priz938', '8.6', 'Pagella politica'),
(2, NULL, 'Tiziana', 'Rossi', 'tittyro29', '9.2', 'lavoce.info'),
(3, NULL, 'Carmine', 'Roberto', 'crroby3', '7.8', 'FactCheckers'),
(4, NULL, 'Mike', 'Roberts', 'reccotoy83', '9.3', 'AGI Fact Checking'),
(5, NULL, 'Damiano', 'Verdi', 'damynow', '7.5', 'facta.news'),
(6, NULL, 'Graziano', 'Arena', 'grarvia49', '6.7', 'Open Fact Checking'),
(7, NULL, 'Luke', 'Robinson', 'luke4317', '7.5', 'Poynter');

-- --------------------------------------------------------

--
-- Struttura della tabella `FileMultimediale`
--

CREATE TABLE IF NOT EXISTS `FileMultimediale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` text,
  `tipologia` varchar(20) NOT NULL,
  `grado_attendibilita` decimal(3,1) DEFAULT NULL,
  `id_post` int DEFAULT NULL,
  `id_segnalazione` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_post_file_multimediale` (`id_post`),
  KEY `fk_id_segnalazione_file_multimediale` (`id_segnalazione`)
) ;

--
-- Dump dei dati per la tabella `FileMultimediale`
--

INSERT INTO `FileMultimediale` (`id`, `url`, `tipologia`, `grado_attendibilita`, `id_post`, `id_segnalazione`) VALUES
(1, 'https://www.instagram.com/src/wiki.png', 'Immagine', '6.8', 1, 1),
(3, 'https://www.instagram.com/src/wired_title.png', 'Immagine', '8.7', 2, NULL),
(4, 'https://www.instagram.com/src/wired_pg1.png', 'Immagine', '9.7', 2, NULL),
(5, 'https://www.instagram.com/src/wired_pg2.png', 'Immagine', '7.8', 2, NULL),
(6, 'https://www.instagram.com/src/wired_pg3.png', 'Immagine', '8.0', 2, NULL),
(7, 'https://www.instagram.com/src/wired_pg_end.png', 'Immagine', '8.4', 2, NULL),
(9, 'https://www.instagram.com/src/16_mo_giro_capodanno.jpeg', 'Immagine', '8.7', 4, NULL),
(10, 'https://scontent.fpsr1-1.fna.fbcdn.net/v/t39.30808-6/319336063_534034098764065_2292122606218921063_n.jpg?stp=cp6_dst-jpg&_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=TEqnflTTadoAX_tTrFZ&_nc_ht=scontent.fpsr1-1.fna&oh=00_AfBNz7VhWkqvex6KQWdw8dHUqkguZJpUp9aWfMRBQco8PQ&oe=63B63B48', 'Immagine', '9.8', 5, 4),
(11, 'https://scontent.fpsr1-1.fna.fbcdn.net/v/t39.30808-6/319242845_516665330495382_4085797839161082080_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=H6El9IaNLoQAX8g5WfE&_nc_ht=scontent.fpsr1-1.fna&oh=00_AfCdcgSjk9QZJ2DUrn5yszIAuWYCp0uCVc52vLJyvygfXQ&oe=63B6824E', 'Immagine', '9.7', 6, NULL),
(12, 'https://pbs.twimg.com/card_img/1609632475663446017/UBf0h-fI?format=jpg&name=900x900', 'Immagine', NULL, 8, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `ImpiegoSensore`
--

CREATE TABLE IF NOT EXISTS `ImpiegoSensore` (
  `id_sessione` int NOT NULL,
  `matricola_sensore` varchar(12) NOT NULL,
  PRIMARY KEY (`id_sessione`,`matricola_sensore`),
  KEY `fk_sensore_impiegato` (`matricola_sensore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `ImpiegoSensore`
--

INSERT INTO `ImpiegoSensore` (`id_sessione`, `matricola_sensore`) VALUES
(1, '1231235533'),
(2, '1231235533'),
(3, '1231235533'),
(2, '4353246674'),
(3, '4353246674'),
(1, '7634782462'),
(2, '7634782462'),
(3, '7634782462');

-- --------------------------------------------------------

--
-- Struttura della tabella `Misurazione`
--

CREATE TABLE IF NOT EXISTS `Misurazione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valore_rilevato` float NOT NULL,
  `timestamp` datetime NOT NULL,
  `id_sessione` int NOT NULL,
  `matricola_sensore` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_sessione` (`id_sessione`),
  KEY `fk_matricola_sensore` (`matricola_sensore`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Misurazione`
--

INSERT INTO `Misurazione` (`id`, `valore_rilevato`, `timestamp`, `id_sessione`, `matricola_sensore`) VALUES
(1, 4.65, '2022-06-14 12:30:20', 1, '7634782462'),
(2, 7.656, '2022-06-14 12:30:30', 1, '1231235533'),
(3, 3.11, '2022-06-14 12:30:40', 1, '1231235533'),
(4, 6.323, '2022-06-14 12:30:50', 1, '7634782462'),
(5, 4.456, '2022-06-14 12:31:00', 1, '1231235533'),
(6, 8.656, '2022-06-14 12:31:10', 1, '7634782462'),
(7, 6.432, '2022-06-14 12:31:20', 1, '7634782462'),
(8, 7.43, '2022-06-15 12:30:10', 2, '7634782462'),
(9, 2.45, '2022-06-15 12:30:20', 2, '1231235533'),
(10, 6.43, '2022-06-15 12:30:30', 2, '1231235533'),
(11, 8.5, '2022-06-15 12:30:40', 2, '7634782462'),
(12, 5.456, '2022-06-15 12:30:50', 2, '7634782462'),
(13, 6.43, '2022-06-15 12:31:00', 2, '4353246674'),
(14, 6.445, '2022-06-15 12:31:10', 2, '4353246674'),
(15, 6.657, '2022-06-16 12:30:10', 3, '7634782462'),
(16, 8.865, '2022-06-16 12:30:20', 3, '4353246674'),
(17, 1.34, '2022-06-16 12:30:30', 3, '4353246674'),
(18, 5.234, '2022-06-16 12:30:40', 3, '1231235533'),
(19, 3.434, '2022-06-16 12:30:50', 3, '1231235533'),
(20, 9.543, '2022-06-16 12:31:00', 3, '4353246674'),
(21, 4.456, '2022-06-16 12:31:10', 3, '7634782462'),
(22, 5.4, '2022-12-15 10:15:13', 4, '4353246674');

-- --------------------------------------------------------

--
-- Struttura della tabella `Post`
--

CREATE TABLE IF NOT EXISTS `Post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `data_ora` datetime NOT NULL,
  `piattaforma_provenienza` varchar(15) NOT NULL,
  `testo` text,
  `grado_attendibilita` decimal(3,1) DEFAULT NULL,
  `id_zona` int DEFAULT NULL,
  `id_utente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_zona_post` (`id_zona`),
  KEY `fk_id_utente` (`id_utente`)
) ;

--
-- Dump dei dati per la tabella `Post`
--

INSERT INTO `Post` (`id`, `url`, `data_ora`, `piattaforma_provenienza`, `testo`, `grado_attendibilita`, `id_zona`, `id_utente`) VALUES
(1, 'https://www.instagram.com/p/CmPL5_PuSul', '2022-12-16 18:23:00', 'Instagram', 'If you had to choose one word to represent 2022, what would it be?', '6.8', 1, 1),
(2, 'https://www.instagram.com/p/CmzBSGkM84P/', '2022-12-30 20:28:55', 'Instagram', 'Scegliere i migliori libri di un anno che si sta per concludere è sempre un compito arduo. Un po\' perché il primo stato mentale è quello della tabula rasa, come se tutti i libri letti nei dodici mesi scomparissero dalla memoria, un po\' perché condensare in una decina di titoli proposte che incontrino i gusti di tutti è prova improba. #books #libri #book #letture', '9.8', NULL, 1),
(3, 'https://www.instagram.com/p/Cmj1lggNyk1/', '2022-12-25 08:02:35', 'Instagram', 'Mancano poche ore al #natale e ne approfittiamo per fare tanti auguri a voi, e a tutti coloro che, anche in questi giorni di festa, saranno in servizio per essere al fianco di chi ha più bisogno. #CroceRossa #crocerossaitaliana #crisenigallia #UnItaliaCheAiuta', '9.7', 5, 2),
(4, 'https://www.instagram.com/p/CmOzlj0NEz_/', '2022-12-16 13:05:54', 'Instagram', 'Tornano i Babbi Natale podisti, al via il 1° gennaio il 16esimo Giro di Capodanno. #pesaro #natalepesaro #natale #girodicapodanno', '8.8', 1, 2),
(5, 'https://www.facebook.com/photo/?fbid=534034102097398&set=a.329740785860065', '2022-12-10 16:31:00', 'Facebook', 'Fortunatamente l’allerta arancione prevista per oggi (10.12.22), passa a gialla per la giornata di domani (11.12.22). Prestare comunque la massima attenzione.', '9.0', 2, 2),
(6, 'https://www.facebook.com/photo/?fbid=516665333828715&set=a.457242599770989', '2022-12-10 15:23:00', 'Facebook', 'Per domani 11/12/2022 la Protezione Civile Regionale ha diramato una allerta \"GIALLA\" con \"Fase di Attenzione\" dalle ore 0,00 alle ore 24,00', '9.8', 4, 3),
(8, 'https://twitter.com/sulsitodisimone/status/1607975389732683777', '2022-09-16 00:00:00', 'Twitter', '16 settembre 2022: A Senigallia si verifica un\'inondazione per uno straordinario straripamento del Misa', NULL, 5, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `Riparazione`
--

CREATE TABLE IF NOT EXISTS `Riparazione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_ora` datetime NOT NULL,
  `tipologia` varchar(30) DEFAULT NULL,
  `esito` tinyint(1) DEFAULT NULL,
  `descrizione` text,
  `id_sensore` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_sensore` (`id_sensore`)
) ;

--
-- Dump dei dati per la tabella `Riparazione`
--

INSERT INTO `Riparazione` (`id`, `data_ora`, `tipologia`, `esito`, `descrizione`, `id_sensore`) VALUES
(1, '2022-08-27 09:44:01', 'aggiornamento', 1, 'Aggiornamento alla versione del firmware più recente', '7634782462'),
(2, '2022-10-10 14:45:17', 'aggiornamento', 1, 'Aggiornamento che corregge falle di sicurezza', '7634782462'),
(3, '2021-05-11 17:35:57', 'reset', 0, 'Tentativo di ripristino del sensore che non comunica più con il PC', '4353246674'),
(4, '2022-04-02 09:00:00', 'ricalibrazione', 1, 'Ricalibrazione del sensore che restituiva valori inaccettabili', '1231235533'),
(5, '2022-07-09 09:47:55', 'sostituzione', 1, 'Sostituzione del sensore con un altro dello stesso tipo, che continuava a fornire valori improbabili', '1231235533');

-- --------------------------------------------------------

--
-- Struttura della tabella `Segnalazione`
--

CREATE TABLE IF NOT EXISTS `Segnalazione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commento` text,
  `tipologia` varchar(40) NOT NULL,
  `url_post` text,
  `situazione_di_pericolo` tinyint(1) DEFAULT NULL,
  `data_ora` datetime NOT NULL,
  `grado_attendibilita` decimal(3,1) DEFAULT NULL,
  `id_zona` int NOT NULL,
  `id_utente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_utente_segnalazione` (`id_utente`),
  KEY `fk_id_zona_segnalazione` (`id_zona`)
) ;

--
-- Dump dei dati per la tabella `Segnalazione`
--

INSERT INTO `Segnalazione` (`id`, `commento`, `tipologia`, `url_post`, `situazione_di_pericolo`, `data_ora`, `grado_attendibilita`, `id_zona`, `id_utente`) VALUES
(1, 'Aiuto aiuto, c\'è una forte bufera di neve qui a Cantiano!!! Che disastro!!!', 'Segnalazione neve', 'https://www.instagram.com/p/CmPL5_PuSul', 1, '2022-12-27 12:00:00', '3.2', 1, 1),
(4, 'Allerta arancione qui a Frontone', 'Segnalazione temporale', 'https://www.facebook.com/photo/?fbid=534034102097398&set=a.329740785860065', 0, '2022-12-10 21:34:58', '8.9', 2, 3),
(6, 'Fiume Musone straripato a Porto Recanati', 'Segnalazione inondazione', NULL, 1, '2021-08-10 14:56:23', '5.6', 13, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `Sensore`
--

CREATE TABLE IF NOT EXISTS `Sensore` (
  `matricola` varchar(12) NOT NULL,
  `tipologia` varchar(50) NOT NULL,
  `anno_produzione` year DEFAULT NULL,
  `descrizione` text,
  `versione_firwmare` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`matricola`)
) ;

--
-- Dump dei dati per la tabella `Sensore`
--

INSERT INTO `Sensore` (`matricola`, `tipologia`, `anno_produzione`, `descrizione`, `versione_firwmare`) VALUES
('1000000', 'Idrometro', 2022, 'Asta graduata che serve a determinare la quota del pelo liquido di un corso d\'acqua, rispetto a una quota di riferimento', '1.2'),
('1231235533', 'Radiometro per umidità', 2019, 'Radiometro per misurazione umidità', '2.3'),
('4353246674', 'Radiometro per bacino d\'acqua', 2020, 'Radiometro per misurazione della portata del bacino fluviale', '1.5'),
('7634782462', 'Radiometro per bacino d\'acqua', 2010, 'Radiometro di test', '11.4');

-- --------------------------------------------------------

--
-- Struttura della tabella `SessioneCampionamento`
--

CREATE TABLE IF NOT EXISTS `SessioneCampionamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_ora` datetime NOT NULL,
  `durata` decimal(5,2) NOT NULL,
  `val_min` float DEFAULT NULL,
  `val_max` float DEFAULT NULL,
  `media_misurazioni` float DEFAULT NULL,
  `id_zona` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_zona` (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `SessioneCampionamento`
--

INSERT INTO `SessioneCampionamento` (`id`, `data_ora`, `durata`, `val_min`, `val_max`, `media_misurazioni`, `id_zona`) VALUES
(1, '2022-06-14 12:30:00', '30.00', 2, 8.5, 6.51525, 5),
(2, '2022-06-15 12:30:00', '30.00', 2, 8.5, 6.163, 5),
(3, '2022-06-16 12:30:00', '30.00', 1, 9.23, 5.647, 5),
(4, '2022-12-15 10:15:13', '30.00', 3.2, 8.7, 7.9, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `Utente`
--

CREATE TABLE IF NOT EXISTS `Utente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` text,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `grado_attendibilita` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

--
-- Dump dei dati per la tabella `Utente`
--

INSERT INTO `Utente` (`id`, `url`, `nome`, `cognome`, `nickname`, `grado_attendibilita`) VALUES
(1, NULL, 'Federico', 'Arduini', 'fedyardu', '9.5'),
(2, 'https://www.instagram.com/_luigi.verdi/', 'Luigi', 'Verdi', '_luigi.verdi', '6.7'),
(3, 'https://www.instagram.com/mariorossi93474/', 'Mario', 'Rossi', 'mariorossi93474', '7.7'),
(4, 'https://twitter.com/brandoboy_09', 'Brando', 'Della Rovere', 'brandoboy_09', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `UtentePiattaforma`
--

CREATE TABLE IF NOT EXISTS `UtentePiattaforma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` text,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `grado_attendibilita` decimal(3,1) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `citta` varchar(40) DEFAULT NULL,
  `password` char(255) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `cellulare` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

--
-- Dump dei dati per la tabella `UtentePiattaforma`
--

INSERT INTO `UtentePiattaforma` (`id`, `url`, `nome`, `cognome`, `nickname`, `grado_attendibilita`, `data_nascita`, `citta`, `password`, `email`, `cellulare`) VALUES
(1, NULL, 'Marcello', 'Bedosti', 'marcy000', '7.8', '1983-06-22', 'Termoli', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'marcy_bedosti@live.it', '2423432432'),
(3, NULL, 'Gianni', 'Azzurri', 'giannygul90', '9.6', '1978-12-21', 'Frontone', '81ee762a3c06403223d37a49837695bbbda10742', 'gianni_gul_90@hotmail.it', '4353456546'),
(4, NULL, 'Mario', 'Garofalo', 'MarioMario#8273', NULL, '1982-04-25', 'Gubbio', '7e0b88ff7d5aec355e5e19aaae46831db0ea7e06', 'mario_garofalo_29@gmail.com', '2324345546');

-- --------------------------------------------------------

--
-- Struttura della tabella `VerificaPost`
--

CREATE TABLE IF NOT EXISTS `VerificaPost` (
  `id_post` int NOT NULL,
  `id_fact_checker` int NOT NULL,
  `data_ora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_post`,`id_fact_checker`),
  KEY `fk_fact_checker_verificatore` (`id_fact_checker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `VerificaPost`
--

INSERT INTO `VerificaPost` (`id_post`, `id_fact_checker`, `data_ora`) VALUES
(1, 2, '2022-10-05 18:15:12'),
(2, 7, '2022-03-06 16:23:23'),
(3, 1, '2022-03-25 11:11:11'),
(3, 5, '2022-02-27 15:50:12'),
(4, 3, '2022-06-08 16:31:30'),
(5, 3, '2023-04-24 16:55:56'),
(5, 7, '2022-04-04 12:54:00'),
(6, 7, '2022-10-19 19:10:38');

-- --------------------------------------------------------

--
-- Struttura della tabella `Zona`
--

CREATE TABLE IF NOT EXISTS `Zona` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `tipologia` varchar(30) NOT NULL,
  `comune` varchar(40) NOT NULL,
  `provincia` varchar(15) NOT NULL,
  `regione` varchar(20) NOT NULL,
  `latitudine` decimal(9,7) DEFAULT NULL,
  `longitudine` decimal(9,7) DEFAULT NULL,
  `quota` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`codice`)
) ;

--
-- Dump dei dati per la tabella `Zona`
--

INSERT INTO `Zona` (`codice`, `tipologia`, `comune`, `provincia`, `regione`, `latitudine`, `longitudine`, `quota`) VALUES
(1, 'Zona fluviale', 'Pesaro', 'Pesaro Urbino', 'Marche', '43.9101500', '12.9133000', '190.0'),
(2, 'Zona montuosa', 'Frontone', 'Pesaro Urbino', 'Marche', '43.5144390', '12.7384500', '412.0'),
(3, 'Zona collinare', 'Cagli', 'Pesaro Urbino', 'Marche', '43.5470000', '12.6473000', '276.0'),
(4, 'Zona collinare', 'Barbara', 'Ancona', 'Marche', '43.5807500', '13.0246190', '219.0'),
(5, 'Zona fluviale', 'Senigallia', 'Ancona', 'Marche', '43.7130560', '13.2183330', '5.0'),
(6, 'Zona pianeggiante', 'Fano', 'Pesaro Urbino', 'Marche', '43.8333330', '13.0166670', '12.0'),
(7, 'Zona fluviale', 'Mondolfo', 'Pesaro Urbino', 'Marche', '43.7517000', '13.0955690', '144.0'),
(8, 'Zona pianeggiante', 'San Benedetto del Tronto', 'Ascoli Piceno', 'Marche', '42.9437810', '13.8833310', '4.0'),
(9, 'Zona pianeggiante', 'Grottammare', 'Ascoli Piceno', 'Marche', '42.9891000', '13.8680690', '4.0'),
(10, 'Zona pianeggiante', 'Cupra Marittima', 'Ascoli Piceno', 'Marche', '43.0249190', '13.8588890', '4.0'),
(11, 'Zona collinare', 'Urbino', 'Pesaro Urbino', 'Marche', '43.7252390', '12.6372000', '485.0'),
(12, 'Zona collinare', 'Ostra', 'Ancona', 'Marche', '43.6126500', '13.1582310', '188.0'),
(13, 'Zona pianeggiante', 'Porto Recanati', 'Macerata', 'Marche', '43.4298640', '13.6648890', '6.0');

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `AvvioSessione`
--
ALTER TABLE `AvvioSessione`
  ADD CONSTRAINT `fk_collaboratore_sessione` FOREIGN KEY (`id_collaboratore`) REFERENCES `Collaboratore` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sessione_avviata` FOREIGN KEY (`id_sessione`) REFERENCES `SessioneCampionamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `DiramazioneAllerta`
--
ALTER TABLE `DiramazioneAllerta`
  ADD CONSTRAINT `fk_allerta_diramata` FOREIGN KEY (`id_allerta`) REFERENCES `Allerta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zona_interessata` FOREIGN KEY (`codice_zona`) REFERENCES `Zona` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `EsecuzioneRiparazione`
--
ALTER TABLE `EsecuzioneRiparazione`
  ADD CONSTRAINT `fk_riparatore` FOREIGN KEY (`id_collaboratore`) REFERENCES `Collaboratore` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_riparazione` FOREIGN KEY (`id_riparazione`) REFERENCES `Riparazione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `FileMultimediale`
--
ALTER TABLE `FileMultimediale`
  ADD CONSTRAINT `fk_id_post_file_multimediale` FOREIGN KEY (`id_post`) REFERENCES `Post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_segnalazione_file_multimediale` FOREIGN KEY (`id_segnalazione`) REFERENCES `Segnalazione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ImpiegoSensore`
--
ALTER TABLE `ImpiegoSensore`
  ADD CONSTRAINT `fk_sensore_impiegato` FOREIGN KEY (`matricola_sensore`) REFERENCES `Sensore` (`matricola`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sessione_campionamento` FOREIGN KEY (`id_sessione`) REFERENCES `SessioneCampionamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Misurazione`
--
ALTER TABLE `Misurazione`
  ADD CONSTRAINT `fk_id_sessione` FOREIGN KEY (`id_sessione`) REFERENCES `SessioneCampionamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matricola_sensore` FOREIGN KEY (`matricola_sensore`) REFERENCES `Sensore` (`matricola`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `fk_id_utente` FOREIGN KEY (`id_utente`) REFERENCES `Utente` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_zona_post` FOREIGN KEY (`id_zona`) REFERENCES `Zona` (`codice`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `Riparazione`
--
ALTER TABLE `Riparazione`
  ADD CONSTRAINT `fk_id_sensore` FOREIGN KEY (`id_sensore`) REFERENCES `Sensore` (`matricola`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Segnalazione`
--
ALTER TABLE `Segnalazione`
  ADD CONSTRAINT `fk_id_utente_segnalazione` FOREIGN KEY (`id_utente`) REFERENCES `UtentePiattaforma` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_zona_segnalazione` FOREIGN KEY (`id_zona`) REFERENCES `Zona` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `SessioneCampionamento`
--
ALTER TABLE `SessioneCampionamento`
  ADD CONSTRAINT `fk_id_zona` FOREIGN KEY (`id_zona`) REFERENCES `Zona` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `VerificaPost`
--
ALTER TABLE `VerificaPost`
  ADD CONSTRAINT `fk_fact_checker_verificatore` FOREIGN KEY (`id_fact_checker`) REFERENCES `FactChecker` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_post_verificato` FOREIGN KEY (`id_post`) REFERENCES `Post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
