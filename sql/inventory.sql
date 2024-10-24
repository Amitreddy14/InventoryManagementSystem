CREATE DATABASE  IF NOT EXISTS `inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `inventory`;

-- Host: localhost    Database: inventory

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts` (
  `acccountID` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `accountDetails` varchar(100) DEFAULT NULL,
  `Customers_customerID` int(11) NOT NULL,
  `User_username` varchar(45) DEFAULT NULL,
  `payMethod` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`acccountID`),
  UNIQUE KEY `accountName_UNIQUE` (`accountName`),
  KEY `fk_Accounts_Customers1_idx` (`Customers_customerID`),
  KEY `fk_Accounts_User2_idx` (`User_username`),
  CONSTRAINT `fk_Accounts_Customers1` FOREIGN KEY (`Customers_customerID`) REFERENCES `customers` (`customerid`),
  CONSTRAINT `fk_Accounts_User2` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Account 1','NONE',1,'admin','Cash'),(2,'Account 2','NONE',1,'admin','Cheque'),(3,'Account 3','NONE',2,'admin','ATM'),(4,'Account 4','NONE',3,'admin','Credit'),(5,'Account 5','NONE',4,'admin','Cash'),(6,'Account 6','NONE',5,'admin','Cash'),(7,'Account 7','NONE',6,'admin','Cheque'),(8,'Account 8','NONE',7,'admin','ATM'),(9,'Account 9','None',8,'admin','Cash'),(10,'Account 10','NONE',9,'admin','Cash');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `memberSince` date DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Dr. Shiv','Nader','Delhi','5987496124','dr.nader@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man3.jpg','Male','2012-04-19'),(2,'Dr. Mazumdar','Shaw','Chennai','9856415789','shaw@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man1.jpg','male','2012-08-21'),(3,'Anand','Mishra','Kolkata','5478931647','mahi@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man2.jpg','Male','2013-01-01'),(4,'Gautam','Obroi','Mumbai','2345987615','adnai@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man4.jpg','Male','2016-04-23'),(5,'Mangalam','Birla','Jaipur','8756984521','birla@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man5.jpg','Male','2016-12-17'),(6,'Falguni','Nayar','Delhi','6879584698','dili@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/woman1.jpg','Female','2017-05-01'),(7,'Kiran','Mazumdar','Mumbai','8547965489','shrawani@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/woman2.jpg','Female','2013-07-11'),(8,'Charles','Koch','Dallas','156489759','kochi@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man5.jpg','Male','2021-02-14'),(9,'Samuel','Colt','Chicago','1659873264','colt@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man1.jpg','Male','2022-10-01'),(10,'Richard','Mellon','New York','1632457895','mellon@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man5.jpg','Male','2022-11-01');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialtronpurchase`
--

DROP TABLE IF EXISTS `financialtronpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `financialtronpurchase` (
  `trID` int(11) NOT NULL,
  `trDate` date DEFAULT NULL,
  `Accounts_acccountID` int(11) NOT NULL,
  `TrTypeCode_trTypeCode` int(11) NOT NULL,
  `Purchases_purchaseID` int(11) NOT NULL,
  `User_username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`trID`),
  KEY `fk_financialTrOnPurchase_Accounts1_idx` (`Accounts_acccountID`),
  KEY `fk_financialTrOnPurchase_TrTypeCode1_idx` (`TrTypeCode_trTypeCode`),
  KEY `fk_financialTrOnPurchase_Purchases1_idx` (`Purchases_purchaseID`),
  KEY `fk_User_idx` (`User_username`),
  CONSTRAINT `fk_User` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`),
  CONSTRAINT `fk_financialTrOnPurchase_Purchases1` FOREIGN KEY (`Purchases_purchaseID`) REFERENCES `purchases` (`purchaseid`),
  CONSTRAINT `fk_financialTrOnPurchase_TrTypeCode1` FOREIGN KEY (`TrTypeCode_trTypeCode`) REFERENCES `trtypecode` (`trtypecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialtronpurchase`
--

LOCK TABLES `financialtronpurchase` WRITE;
/*!40000 ALTER TABLE `financialtronpurchase` DISABLE KEYS */;
INSERT INTO `financialtronpurchase` VALUES (1,'2014-07-05',1,1,1,'admin'),(2,'2015-06-06',2,2,2,'admin'),(3,'2016-08-07',3,2,3,'admin'),(4,'2013-12-09',4,2,4,'admin'),(5,'2017-01-11',5,1,5,'admin'),(6,'2020-03-21',6,3,6,'admin'),(7,'2015-07-12',7,4,7,'admin'),(8,'2020-07-12',8,3,8,'admin'),(9,'2020-05-14',9,2,9,'admin'),(10,'2021-04-14',10,2,10,'admin'),(11,'2020-09-06',9,1,11,'admin'),(12,'2022-08-07',7,1,12,'admin'),(13,'2021-08-18',8,1,13,'admin'),(14,'2021-08-09',10,1,14,'admin'),(15,'2021-08-10',5,2,15,'admin'),(16,'2021-08-10',7,1,16,'employee'),(17,'2019-08-10',6,1,17,'admin'),(18,'2018-08-11',3,1,18,'admin'),(19,'2018-08-11',1,1,19,'admin'),(20,'2022-08-11',9,1,20,'admin'),(21,'2023-08-11',5,1,21,'admin'),(22,'2020-07-10',3,1,22,'admin');
/*!40000 ALTER TABLE `financialtronpurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialtronrental`
--

DROP TABLE IF EXISTS `financialtronrental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `financialtronrental` (
  `trID` int(11) NOT NULL,
  `trDate` date NOT NULL,
  `Accounts_acccountID` int(11) NOT NULL,
  `Rentals_rentalID` int(11) DEFAULT NULL,
  `TrTypeCode_trTypeCode` int(11) NOT NULL,
  `User_username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`trID`),
  KEY `fk_FinancialTrOnRental_Accounts1_idx` (`Accounts_acccountID`),
  KEY `fk_FinancialTrOnRental_TrTypeCode1_idx` (`TrTypeCode_trTypeCode`),
  KEY `fk_Username_idx` (`User_username`),
  KEY `fk_Rental_idx` (`Rentals_rentalID`),
  CONSTRAINT `fk_FinancialTrOnRental_TrTypeCode1` FOREIGN KEY (`TrTypeCode_trTypeCode`) REFERENCES `trtypecode` (`trtypecode`),
  CONSTRAINT `fk_Rental` FOREIGN KEY (`Rentals_rentalID`) REFERENCES `rentals` (`rentalid`),
  CONSTRAINT `fk_Username` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialtronrental`
--

LOCK TABLES `financialtronrental` WRITE;
/*!40000 ALTER TABLE `financialtronrental` DISABLE KEYS */;
INSERT INTO `financialtronrental` VALUES (1,'2014-07-07',1,1,1,'admin'),(2,'2013-07-07',2,2,2,'admin'),(3,'2014-07-09',3,2,3,'admin'),(4,'2016-07-09',4,2,4,'admin'),(5,'2017-07-11',5,1,2,'admin'),(6,'2022-07-12',6,3,1,'admin'),(7,'2021-07-14',7,4,3,'admin'),(8,'2020-07-16',8,3,4,'admin'),(9,'2020-07-17',9,2,2,'admin'),(10,'2023-07-17',10,2,1,'admin'),(11,'2018-08-10',6,11,1,'admin'),(12,'2015-08-10',4,12,1,'admin'),(13,'2019-08-11',4,13,1,'admin'),(14,'2023-08-11',4,14,1,'admin'),(15,'2023-08-11',10,15,1,'admin');
/*!40000 ALTER TABLE `financialtronrental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `itemName` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  `rentalOrSale` set('Rental','Sale') NOT NULL,
  `salePrice` double DEFAULT NULL,
  `rentRate` double DEFAULT NULL,
  `photo` varchar(160) DEFAULT NULL,
  `ItemType_itemTypeId` int(11) NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `fk_Item_ItemType1_idx` (`ItemType_itemTypeId`),
  CONSTRAINT `fk_Item_ItemType1` FOREIGN KEY (`ItemType_itemTypeId`) REFERENCES `itemtype` (`itemtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Mobile',47,'Sale',2000,0,'file:/D:/Project_Final/IntellijIDEA/Images/items/mobile.jpg',1),(2,'Computer',29,'Sale',15000,0,'file:/D:/Project_Final/IntellijIDEA/Images/items/computer.jpg',1),(3,'Earphones',9,'Rental',0,400,'file:/D:/Project_Final/IntellijIDEA/Images/items/truck.jpg',1),(4,'Electric Heater',4,'Rental,Sale',100,800,'file:/D:/Project_Final/IntellijIDEA/Images/items/heater.jpg',2),(5,'Drilling Machine',10,'Sale',100,0,'file:/D:/Project_Final/IntellijIDEA/Images/items/drill.png',3),(6,'SkateBoard',1,'Sale',100,0,'file:/D:/Project_Final/IntellijIDEA/Images/items/skate.jpg',7),(7,'PVC Pipes',4,'Sale',60,0,'file:/D:/Project_Final/IntellijIDEA/Images/items/hammer.jpg',3),(8,'LED lights',39,'Rental',0,50,'file:/D:/Project_Final/IntellijIDEA/Images/items/xmas.jpg',9),(9,'Kits',14,'Sale',70,0,NULL,8),(10,'Milk',9,'Sale',90,0,NULL,6),(11,'AC',20,'Sale',44,0,NULL,2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemtype`
--

DROP TABLE IF EXISTS `itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `itemtype` (
  `itemTypeId` int(11) NOT NULL,
  `typeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtype`
--

LOCK TABLES `itemtype` WRITE;
/*!40000 ALTER TABLE `itemtype` DISABLE KEYS */;
INSERT INTO `itemtype` VALUES (1,'Electronics'),(2,'Home Appliances'),(3,'Tools'),(4,'Machinaries'),(5,'Automobiles'),(6,'Groceries'),(7,'Fun Stuff'),(8,'Sports'),(9,'Decoration'),(10,'Daily Basics');
/*!40000 ALTER TABLE `itemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchases` (
  `purchaseID` int(11) NOT NULL,
  `purchaseDate` varchar(45) NOT NULL,
  `purchaseQuantity` int(11) NOT NULL,
  `amountDue` double DEFAULT NULL,
  `User_username` varchar(45) NOT NULL,
  `Item_itemID` int(11) NOT NULL,
  `Customers_customerID` int(11) NOT NULL,
  `payAmount` double DEFAULT NULL,
  PRIMARY KEY (`purchaseID`),
  KEY `fk_Purchases_User1_idx` (`User_username`),
  KEY `fk_Purchases_Item1_idx` (`Item_itemID`),
  KEY `fk_Purchases_Customers1_idx` (`Customers_customerID`),
  CONSTRAINT `fk_Purchases_User1` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'2013-7-5',2,0,'admin',1,1,1000000),(2,'2015-7-6',3,0,'admin',2,2,1223510),(3,'2013-7-7',1,0,'admin',3,3,935620),(4,'2016-7-8',5,10,'admin',3,4,1002560),(5,'2016-1-9',7,0,'admin',1,6,200000),(6,'2017-2-11',7,0,'admin',4,8,600000),(7,'2019-6-12',4,0,'admin',5,1,802330),(8,'2020-4-13',9,0,'admin',6,7,80000),(9,'2021-7-14',2,0,'admin',7,5,923600),(10,'2017-7-17',6,0,'admin',8,5,112000),(11,'2019-08-7',3,0,'admin',7,8,180000),(12,'2022-08-8',7,0,'admin',6,6,702500),(13,'2023-08-9',5,0,'admin',9,7,700000),(14,'2022-08-10',3,0,'admin',4,9,32000),(15,'2023-08-10',1,0,'admin',10,4,90000),(16,'2023-12-10',3,0,'employee',7,6,180000),(17,'2022-08-10',1,0,'admin',6,5,10000),(18,'2022-08-21',1,0,'admin',9,2,70000),(19,'2017-08-11',3,0,'admin',1,1,625000),(20,'2016-08-11',1,0,'admin',6,8,1365000),(21,'2022-04-18',1,0,'admin',2,4,150000),(22,'2020-07-10',10,25,'admin',10,2,836575);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rentals` (
  `rentalID` int(11) NOT NULL,
  `rentalDate` date NOT NULL,
  `returnDate` date DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `amountDue` double DEFAULT NULL,
  `User_username` varchar(45) NOT NULL,
  `Item_itemID` int(11) NOT NULL,
  `Customers_customerID` int(11) NOT NULL,
  PRIMARY KEY (`rentalID`),
  KEY `fk_Rentals_User_idx` (`User_username`),
  KEY `fk_Rentals_Item1_idx` (`Item_itemID`),
  KEY `fk_Rentals_Customers1_idx` (`Customers_customerID`),
  CONSTRAINT `fk_Rentals_User` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;
INSERT INTO `rentals` VALUES (1,'2013-07-03','2013-08-12',100000,2321,'admin',3,1),(2,'2015-07-04','2015-08-16',6225680,0,'admin',5,2),(3,'2016-07-05','2016-08-16',5255950,0,'admin',3,2),(4,'2016-07-05','2017-07-16',600000,10000,'admin',7,3),(5,'2018-07-06','2018-08-16',421560,100,'admin',7,3),(6,'2022-07-07','2023-07-16',825780,40,'admin',5,4),(7,'2020-07-07','2021-07-16',60000,60,'admin',7,5),(8,'2020-07-08','2021-07-17',200000,70,'admin',3,6),(9,'2016-07-09','2017-07-17',100000,80,'admin',5,6),(10,'2015-07-10','2016-07-17',180200,90,'admin',5,1),(11,'2023-07-11','2023-09-16',300023,0,'admin',8,5),(12,'2021-07-12','2022-10-11',80000,1000,'admin',4,3),(13,'2022-07-16','2022-10-12',8256000,22220,'admin',4,3),(14,'2018-07-11','2019-08-12',423400,0,'admin',3,3),(15,'2023-08-11','2023-09-15',320000,0,'admin',4,9);
/*!40000 ALTER TABLE `rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trtypecode`
--

DROP TABLE IF EXISTS `trtypecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trtypecode` (
  `trTypeCode` int(11) NOT NULL,
  `typeDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`trTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trtypecode`
--

LOCK TABLES `trtypecode` WRITE;
/*!40000 ALTER TABLE `trtypecode` DISABLE KEYS */;
INSERT INTO `trtypecode` VALUES (1,'Cash'),(2,'ATM'),(3,'Credit'),(4,'Others');
/*!40000 ALTER TABLE `trtypecode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `accessLevel` enum('Admin','Employee') NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','admin','admin@email.com','Admin'),('employee','employee','employee@email.com','Employee'),('test','test','text@xmail.com','Employee');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercredents`
--

DROP TABLE IF EXISTS `usercredents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usercredents` (
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercredents`
--

LOCK TABLES `usercredents` WRITE;
/*!40000 ALTER TABLE `usercredents` DISABLE KEYS */;
INSERT INTO `usercredents` VALUES ('admin','admin');
/*!40000 ALTER TABLE `usercredents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 23:53:22
