-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.62 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5222
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for schoolmanagement
CREATE DATABASE IF NOT EXISTS `schoolmanagement` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `schoolmanagement`;

-- Dumping structure for table schoolmanagement.myuser_usersignup
CREATE TABLE IF NOT EXISTS `myuser_usersignup` (
  `userFullName` varchar(200) NOT NULL,
  `userEmail` varchar(200) NOT NULL,
  `userPassword` varchar(200) NOT NULL,
  `userMobile` bigint(20) NOT NULL,
  `userAddress` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `roleId_id` int(11) NOT NULL,
  PRIMARY KEY (`userEmail`),
  KEY `myUser_usersignp_roleId_id_9cb6f7e2_fk_myUser_userrole_roleId` (`roleId_id`),
  CONSTRAINT `myUser_usersignp_roleId_id_9cb6f7e2_fk_myUser_userrole_roleId` FOREIGN KEY (`roleId_id`) REFERENCES `myuser_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.myuser_usersignup: ~0 rows (approximately)
/*!40000 ALTER TABLE `myuser_usersignup` DISABLE KEYS */;
INSERT INTO `myuser_usersignup` (`userFullName`, `userEmail`, `userPassword`, `userMobile`, `userAddress`, `isActive`, `roleId_id`) VALUES
	('Manoj Kumar', 'manoj.kumar@gmail.com', 'asdfg123#', 9876002081, 'sector 34 , chd', 1, 1);
/*!40000 ALTER TABLE `myuser_usersignup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
