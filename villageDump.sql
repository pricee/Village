CREATE DATABASE  IF NOT EXISTS `village` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `village`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: village
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `clothing`
--

DROP TABLE IF EXISTS `clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothing` (
  `clothingName` varchar(40) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  KEY `clothing_item_fk` (`clothingName`),
  CONSTRAINT `clothing_item_fk` FOREIGN KEY (`clothingName`) REFERENCES `item` (`itemName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing`
--

LOCK TABLES `clothing` WRITE;
/*!40000 ALTER TABLE `clothing` DISABLE KEYS */;
INSERT INTO `clothing` VALUES ('After-School Jacket',2),('Amethyst Shirt',2),('Argyle Knit Shirt',2),('Armor Suit',2),('Bunny Shirt',2),('Camel Shirt',2),('Checkered Tee',1),('Citrus Tee',1),('Comfy Sweater',2),('Crossing Shirt',2),('Dawn Tee',1),('Deep-Blue Tank',0),('Denim Jacket',2),('Detective Outfit',2),('Elephant Tee',1),('Fall Plaid Shirt',2),('Fern Tee',1),('Fish Tee',1),('Flight-Crew Shirt',2),('Four-Ball Tee',1),('Fresh Tee',1),('Funky-Dot Tee',1),('Green Tie-Dye Tee',1),('Heart Tee',1),('Imperial Shirt',2),('Jagged Tee',1),('Jockey Shirt',2),('Jungle-Camo Shirt',2),('Kiwi Tee',1),('Lite Polka Tee',1),('Military Uniform',2),('Misty Tank',0),('Mummy Shirt',2),('MVP Shirt',2),('Painter\'s Shirt',2),('Red Flannel Shirt',2),('Red Warm-Up Suit',2),('Snow Shirt',2),('Splendid Tee',1),('Straw Shirt',2),('Strawberry Tee',1),('Team NTDO Tee',1),('Tin Shirt',2),('U-R-Here Tee',1),('Vertigo Shirt',2),('Waffle Shirt',2),('Work Shirt',2),('Wrap Shirt',2),('Yellow-Bar Tee',1);
/*!40000 ALTER TABLE `clothing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color` varchar(40) NOT NULL DEFAULT 'WHITE',
  PRIMARY KEY (`color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES ('aqua'),('beige'),('black'),('blue'),('brown'),('colorful'),('gray'),('green'),('none'),('orange'),('pink'),('purple'),('red'),('white'),('yellow');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture` (
  `furnitureName` varchar(40) DEFAULT NULL,
  `color1` varchar(40) DEFAULT NULL,
  `color2` varchar(40) DEFAULT NULL,
  KEY `furniture_item_fk` (`furnitureName`),
  KEY `furniture_color_fk` (`color1`),
  CONSTRAINT `furniture_color_fk` FOREIGN KEY (`color1`) REFERENCES `color` (`color`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `furniture_item_fk` FOREIGN KEY (`furnitureName`) REFERENCES `item` (`itemName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture`
--

LOCK TABLES `furniture` WRITE;
/*!40000 ALTER TABLE `furniture` DISABLE KEYS */;
INSERT INTO `furniture` VALUES ('air conditioner','none','none'),('asteroid','brown','gray'),('azalea bonsai','blue','pink'),('bathroom stall','white','white'),('boomerang','aqua','brown'),('covered wagon','beige','brown'),('crane game','pink','pink'),('desert cactus','green','green'),('diver dan','yellow','colorful'),('electric guitar','red','red'),('fan','green','aqua'),('flower table','green','red'),('glass display case','white','white'),('gorgeous sofa','red','red'),('hot plate','white','black'),('ironing set','red','white'),('jukebox','colorful','brown'),('karaoke system','gray','gray'),('life ring','red','white'),('lunar rover','gray','gray'),('mermaid shelf','aqua','pink'),('mini cactus','green','brown'),('minimalist ottoman','white','white'),('mr. flamingo','pink','pink'),('mrs. flamingo','pink','pink'),('mugho bonsai','green','black'),('mummy\'s casket','yellow','colorful'),('ninja sword','brown','brown'),('oil lamp','red','aqua'),('princess bed','aqua','aqua'),('regal bookcase','yellow','white'),('regal chair','yellow','white'),('revolving spice rack','colorful','brown'),('spooky wall lamp','orange','orange'),('stripe bathroom sink','aqua','white'),('submarine','yellow','yellow'),('sweets sofa','pink','beige'),('tea set','yellow','green'),('tiki torch','red','brown'),('traffic cone','red','red'),('tv camera','gray','gray'),('typewriter','white','black'),('upright vacuum','blue','white'),('volleyball net','gray','black'),('washbasin','gray','gray'),('yellow certificate','brown','white'),('zero lamp','white','white');
/*!40000 ALTER TABLE `furniture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemName` varchar(40) NOT NULL,
  `cost` int(11) NOT NULL,
  `style` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`itemName`),
  KEY `item_style_fk` (`style`),
  CONSTRAINT `item_style_fk` FOREIGN KEY (`style`) REFERENCES `style` (`style`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('After-School Jacket',420,'Rock \'n\' Roll'),('air conditioner',2500,'Basic'),('Amethyst Shirt',420,'Ornate'),('Argyle Knit Shirt',460,'Iconic'),('Armor Suit',400,'Historical'),('asteroid',1800,'Flashy'),('azalea bonsai',1500,'Iconic'),('bathroom stall',2000,'Flashy'),('boomerang',1200,'Iconic'),('Bunny Shirt',480,'Cute'),('Camel Shirt',280,'Historical'),('Checkered Tee',390,'Rock \'n\' Roll'),('Citrus Tee',640,'Cute'),('Comfy Sweater',360,'Basic'),('covered wagon',3800,'Historical'),('crane game',1680,'Cute'),('Crossing Shirt',420,'Flashy'),('Dawn Tee',380,'Iconic'),('Deep-Blue Tank',280,'Sporty'),('Denim Jacket',420,'Basic'),('desert cactus',890,'Historical'),('Detective Outfit',480,'Iconic'),('diver dan',60,'Sporty'),('electric guitar',1900,'Rock \'n\' Roll'),('Elephant Tee',260,'Cute'),('Fall Plaid Shirt',370,'Iconic'),('fan',1200,'Iconic'),('Fern Tee',300,'Basic'),('Fish Tee',380,'Rock \'n\' Roll'),('Flight-Crew Shirt',1200,'Official'),('flower table',1900,'Cute'),('Four-Ball Tee',340,'Sporty'),('Fresh Tee',380,'Sporty'),('Funky-Dot Tee',430,'Cute'),('glass display case',2000,'Official'),('gorgeous sofa',120000,'Ornate'),('Green Tie-Dye Tee',380,'Basic'),('Heart Tee',360,'Cute'),('hot plate',1680,'Modern'),('Imperial Shirt',320,'Iconic'),('ironing set',1400,'Modern'),('Jagged Tee',360,'Rock \'n\' Roll'),('Jockey Shirt',420,'Sporty'),('jukebox',3200,'Historical'),('Jungle-Camo Shirt',420,'Rock \'n\' Roll'),('karaoke system',2400,'Rock \'n\' Roll'),('Kiwi Tee',640,'Cute'),('life ring',20,'Sporty'),('Lite Polka Tee',380,'Cute'),('lunar rover',2560,'Flashy'),('mermaid shelf',40,'Cute'),('Military Uniform',380,'Official'),('mini cactus',800,'Basic'),('minimalist ottoman',1500,'Basic'),('Misty Tank',280,'Historical'),('mr. flamingo',1530,'Cute'),('mrs. flamingo',1530,'Cute'),('mugho bonsai',1800,'Iconic'),('Mummy Shirt',180,'Flashy'),('mummy\'s casket',4400,'Historical'),('MVP Shirt',370,'Sporty'),('ninja sword',9600,'Iconic'),('oil lamp',680,'Official'),('Painter\'s Shirt',420,'Historical'),('princess bed',80000,'Cute'),('Red Flannel Shirt',420,'Basic'),('Red Warm-Up Suit',260,'Sporty'),('regal bookcase',3120,'Ornate'),('regal chair',2100,'Ornate'),('revolving spice rack',800,'Basic'),('Snow Shirt',680,'Basic'),('Splendid Tee',420,'Flashy'),('spooky wall lamp',4124,'Flashy'),('Straw Shirt',360,'Historical'),('Strawberry Tee',640,'Cute'),('stripe bathroom sink',2020,'Modern'),('submarine',8000,'Sporty'),('sweets sofa',80000,'Cute'),('tea set',300,'Iconic'),('Team NTDO Tee',320,'Sporty'),('tiki torch',870,'Sporty'),('Tin Shirt',400,'Flashy'),('traffic cone',800,'Rock \'n\' Roll'),('tv camera',5600,'Official'),('typewriter',2400,'Historical'),('U-R-Here Tee',350,'Rock \'n\' Roll'),('upright vacuum',1800,'Modern'),('Vertigo Shirt',420,'Historical'),('volleyball net',1800,'Sporty'),('Waffle Shirt',420,'Iconic'),('washbasin',1200,'Flashy'),('Work Shirt',420,'Official'),('Wrap Shirt',320,'Sporty'),('yellow certificate',960,'Iconic'),('Yellow-Bar Tee',320,'Basic'),('zero lamp',10000,'Cute');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `style` (
  `style` varchar(40) NOT NULL DEFAULT 'BASIC',
  PRIMARY KEY (`style`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES ('Basic'),('Cute'),('Flashy'),('Historical'),('Iconic'),('Modern'),('Official'),('Ornate'),('Rock \'n\' Roll'),('Sporty');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userItems`
--

DROP TABLE IF EXISTS `userItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userItems` (
  `username` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  KEY `ui_user_fk` (`username`),
  KEY `ui_item_fk` (`item`),
  CONSTRAINT `ui_item_fk` FOREIGN KEY (`item`) REFERENCES `item` (`itemName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ui_user_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userItems`
--

LOCK TABLES `userItems` WRITE;
/*!40000 ALTER TABLE `userItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `userItems` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_total_item` AFTER INSERT ON `useritems` FOR EACH ROW BEGIN
UPDATE users
SET total_items = total_items + 1
WHERE username = NEW.username;
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `subtract_total_item` AFTER DELETE ON `useritems` FOR EACH ROW BEGIN
UPDATE users
SET total_items = total_items - 1
WHERE username = OLD.username;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(40) NOT NULL,
  `pword` varchar(40) NOT NULL,
  `character_name` varchar(40) NOT NULL,
  `account_bal` int(11) NOT NULL,
  `total_items` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `users_chk_1` CHECK ((`account_bal` >= 0)),
  CONSTRAINT `users_chk_2` CHECK ((`total_items` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('emily','5678','emily',0,0),('emma','1234','thepriceisright',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villager`
--

DROP TABLE IF EXISTS `villager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villager` (
  `villager_name` varchar(40) NOT NULL,
  `birthday` date NOT NULL,
  `preferred_style` varchar(40) NOT NULL,
  `preferred_color` varchar(40) NOT NULL,
  PRIMARY KEY (`villager_name`),
  KEY `vil_style_fk` (`preferred_style`),
  KEY `vil_color_fk` (`preferred_color`),
  CONSTRAINT `vil_color_fk` FOREIGN KEY (`preferred_color`) REFERENCES `color` (`color`),
  CONSTRAINT `vil_style_fk` FOREIGN KEY (`preferred_style`) REFERENCES `style` (`style`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villager`
--

LOCK TABLES `villager` WRITE;
/*!40000 ALTER TABLE `villager` DISABLE KEYS */;
INSERT INTO `villager` VALUES ('Admiral','2001-01-27','Modern','Black'),('Becky','2001-12-09','Ornate','Purple'),('Bianca','2001-12-13','Modern','White'),('Chadder','2001-12-15','Official','Yellow'),('Charlise','2001-04-17','Sporty','Orange'),('Cleo','2001-02-09','Cute','White'),('Cousteau','2001-12-17','Iconic','Red'),('Cube','2001-01-29','Cute','Colorful'),('Cyrano','2001-03-09','Iconic','Yellow'),('Daisy','2001-11-16','Basic','Brown'),('Elise','2001-03-21','Official','Colorful'),('Eloise','2001-12-08','Official','Green'),('Étoile','2001-12-25','Cute','Pink'),('Fang','2001-12-18','Official','Beige'),('Flora','2001-02-09','Modern','Pink'),('Flurry','2001-01-30','Iconic','Beige'),('Freya','2001-12-14','Rock \'n\' Roll','Black'),('Gabi','2001-12-16','Ornate','Brown'),('Hopkins','2001-03-11','Sporty','Yellow'),('Hopper','2001-04-06','Rock \'n\' Roll','Yellow'),('Hornsby','2001-03-20','Basic','Brown'),('Hugh','2001-12-30','Modern','Blue'),('Knox','2001-11-23','Iconic','Brown'),('Lucha','2001-12-12','Sporty','Red'),('Maelle','2001-04-08','Modern','White'),('Mallary','2001-11-17','Modern','Brown'),('Marcel','2001-12-31','Iconic','Green'),('Marty','2001-04-16','Sporty','Yellow'),('Medli','2001-12-13','Iconic','White'),('Merengue','2001-03-19','Official','Beige'),('Midge','2001-03-12','Iconic','Pink'),('Miranda','2001-04-23','Ornate','Yellow'),('Monty','2001-12-07','Iconic','Blue'),('Murphy','2001-12-29','Basic','White'),('Paula','2001-03-22','Flashy','Orange'),('Peaches','2001-11-28','Cute','Pink'),('Phoebe','2001-04-22','Ornate','Yellow'),('Rasher','2001-04-07','Rock \'n\' Roll','Black'),('Rhonda','2001-01-24','Ornate','White'),('Rocket','2001-04-14','Sporty','Pink'),('Ruby','2001-12-25','Modern','Yellow'),('Savannah','2001-01-25','Modern','Gray'),('Sterling','2001-12-11','Historical','Blue'),('Tom','2001-12-10','Rock \'n\' Roll','Brown'),('Vesta','2001-04-16','Historical','Orange'),('Vic','2001-12-29','Historical','Aqua'),('Winnie','2001-01-31','Modern','Colorful'),('Wolf Link','2001-12-02','Iconic','Green'),('Wolfgang','2001-11-25','Modern','Black'),('Zucker','2001-03-08','Official','Yellow');
/*!40000 ALTER TABLE `villager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'village'
--
/*!50003 DROP FUNCTION IF EXISTS `buyItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buyItem`(
	item		VARCHAR(40),
    usernm	VARCHAR(40)
) RETURNS varchar(40) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE accountBal INT;
    DECLARE itemCost INT;
    DECLARE totalItems INT;
    SET accountBal = (SELECT account_bal FROM users WHERE username = usernm);
    SET itemCost = (SELECT cost FROM item WHERE itemName = item);
    SET totalItems = (SELECT total_items FROM users WHERE username = usernm);
	IF itemCost <= accountBal THEN 
        INSERT INTO userItems VALUES (usernm, item);
        UPDATE users SET account_bal = accountBal - itemCost WHERE username = usernm;
        UPDATE users SET total_items = totalItems + 1 WHERE username = usernm;
        RETURN "Item bought!";
    ELSE 
		RETURN "You don't have enough money!";
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `giveToVillager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `giveToVillager`(
	villagerName	VARCHAR(40),
    userNm			VARCHAR(40),
    itemName			VARCHAR(40)
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DELETE FROM userItems WHERE username = userNm AND item = itemName LIMIT 1;
    RETURN (SELECT villagerLikes(villagerName,itemName));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `login`(
	usernm		VARCHAR(40),
    pass		VARCHAR(40)
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	RETURN (SELECT pword FROM users WHERE usernm = username) = pass;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `villagerLikes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `villagerLikes`(
	villagerName 	VARCHAR(255),
    item			VARCHAR(255)
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE itemStyle VARCHAR(255);
    DECLARE itemColor1 VARCHAR(255);
    DECLARE itemColor2 VARCHAR(255);
    DECLARE villagerStyle VARCHAR(255);
    DECLARE villagerColor VARCHAR(255);
    SET itemStyle = (SELECT style FROM item WHERE item = itemName);
    SET itemColor1 = (SELECT color1 FROM item JOIN furniture ON itemName = furnitureName WHERE item = itemName);
    SET itemColor2 = (SELECT color2 FROM item JOIN furniture ON itemName = furnitureName WHERE item = itemName);
    SET villagerStyle = (SELECT preferred_style FROM villager WHERE villagerName = villager_name);
    SET villagerColor = (SELECT preferred_color FROM villager WHERE villagerName = villager_name);
    RETURN itemStyle = villagerStyle OR itemColor1 = villagerColor OR itemColor2 = villagerColor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser`(
	username		VARCHAR(40),
    pword			VARCHAR(40),
    characterName	VARCHAR(40)
)
BEGIN
	INSERT INTO users VALUES (username, pword, characterName, 0,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `payUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `payUser`(
	userNm	VARCHAR(40),
    amount 	INT
)
BEGIN
	DECLARE accountBal INT;
    SET accountBal = (SELECT account_bal FROM users WHERE username = userNm);
    UPDATE users SET account_bal = amount + accountBal WHERE username = userNm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02  0:01:29
