-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: batallaraces
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `battle`
--

DROP TABLE IF EXISTS `battle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle` (
  `battle_id` int NOT NULL AUTO_INCREMENT,
  `id_player` int NOT NULL,
  `id_warrior` int NOT NULL,
  `warrior_weapon_id` int NOT NULL,
  `oponent_id` int NOT NULL,
  `oponent_weapon_id` int NOT NULL,
  `injuries_caused` int NOT NULL,
  `injuries_suffered` int NOT NULL,
  `battle_points` int NOT NULL,
  PRIMARY KEY (`battle_id`),
  KEY `fk_pid_pid` (`id_player`),
  KEY `fk_wid_wid` (`id_warrior`),
  KEY `fk_wwid_wid` (`warrior_weapon_id`),
  KEY `fk_oid_pid` (`oponent_id`),
  KEY `fk_owid_wid` (`oponent_weapon_id`),
  CONSTRAINT `fk_oid_pid` FOREIGN KEY (`oponent_id`) REFERENCES `warriors` (`warrior_id`),
  CONSTRAINT `fk_owid_wid` FOREIGN KEY (`oponent_weapon_id`) REFERENCES `weapons_available` (`id_weapon`),
  CONSTRAINT `fk_pid_pid` FOREIGN KEY (`id_player`) REFERENCES `players` (`player_id`),
  CONSTRAINT `fk_wid_wid` FOREIGN KEY (`id_warrior`) REFERENCES `warriors` (`warrior_id`),
  CONSTRAINT `fk_wwid_wid` FOREIGN KEY (`warrior_weapon_id`) REFERENCES `weapons_available` (`id_weapon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle`
--

LOCK TABLES `battle` WRITE;
/*!40000 ALTER TABLE `battle` DISABLE KEYS */;
INSERT INTO `battle` VALUES (1,3,7,8,2,2,0,40,0),(2,2,1,3,3,8,60,14,33),(3,4,1,2,7,8,40,0,31),(4,4,5,8,6,8,44,50,0);
/*!40000 ALTER TABLE `battle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `player_name` char(30) NOT NULL,
  `player_password` char(30) NOT NULL,
  `player_global_points` int DEFAULT NULL,
  `player_enemies_defeated` int DEFAULT NULL,
  `player_damage_done` int DEFAULT NULL,
  `player_damage_taken` int DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_name` (`player_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'pau','admin',0,0,0,0),(2,'pol','admin',33,1,60,14),(3,'jordi','admin',0,0,0,40),(4,'presentacion','1234',31,1,84,50);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `races` (
  `race_id` int NOT NULL AUTO_INCREMENT,
  `race_name` char(20) DEFAULT NULL,
  `race_points` int DEFAULT NULL,
  `race_life` int DEFAULT NULL,
  `race_strenght` int DEFAULT NULL,
  `race_defense` int DEFAULT NULL,
  `race_agility` int DEFAULT NULL,
  `race_speed` int DEFAULT NULL,
  PRIMARY KEY (`race_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES (1,'Dwarf',21,60,6,4,4,3),(2,'Human',20,50,5,3,6,5),(3,'Elf',19,40,4,2,7,7);
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warriors`
--

DROP TABLE IF EXISTS `warriors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warriors` (
  `warrior_id` int NOT NULL AUTO_INCREMENT,
  `warrior_name` char(30) DEFAULT NULL,
  `id_race` int DEFAULT NULL,
  `warrior_image_path` char(80) DEFAULT NULL,
  PRIMARY KEY (`warrior_id`),
  KEY `fk_idr_rid` (`id_race`),
  CONSTRAINT `fk_idr_rid` FOREIGN KEY (`id_race`) REFERENCES `races` (`race_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warriors`
--

LOCK TABLES `warriors` WRITE;
/*!40000 ALTER TABLE `warriors` DISABLE KEYS */;
INSERT INTO `warriors` VALUES (1,'Bombur',1,'characters/bombur.png'),(2,'Fili',1,'characters/fili.png'),(3,'Kili',1,'characters/kili.png'),(4,'Faramir',2,'characters/faramir.png'),(5,'Boromir',2,'characters/boromir.png'),(6,'Elendil',2,'characters/elendil.png'),(7,'Thranduil',3,'characters/thranduil.png'),(8,'Legolas',3,'characters/legolas.png'),(9,'Elrond',3,'characters/elrond.png');
/*!40000 ALTER TABLE `warriors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapons` (
  `weapon_id` int NOT NULL AUTO_INCREMENT,
  `weapon_name` char(30) DEFAULT NULL,
  `weapon_speed` int DEFAULT NULL,
  `weapon_strenght` int DEFAULT NULL,
  `weapon_image_path` char(80) DEFAULT NULL,
  `weapon_points` int DEFAULT NULL,
  PRIMARY KEY (`weapon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES (1,'Dagger',3,0,'weapons/dagger.png',10),(2,'Sword',1,1,'weapons/sword.png',10),(3,'Axe',0,3,'weapons/axe.png',10),(4,'Double Sword',2,2,'weapons/doubleSwords.png',14),(5,'Scimitar',2,1,'weapons/scimitar.png',14),(6,'Bow',5,1,'weapons/bow.png',15),(7,'Katana',3,2,'weapons/katana.png',18),(8,'Dirk',4,0,'weapons/dirk.png',12),(9,'Double Axe',0,5,'weapons/doubleAxe.png',20);
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons_available`
--

DROP TABLE IF EXISTS `weapons_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapons_available` (
  `id_race` int NOT NULL,
  `id_weapon` int NOT NULL,
  KEY `fk_wid_idw` (`id_race`),
  KEY `fk_weid_idwe` (`id_weapon`),
  CONSTRAINT `fk_weid_idwe` FOREIGN KEY (`id_weapon`) REFERENCES `weapons` (`weapon_id`),
  CONSTRAINT `fk_wid_idw` FOREIGN KEY (`id_race`) REFERENCES `races` (`race_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons_available`
--

LOCK TABLES `weapons_available` WRITE;
/*!40000 ALTER TABLE `weapons_available` DISABLE KEYS */;
INSERT INTO `weapons_available` VALUES (1,2),(1,3),(1,8),(1,9),(2,1),(2,2),(2,3),(2,4),(2,5),(2,7),(2,8),(3,1),(3,2),(3,4),(3,5),(3,6),(3,8);
/*!40000 ALTER TABLE `weapons_available` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 16:13:12
