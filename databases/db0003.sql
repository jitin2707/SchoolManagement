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

-- Dumping structure for table schoolmanagement.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.auth_permission: ~36 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add user role', 7, 'add_userrole'),
	(20, 'Can change user role', 7, 'change_userrole'),
	(21, 'Can delete user role', 7, 'delete_userrole'),
	(22, 'Can add user signp', 8, 'add_usersignp'),
	(23, 'Can change user signp', 8, 'change_usersignp'),
	(24, 'Can delete user signp', 8, 'delete_usersignp'),
	(25, 'Can add user signup', 8, 'add_usersignup'),
	(26, 'Can change user signup', 8, 'change_usersignup'),
	(27, 'Can delete user signup', 8, 'delete_usersignup'),
	(28, 'Can add principle', 9, 'add_principle'),
	(29, 'Can change principle', 9, 'change_principle'),
	(30, 'Can delete principle', 9, 'delete_principle'),
	(31, 'Can add teacher', 10, 'add_teacher'),
	(32, 'Can change teacher', 10, 'change_teacher'),
	(33, 'Can delete teacher', 10, 'delete_teacher'),
	(34, 'Can add login records', 11, 'add_loginrecords'),
	(35, 'Can change login records', 11, 'change_loginrecords'),
	(36, 'Can delete login records', 11, 'delete_loginrecords');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.auth_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$100000$NfVpzyzMpRGE$Ilom79IvT/ePFvKv2gh9VfBeWoCZEMddGe8e675fVRY=', '2019-10-17 03:30:02', 1, 'jitin', '', '', 'truepbx247@gmail.com', 1, 1, '2019-10-03 16:59:57');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.django_admin_log: ~3 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2019-10-03 17:02:56', '1', 'UserRole object (1)', 1, '[{"added": {}}]', 7, 1),
	(2, '2019-10-03 17:30:38', 'manoj.kumar@gmail.com', 'UserSignup object (manoj.kumar@gmail.com)', 1, '[{"added": {}}]', 8, 1),
	(3, '2019-10-17 03:30:48', '2', 'UserRole object (2)', 1, '[{"added": {}}]', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.django_content_type: ~11 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(11, 'myUser', 'loginrecords'),
	(7, 'myUser', 'userrole'),
	(8, 'myUser', 'usersignup'),
	(9, 'principal', 'principle'),
	(6, 'sessions', 'session'),
	(10, 'teacher', 'teacher');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.django_migrations: ~22 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-10-02 12:39:30'),
	(2, 'auth', '0001_initial', '2019-10-02 12:39:33'),
	(3, 'admin', '0001_initial', '2019-10-02 12:39:34'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-10-02 12:39:34'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2019-10-02 12:39:34'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2019-10-02 12:39:35'),
	(7, 'auth', '0003_alter_user_email_max_length', '2019-10-02 12:39:35'),
	(8, 'auth', '0004_alter_user_username_opts', '2019-10-02 12:39:35'),
	(9, 'auth', '0005_alter_user_last_login_null', '2019-10-02 12:39:35'),
	(10, 'auth', '0006_require_contenttypes_0002', '2019-10-02 12:39:35'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2019-10-02 12:39:35'),
	(12, 'auth', '0008_alter_user_username_max_length', '2019-10-02 12:39:36'),
	(13, 'auth', '0009_alter_user_last_name_max_length', '2019-10-02 12:39:36'),
	(14, 'sessions', '0001_initial', '2019-10-02 12:39:36'),
	(15, 'myUser', '0001_initial', '2019-10-03 04:30:38'),
	(16, 'myUser', '0002_usersignp', '2019-10-03 17:24:22'),
	(17, 'myUser', '0003_auto_20191003_2255', '2019-10-03 17:25:34'),
	(18, 'myUser', '0004_auto_20191004_0935', '2019-10-04 04:05:43'),
	(19, 'myUser', '0005_auto_20191007_0957', '2019-10-07 04:28:06'),
	(20, 'principal', '0001_initial', '2019-10-17 03:14:12'),
	(21, 'teacher', '0001_initial', '2019-10-19 05:09:02'),
	(22, 'myUser', '0006_loginrecords', '2019-10-19 05:15:10');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.django_session: ~34 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('0c5uhkkqbtoh2hseyyu12xa0c7nj7ivw', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-13 08:27:18'),
	('0hxqy5gw4spvgj8ofo7hyz5vysfdswtb', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-16 04:25:41'),
	('0n05t01je371j092ug3d2w09hxbh5ub4', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-24 04:27:21'),
	('195q7h2o9ux4z8h76d3t8zsz6mrxf5lh', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-16 03:19:43'),
	('333hysc0kp9qzhc5d3fn0otl0fuk6ihi', 'ZDllZDVlYWM5MzQ0NWEzYjgxYzQ1OGUzODdjNDlkNTE3M2RhODk0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzg4MjUzZWMzMTdkYmQxYzc3MzE1YWM1ODFjZTA4ZDNkM2RlYjAxIn0=', '2019-10-17 03:33:49'),
	('39qqzl95ntwma1gdibb3tv9k7ix2pph6', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-15 08:26:00'),
	('5obumahxuhdmdoj0qnwuua6ijsz889nw', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-17 11:15:12'),
	('5ulcxo2rr1tvkr3pzatxx5mf1291wfr0', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-17 12:19:19'),
	('8oegtniardn408tbi1dxpiwejuqesdpb', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-11 03:22:40'),
	('93t7i1oje904i0bshqv8aovl1il7p0an', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-16 04:33:25'),
	('9kh1feeuaomnarucvgedztpfv162as05', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-14 03:47:52'),
	('ay0mp7hb2ahwrab5oh8j1sc7imu1ha5q', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-17 03:38:24'),
	('b9zjrwzedddeg184vs99h1nwakkyscvq', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-14 03:41:47'),
	('butcmiagy0yrdqna9w1xqdc1g4cd52iy', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-15 06:28:51'),
	('c16vcv857h18u8doa5738ublhc73b6an', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-17 03:47:19'),
	('ckug3mv4z3n9vgeu6wtnij901t3ksbxe', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-17 11:51:01'),
	('dvjv5s805dpetzqssxt1hwc4algc7zjb', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-16 04:05:05'),
	('gipx9h6szldzd06tovgwdcxtiuog3oay', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-16 04:00:12'),
	('gztz1oinb10ilrs456ioua0jw7h0rdhi', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-17 06:43:27'),
	('ijz1l60azuz3krcpmqohghu6safoxxox', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-13 08:14:22'),
	('irz6zoosoir6ojhccwjjefancujuusm9', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-15 06:13:23'),
	('jc8o2i6k1joi378ws61tdyh1i60pjuo5', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-17 04:19:48'),
	('ji3c1rwhw0qj8mkdswpehi9ohxj8u84m', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-17 13:30:33'),
	('jth4lfgufkvrsimw9pt5mq5qab4u2ryl', 'NTgyYTgzNjA1Y2RkM2ZjYzA1MDcxMzFiY2RmYmQwOWY3N2JlZmQ1Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzg4MjUzZWMzMTdkYmQxYzc3MzE1YWM1ODFjZTA4ZDNkM2RlYjAxIiwiQXV0aGVudGljYXRpb24iOnRydWUsImVtYWlsaWQiOiJ0cnVlcGJ4MjQ3QGdtYWlsLmNvbSIsInJvbGVpZCI6MX0=', '2019-10-11 03:15:56'),
	('kp2v08nb19fno5nvwvo75cilv8b9cp7v', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-14 16:05:28'),
	('lvibofeuz3c6yshx2bzst01qaau8csqu', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-14 15:57:48'),
	('oh0eoh3qzfgj45vz4dubqcyk3fi4flmh', 'MzFlYzU4MDNlNWI4OTlhZDMzZmIwZGExOGY1OTI2ZTEyOWFiNjIxNDp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoiaml0aW5AaW50ZXJiaXRzb2x1dGlvbnMuY29tIiwicm9sZWlkIjoyfQ==', '2019-10-17 13:53:58'),
	('peogsvq7oprp6rcnb7m72yx3w0o9vm62', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-15 12:13:41'),
	('u8b0m3sqo7b0xxfd10fg0k4qh279tmyu', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-13 08:22:49'),
	('ugoyw2cnltves5cf02sh6eh7y54r16sb', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-24 03:43:25'),
	('v4oqqvzr002fgla0jixfo0z2wn3eq26m', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-15 08:00:17'),
	('x7nfqc9ivrkquhybj9blha7a7zyvhtot', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-17 03:42:26'),
	('xfsrejepj7ra4t84ly9zxwdp0uyqo8mk', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-10-15 10:07:50'),
	('xpr5j1lgwy9o350qr3fwub3wvi3q7uia', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-10-14 03:07:14');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.myuser_loginrecords
CREATE TABLE IF NOT EXISTS `myuser_loginrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginTime` varchar(255) DEFAULT NULL,
  `logoutTime` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `macAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.myuser_loginrecords: ~0 rows (approximately)
/*!40000 ALTER TABLE `myuser_loginrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `myuser_loginrecords` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.myuser_userrole
CREATE TABLE IF NOT EXISTS `myuser_userrole` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.myuser_userrole: ~2 rows (approximately)
/*!40000 ALTER TABLE `myuser_userrole` DISABLE KEYS */;
INSERT INTO `myuser_userrole` (`roleId`, `roleName`, `isActive`) VALUES
	(1, 'manager', 1),
	(2, 'principal', 1);
/*!40000 ALTER TABLE `myuser_userrole` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.myuser_usersignup
CREATE TABLE IF NOT EXISTS `myuser_usersignup` (
  `userFullName` varchar(200) NOT NULL,
  `userEmail` varchar(200) NOT NULL,
  `userPassword` varchar(200) NOT NULL,
  `userMobile` bigint(20) NOT NULL,
  `userState` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `roleId_id` int(11) NOT NULL,
  `confirmationLink` varchar(2000) NOT NULL,
  `isVerified` tinyint(1) NOT NULL,
  `otpTime` varchar(200) NOT NULL,
  `userOTP` varchar(200) NOT NULL,
  `userToken` varchar(2000) NOT NULL,
  PRIMARY KEY (`userEmail`),
  KEY `myUser_usersignp_roleId_id_9cb6f7e2_fk_myUser_userrole_roleId` (`roleId_id`),
  CONSTRAINT `myUser_usersignp_roleId_id_9cb6f7e2_fk_myUser_userrole_roleId` FOREIGN KEY (`roleId_id`) REFERENCES `myuser_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.myuser_usersignup: ~4 rows (approximately)
/*!40000 ALTER TABLE `myuser_usersignup` DISABLE KEYS */;
INSERT INTO `myuser_usersignup` (`userFullName`, `userEmail`, `userPassword`, `userMobile`, `userState`, `isActive`, `roleId_id`, `confirmationLink`, `isVerified`, `otpTime`, `userOTP`, `userToken`) VALUES
	('jitinprinci', 'jitin@interbitsolutions.com', 'pbkdf2_sha256$100000$XpjUuqI3gxKq$J9CMZTHzaCT1J7OicbBMSrVvoh2Cmarq7oWDjZBv5R4=', 8445656758, 'zirakpur', 1, 2, '', 1, '2019-10-17 19:11:59.404294', 'D24049k', 'pbkdf2_sha256$100000$RpWtI6olSDDQ$4ZLOS94h0WO4EgNnMwUfhgd3MjFfmEYRTa8BsEGghCk='),
	('nitin', 'kolishnitin@gmail.com', 'pbkdf2_sha256$100000$Ec8aP8dkuTvt$+rz+VzlbRLFCsmlKqB1/+J4WmlYtrgr4nz5/lihLr0c=', 878787979778, 'Punjab', 1, 1, 'http://127.0.0.1/verifyuser/?email=kolishnitin@gmail.com&token=pbkdf2_sha256$100000$FPiNG9m0owLR$/9aK7mC2ITve82RhEvELgIiPYI/bkk4smFRptgnuTvk=', 0, '2019-10-09 09:56:53.091780', 'b51900B', 'pbkdf2_sha256$100000$FPiNG9m0owLR$/9aK7mC2ITve82RhEvELgIiPYI/bkk4smFRptgnuTvk='),
	('Manoj Kumar', 'manoj.kumar@gmail.com', 'asdfg123#', 9876002081, 'sector 34 , chd', 1, 1, '', 0, '', '', ''),
	('jitin', 'truepbx247@gmail.com', 'pbkdf2_sha256$100000$I3GfsYPVWWEC$ruJlm3p8Xk2bSI2T24lcKJgVaPBj/BDN6H0nscQTMeg=', 7838534376, 'punjab', 1, 1, '', 1, '2019-10-10 09:10:09.993410', 'v36472q', 'pbkdf2_sha256$100000$sSl67qG8ejGC$qYcVFQsO9Ub4MygvloKg4RYe80J45VUqTXu1dW/dtOI=');
/*!40000 ALTER TABLE `myuser_usersignup` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.principal_principle
CREATE TABLE IF NOT EXISTS `principal_principle` (
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `doj` varchar(255) DEFAULT NULL,
  `dol` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `last_login_time` varchar(255) DEFAULT NULL,
  `last_login_date` varchar(255) DEFAULT NULL,
  `last_logout` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_date_time` varchar(255) DEFAULT NULL,
  `verify_link` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `principal_principle_role_id_83dbada9_fk_myUser_userrole_roleId` (`role_id`),
  CONSTRAINT `principal_principle_role_id_83dbada9_fk_myUser_userrole_roleId` FOREIGN KEY (`role_id`) REFERENCES `myuser_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.principal_principle: ~1 rows (approximately)
/*!40000 ALTER TABLE `principal_principle` DISABLE KEYS */;
INSERT INTO `principal_principle` (`name`, `email`, `gender`, `qualification`, `password`, `dob`, `doj`, `dol`, `address`, `mobile`, `status`, `session`, `image`, `last_login_time`, `last_login_date`, `last_logout`, `otp`, `otp_date_time`, `verify_link`, `role_id`) VALUES
	('jitinprinci', 'jitin@interbitsolutions.com', 'Male', 'b.tech', 'pbkdf2_sha256$100000$mpQl03905Tcg$683eKn98REt8EkgawypVbyJMACVY92rGALbrEmlAbZ0=', '1992-07-27', '2019-10-17', '', 'zirakpur', '8445656758', 1, '2019-2020', 'FB_IMG_1556964066110.jpg', '', '', '', 'D24049k', '2019-10-17 19:11:59.404294', 'http://127.0.0.1/verifyuser/?email=jitin@interbitsolutions.com&token=pbkdf2_sha256$100000$RpWtI6olSDDQ$4ZLOS94h0WO4EgNnMwUfhgd3MjFfmEYRTa8BsEGghCk=', 2);
/*!40000 ALTER TABLE `principal_principle` ENABLE KEYS */;

-- Dumping structure for table schoolmanagement.teacher_teacher
CREATE TABLE IF NOT EXISTS `teacher_teacher` (
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `doj` varchar(255) DEFAULT NULL,
  `dol` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `last_login_time` varchar(255) DEFAULT NULL,
  `last_login_date` varchar(255) DEFAULT NULL,
  `last_logout` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_date_time` varchar(255) DEFAULT NULL,
  `verify_link` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `teacher_teacher_role_id_c5667107_fk_myUser_userrole_roleId` (`role_id`),
  CONSTRAINT `teacher_teacher_role_id_c5667107_fk_myUser_userrole_roleId` FOREIGN KEY (`role_id`) REFERENCES `myuser_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table schoolmanagement.teacher_teacher: ~0 rows (approximately)
/*!40000 ALTER TABLE `teacher_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teacher` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
