-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projet_v1
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresses`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresses` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `numero_rue` int DEFAULT NULL,
  `nom_rue` varchar(100) DEFAULT NULL,
  `complement_adresse` varchar(100) DEFAULT NULL,
  `id_ville_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `adresses_id_ville_fk` (`id_ville_fk`),
  CONSTRAINT `adresses_id_ville_fk` FOREIGN KEY (`id_ville_fk`) REFERENCES `villes` (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
INSERT INTO `adresses` (`id_adresse`, `numero_rue`, `nom_rue`, `complement_adresse`, `id_ville_fk`) VALUES (1,14,'Rue du Président Wilson',NULL,10),(2,22,'Rue Sainte-Catherine',NULL,3),(3,7,'Rue des Trois-Conils',NULL,11),(4,3,'Rue Esprit des Lois',NULL,2),(5,18,'Rue de la République',NULL,9),(6,5,'Rue Victor Hugo',NULL,1),(7,29,'Rue de l’Hôpital',NULL,6),(8,10,'Rue des Carmes',NULL,12),(9,8,'Rue du Faubourg Saint-Antoine',NULL,7),(10,31,'Rue Nationale',NULL,4),(11,6,'Rue du Général de Gaulle',NULL,8),(12,12,'Rue Sainte-Catherine',NULL,1),(13,5,'Avenue de la Marne','Bâtiment B',5),(14,18,'Rue Judaïque',NULL,1),(15,22,'Boulevard du Président Wilson',NULL,1),(16,9,'Allée Haussmann',NULL,1),(17,45,'Rue de Rivoli','Appartement 302',9),(18,7,'Boulevard Haussmann',NULL,9),(19,21,'Rue Oberkampf',NULL,9),(20,3,'Avenue des Champs-Élysées','5eme étage',9),(21,56,'Rue Saint-Dominique',NULL,9),(22,4,'Rue Taillefer',NULL,10),(23,10,'Rue Gambetta',NULL,10),(24,27,'Avenue Georges Pompidou',NULL,10),(25,16,'Rue de la Clarté','Résidence du Parc',10),(26,35,'Place Francheville',NULL,10),(27,2,'Rue Alsace-Lorraine',NULL,12),(28,13,'Boulevard de Strasbourg',NULL,12),(29,25,'Rue Saint-Rome','Appartement 12',12),(30,8,'Place du Capitole',NULL,12),(31,41,'Avenue de Grande Bretagne',NULL,12);
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agences`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agences` (
  `id_agence` int NOT NULL AUTO_INCREMENT,
  `id_ville_fk` int NOT NULL,
  PRIMARY KEY (`id_agence`),
  KEY `agences_id_ville_fk` (`id_ville_fk`),
  CONSTRAINT `agences_id_ville_fk` FOREIGN KEY (`id_ville_fk`) REFERENCES `villes` (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agences`
--

