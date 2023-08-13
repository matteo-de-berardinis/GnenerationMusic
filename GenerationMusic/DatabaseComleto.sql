-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: databasegeneration
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `idArtista` int NOT NULL AUTO_INCREMENT,
  `nome_artista` varchar(45) DEFAULT NULL,
  `eta` int DEFAULT NULL,
  `genere` varchar(45) DEFAULT NULL,
  `anno_nascita` date DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `idUtente` int DEFAULT NULL,
  `bio` longtext,
  PRIMARY KEY (`idArtista`),
  KEY `utenteArtistaID_idx` (`idUtente`),
  CONSTRAINT `utenteArtistaID` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Giovanni Verdi',40,'rap','1990-02-17',400,5,'Un rapper artistico carismatico con versi taglienti, che incanta il pubblico con la sua presenza magnetica e la sua energia esplosiva, diventando rapidamente una voce rispettata nell\'universo dell\'hip-hop'),(2,'Sofia Bianchi',28,'pop','1990-02-17',200,6,'Una promessa musicale che irradia carisma con la sua voce potente e le sue melodie avvolgenti, sta rapidamente emergendo come un\'icona nel panorama musicale contemporaneo, catturando l\'attenzione di fan devoti in tutto il mondo'),(3,'John Fritz',40,'rap','1990-02-17',300,7,'Un cantante rap infuocato che brucia il palco con la sua voce potente e i testi incendiari, catturando l\'attenzione del pubblico con la sua presenza magnetica e il suo flusso inarrestabile'),(4,'fabri fibra ',40,'rap','1990-02-17',400,8,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(5,'liberato ',40,'commerciale','1990-02-17',100,9,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(6,'geolier',40,'rap','1990-02-17',200,10,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(7,'madame',40,'commerciale','1990-02-17',200,11,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(8,'adele ',42,'pop','1990-02-17',400,12,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(9,'stromae',20,'pop','1990-02-17',200,13,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(10,'dAgostino',50,'tekno','1980-02-17',250,14,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(11,'Mashmellow',30,'commerciale','1980-02-17',NULL,15,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(12,'cox',40,'house','1980-02-17',NULL,16,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(13,'capriati',50,NULL,'1980-02-17',NULL,17,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(14,'steven oki',40,NULL,'1980-02-17',NULL,18,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(38,NULL,NULL,NULL,NULL,NULL,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band` (
  `idBand` int NOT NULL AUTO_INCREMENT,
  `nome_band` varchar(45) DEFAULT NULL,
  `genere` varchar(45) DEFAULT NULL,
  `anno_fondazione` date DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `idUtente` int DEFAULT NULL,
  `bio` longtext,
  PRIMARY KEY (`idBand`),
  KEY `bandUtenteID_idx` (`idUtente`),
  CONSTRAINT `bandUtenteID` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,'The Velvet Echoes','rock','1990-01-21',400,19,'Una band rock infuocata che fa vibrare il pubblico con il loro suono potente e le loro performance elettrizzanti, conquistando il cuore degli amanti del rock con la loro energia travolgente e il loro spirito ribelle'),(2,'The Midnight Serenade','progressive rock','1990-01-21',200,20,'Una band rock esplosiva che incendia il palco e conquista il cuore del pubblico con il loro sound potente e la loro energia contagiosa'),(3,'Fury Pulse','punk','1990-01-21',300,21,'Una band rock incendiaria che trasmette un\'energia elettrizzante attraverso il loro suono potente, scuotendo il pubblico con le loro performance travolgenti e il loro carisma magnetico'),(4,'imageDragons','commerciale','1990-01-21',400,22,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(5,'maroon','commerciale','1990-01-21',300,23,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(6,'bts','rock','1990-01-21',500,24,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(7,'monkey','commerciale','1990-01-21',400,25,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(8,'affiel','commerciale','1990-01-21',200,26,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(9,'coldplay','classico','1990-01-21',400,27,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),(10,'oasis',NULL,'1990-01-21',300,28,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `eta` int DEFAULT NULL,
  `anno_nascita` date DEFAULT NULL,
  `idUtente` int DEFAULT NULL,
  `bio` longtext,
  PRIMARY KEY (`idCliente`),
  KEY `clienteUtente_idx` (`idUtente`),
  CONSTRAINT `clienteUtenteID` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'matteo','de berardinis',22,'2002-09-26',29,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commenti_admin`
--

DROP TABLE IF EXISTS `commenti_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commenti_admin` (
  `idcommentiAdmin` int NOT NULL AUTO_INCREMENT,
  `nomeUtente` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `commento` longtext,
  PRIMARY KEY (`idcommentiAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenti_admin`
--

LOCK TABLES `commenti_admin` WRITE;
/*!40000 ALTER TABLE `commenti_admin` DISABLE KEYS */;
INSERT INTO `commenti_admin` VALUES (1,'matteo','deberardinismatteo9@gmail.com','ottima');
/*!40000 ALTER TABLE `commenti_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commenti_artista`
--

DROP TABLE IF EXISTS `commenti_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commenti_artista` (
  `idUtente` int DEFAULT NULL,
  `testo` longtext,
  `idArtista` int DEFAULT NULL,
  `valutazione` int DEFAULT NULL,
  `idcommento` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idcommento`),
  UNIQUE KEY `idcommento_UNIQUE` (`idcommento`),
  KEY `commentiArtistaArtistaID_idx` (`idArtista`),
  KEY `commentiArtistaUtenteID` (`idUtente`),
  CONSTRAINT `commentiArtistaArtistaID` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentiArtistaUtenteID` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenti_artista`
--

LOCK TABLES `commenti_artista` WRITE;
/*!40000 ALTER TABLE `commenti_artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `commenti_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commenti_band`
--

DROP TABLE IF EXISTS `commenti_band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commenti_band` (
  `idUtente` int DEFAULT NULL,
  `testo` longtext,
  `idBand` int DEFAULT NULL,
  `valutazione` int DEFAULT NULL,
  `idCommento` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCommento`),
  UNIQUE KEY `idCommento_UNIQUE` (`idCommento`),
  KEY `commentiBandBandID_idx` (`idBand`),
  KEY `commentiBandUtenteID` (`idUtente`),
  CONSTRAINT `commentiBandBandID` FOREIGN KEY (`idBand`) REFERENCES `band` (`idBand`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentiBandUtenteID` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenti_band`
--

LOCK TABLES `commenti_band` WRITE;
/*!40000 ALTER TABLE `commenti_band` DISABLE KEYS */;
/*!40000 ALTER TABLE `commenti_band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commenti_locale`
--

DROP TABLE IF EXISTS `commenti_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commenti_locale` (
  `idUtente` int DEFAULT NULL,
  `testo` longtext,
  `idLocale` int DEFAULT NULL,
  `valutazione` int DEFAULT NULL,
  `idCommento` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCommento`),
  UNIQUE KEY `idCommento_UNIQUE` (`idCommento`),
  KEY `commentiLocaleLocaleID_idx` (`idLocale`),
  KEY `commentiLocaleUtenteID` (`idUtente`),
  CONSTRAINT `commentiLocaleLocaleID` FOREIGN KEY (`idLocale`) REFERENCES `locale` (`idLocale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentiLocaleUtenteID` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenti_locale`
--

LOCK TABLES `commenti_locale` WRITE;
/*!40000 ALTER TABLE `commenti_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `commenti_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilita_artista`
--

DROP TABLE IF EXISTS `disponibilita_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilita_artista` (
  `giorno` date DEFAULT NULL,
  `idArtista` int DEFAULT NULL,
  `idDisponibilita` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idDisponibilita`),
  KEY `disponibilitaArtistaID_idx` (`idArtista`),
  CONSTRAINT `disponibilitaArtistaID` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilita_artista`
--

LOCK TABLES `disponibilita_artista` WRITE;
/*!40000 ALTER TABLE `disponibilita_artista` DISABLE KEYS */;
INSERT INTO `disponibilita_artista` VALUES ('2023-06-17',1,2),('2023-06-23',1,4);
/*!40000 ALTER TABLE `disponibilita_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilita_band`
--

DROP TABLE IF EXISTS `disponibilita_band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilita_band` (
  `giorno` date DEFAULT NULL,
  `idBand` int DEFAULT NULL,
  `idDisponibilita` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idDisponibilita`),
  KEY `disponibilitaBand_idx` (`idBand`),
  CONSTRAINT `disponibilitaBand` FOREIGN KEY (`idBand`) REFERENCES `band` (`idBand`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilita_band`
--

LOCK TABLES `disponibilita_band` WRITE;
/*!40000 ALTER TABLE `disponibilita_band` DISABLE KEYS */;
INSERT INTO `disponibilita_band` VALUES ('2023-06-15',1,1),('2023-06-25',1,3);
/*!40000 ALTER TABLE `disponibilita_band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilita_locale`
--

DROP TABLE IF EXISTS `disponibilita_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilita_locale` (
  `giorno` date DEFAULT NULL,
  `idLocale` int DEFAULT NULL,
  `idDisponibilita` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idDisponibilita`),
  KEY `disponibilitaLocaleLocaleID_idx` (`idLocale`),
  CONSTRAINT `disponibilitaLocaleLocaleID` FOREIGN KEY (`idLocale`) REFERENCES `locale` (`idLocale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilita_locale`
--

LOCK TABLES `disponibilita_locale` WRITE;
/*!40000 ALTER TABLE `disponibilita_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilita_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giorno`
--

DROP TABLE IF EXISTS `giorno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giorno` (
  `idgiorno` date NOT NULL,
  `orario` time DEFAULT NULL,
  PRIMARY KEY (`idgiorno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giorno`
--

LOCK TABLES `giorno` WRITE;
/*!40000 ALTER TABLE `giorno` DISABLE KEYS */;
/*!40000 ALTER TABLE `giorno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locale`
--

DROP TABLE IF EXISTS `locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locale` (
  `idLocale` int NOT NULL AUTO_INCREMENT,
  `nome_locale` varchar(45) DEFAULT NULL,
  `citta` varchar(45) DEFAULT NULL,
  `regione` varchar(45) DEFAULT NULL,
  `capienza` int DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `idProprietario` int DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `bio` longtext,
  PRIMARY KEY (`idLocale`),
  KEY `localeProprietarioID_idx` (`idProprietario`),
  CONSTRAINT `localeProprietarioID` FOREIGN KEY (`idProprietario`) REFERENCES `proprietario` (`idProprietario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locale`
--

LOCK TABLES `locale` WRITE;
/*!40000 ALTER TABLE `locale` DISABLE KEYS */;
INSERT INTO `locale` VALUES (3,'tekno','roma','roma',6000,10000,12,'img\\tekno.jpg\"','Un ritrovo retrò dai colori vivaci, dove il fascino vintage si mescola con la musica, creando un\'atmosfera unica che trasporta gli ospiti in un\'epoca d\'oro del divertimento e della buona musica'),(4,'relax','firenze','firenze',2000,3000,13,'img\\relax.jpg\"','Un\'oasi musicale nascosta tra le vie della città, dove melodie incantevoli e armonie avvolgenti si fondono per creare un rifugio di serenità e gioia per gli amanti della musica'),(5,'terazza','marche','marche',3000,2000,11,'img\\terazza.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');
/*!40000 ALTER TABLE `locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazione` (
  `idPrenotazione` int NOT NULL AUTO_INCREMENT,
  `data_prenotazione` date DEFAULT NULL,
  `idUtente` int DEFAULT NULL,
  `idArtista` int DEFAULT NULL,
  `idLocale` int DEFAULT NULL,
  `richiesta` longtext,
  `idBand` int DEFAULT NULL,
  PRIMARY KEY (`idPrenotazione`),
  KEY `idUtente1_idx` (`idUtente`),
  KEY `idArtista_idx` (`idArtista`),
  KEY `idLocale_idx` (`idLocale`),
  KEY `idBand_idx` (`idBand`),
  CONSTRAINT `idArtistaP` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idBandP` FOREIGN KEY (`idBand`) REFERENCES `band` (`idBand`),
  CONSTRAINT `idLocaleP` FOREIGN KEY (`idLocale`) REFERENCES `locale` (`idLocale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUtenteP` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazione`
--

LOCK TABLES `prenotazione` WRITE;
/*!40000 ALTER TABLE `prenotazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenotazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietario`
--

DROP TABLE IF EXISTS `proprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietario` (
  `idProprietario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `eta` int DEFAULT NULL,
  `anno_nascita` date DEFAULT NULL,
  `idUtente` int DEFAULT NULL,
  `bio` longtext,
  PRIMARY KEY (`idProprietario`),
  KEY `imprenditoreUtenteID_idx` (`idUtente`),
  CONSTRAINT `imprenditoreUtenteID` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietario`
--

LOCK TABLES `proprietario` WRITE;
/*!40000 ALTER TABLE `proprietario` DISABLE KEYS */;
INSERT INTO `proprietario` VALUES (11,'maria','sole',20,'1990-02-12',1,NULL),(12,'marco ','bovara',25,'1998-05-11',2,NULL),(13,'mattia','maggio',32,'1978-06-20',3,NULL),(14,'giulia','verde',40,'1983-01-12',4,NULL);
/*!40000 ALTER TABLE `proprietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `idUtente` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nazionalita` varchar(45) DEFAULT NULL,
  `citta` varchar(45) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `admin` tinyint DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtente`,`email`),
  UNIQUE KEY `idUtente_UNIQUE` (`idUtente`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'maria01','ciao1','italia','roma',NULL,0,'maria@gmail.com','proprietario'),(2,'marco02','ciao2','italia','napoli',NULL,0,'marco@gmail.com','proprietario'),(3,'mattia03','ciao3','usa','firenze',NULL,0,'mattia@gmail.com','proprietario'),(4,'giulia04','ciao4','spagna','marche ',NULL,0,'giulia@gmail.com','proprietario'),(5,'Giovanni Verdi','GiovanniVerdi','Italia','milano','img\\GiovanniVerdi.jpg\"',0,'giovanniverdi@gmail.com','artista'),(6,'Sofia Bianchi','SofiaBianchi','Italia','roma','img\\SofiaBianchi.jpg\"',0,'sofiabianchi@gmail.com','artista'),(7,'John Fritz','John Fritz','usa','new york','img\\JohnFritz.jpg\"',0,'johnfritz@gmail.com','artista'),(8,'fabri08','ciao8','italia','marche','img\\fabrifibta.jpg\"',0,'fabrifibra@gmail.com','artista'),(9,'liberato09','ciao9','italia','napoli','img\\liberato.jpg\"',0,'liberato@gmail.com','artista'),(10,'geolier10','ciao10','italia','napoli','img\\geolier.jpg\"',0,'grolier@gmail.com','artista'),(11,'madame11','ciao11','italia','roma','img\\madame.jpg\"',0,'madame@gmail.com','artista'),(12,'adele12','ciao12','usa','firenze','img\\adele.jpg\"',0,'adele@gmail.com','artista'),(13,'stromae13','ciao13','francia','marche','img\\stroame.jpg\"',0,'stoame@gmail.com','artista'),(14,'dagostino14','ciao14','italia','napoli','img\\dagostino.jpg\"',0,'dagostino@gmail.com','artista'),(15,'marshmello15','ciao15','usa','firenze','img\\marhmello.jpg\"',0,'marshmello@gmail.com','artista'),(16,'cox16','ciao16','inglese','marche','img\\cox.jpg\"',0,'cox@gmail.com','artista'),(17,'capriati17','ciao17','italia','roma','img\\capriatijpg\"',0,'capriati@gmail.com','artista'),(18,'aoki18','ciao18','usa','firenze','img\\aoki.jpg\"',0,'aoki@gmail.com','artista'),(19,'The Velvet Echoes','TheVelvetEchoes','usa','new york','img\\TheVelvetEchoes.jpg',0,'thevelvetechoes@gmail.com','band'),(20,'The Midnight Serenade','The Midnight Serenade','usa','chicago','img\\The Midnight Serenade.jpg',0,'themidnightserenade@gmail.com','band'),(21,'FuryPulse','FuryPulse','usa','los angeles','img\\FuryPulse.jpg',0,'furypulse@gmail.com','band'),(22,'dragons22','ciao22','usa','roma','img\\dragons.jpg\"',0,'dragons@gmail.com','band'),(23,'maroon23','ciao23','usa','marche','img\\maroon.jpg\"',0,'maroon@gmail.com','band'),(24,'bts24','ciao24','usa','firenze','img\\bts.jpg\"',0,'bts@gmail.com','band'),(25,'monkeys25','ciao25','usa','roma','img\\monkey.jpg\"',0,'monkey@gmail.com','band'),(26,'aiffel26','ciao26','francia','marche','img\\affiel.jpg\"',0,'affiel@gmail.com','band'),(27,'coldplay27','ciao27','usa','napoli','img\\coldplay.jpg\"',0,'coldplay@gmail.com','band'),(28,'oasis28','ciao28','usa','firenze','img\\oasis.jpg\"',0,'oasis@gmail.com','band'),(29,'matteo02','aa','italia','marche','img\\7514adc9-54e8-4204-bd84-351855c00d1.jpg\"',1,'admin@gmail.com','cliente');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-22 21:32:33
