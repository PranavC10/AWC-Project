-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.23


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema anganwadi
--

CREATE DATABASE IF NOT EXISTS anganwadi;
USE anganwadi;

--
-- Definition of table `children`
--

DROP TABLE IF EXISTS `children`;
CREATE TABLE `children` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `village` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` int(10) unsigned NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `adhar` varchar(12) NOT NULL,
  `bgrp` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `old_mobile` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `children`
--

/*!40000 ALTER TABLE `children` DISABLE KEYS */;
INSERT INTO `children` (`cid`,`fname`,`mname`,`lname`,`gender`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`email`,`adhar`,`bgrp`,`dob`,`cdate`,`old_mobile`) VALUES 
 (2,'raj','ramesh','kumar','Male','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY','VILLAGE','CITY','STATE',411232,'4444444444','raj@gmail.com','898989898989','O-','Thu Oct 06 00:00:00 IST 2011','2018-10-16 11:56:35',''),
 (3,'pranav','s','m','Male','2,joadujw','qekjfjke','rffrf','STATE',411232,'7656434534','mgyf@gmail.com','898989898989','O-','Fri Oct 03 13:45:52 IST 2008','2018-10-17 13:47:14',NULL);
/*!40000 ALTER TABLE `children` ENABLE KEYS */;


--
-- Definition of trigger `upd_check`
--

DROP TRIGGER /*!50030 IF EXISTS */ `upd_check`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `upd_check` AFTER UPDATE ON `children` FOR EACH ROW BEGIN
       IF (OLD.mobile <> NEW.mobile) THEN
         INSERT INTO refchild(cid, old_mobile)
         VALUES (OLD.cid, OLD.mobile);
       END IF;
    END $$

DELIMITER ;

--
-- Definition of table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `salary` decimal(10,0) NOT NULL,
  `sal_diff` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`ID`,`salary`,`sal_diff`) VALUES 
 (1,'100','0');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


--
-- Definition of table `doctorreport`
--

DROP TABLE IF EXISTS `doctorreport`;
CREATE TABLE `doctorreport` (
  `hrid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(45) NOT NULL,
  `dor` varchar(45) NOT NULL,
  `weight` varchar(45) NOT NULL,
  `height` varchar(45) NOT NULL,
  `deficiency` varchar(45) NOT NULL,
  `ablity` varchar(45) NOT NULL,
  `comments` varchar(45) NOT NULL,
  `docid` varchar(45) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`hrid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorreport`
--

/*!40000 ALTER TABLE `doctorreport` DISABLE KEYS */;
INSERT INTO `doctorreport` (`hrid`,`mid`,`dor`,`weight`,`height`,`deficiency`,`ablity`,`comments`,`docid`,`cdate`) VALUES 
 (1,'C-2','Thu Jan 15 21:37:08 IST 2009','55','33','Vitamin A,Vitamin C,','Disablity','ok','1','2018-10-15 21:38:43'),
 (2,'C-2','Wed Oct 17 12:49:55 IST 2018','60','150','Vitamin A,Iodine,','No Disablity','all good ','1','2018-10-17 12:50:31');
/*!40000 ALTER TABLE `doctorreport` ENABLE KEYS */;


--
-- Definition of table `nursing`
--

DROP TABLE IF EXISTS `nursing`;
CREATE TABLE `nursing` (
  `nwid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `deliverydate` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `village` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `telno` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `adhar` varchar(12) NOT NULL,
  `bgrp` varchar(45) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nwid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nursing`
--

/*!40000 ALTER TABLE `nursing` DISABLE KEYS */;
INSERT INTO `nursing` (`nwid`,`fname`,`mname`,`lname`,`gender`,`dob`,`deliverydate`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`telno`,`email`,`adhar`,`bgrp`,`cdate`) VALUES 
 (1,'FIRST','MIDDLE','LAST','Male','Wed Oct 03 19:03:15 IST 2018','Tue Oct 09 19:03:17 IST 2018','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY,LANDMARK','VILLAGE','CITY','STATE','PIN CODE','9689507689','TELEPHONE ','ENTER EMAIL ID','121212454545','A+','2018-10-13 19:03:24');
/*!40000 ALTER TABLE `nursing` ENABLE KEYS */;


--
-- Definition of table `pregnantwomen`
--

DROP TABLE IF EXISTS `pregnantwomen`;
CREATE TABLE `pregnantwomen` (
  `pwid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `premonth` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `village` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `telno` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `adhar` varchar(12) NOT NULL,
  `bgrp` varchar(45) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pwid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pregnantwomen`
--

/*!40000 ALTER TABLE `pregnantwomen` DISABLE KEYS */;
INSERT INTO `pregnantwomen` (`pwid`,`fname`,`mname`,`lname`,`dob`,`premonth`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`telno`,`email`,`adhar`,`bgrp`,`cdate`) VALUES 
 (1,'FIRST','MIDDLE','LAST','Tue Oct 16 00:00:00 IST 2018','2','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY,LANDMARK','VILLAGE','CITY','STATE','PIN CODE','9689507689','897898898','nileshkakade6@gmail.com','968950766658','A+','2018-10-13 19:03:04');
/*!40000 ALTER TABLE `pregnantwomen` ENABLE KEYS */;


--
-- Definition of table `refchild`
--

DROP TABLE IF EXISTS `refchild`;
CREATE TABLE `refchild` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_mobile` varchar(10) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refchild`
--

/*!40000 ALTER TABLE `refchild` DISABLE KEYS */;
INSERT INTO `refchild` (`cid`,`old_mobile`) VALUES 
 (2,'100000000');
/*!40000 ALTER TABLE `refchild` ENABLE KEYS */;


--
-- Definition of table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
CREATE TABLE `requirement` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rice` varchar(45) NOT NULL,
  `jowar` varchar(45) NOT NULL,
  `moong` varchar(45) NOT NULL,
  `maize` varchar(45) NOT NULL,
  `chana` varchar(45) NOT NULL,
  `arhar` varchar(45) NOT NULL,
  `bajra` varchar(45) NOT NULL,
  `masur` varchar(45) NOT NULL,
  `v_oil` varchar(45) NOT NULL,
  `butter` varchar(45) NOT NULL,
  `ghee` varchar(45) NOT NULL,
  `sugar` varchar(45) NOT NULL,
  `jaggry` varchar(45) NOT NULL,
  `uid` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requirement`
--

/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` (`rid`,`rice`,`jowar`,`moong`,`maize`,`chana`,`arhar`,`bajra`,`masur`,`v_oil`,`butter`,`ghee`,`sugar`,`jaggry`,`uid`,`status`) VALUES 
 (1,'0','0','0','0','0','0','0','0','0','0','0','0','0','1','No');
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;


--
-- Definition of table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `mstatus` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `village` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `telno` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `education` varchar(45) NOT NULL,
  `year_of_passing10` varchar(45) NOT NULL,
  `year_of_passing12` varchar(45) NOT NULL,
  `skill` varchar(45) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
