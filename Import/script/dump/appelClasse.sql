-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: appelclasse
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appel`
--

DROP TABLE IF EXISTS `appel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appel` (
  `dateAppel` date NOT NULL,
  `idPeriode` int(11) NOT NULL,
  `idEleve` int(11) NOT NULL,
  `estPresent` tinyint(2) NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  PRIMARY KEY (`dateAppel`,`idPeriode`,`idEleve`),
  KEY `idPeriode` (`idPeriode`),
  KEY `idEleve` (`idEleve`),
  CONSTRAINT `appel_ibfk_1` FOREIGN KEY (`idPeriode`) REFERENCES `periode` (`id`),
  CONSTRAINT `appel_ibfk_2` FOREIGN KEY (`idEleve`) REFERENCES `eleves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appel`
--

LOCK TABLES `appel` WRITE;
/*!40000 ALTER TABLE `appel` DISABLE KEYS */;
INSERT INTO `appel` VALUES ('2023-09-04',1,1,1,''),('2023-09-04',1,2,1,''),('2023-09-04',2,1,0,''),('2023-09-04',2,2,1,''),('2023-09-05',1,1,2,''),('2023-09-05',1,2,2,''),('2023-09-05',1,3,2,''),('2023-09-05',2,1,2,''),('2023-09-05',2,2,2,''),('2023-09-05',2,3,2,'');
/*!40000 ALTER TABLE `appel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `libelleCourt` varchar(255) NOT NULL,
  `ordre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Toute Petite Section','TPS',10),(2,'Petite Section','PS',20),(3,'Moyenne Section','MS',30),(4,'Cours Préparatoire','CP',50),(5,'Cours Elementaire 1','CE1',60),(6,'Cours Elementaire 2','CE2',70),(7,'Cours Moyen 1','CM1',80),(8,'Cours Moyen 2','CM2',90),(10,'Grande Section','GS',40);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves`
--

DROP TABLE IF EXISTS `eleves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `idSexe` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `dateEntree` date NOT NULL,
  `dateSortie` date NOT NULL,
  `dateNaissance` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idClasse` (`idClasse`),
  KEY `idSexe` (`idSexe`),
  CONSTRAINT `eleves_ibfk_1` FOREIGN KEY (`idClasse`) REFERENCES `classes` (`id`),
  CONSTRAINT `eleves_ibfk_2` FOREIGN KEY (`idSexe`) REFERENCES `sexes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves`
--

