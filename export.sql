-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.10-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- adapter 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `adapter` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adapter`;

-- 테이블 adapter.cbbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `cbbs` (
  `bbsID` int(11) NOT NULL,
  `bbsTitle` varchar(50) DEFAULT NULL,
  `userID` varchar(20) DEFAULT NULL,
  `bbsDate` datetime DEFAULT NULL,
  `bbsContent` varchar(2048) DEFAULT NULL,
  `bbsAvailable` int(11) DEFAULT NULL,
  `chatCount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bbsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 adapter.cbbs:~1 rows (대략적) 내보내기
DELETE FROM `cbbs`;
/*!40000 ALTER TABLE `cbbs` DISABLE KEYS */;
INSERT INTO `cbbs` (`bbsID`, `bbsTitle`, `userID`, `bbsDate`, `bbsContent`, `bbsAvailable`, `chatCount`) VALUES
	(1, 'test', 'test', '2021-05-09 00:45:37', 'test', 1, 0);
/*!40000 ALTER TABLE `cbbs` ENABLE KEYS */;

-- 테이블 adapter.cbbsfile 구조 내보내기
CREATE TABLE IF NOT EXISTS `cbbsfile` (
  `filename` varchar(50) DEFAULT NULL,
  `filerealname` varchar(50) DEFAULT NULL,
  `bbsID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 adapter.cbbsfile:~0 rows (대략적) 내보내기
DELETE FROM `cbbsfile`;
/*!40000 ALTER TABLE `cbbsfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbbsfile` ENABLE KEYS */;

-- 테이블 adapter.javabbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `javabbs` (
  `bbsID` int(11) NOT NULL,
  `bbsTitle` varchar(50) DEFAULT NULL,
  `userID` varchar(20) DEFAULT NULL,
  `bbsDate` datetime DEFAULT NULL,
  `bbsContent` varchar(2048) DEFAULT NULL,
  `bbsAvailable` int(11) DEFAULT NULL,
  `chatCount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bbsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 adapter.javabbs:~3 rows (대략적) 내보내기
DELETE FROM `javabbs`;
/*!40000 ALTER TABLE `javabbs` DISABLE KEYS */;
INSERT INTO `javabbs` (`bbsID`, `bbsTitle`, `userID`, `bbsDate`, `bbsContent`, `bbsAvailable`, `chatCount`) VALUES
	(1, 'test', 'test', '2021-04-26 10:42:21', 'edfdf', 1, 0),
	(2, '채팅테스트', 'test', '2021-05-15 17:38:16', '테스트', 1, 0),
	(3, '안녕하세요', 'test', '2021-05-23 21:21:09', '채팅방 인원수 적용후 테스트', 1, 0),
	(4, '모바일 이미지 테스트', 'test', '2021-05-25 00:11:28', '모바일 이미지 테스트', 1, 0);
/*!40000 ALTER TABLE `javabbs` ENABLE KEYS */;

-- 테이블 adapter.javabbsfile 구조 내보내기
CREATE TABLE IF NOT EXISTS `javabbsfile` (
  `filename` varchar(50) DEFAULT NULL,
  `filerealname` varchar(50) DEFAULT NULL,
  `bbsID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 adapter.javabbsfile:~0 rows (대략적) 내보내기
DELETE FROM `javabbsfile`;
/*!40000 ALTER TABLE `javabbsfile` DISABLE KEYS */;
INSERT INTO `javabbsfile` (`filename`, `filerealname`, `bbsID`) VALUES
	('Screenshot_20210524-123838_Flightradar24.jpg', 'Screenshot_20210524-123838_Flightradar24.jpg', 4);
/*!40000 ALTER TABLE `javabbsfile` ENABLE KEYS */;

-- 테이블 adapter.pythonbbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `pythonbbs` (
  `bbsID` int(11) NOT NULL,
  `bbsTitle` varchar(50) DEFAULT NULL,
  `userID` varchar(20) DEFAULT NULL,
  `bbsDate` datetime DEFAULT NULL,
  `bbsContent` varchar(2048) DEFAULT NULL,
  `bbsAvailable` int(11) DEFAULT NULL,
  `chatCount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bbsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 adapter.pythonbbs:~4 rows (대략적) 내보내기
DELETE FROM `pythonbbs`;
/*!40000 ALTER TABLE `pythonbbs` DISABLE KEYS */;
INSERT INTO `pythonbbs` (`bbsID`, `bbsTitle`, `userID`, `bbsDate`, `bbsContent`, `bbsAvailable`, `chatCount`) VALUES
	(1, 'test', 'test', '2021-05-09 01:04:44', 'test', 1, 0),
	(2, 'test', 'test', '2021-05-10 11:49:21', 'test', 1, 0),
	(3, 'test', 'test', '2021-05-10 11:49:26', 'test', 1, 0),
	(4, 'test', 'test', '2021-05-10 11:49:32', 'test', 1, 0);
/*!40000 ALTER TABLE `pythonbbs` ENABLE KEYS */;

-- 테이블 adapter.pythonbbsfile 구조 내보내기
CREATE TABLE IF NOT EXISTS `pythonbbsfile` (
  `filename` varchar(50) DEFAULT NULL,
  `filerealname` varchar(50) DEFAULT NULL,
  `bbsID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 adapter.pythonbbsfile:~0 rows (대략적) 내보내기
DELETE FROM `pythonbbsfile`;
/*!40000 ALTER TABLE `pythonbbsfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `pythonbbsfile` ENABLE KEYS */;

-- 테이블 adapter.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `userID` varchar(20) NOT NULL,
  `userPassword` varchar(20) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `userGender` varchar(20) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 adapter.user:~0 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userID`, `userPassword`, `userName`, `userGender`, `userEmail`) VALUES
	('lily520121', 'test', 'wafdad', '남자', 'lily@lt'),
	('test', 'test', 'test', '남자', 'test@test.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- chat 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `chat` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `chat`;

-- 테이블 chat.cchat 구조 내보내기
CREATE TABLE IF NOT EXISTS `cchat` (
  `chatID` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` varchar(50) DEFAULT NULL,
  `chatName` varchar(20) DEFAULT NULL,
  `chatContent` varchar(100) DEFAULT NULL,
  `chatTime` datetime DEFAULT NULL,
  PRIMARY KEY (`chatID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 chat.cchat:~1 rows (대략적) 내보내기
DELETE FROM `cchat`;
/*!40000 ALTER TABLE `cchat` DISABLE KEYS */;
INSERT INTO `cchat` (`chatID`, `roomID`, `chatName`, `chatContent`, `chatTime`) VALUES
	(3, '1', 'test', '안녕하세요', '2021-05-23 20:39:07');
/*!40000 ALTER TABLE `cchat` ENABLE KEYS */;

-- 테이블 chat.javachat 구조 내보내기
CREATE TABLE IF NOT EXISTS `javachat` (
  `chatID` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` varchar(50) DEFAULT NULL,
  `chatName` varchar(20) DEFAULT NULL,
  `chatContent` varchar(100) DEFAULT NULL,
  `chatTime` datetime DEFAULT NULL,
  PRIMARY KEY (`chatID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- 테이블 데이터 chat.javachat:~3 rows (대략적) 내보내기
DELETE FROM `javachat`;
/*!40000 ALTER TABLE `javachat` DISABLE KEYS */;
INSERT INTO `javachat` (`chatID`, `roomID`, `chatName`, `chatContent`, `chatTime`) VALUES
	(23, '2', 'test', '안녕하세요', '2021-05-17 10:27:40'),
	(24, '4', 'test', '안녕하세요', '2021-05-31 11:32:04'),
	(25, '4', 'test', '안녕하세요', '2021-05-31 11:36:58'),
	(26, '4', 'test', '안녕하세요', '2021-05-31 11:39:54'),
	(27, '4', 'test', '안녕하세요', '2021-05-31 15:04:58');
/*!40000 ALTER TABLE `javachat` ENABLE KEYS */;

-- 테이블 chat.pythonchat 구조 내보내기
CREATE TABLE IF NOT EXISTS `pythonchat` (
  `chatID` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` varchar(50) DEFAULT NULL,
  `chatName` varchar(20) DEFAULT NULL,
  `chatContent` varchar(100) DEFAULT NULL,
  `chatTime` datetime DEFAULT NULL,
  PRIMARY KEY (`chatID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 테이블 데이터 chat.pythonchat:~1 rows (대략적) 내보내기
DELETE FROM `pythonchat`;
/*!40000 ALTER TABLE `pythonchat` DISABLE KEYS */;
INSERT INTO `pythonchat` (`chatID`, `roomID`, `chatName`, `chatContent`, `chatTime`) VALUES
	(4, '11', 'test', '테스트', '2021-05-17 11:22:37'),
	(5, '4', 'test', '안녕하세요', '2021-06-02 01:16:34');
/*!40000 ALTER TABLE `pythonchat` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
