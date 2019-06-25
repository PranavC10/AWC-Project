-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.9-MariaDB


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
-- Definition of table `awc`
--

DROP TABLE IF EXISTS `awc`;
CREATE TABLE `awc` (
  `awcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `awsname` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `village` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `awstype` varchar(45) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`awcid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `awc`
--

/*!40000 ALTER TABLE `awc` DISABLE KEYS */;
INSERT INTO `awc` (`awcid`,`awsname`,`address`,`village`,`city`,`pincode`,`awstype`,`cdate`) VALUES 
 (1,'awc1','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY,LANDMARK','VILLAGE','CITY','PIN CODE','rural','2018-10-17 17:12:38');
/*!40000 ALTER TABLE `awc` ENABLE KEYS */;


--
-- Definition of table `awchead`
--

DROP TABLE IF EXISTS `awchead`;
CREATE TABLE `awchead` (
  `hid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` varchar(45) NOT NULL,
  `awcid` varchar(45) NOT NULL,
  `uname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `awchead`
--

/*!40000 ALTER TABLE `awchead` DISABLE KEYS */;
INSERT INTO `awchead` (`hid`,`tid`,`awcid`,`uname`,`password`,`cdate`) VALUES 
 (1,'1','1','h1','h1','2018-10-18 16:39:58');
/*!40000 ALTER TABLE `awchead` ENABLE KEYS */;


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
  `old_mobile` varchar(10) NOT NULL,
  `hid` varchar(45) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `children`
--

/*!40000 ALTER TABLE `children` DISABLE KEYS */;
INSERT INTO `children` (`cid`,`fname`,`mname`,`lname`,`gender`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`email`,`adhar`,`bgrp`,`dob`,`cdate`,`old_mobile`,`hid`) VALUES 
 (2,'Children1','Children1','Children1','Male','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY','VILLAGE','CITY','STATE',411232,'4444444444','nileshkakade6@gmail.com','898989898989','O-','Thu Oct 06 00:00:00 IST 2011','2018-10-18 13:54:06','','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`ID`,`salary`,`sal_diff`) VALUES 
 (1,'100','0'),
 (2,'0','0'),
 (3,'0','0');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


--
-- Definition of table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `mstatus` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
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
  `uname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `awcid` varchar(45) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` (`did`,`fname`,`mname`,`lname`,`gender`,`mstatus`,`dob`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`telno`,`email`,`education`,`year_of_passing10`,`year_of_passing12`,`skill`,`uname`,`password`,`awcid`) VALUES 
 (1,'doctor1','doctor1','doctor1','','','Thu Oct 17 00:00:00 IST 2013','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY,LANDMARK','VILLAGE','CITY','STATE','PIN CODE','9689507666','898789','doctor1@gmail.com','10TH PASSED','2011','2015','Enter skills','d1','d1','1');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;


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
  `awcid` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  PRIMARY KEY (`hrid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorreport`
--

/*!40000 ALTER TABLE `doctorreport` DISABLE KEYS */;
INSERT INTO `doctorreport` (`hrid`,`mid`,`dor`,`weight`,`height`,`deficiency`,`ablity`,`comments`,`docid`,`cdate`,`awcid`,`age`) VALUES 
 (1,'C-2','ss','ss','40','Vitamin A,Vitamin B,Calcium,','No Disablity','ok','1','2018-10-18 18:56:32','1','30');
/*!40000 ALTER TABLE `doctorreport` ENABLE KEYS */;


--
-- Definition of trigger `upd_checker_doctorreport`
--

DROP TRIGGER /*!50030 IF EXISTS */ `upd_checker_doctorreport`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `upd_checker_doctorreport` AFTER UPDATE ON `doctorreport` FOR EACH ROW BEGIN
    INSERT INTO refdoctorreport(hrid, mid, dor, weight, height, deficiency, ablity, comments, docid, cdate, awcid)
    VALUES (OLD.hrid, OLD.mid, OLD.dor, OLD.weight, OLD.height, OLD.deficiency, OLD.ablity, OLD.comments, OLD.docid, OLD.cdate, OLD.awcid);
    END $$

DELIMITER ;

--
-- Definition of table `mukhyasevika`
--

DROP TABLE IF EXISTS `mukhyasevika`;
CREATE TABLE `mukhyasevika` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `village` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `telno` varchar(45) NOT NULL,
  `adhar` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mukhyasevika`
--

/*!40000 ALTER TABLE `mukhyasevika` DISABLE KEYS */;
INSERT INTO `mukhyasevika` (`mid`,`fname`,`mname`,`lname`,`dob`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`telno`,`adhar`,`email`,`username`,`password`,`cdate`) VALUES 
 (1,'m1','m1','m1','Thu Oct 16 00:00:00 IST 2008','PLOTNO / FLAT NO / FLOOR/BUILDING,LANDMARK,COLONY/LOCALITY','VILLAGE','CITY','STATE','PIN CODE','9689507669','99999','895568656','m1@gmail.com','m1','m1','2018-10-17 17:12:15');
/*!40000 ALTER TABLE `mukhyasevika` ENABLE KEYS */;


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
  `hid` varchar(45) NOT NULL,
  PRIMARY KEY (`nwid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nursing`
--

/*!40000 ALTER TABLE `nursing` DISABLE KEYS */;
INSERT INTO `nursing` (`nwid`,`fname`,`mname`,`lname`,`gender`,`dob`,`deliverydate`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`telno`,`email`,`adhar`,`bgrp`,`cdate`,`hid`) VALUES 
 (1,'FIRST','MIDDLE','LAST','Male','Wed Oct 03 19:03:15 IST 2018','Tue Oct 09 19:03:17 IST 2018','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY,LANDMARK','VILLAGE','CITY','STATE','PIN CODE','9689507689','TELEPHONE ','ENTER EMAIL ID','121212454545','A+','2018-10-18 14:09:20','1');
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
  `hid` varchar(45) NOT NULL,
  PRIMARY KEY (`pwid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pregnantwomen`
--

/*!40000 ALTER TABLE `pregnantwomen` DISABLE KEYS */;
INSERT INTO `pregnantwomen` (`pwid`,`fname`,`mname`,`lname`,`dob`,`premonth`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`telno`,`email`,`adhar`,`bgrp`,`cdate`,`hid`) VALUES 
 (1,'FIRST','MIDDLE','LAST','Tue Oct 16 00:00:00 IST 2018','2','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY,LANDMARK','VILLAGE','CITY','STATE','PIN CODE','9689507689','897898898','nileshkakade6@gmail.com','968950766658','A+','2018-10-18 14:09:26','1');
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
-- Definition of table `refdoctorreport`
--

DROP TABLE IF EXISTS `refdoctorreport`;
CREATE TABLE `refdoctorreport` (
  `hrid` int(10) unsigned NOT NULL,
  `mid` varchar(45) NOT NULL,
  `dor` varchar(45) NOT NULL,
  `weight` varchar(45) NOT NULL,
  `height` varchar(45) NOT NULL,
  `deficiency` varchar(45) NOT NULL,
  `ablity` varchar(45) NOT NULL,
  `comments` varchar(45) NOT NULL,
  `docid` varchar(45) NOT NULL,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `awcid` varchar(45) NOT NULL,
  `recordId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`recordId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refdoctorreport`
--

/*!40000 ALTER TABLE `refdoctorreport` DISABLE KEYS */;
INSERT INTO `refdoctorreport` (`hrid`,`mid`,`dor`,`weight`,`height`,`deficiency`,`ablity`,`comments`,`docid`,`cdate`,`awcid`,`recordId`) VALUES 
 (1,'C-2','Mon Oct 15 11:35:12 IST 2018','30','40','Vitamin A,Vitamin B,Calcium,','No Disablity','ok','1','2018-10-18 11:36:02','1',2),
 (1,'C-2','Mon Oct 15 11:35:12 IST 2018','40','40','Vitamin A,Vitamin B,Calcium,','No Disablity','ok','1','2018-10-18 17:05:21','1',3),
 (1,'C-2','ss','ss','40','Vitamin A,Vitamin B,Calcium,','No Disablity','ok','1','2018-10-18 18:16:52','1',4);
/*!40000 ALTER TABLE `refdoctorreport` ENABLE KEYS */;


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
 (1,'0','0','0','0','0','0','0','0','0','0','0','0','0','1','Yes');
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
  `address` varchar(100) NOT NULL,
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
  `awcid` varchar(45) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`tid`,`fname`,`mname`,`lname`,`gender`,`mstatus`,`dob`,`address`,`village`,`city`,`state`,`pincode`,`mobile`,`telno`,`email`,`education`,`year_of_passing10`,`year_of_passing12`,`skill`,`awcid`) VALUES 
 (1,'teacher1','teacher1','teacher1','male','rural','Wed Oct 13 19:51:33 IST 1993','PLOTNO / FLAT NO / FLOOR/BUILDING,COLONY/LOCALITY,LANDMARK','VILLAGE','CITY','STATE','PIN CODE','5689889895','123456 ','teacher1@gmail.com','12TH PASSED','2010','2012','any skill','1');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