LOCK TABLES `eleves` WRITE;
/*!40000 ALTER TABLE `eleves` DISABLE KEYS */;
INSERT INTO `eleves` VALUES (1,'TEST','Testeur',1,3,'2023-09-04','2023-09-05','2015-10-08'),(2,'SCHTROUMPFS','Sdssc',2,2,'2023-09-04','2023-09-26','2023-09-04'),(3,'CCQ','Qscqsc',1,2,'2023-09-04','2024-05-05','2015-04-04');
/*!40000 ALTER TABLE `eleves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libelle`
--

DROP TABLE IF EXISTS `libelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libelle` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libelle`
--

LOCK TABLES `libelle` WRITE;
/*!40000 ALTER TABLE `libelle` DISABLE KEYS */;
INSERT INTO `libelle` VALUES (1,'Vacances de la Toussaint'),(2,'Vacances de Noël'),(3,'Vacances d\'hiver'),(4,'Vacances de printemps'),(5,'Vacances d\'été'),(6,'Carnaval'),(7,'Mi-carême'),(8,'Vacances de Pâques'),(9,'Abolition de l\'esclavage'),(10,'Jour du Recteur'),(11,'Mi-Mai'),(12,'Pont de l\'Ascension'),(13,'Vacances de Pentecôte'),(14,'Congés spécifique'),(15,'1ère période'),(16,'2ème période'),(17,'3ème période'),(18,'4ème période'),(19,'Eté austral'),(20,'Hiver austral'),(21,'Pont'),(22,'Mi-trimestre'),(23,'Fin 1er trimestre'),(24,'Fin 2ème trimestre'),(25,'Vacances de Septembre'),(26,'Vacances de Février'),(27,'Journée vaquée'),(28,'Journées vaquées'),(29,'Arrivée de l\'Evangile'),(30,'Vendredi Saint'),(31,'Vacances de Mai'),(32,'Fête de l\'Autonomie');
/*!40000 ALTER TABLE `libelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miseajour`
--

DROP TABLE IF EXISTS `miseajour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miseajour` (
  `dt` date NOT NULL,
  PRIMARY KEY (`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miseajour`
--

LOCK TABLES `miseajour` WRITE;
/*!40000 ALTER TABLE `miseajour` DISABLE KEYS */;
INSERT INTO `miseajour` VALUES ('2023-07-13');
/*!40000 ALTER TABLE `miseajour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periode`
--

DROP TABLE IF EXISTS `periode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periode`
--

LOCK TABLES `periode` WRITE;
/*!40000 ALTER TABLE `periode` DISABLE KEYS */;
INSERT INTO `periode` VALUES (1,'Matin'),(2,'Après-midi');
/*!40000 ALTER TABLE `periode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `numVersion` float NOT NULL,
  `version` varchar(15) NOT NULL,
  `idZoneVacance` int(11) NOT NULL,
  PRIMARY KEY (`numVersion`),
  KEY `idZoneVacance` (`idZoneVacance`),
  CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`idZoneVacance`) REFERENCES `zonesvacances` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1.01,'Personnelle',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexes`
--

DROP TABLE IF EXISTS `sexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexes`
--

LOCK TABLES `sexes` WRITE;
/*!40000 ALTER TABLE `sexes` DISABLE KEYS */;
INSERT INTO `sexes` VALUES (1,'Garçon'),(2,'Fille');
/*!40000 ALTER TABLE `sexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacances`
--

DROP TABLE IF EXISTS `vacances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacances` (
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `idLibelle` int(11) NOT NULL,
  PRIMARY KEY (`dateFin`),
  KEY `idLibelle_FK` (`idLibelle`) USING BTREE,
  CONSTRAINT `vacances_ibfk_1` FOREIGN KEY (`idLibelle`) REFERENCES `libelle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacances`
--

LOCK TABLES `vacances` WRITE;
/*!40000 ALTER TABLE `vacances` DISABLE KEYS */;
INSERT INTO `vacances` VALUES ('2013-10-19','2013-11-03',1),('2013-12-21','2014-01-05',2),('2014-03-01','2014-03-16',3),('2014-04-26','2014-05-11',4),('2014-07-05','2014-09-01',5),('2014-10-18','2014-11-02',1),('2014-12-20','2015-01-04',2),('2015-02-07','2015-02-22',3),('2015-04-11','2015-04-26',4),('2015-07-04','2015-08-31',5),('2015-10-17','2015-11-01',1),('2015-12-19','2016-01-03',2),('2016-02-13','2016-02-28',3),('2016-04-09','2016-04-24',4),('2016-05-05','2016-05-07',12),('2016-07-05','2016-08-31',5),('2016-10-19','2016-11-02',1),('2016-12-17','2017-01-02',2),('2017-02-18','2017-03-05',3),('2017-04-15','2017-05-01',4),('2017-05-25','2017-05-27',12),('2017-07-08','2017-09-03',5),('2017-10-21','2017-11-05',1),('2017-12-23','2018-01-07',2),('2018-02-10','2018-02-25',3),('2018-04-07','2018-04-22',4),('2018-07-07','2018-09-02',5),('2018-10-20','2018-11-04',1),('2018-12-22','2019-01-06',2),('2019-02-16','2019-03-03',3),('2019-04-13','2019-04-28',4),('2019-05-30','2019-06-01',12),('2019-07-06','2019-09-01',5),('2019-10-19','2019-11-03',1),('2019-12-21','2020-01-05',2),('2020-02-22','2020-03-08',3),('2020-04-18','2020-05-03',4),('2020-05-21','2020-05-23',12),('2020-07-04','2020-08-31',5),('2020-10-17','2020-11-01',1),('2020-12-19','2021-01-03',2),('2021-02-06','2021-02-21',3),('2021-04-10','2021-04-25',4),('2021-05-13','2021-05-15',12),('2021-07-06','2021-09-01',5),('2021-10-23','2021-11-07',1),('2021-12-18','2022-01-02',2),('2022-02-12','2022-02-27',3),('2022-04-16','2022-05-01',4),('2022-05-26','2022-05-29',12),('2022-07-07','2022-08-31',5),('2022-10-22','2022-11-06',1),('2022-12-17','2023-01-02',2),('2023-02-04','2023-02-19',3),('2023-04-08','2023-04-23',4),('2023-05-18','2023-05-21',12),('2023-07-08','2023-09-03',5),('2023-10-21','2023-11-05',1),('2023-12-23','2024-01-07',2),('2024-02-17','2024-03-03',3),('2024-04-13','2024-04-28',4),('2024-05-09','2024-05-12',12),('2024-07-06','2024-09-01',5),('2024-10-19','2024-11-03',1),('2024-12-21','2025-01-05',2),('2025-02-22','2025-03-09',3),('2025-04-19','2025-05-04',4),('2025-05-29','2025-06-01',12),('2025-07-05','2025-08-31',5),('2025-10-18','2025-11-02',1),('2025-12-20','2026-01-04',2),('2026-02-07','2026-02-22',3),('2026-04-04','2026-04-19',4),('2026-05-14','2026-05-17',12),('2026-07-04','2026-08-31',5);
/*!40000 ALTER TABLE `vacances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonesvacances`
--

DROP TABLE IF EXISTS `zonesvacances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonesvacances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonesvacances`
--

LOCK TABLES `zonesvacances` WRITE;
/*!40000 ALTER TABLE `zonesvacances` DISABLE KEYS */;
INSERT INTO `zonesvacances` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'Corse'),(5,'Corse'),(6,'Guadeloupe'),(7,'Martinique'),(8,'Guyane'),(9,'Réunion'),(10,'Mayotte'),(11,'Calédonie'),(12,'Polynésie'),(13,'StPierreMiquelon'),(14,'WallisFutuna');
/*!40000 ALTER TABLE `zonesvacances` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-04 20:17:02