LOCK TABLES `agences` WRITE;
/*!40000 ALTER TABLE `agences` DISABLE KEYS */;
INSERT INTO `agences` (`id_agence`, `id_ville_fk`) VALUES (1,1),(4,2),(2,3),(8,4),(7,6),(5,9),(3,11),(6,12);
/*!40000 ALTER TABLE `agences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auteurs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auteurs` (
  `id_rapport_fk` int NOT NULL,
  `id_personne_fk` int NOT NULL,
  KEY `auteur_id_rapport_fk` (`id_rapport_fk`),
  KEY `auteurs_id_personne_fk` (`id_personne_fk`),
  CONSTRAINT `auteur_id_rapport_fk` FOREIGN KEY (`id_rapport_fk`) REFERENCES `rapports` (`id_rapport`),
  CONSTRAINT `auteurs_id_personne_fk` FOREIGN KEY (`id_personne_fk`) REFERENCES `personnels` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auteurs`
--

LOCK TABLES `auteurs` WRITE;
/*!40000 ALTER TABLE `auteurs` DISABLE KEYS */;
INSERT INTO `auteurs` (`id_rapport_fk`, `id_personne_fk`) VALUES (1,17),(1,18),(1,19),(2,18),(3,18),(4,19),(5,17),(5,18),(6,3),(7,3),(8,5),(9,11),(9,12),(10,11),(10,12);
/*!40000 ALTER TABLE `auteurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capteurs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capteurs` (
  `id_capteur` int NOT NULL,
  `id_gaz_fk` int NOT NULL,
  `id_adresse_capteur_fk` int NOT NULL,
  `etat` tinyint(1) NOT NULL DEFAULT '1',
  `id_agence_fk` int NOT NULL,
  PRIMARY KEY (`id_capteur`),
  KEY `id_adresse_capteur_fk` (`id_adresse_capteur_fk`),
  KEY `id_gaz_fk` (`id_gaz_fk`),
  KEY `capteurs_id_agence_fk` (`id_agence_fk`),
  CONSTRAINT `capteurs_id_agence_fk` FOREIGN KEY (`id_agence_fk`) REFERENCES `agences` (`id_agence`),
  CONSTRAINT `id_adresse_capteur_fk` FOREIGN KEY (`id_adresse_capteur_fk`) REFERENCES `adresses` (`id_adresse`),
  CONSTRAINT `id_gaz_fk` FOREIGN KEY (`id_gaz_fk`) REFERENCES `gaz` (`id_gaz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capteurs`
--

LOCK TABLES `capteurs` WRITE;
/*!40000 ALTER TABLE `capteurs` DISABLE KEYS */;
INSERT INTO `capteurs` (`id_capteur`, `id_gaz_fk`, `id_adresse_capteur_fk`, `etat`, `id_agence_fk`) VALUES (25,1,1,1,1),(26,2,1,1,1),(27,3,1,1,1),(28,4,1,1,1),(29,5,1,1,1),(30,6,1,1,1),(31,4,10,1,8),(36,3,3,1,3),(37,1,5,1,5),(40,4,9,1,7),(42,2,10,1,8),(43,2,6,1,1),(44,3,9,1,7),(46,4,7,1,6),(47,3,2,1,2),(49,3,11,1,8),(50,3,8,1,6),(51,6,7,1,6),(52,2,7,1,6),(55,3,4,1,4),(57,1,2,1,2),(60,5,10,1,8),(61,1,8,1,6),(62,6,10,1,8),(64,5,9,1,7),(65,1,9,1,7),(66,5,7,1,6),(67,4,7,1,6),(68,4,6,1,1),(69,5,11,1,8),(72,3,6,1,1),(73,5,9,1,7),(76,5,9,1,7),(79,1,10,1,8),(80,2,9,1,7),(82,3,7,1,6),(83,6,7,1,6),(85,6,2,1,2),(86,2,9,1,7),(87,3,4,1,4),(90,4,10,1,8),(91,1,2,1,2),(96,2,11,1,8),(97,1,10,1,8),(98,4,11,1,8),(99,2,5,1,5),(100,2,6,1,1),(102,1,3,1,3),(103,1,9,1,7),(104,4,5,1,5),(105,4,2,1,2),(106,4,11,1,8),(107,1,3,1,3),(109,5,5,1,5),(110,3,9,1,7),(112,2,4,1,4),(113,6,3,1,3),(115,3,8,1,6),(116,5,5,1,5),(117,3,2,1,2),(121,3,8,1,6),(122,6,10,1,8),(124,5,4,1,4),(125,3,2,1,2),(126,1,5,1,5),(127,2,2,1,2),(128,2,6,1,1),(129,6,2,1,2),(131,6,3,1,3),(132,3,2,1,2),(133,1,3,1,3),(135,2,10,1,8),(136,5,4,1,4),(138,4,6,1,1),(142,6,11,1,8),(144,1,6,1,1),(145,2,2,1,2),(149,5,4,1,4),(150,6,6,1,1),(151,5,5,1,5),(152,6,3,1,3),(153,4,5,1,5),(155,1,5,1,5),(156,1,5,1,5),(157,6,7,1,6),(158,2,2,1,2),(159,2,4,1,4),(162,2,2,1,2),(163,1,5,1,5),(165,3,4,1,4),(166,5,11,1,8),(167,2,5,1,5),(168,5,8,1,6),(169,4,6,1,1),(170,4,7,1,6),(171,1,4,1,4),(173,3,10,1,8),(174,3,11,1,8),(175,6,5,1,5),(178,2,2,1,2),(179,1,6,1,1),(181,5,7,1,6),(182,4,8,1,6),(183,6,9,1,7),(186,1,5,1,5),(187,2,9,1,7),(188,2,2,1,2),(189,2,8,1,6),(190,4,6,1,1),(191,5,2,1,2),(193,2,10,1,8),(195,2,2,1,2),(196,4,9,1,7),(200,3,8,1,6),(201,1,3,1,3),(202,3,9,1,7),(203,2,8,1,6),(204,6,4,1,4),(205,6,11,1,8),(206,2,10,1,8),(209,4,7,1,6),(210,4,3,1,3),(212,1,11,1,8),(213,2,7,1,6),(215,6,4,1,4),(216,5,11,1,8),(219,3,9,1,7),(220,6,11,1,8),(221,1,2,1,2),(222,4,11,1,8),(223,5,2,1,2),(226,4,10,1,8),(227,6,5,1,5),(228,4,3,1,3),(230,5,4,1,4);
/*!40000 ALTER TABLE `capteurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donnees_capteur`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donnees_capteur` (
  `id_releve` int NOT NULL AUTO_INCREMENT,
  `ref_releve` varchar(11) NOT NULL,
  `donnee` float DEFAULT NULL,
  `id_capteur_fk` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_releve`),
  KEY `id_capteur_fk` (`id_capteur_fk`),
  CONSTRAINT `id_capteur_fk` FOREIGN KEY (`id_capteur_fk`) REFERENCES `capteurs` (`id_capteur`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donnees_capteur`
--

LOCK TABLES `donnees_capteur` WRITE;
/*!40000 ALTER TABLE `donnees_capteur` DISABLE KEYS */;
INSERT INTO `donnees_capteur` (`id_releve`, `ref_releve`, `donnee`, `id_capteur_fk`, `date`) VALUES (1,'PER-25-2403',107,25,'2024-03-01'),(2,'PER-25-2404',471,25,'2024-04-01'),(3,'PER-25-2405',162,25,'2024-05-01'),(4,'PER-26-2403',196.8,26,'2024-03-01'),(5,'PER-26-2404',334.6,26,'2024-04-01'),(6,'PER-26-2405',7.64,26,'2024-05-01'),(7,'PER-27-2403',133,27,'2024-03-01'),(8,'PER-27-2404',488,27,'2024-04-01'),(9,'PER-27-2405',259,27,'2024-05-01'),(10,'PER-28-2403',51.7,28,'2024-03-01'),(11,'PER-28-2404',402,28,'2024-04-01'),(12,'PER-28-2405',168.9,28,'2024-05-01'),(13,'PER-29-2403',433,29,'2024-03-01'),(14,'PER-29-2404',182.5,29,'2024-04-01'),(15,'PER-29-2405',395,29,'2024-05-01'),(16,'PER-30-2403',234,30,'2024-03-01'),(17,'PER-30-2404',144,30,'2024-04-01'),(18,'PER-30-2405',425.2,30,'2024-05-01'),(19,'MAR-31-1807',23.15,31,'2018-07-01'),(20,'STR-36-2008',2.46,36,'2020-08-01'),(21,'STR-36-2078',321.67,36,'2021-05-01'),(22,'PAR-37-2105',405.83,37,'2021-05-01'),(23,'NAN-40-1807',0.09,40,'2018-07-01'),(24,'NAN-40-1867',102.66,40,'2019-04-01'),(25,'NAN-40-1835',401.9,40,'2023-06-01'),(26,'MAR-42-1706',432.38,42,'2017-06-01'),(27,'BOR-43-2406',6.82,43,'2018-09-01'),(28,'BOR-43-2465',219.34,43,'2017-07-01'),(29,'BOR-43-2402',145.21,43,'2024-02-01'),(30,'BOR-43-2482',232.04,43,'2020-01-01'),(31,'NAN-44-2108',339.99,44,'2021-08-01'),(32,'MON-46-2011',493.5,46,'2020-11-01'),(33,'MON-46-2028',455.44,46,'2020-03-01'),(34,'MON-46-2051',480.51,46,'2021-08-01'),(35,'LYO-47-1989',26.07,47,'2021-09-01'),(36,'LYO-47-1998',127.96,47,'2019-10-01'),(37,'LYO-47-1979',89.3,47,'2020-02-01'),(38,'NIC-49-1845',443.29,49,'2020-08-01'),(39,'TOU-50-1943',214.45,50,'2023-11-01'),(40,'TOU-50-1994',355.84,50,'2017-10-01'),(41,'TOU-50-1906',480.4,50,'2019-06-01'),(42,'MON-51-2308',386.5,51,'2023-08-01'),(43,'MON-52-2312',123.21,52,'2023-12-01'),(44,'LIL-55-1740',317.3,55,'2024-02-01'),(45,'LIL-55-1703',368.39,55,'2017-03-01'),(46,'LIL-55-1799',347.63,55,'2024-01-01'),(47,'LYO-57-1804',485.38,57,'2018-04-01'),(48,'LYO-57-1894',75.57,57,'2022-01-01'),(49,'MAR-60-2157',470.19,60,'2022-11-01'),(50,'MAR-60-2149',174.33,60,'2018-06-01'),(51,'MAR-60-2192',432.32,60,'2021-07-01'),(52,'MAR-60-2101',339.91,60,'2021-01-01'),(53,'TOU-61-2208',377.52,61,'2022-08-01'),(54,'MAR-62-2026',228.9,62,'2021-05-01'),(55,'MAR-62-2083',4.66,62,'2022-06-01'),(56,'MAR-62-2010',18.13,62,'2020-10-01'),(57,'NAN-64-1907',41.61,64,'2019-07-01'),(58,'NAN-65-2004',215.35,65,'2020-04-01'),(59,'MON-66-2023',34.85,66,'2024-12-01'),(60,'MON-66-2009',317.07,66,'2020-09-01'),(61,'MON-67-2107',227.36,67,'2021-07-01'),(62,'BOR-68-2410',454.67,68,'2024-10-01'),(63,'NIC-69-1902',448.82,69,'2019-02-01'),(64,'BOR-72-1839',373.19,72,'2019-10-01'),(65,'BOR-72-1810',79.62,72,'2018-10-01'),(66,'NAN-73-2071',494.46,73,'2018-09-01'),(67,'NAN-73-2011',36.83,73,'2019-08-01'),(68,'NAN-73-2001',259.11,73,'2020-01-01'),(69,'NAN-73-2037',409.69,73,'2019-04-01'),(70,'NAN-76-1785',450.02,76,'2021-07-01'),(71,'NAN-76-1743',283.43,76,'2019-02-01'),(72,'MAR-79-1909',476.09,79,'2019-09-01'),(73,'NAN-80-2409',208.94,80,'2024-09-01'),(74,'MON-82-1946',74.62,82,'2021-10-01'),(75,'MON-83-1902',184.12,83,'2019-02-01'),(76,'LYO-85-1903',240.99,85,'2019-03-01'),(77,'NAN-86-2302',65.21,86,'2023-02-01'),(78,'LIL-87-1932',55.66,87,'2023-08-01'),(79,'LIL-87-1982',179.36,87,'2024-06-01'),(80,'MAR-90-1810',425.84,90,'2018-10-01'),(81,'LYO-91-2279',350.79,91,'2017-11-01'),(82,'LYO-91-2205',238.34,91,'2021-12-01'),(83,'NIC-96-1992',279.99,96,'2022-05-01'),(84,'NIC-96-1959',62.31,96,'2023-09-01'),(85,'NIC-96-1995',307.38,96,'2021-02-01'),(86,'MAR-97-2104',156.2,97,'2021-04-01'),(87,'NIC-98-1899',482.56,98,'2024-08-01'),(88,'NIC-98-1850',20.18,98,'2024-11-01'),(89,'PAR-99-1755',269.07,99,'2019-03-01'),(90,'BOR-100-209',99.06,100,'2022-12-01'),(91,'BOR-100-200',150.46,100,'2021-06-01'),(92,'STR-102-240',116.86,102,'2024-04-01'),(93,'NAN-103-230',207.35,103,'2023-08-01'),(94,'PAR-104-223',324.48,104,'2018-04-01'),(95,'PAR-104-227',147.15,104,'2021-11-01'),(96,'LYO-105-240',463.23,105,'2024-03-01'),(97,'NIC-106-241',378.4,106,'2018-07-01'),(98,'NIC-106-240',298.37,106,'2024-01-01'),(99,'NIC-106-241',283.33,106,'2019-02-01'),(100,'STR-107-244',478.06,107,'2022-04-01'),(101,'STR-107-247',78.99,107,'2017-08-01'),(102,'STR-107-240',429.88,107,'2023-12-01'),(103,'PAR-109-245',114.56,109,'2021-04-01'),(104,'PAR-109-246',48.18,109,'2022-05-01'),(105,'PAR-109-240',98.62,109,'2024-09-01'),(106,'NAN-110-192',121.72,110,'2024-10-01'),(107,'NAN-110-190',242.48,110,'2019-02-01'),(108,'NAN-110-199',422.81,110,'2024-04-01'),(109,'LIL-112-211',108,112,'2021-10-01'),(110,'STR-113-180',78.26,113,'2018-04-01'),(111,'STR-113-183',352.58,113,'2024-09-01'),(112,'TOU-115-236',18.83,115,'2023-03-01'),(113,'PAR-116-240',145.99,116,'2024-05-01'),(114,'LYO-117-188',472.29,117,'2017-08-01'),(115,'TOU-121-214',275.4,121,'2024-07-01'),(116,'MAR-122-240',332.48,122,'2024-08-01'),(117,'LIL-124-182',336.5,124,'2024-01-01'),(118,'LIL-124-188',337.23,124,'2021-08-01'),(119,'LIL-124-183',231.56,124,'2023-09-01'),(120,'LIL-124-180',107.97,124,'2018-04-01'),(121,'LYO-125-210',350.1,125,'2021-07-01'),(122,'PAR-126-201',238.59,126,'2020-09-01'),(123,'PAR-126-202',187.31,126,'2018-10-01'),(124,'PAR-126-200',214.45,126,'2020-07-01'),(125,'PAR-126-208',418.2,126,'2020-10-01'),(126,'LYO-127-213',262,127,'2021-10-01'),(127,'BOR-128-249',71.97,128,'2022-08-01'),(128,'LYO-129-183',47.35,129,'2022-05-01'),(129,'LYO-129-181',1.98,129,'2023-05-01'),(130,'STR-131-209',223.29,131,'2019-05-01'),(131,'STR-131-203',353.8,131,'2022-03-01'),(132,'LYO-132-190',368.89,132,'2019-06-01'),(133,'STR-133-170',63.31,133,'2017-03-01'),(134,'MAR-135-233',63.08,135,'2021-01-01'),(135,'MAR-135-231',253.58,135,'2023-12-01'),(136,'MAR-135-236',228.52,135,'2024-04-01'),(137,'LIL-136-221',223,136,'2022-12-01'),(138,'BOR-138-180',453.41,138,'2018-06-01'),(139,'NIC-142-204',187.86,142,'2021-08-01'),(140,'BOR-144-207',87.1,144,'2021-12-01'),(141,'BOR-144-202',46.59,144,'2017-07-01'),(142,'BOR-144-205',64.81,144,'2024-07-01'),(143,'BOR-144-206',478.69,144,'2020-06-01'),(144,'BOR-144-209',395.13,144,'2017-12-01'),(145,'LYO-145-215',69.64,145,'2021-09-01'),(146,'LYO-145-210',244.75,145,'2021-07-01'),(147,'LYO-145-217',53.51,145,'2017-12-01'),(148,'LIL-149-205',473.38,149,'2022-03-01'),(149,'LIL-149-200',133.4,149,'2023-01-01'),(150,'LIL-149-206',357.98,149,'2021-10-01'),(151,'BOR-150-233',239.36,150,'2022-05-01'),(152,'BOR-150-238',25.01,150,'2021-11-01'),(153,'BOR-150-230',371.88,150,'2018-02-01'),(154,'BOR-150-234',275.68,150,'2022-12-01'),(155,'PAR-151-201',281.77,151,'2020-11-01'),(156,'STR-152-220',477.56,152,'2022-09-01'),(157,'PAR-153-223',157.05,153,'2021-10-01'),(158,'PAR-153-222',37.48,153,'2020-06-01'),(159,'PAR-155-211',233.76,155,'2020-10-01'),(160,'PAR-155-215',201.13,155,'2023-05-01'),(161,'PAR-156-190',302.68,156,'2019-04-01'),(162,'PAR-156-193',206.96,156,'2024-05-01'),(163,'MON-157-213',207.59,157,'2019-08-01'),(164,'LYO-158-228',235.14,158,'2024-06-01'),(165,'LYO-158-226',266.74,158,'2022-09-01'),(166,'LIL-159-228',345.06,159,'2019-09-01'),(167,'LIL-159-221',313.85,159,'2022-11-01'),(168,'LIL-159-221',414.13,159,'2020-12-01'),(169,'LYO-162-190',164.91,162,'2019-09-01'),(170,'PAR-163-210',192.65,163,'2021-06-01'),(171,'PAR-163-210',379.39,163,'2021-11-01'),(172,'LIL-165-200',421.39,165,'2020-01-01'),(173,'NIC-166-200',47.21,166,'2021-04-01'),(174,'NIC-166-208',469.31,166,'2020-09-01'),(175,'NIC-166-209',411.33,166,'2021-09-01'),(176,'PAR-167-236',201.28,167,'2019-10-01'),(177,'PAR-167-233',499.37,167,'2020-05-01'),(178,'PAR-167-238',58.05,167,'2018-07-01'),(179,'TOU-168-226',475.76,168,'2018-09-01'),(180,'TOU-168-224',417.28,168,'2023-08-01'),(181,'BOR-169-180',436.8,169,'2018-07-01'),(182,'MON-170-210',25.87,170,'2018-04-01'),(183,'MON-170-210',407.63,170,'2024-11-01'),(184,'LIL-171-212',97.72,171,'2021-12-01'),(185,'LIL-171-215',286.6,171,'2017-02-01'),(186,'MAR-173-230',309.77,173,'2023-02-01'),(187,'NIC-174-205',352.13,174,'2020-03-01'),(188,'NIC-174-203',386.04,174,'2022-05-01'),(189,'PAR-175-220',461.6,175,'2022-04-01'),(190,'LYO-178-201',169.11,178,'2020-11-01'),(191,'BOR-179-190',188.84,179,'2019-01-01'),(192,'MON-181-206',171.72,181,'2020-04-01'),(193,'MON-181-200',126.32,181,'2020-08-01'),(194,'TOU-182-170',230.79,182,'2017-08-01'),(195,'NAN-183-219',499.15,183,'2023-08-01'),(196,'NAN-183-211',166.7,183,'2023-06-01'),(197,'PAR-186-171',77.58,186,'2017-11-01'),(198,'NAN-187-210',275.54,187,'2021-07-01'),(199,'LYO-188-220',207.2,188,'2022-05-01'),(200,'TOU-189-241',2.75,189,'2024-03-01'),(201,'TOU-189-248',431.16,189,'2018-12-01'),(202,'TOU-189-241',195.79,189,'2023-11-01'),(203,'BOR-190-180',217.2,190,'2018-07-01'),(204,'LYO-191-210',469.84,191,'2021-01-01'),(205,'MAR-193-201',146.85,193,'2020-11-01'),(206,'MAR-193-206',110.23,193,'2020-03-01'),(207,'MAR-193-204',184.45,193,'2021-06-01'),(208,'MAR-193-201',448.7,193,'2019-12-01'),(209,'LYO-195-185',436.86,195,'2019-02-01'),(210,'LYO-195-180',451.51,195,'2018-02-01'),(211,'LYO-195-183',125.58,195,'2022-05-01'),(212,'NAN-196-210',259.21,196,'2021-08-01'),(213,'NAN-196-217',111.21,196,'2024-09-01'),(214,'TOU-200-214',280.94,200,'2019-04-01'),(215,'TOU-200-215',154.9,200,'2023-09-01'),(216,'STR-201-224',378.03,201,'2023-11-01'),(217,'STR-201-221',265.49,201,'2023-02-01'),(218,'STR-201-221',411.99,201,'2022-10-01'),(219,'NAN-202-231',107.28,202,'2023-10-01'),(220,'TOU-203-212',22.88,203,'2023-07-01'),(221,'TOU-203-210',374.98,203,'2021-07-01'),(222,'LIL-204-190',152.57,204,'2022-09-01'),(223,'NIC-205-212',405.22,205,'2023-08-01'),(224,'NIC-205-211',213.87,205,'2022-05-01'),(225,'MAR-206-221',369.46,206,'2022-12-01'),(226,'MON-209-191',423.79,209,'2019-11-01'),(227,'STR-210-230',491.38,210,'2023-08-01'),(228,'NIC-212-221',83.29,212,'2022-12-01'),(229,'MON-213-248',75.12,213,'2021-02-01'),(230,'MON-213-249',70.36,213,'2024-04-01'),(231,'MON-213-240',239.03,213,'2024-08-01'),(232,'LIL-215-240',272.3,215,'2024-03-01'),(233,'NIC-216-190',464.45,216,'2019-04-01'),(234,'NAN-219-190',5.06,219,'2019-02-01'),(235,'NIC-220-220',4.75,220,'2022-06-01'),(236,'NIC-220-222',305.7,220,'2021-04-01'),(237,'LYO-221-190',90.24,221,'2019-01-01'),(238,'NIC-222-220',385.61,222,'2022-04-01'),(239,'LYO-223-240',347.26,223,'2024-07-01'),(240,'MAR-226-216',194.25,226,'2017-12-01'),(241,'MAR-226-217',44.74,226,'2020-09-01'),(242,'PAR-227-221',23.94,227,'2022-11-01'),(243,'STR-228-207',22.54,228,'2023-10-01'),(244,'LIL-230-231',430.31,230,'2023-10-01');
/*!40000 ALTER TABLE `donnees_capteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donnees_rapport`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donnees_rapport` (
  `id_rapport_fk` int NOT NULL,
  `id_releve_fk` int NOT NULL,
  KEY `id_rapport_fk` (`id_rapport_fk`),
  KEY `id_releve_fk` (`id_releve_fk`),
  CONSTRAINT `id_rapport_fk` FOREIGN KEY (`id_rapport_fk`) REFERENCES `rapports` (`id_rapport`),
  CONSTRAINT `id_releve_fk` FOREIGN KEY (`id_releve_fk`) REFERENCES `donnees_capteur` (`id_releve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donnees_rapport`
--

LOCK TABLES `donnees_rapport` WRITE;
/*!40000 ALTER TABLE `donnees_rapport` DISABLE KEYS */;
INSERT INTO `donnees_rapport` (`id_rapport_fk`, `id_releve_fk`) VALUES (1,214),(1,233),(2,112),(3,34),(4,101),(5,243),(5,163),(5,101),(6,151),(7,90),(7,91),(8,242),(9,95),(10,122),(10,124);
/*!40000 ALTER TABLE `donnees_rapport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gaz`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaz` (
  `id_gaz` int NOT NULL AUTO_INCREMENT,
  `nom_gaz` varchar(150) NOT NULL,
  `sigle` varchar(3) NOT NULL,
  `id_type_gaz_fk` int NOT NULL,
  PRIMARY KEY (`id_gaz`),
  KEY `id_type_gaz_fk` (`id_type_gaz_fk`),
  CONSTRAINT `id_type_gaz_fk` FOREIGN KEY (`id_type_gaz_fk`) REFERENCES `type_gaz` (`id_type_gaz`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaz`
--

LOCK TABLES `gaz` WRITE;
/*!40000 ALTER TABLE `gaz` DISABLE KEYS */;
INSERT INTO `gaz` (`id_gaz`, `nom_gaz`, `sigle`, `id_type_gaz_fk`) VALUES (1,'Protoxyde d\'azote','N2O',1),(2,'Ozone troposphérique','O3',1),(3,'Méthane','CH4',1),(4,'Hydrofluorocarbures','HFC',2),(5,'Hexafluorure de soufre','SF6',2),(6,'Dioxyde de carbone','CO2',1);
/*!40000 ALTER TABLE `gaz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` (`id_genre`, `libelle`) VALUES (1,'Homme'),(2,'Femme');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_capteur`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_capteur` (
  `id_capteur_fk` int NOT NULL,
  `id_personnel_fk` int NOT NULL,
  KEY `maintenance_capteur_id_capteur_fk` (`id_capteur_fk`),
  KEY `maintenance_capteur_id_personnel_fk` (`id_personnel_fk`),
  CONSTRAINT `maintenance_capteur_id_capteur_fk` FOREIGN KEY (`id_capteur_fk`) REFERENCES `capteurs` (`id_capteur`),
  CONSTRAINT `maintenance_capteur_id_personnel_fk` FOREIGN KEY (`id_personnel_fk`) REFERENCES `personnels` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_capteur`
--

LOCK TABLES `maintenance_capteur` WRITE;
/*!40000 ALTER TABLE `maintenance_capteur` DISABLE KEYS */;
INSERT INTO `maintenance_capteur` (`id_capteur_fk`, `id_personnel_fk`) VALUES (25,15),(26,15),(27,14),(28,14),(29,13),(30,13),(43,1),(68,1),(72,1),(100,2),(128,2),(138,2),(144,2),(150,2),(169,1),(179,1),(190,1),(37,7),(99,7),(104,7),(109,7),(116,7),(126,7),(151,7),(153,7),(155,7),(156,7),(163,7),(167,7),(175,7),(186,7),(227,7),(46,20),(50,20),(51,20),(52,20),(61,20),(66,20),(67,20),(82,20),(83,20),(115,20),(121,20),(157,21),(168,21),(170,21),(181,21),(182,21),(189,21),(200,21),(203,21),(209,21),(213,21);
/*!40000 ALTER TABLE `maintenance_capteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pays` (
  `id_pays` int NOT NULL AUTO_INCREMENT,
  `pays` varchar(56) NOT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` (`id_pays`, `pays`) VALUES (1,'France');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnels`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnels` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `numero_telephone` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `date_prise_poste` date NOT NULL,
  `diplome` varchar(100) DEFAULT NULL,
  `id_genre_fk` int NOT NULL,
  `id_adresse_fk` int NOT NULL,
  `id_agence_fk` int NOT NULL,
  `id_poste_fk` int NOT NULL,
  `id_ville_naissance_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `id_adresse_fk` (`id_adresse_fk`),
  KEY `id_agence_fk` (`id_agence_fk`),
  KEY `id_poste_fk` (`id_poste_fk`),
  KEY `id_genre_fk` (`id_genre_fk`),
  KEY `personnels_id_ville_naissance_fk` (`id_ville_naissance_fk`),
  CONSTRAINT `id_adresse_fk` FOREIGN KEY (`id_adresse_fk`) REFERENCES `adresses` (`id_adresse`),
  CONSTRAINT `id_agence_fk` FOREIGN KEY (`id_agence_fk`) REFERENCES `agences` (`id_agence`),
  CONSTRAINT `id_genre_fk` FOREIGN KEY (`id_genre_fk`) REFERENCES `genres` (`id_genre`),
  CONSTRAINT `id_poste_fk` FOREIGN KEY (`id_poste_fk`) REFERENCES `postes` (`id_poste`),
  CONSTRAINT `personnels_id_ville_naissance_fk` FOREIGN KEY (`id_ville_naissance_fk`) REFERENCES `villes` (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnels`
--

LOCK TABLES `personnels` WRITE;
/*!40000 ALTER TABLE `personnels` DISABLE KEYS */;
INSERT INTO `personnels` (`id_personne`, `nom`, `prenom`, `date_naissance`, `numero_telephone`, `email`, `date_prise_poste`, `diplome`, `id_genre_fk`, `id_adresse_fk`, `id_agence_fk`, `id_poste_fk`, `id_ville_naissance_fk`) VALUES (1,'Martin','Camille','1998-03-15','06 45 12 87 90','camille.martin@email.com','2022-09-01',NULL,2,12,1,1,3),(2,'Bernard','Lucas','1995-11-22','06 87 45 32 18','lucas.bernard@email.com','2021-05-03',NULL,1,13,1,1,12),(3,'Dubois','Emma','2001-07-05','07 66 28 19 73','emma.dubois@email.com','2023-01-12',NULL,2,14,1,2,1),(4,'Thomas','Hugo','1990-04-18','06 32 76 58 45','hugo.thomas@email.com','2020-11-15','Mastère Spécialisé Managment Qualité Securité Environnement - RSE : CESI Bordeaux',1,15,1,3,2),(5,'Robert','Chloé','1999-12-30','07 81 64 21 39','chloe.robert@email.com','2022-07-06',NULL,2,16,1,2,4),(6,'Richard','Nathan','1987-06-02','06 59 78 23 41','nathan.richard@email.com','2021-03-20','Doctorat chimie environnementale : Université de Nantes',1,17,5,3,7),(7,'Petit','Léa','1996-08-10','06 84 53 26 71','lea.petit@email.com','2023-09-05',NULL,2,18,5,1,13),(8,'Durand','Gabriel','1993-09-25','07 90 34 61 82','gabriel.durand@email.com','2022-02-08',NULL,1,19,5,2,11),(9,'Leroy','Inès','2000-01-13','06 41 29 83 75','ines.leroy@email.com','2024-04-01',NULL,2,20,5,2,6),(10,'Moreau','Mathis','2002-02-27','06 78 95 43 61','mathis.moreau@email.com','2023-10-18',NULL,1,21,5,2,8),(11,'Simon','Manon','1997-05-19','06 52 71 86 94','manon.simon@email.com','2021-06-02',NULL,2,22,1,2,14),(12,'Laurent','Louis','1985-07-01','07 36 85 24 90','louis.laurent@email.com','2020-08-27',NULL,1,23,1,2,15),(13,'Lefebvre','Clara','1994-12-08','06 92 40 67 35','clara.lefebvre@email.com','2022-01-09',NULL,2,24,1,1,16),(14,'Michel','Jules','2000-10-03','07 25 63 14 80','jules.michel@email.com','2023-09-14',NULL,1,25,1,1,17),(15,'Garcia','Zoé','1992-11-21','06 74 81 59 62','zoe.garcia@email.com','2021-05-11',NULL,2,26,1,1,18),(16,'David','Tom','1989-01-11','06 87 23 47 11','tom.david@email.com','2020-11-06','Ingenieur generaliste : CESI La rochelle',1,27,6,3,19),(17,'Bertrand','Lilou','1990-04-07','07 18 52 79 86','lilou.bertrand@email.com','2022-02-20',NULL,2,28,6,2,20),(18,'Roux','Adam','1998-09-23','06 64 30 25 78','adam.roux@email.com','2021-07-03',NULL,1,29,6,2,21),(19,'Vincent','Anna','1991-06-06','07 49 86 32 17','anna.vincent@email.com','2021-10-12',NULL,2,30,6,2,22),(20,'Fournier','Enzo','2003-03-17','06 53 74 60 94','enzo.fournier@email.com','2022-03-24',NULL,1,31,6,1,23),(21,'Girard','Jade','2003-05-29','07 42 68 93 27','jade.girard@email.com','2024-04-07',NULL,2,31,6,1,23);
/*!40000 ALTER TABLE `personnels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postes` (
  `id_poste` int NOT NULL AUTO_INCREMENT,
  `intitule_poste` varchar(100) NOT NULL,
  PRIMARY KEY (`id_poste`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postes`
--

LOCK TABLES `postes` WRITE;
/*!40000 ALTER TABLE `postes` DISABLE KEYS */;
INSERT INTO `postes` (`id_poste`, `intitule_poste`) VALUES (1,'Assisté d\'agent technique'),(2,'Assisté d\'agent administratif'),(3,'Chef d\'agence');
/*!40000 ALTER TABLE `postes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rapports`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rapports` (
  `id_rapport` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `analyse` text NOT NULL,
  `id_agence_rapport_fk` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `Ref_rapport` varchar(9) NOT NULL,
  PRIMARY KEY (`id_rapport`),
  KEY `id_agence_rapport_fk` (`id_agence_rapport_fk`),
  CONSTRAINT `id_agence_rapport_fk` FOREIGN KEY (`id_agence_rapport_fk`) REFERENCES `agences` (`id_agence`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rapports`
--

LOCK TABLES `rapports` WRITE;
/*!40000 ALTER TABLE `rapports` DISABLE KEYS */;
INSERT INTO `rapports` (`id_rapport`, `date`, `analyse`, `id_agence_rapport_fk`, `titre`, `Ref_rapport`) VALUES (1,'2023-02-14','Une légère augmentation du CO2 a été observée, atteignant un nouveau pic saisonnier.',6,'Hausse saisonnière du CO2','TOU140223'),(2,'2023-04-22','Les concentrations de méthane (CH4) ont connu une hausse rapide, liée à la fonte du pergélisol.',6,'Accélération du méthane','TOU220423'),(3,'2023-07-05','Une stagnation temporaire du N2O a été détectée, probablement due à une activité agricole réduite.',6,'Impact agricole sur le N2O','TOU050723'),(4,'2023-09-30','Les émissions de GESI, notamment l\'ozone troposphérique, ont augmenté lors d\'une vague de chaleur.',6,'Hausse de l\'ozone durant une canicule','TOU300923'),(5,'2023-11-18','Les niveaux de CO2 sont restés exceptionnellement élevés malgré la baisse des activités économiques.',6,'CO2 élevé malgré la baisse économique','TOU181123'),(6,'2024-01-11','Une concentration record de GES a été mesurée après des incendies massifs.',1,'Incendies et concentration record de GES','BOR110124'),(7,'2024-03-27','Les GESI issus du transport maritime ont montré une diminution après de nouvelles régulations.',1,'Réduction des GESI maritimes','BOR270324'),(8,'2024-06-19','Augmentation anormale de méthane détectée, corrélée aux inondations récentes.',1,'Méthane et inondations','PER190624'),(9,'2024-09-03','Baisse notable du N2O atmosphérique observée après une saison agricole particulièrement sèche.',5,'Sécheresse et baisse de N2O','PAR030924'),(10,'2024-11-20','Les concentrations de GES globaux restent sur une trajectoire ascendante, sans inflexion notable.',5,'Trajectoire ascendante des GES globaux','PAR201124');
/*!40000 ALTER TABLE `rapports` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rapport_pas_update` BEFORE UPDATE ON `rapports` FOR EACH ROW begin
    SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Modification des rapports interdite';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rapport_pas_delete` BEFORE DELETE ON `rapports` FOR EACH ROW begin
    SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Suppression des rapports interdite';
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `region`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id_region` int NOT NULL AUTO_INCREMENT,
  `region` varchar(50) NOT NULL,
  `id_pays_fk` int NOT NULL,
  PRIMARY KEY (`id_region`),
  KEY `region_id_pays_fk_fk` (`id_pays_fk`),
  CONSTRAINT `region_id_pays_fk_fk` FOREIGN KEY (`id_pays_fk`) REFERENCES `pays` (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`id_region`, `region`, `id_pays_fk`) VALUES (1,'Auvergne-Rhône-Alpes',1),(2,'Grand Est',1),(3,'Hauts-de-France',1),(4,'Île-de-France',1),(5,'Nouvelle-Aquitaine',1),(6,'Occitanie',1),(7,'Pays de la Loire',1),(8,'Provence-Alpes-Côte d\'Azur',1),(9,'Bretagne',1),(10,'Centre-Val de Loire',1),(11,'Bourgogne-Franche-Comté',1);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_gaz`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_gaz` (
  `id_type_gaz` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(10) NOT NULL,
  PRIMARY KEY (`id_type_gaz`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_gaz`
--

LOCK TABLES `type_gaz` WRITE;
/*!40000 ALTER TABLE `type_gaz` DISABLE KEYS */;
INSERT INTO `type_gaz` (`id_type_gaz`, `libelle`) VALUES (1,'GES'),(2,'GESI');
/*!40000 ALTER TABLE `type_gaz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villes` (
  `id_ville` int NOT NULL AUTO_INCREMENT,
  `ville` varchar(100) NOT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `id_region_fk` int NOT NULL,
  PRIMARY KEY (`id_ville`),
  KEY `villes_id_region_fk` (`id_region_fk`),
  CONSTRAINT `villes_id_region_fk` FOREIGN KEY (`id_region_fk`) REFERENCES `region` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villes`
--

LOCK TABLES `villes` WRITE;
/*!40000 ALTER TABLE `villes` DISABLE KEYS */;
INSERT INTO `villes` (`id_ville`, `ville`, `code_postal`, `id_region_fk`) VALUES (1,'Bordeaux','33000',5),(2,'Lille','59000',3),(3,'Lyon','69000',1),(4,'Marseille','13000',8),(5,'Mérignac','33700',5),(6,'Montpellier','34000',6),(7,'Nantes','44000',7),(8,'Nice','06000',8),(9,'Paris','75000',4),(10,'Périgeux','24000',5),(11,'Strasbourg','67000',2),(12,'Toulouse','31000',6),(13,'Rennes','35000',9),(14,'Orléans','45000',10),(15,'Clermont-Ferrand','63000',1),(16,'Dijon','21000',11),(17,'Tours','37000',10),(18,'Reims','51100',2),(19,'Limoges','87000',5),(20,'Perpignan','66000',6),(21,'Metz','57000',2),(22,'Angers','49000',7),(23,'Pau','64000',5);
/*!40000 ALTER TABLE `villes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'projet_v1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 12:23:11
