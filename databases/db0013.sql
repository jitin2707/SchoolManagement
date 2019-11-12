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


-- Dumping database structure for test_db
CREATE DATABASE IF NOT EXISTS `test_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test_db`;

-- Dumping structure for table test_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table test_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table test_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.auth_permission: ~48 rows (approximately)
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
	(22, 'Can add user signup', 8, 'add_usersignup'),
	(23, 'Can change user signup', 8, 'change_usersignup'),
	(24, 'Can delete user signup', 8, 'delete_usersignup'),
	(25, 'Can add login records', 9, 'add_loginrecords'),
	(26, 'Can change login records', 9, 'change_loginrecords'),
	(27, 'Can delete login records', 9, 'delete_loginrecords'),
	(28, 'Can add principle', 10, 'add_principle'),
	(29, 'Can change principle', 10, 'change_principle'),
	(30, 'Can delete principle', 10, 'delete_principle'),
	(31, 'Can add student', 11, 'add_student'),
	(32, 'Can change student', 11, 'change_student'),
	(33, 'Can delete student', 11, 'delete_student'),
	(34, 'Can add student_class', 12, 'add_student_class'),
	(35, 'Can change student_class', 12, 'change_student_class'),
	(36, 'Can delete student_class', 12, 'delete_student_class'),
	(37, 'Can add teacher detail', 13, 'add_teacherdetail'),
	(38, 'Can change teacher detail', 13, 'change_teacherdetail'),
	(39, 'Can delete teacher detail', 13, 'delete_teacherdetail'),
	(40, 'Can add clerk', 14, 'add_clerk'),
	(41, 'Can change clerk', 14, 'change_clerk'),
	(42, 'Can delete clerk', 14, 'delete_clerk'),
	(43, 'Can add section', 15, 'add_section'),
	(44, 'Can change section', 15, 'change_section'),
	(45, 'Can delete section', 15, 'delete_section'),
	(46, 'Can add parents', 16, 'add_parents'),
	(47, 'Can change parents', 16, 'change_parents'),
	(48, 'Can delete parents', 16, 'delete_parents');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table test_db.auth_user
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

-- Dumping data for table test_db.auth_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$100000$njGoW9tjgaSv$wgy7L367AW2MkbAm8KLC6w0fl5o1bZSKn551ZRUsX6Y=', '2019-11-12 06:33:57', 1, 'jitin', '', '', 'jitin@interbitsolutions.com', 1, 1, '2019-11-11 18:33:17');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table test_db.auth_user_groups
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

-- Dumping data for table test_db.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table test_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table test_db.clerical_clerk
CREATE TABLE IF NOT EXISTS `clerical_clerk` (
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
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `clerical_clerk_role_id_84015c2a_fk_myUser_userrole_roleId` (`role_id`),
  CONSTRAINT `clerical_clerk_role_id_84015c2a_fk_myUser_userrole_roleId` FOREIGN KEY (`role_id`) REFERENCES `myuser_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.clerical_clerk: ~0 rows (approximately)
/*!40000 ALTER TABLE `clerical_clerk` DISABLE KEYS */;
/*!40000 ALTER TABLE `clerical_clerk` ENABLE KEYS */;

-- Dumping structure for table test_db.django_admin_log
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.django_admin_log: ~17 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2019-11-11 18:34:34', '5', 'student', 1, '[{"added": {}}]', 7, 1),
	(2, '2019-11-11 18:58:40', '1', 'Student_class object (1)', 1, '[{"added": {}}]', 12, 1),
	(3, '2019-11-11 18:59:06', '2', 'Student_class object (2)', 1, '[{"added": {}}]', 12, 1),
	(4, '2019-11-11 19:01:23', '3', 'third', 1, '[{"added": {}}]', 12, 1),
	(5, '2019-11-11 19:01:36', '4', 'fourth', 1, '[{"added": {}}]', 12, 1),
	(6, '2019-11-11 19:01:48', '5', 'five', 1, '[{"added": {}}]', 12, 1),
	(7, '2019-11-11 19:02:00', '6', 'six', 1, '[{"added": {}}]', 12, 1),
	(8, '2019-11-11 19:06:18', '7', 'seven', 1, '[{"added": {}}]', 12, 1),
	(9, '2019-11-11 19:07:45', '8', 'eight', 1, '[{"added": {}}]', 12, 1),
	(10, '2019-11-11 19:07:57', '9', 'nine', 1, '[{"added": {}}]', 12, 1),
	(11, '2019-11-11 19:08:10', '10', 'ten', 1, '[{"added": {}}]', 12, 1),
	(12, '2019-11-11 19:10:23', '1', 'Section object (1)', 1, '[{"added": {}}]', 15, 1),
	(13, '2019-11-11 19:10:37', '2', 'Section object (2)', 1, '[{"added": {}}]', 15, 1),
	(14, '2019-11-11 19:10:45', '3', 'Section object (3)', 1, '[{"added": {}}]', 15, 1),
	(15, '2019-11-11 19:11:00', '4', 'Section object (4)', 1, '[{"added": {}}]', 15, 1),
	(16, '2019-11-11 19:11:08', '5', 'Section object (5)', 1, '[{"added": {}}]', 15, 1),
	(17, '2019-11-11 19:11:15', '6', 'Section object (6)', 1, '[{"added": {}}]', 15, 1),
	(18, '2019-11-12 06:34:11', '6', 'parents', 1, '[{"added": {}}]', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table test_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.django_content_type: ~16 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(14, 'clerical', 'clerk'),
	(5, 'contenttypes', 'contenttype'),
	(9, 'myUser', 'loginrecords'),
	(7, 'myUser', 'userrole'),
	(8, 'myUser', 'usersignup'),
	(16, 'parents', 'parents'),
	(10, 'principal', 'principle'),
	(6, 'sessions', 'session'),
	(15, 'students', 'section'),
	(11, 'students', 'student'),
	(12, 'students', 'student_class'),
	(13, 'teacher', 'teacherdetail');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table test_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.django_migrations: ~29 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-11-11 04:15:59'),
	(2, 'auth', '0001_initial', '2019-11-11 04:16:07'),
	(3, 'admin', '0001_initial', '2019-11-11 04:16:07'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-11-11 04:16:07'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2019-11-11 04:16:08'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2019-11-11 04:16:08'),
	(7, 'auth', '0003_alter_user_email_max_length', '2019-11-11 04:16:08'),
	(8, 'auth', '0004_alter_user_username_opts', '2019-11-11 04:16:09'),
	(9, 'auth', '0005_alter_user_last_login_null', '2019-11-11 04:16:09'),
	(10, 'auth', '0006_require_contenttypes_0002', '2019-11-11 04:16:09'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2019-11-11 04:16:09'),
	(12, 'auth', '0008_alter_user_username_max_length', '2019-11-11 04:16:09'),
	(13, 'auth', '0009_alter_user_last_name_max_length', '2019-11-11 04:16:10'),
	(14, 'myUser', '0001_initial', '2019-11-11 04:16:10'),
	(15, 'myUser', '0002_usersignp', '2019-11-11 04:16:10'),
	(16, 'myUser', '0003_auto_20191003_2255', '2019-11-11 04:16:10'),
	(17, 'myUser', '0004_auto_20191004_0935', '2019-11-11 04:16:11'),
	(18, 'myUser', '0005_auto_20191007_0957', '2019-11-11 04:16:12'),
	(19, 'myUser', '0006_loginrecords', '2019-11-11 04:16:12'),
	(20, 'clerical', '0001_initial', '2019-11-11 04:16:12'),
	(21, 'principal', '0001_initial', '2019-11-11 04:16:13'),
	(22, 'principal', '0002_auto_20191111_0941', '2019-11-11 04:16:13'),
	(23, 'sessions', '0001_initial', '2019-11-11 04:16:13'),
	(24, 'students', '0001_initial', '2019-11-11 04:16:14'),
	(25, 'teacher', '0001_initial', '2019-11-11 04:16:15'),
	(26, 'students', '0002_section', '2019-11-11 04:31:50'),
	(27, 'students', '0003_auto_20191112_1038', '2019-11-12 05:08:26'),
	(28, 'students', '0004_student_section_id', '2019-11-12 05:35:44'),
	(29, 'parents', '0001_initial', '2019-11-12 06:17:28');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table test_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.django_session: ~3 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('0x8qmhjlmlkk1k8idvbdkat3b5cwi2bs', 'ZjRjZGUyNjhhOGI3ODIxNjBjNDJkNzRlODJkNzlkMzc4Zjc0ZmRiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-11 18:44:34'),
	('d8zwwcwqr0nts04snyj6zv1yotxmplxj', 'MDU2YTcxZTc4MTlhNDkzMTgwNWE5NDUyOWQ2ZGEwMDBkOWFiNDE0ODp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-12 06:44:12'),
	('i6mdwq4ra6fz4rttyqs11jdukryoix5k', 'ZjRjZGUyNjhhOGI3ODIxNjBjNDJkNzRlODJkNzlkMzc4Zjc0ZmRiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-11 19:21:16'),
	('nbxq4tr73zycyihdnzpp7aabejd8og8l', 'Yjg4MDUwYjQ1ODEwMmEyNmZlNDRlMjBlYzQ5ZTZiOTBlZDRiMWYyMzp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjF9', '2019-11-12 04:56:45');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table test_db.myuser_loginrecords
CREATE TABLE IF NOT EXISTS `myuser_loginrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginTime` varchar(255) DEFAULT NULL,
  `logoutTime` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `macAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.myuser_loginrecords: ~17 rows (approximately)
/*!40000 ALTER TABLE `myuser_loginrecords` DISABLE KEYS */;
INSERT INTO `myuser_loginrecords` (`id`, `loginTime`, `logoutTime`, `userEmail`, `ipAddress`, `macAddress`) VALUES
	(3, '2019-10-23 09:30:36.475172', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(4, '2019-10-23 09:33:38.501814', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(5, '2019-10-23 09:37:11.767620', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(6, '2019-10-23 09:39:26.039293', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(7, '2019-10-23 09:41:03.447068', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(8, '2019-10-23 09:44:13.557900', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(9, '2019-10-23 09:45:46.549002', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(10, '2019-10-23 09:49:37.963437', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(11, '2019-10-23 09:51:45.418937', '2019-10-23 09:51:48.552144', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(12, '2019-11-03 15:00:09.606779', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(13, '2019-11-04 09:01:15.584044', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(14, '2019-11-06 09:17:41.343897', '2019-11-06 09:17:48.013019', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(15, '2019-11-06 09:27:23.214414', '', 'jitin@interbitsolutions.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(16, '2019-11-06 09:49:35.520532', '2019-11-06 09:53:30.838352', 'jitin@interbitsolutions.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(17, '2019-11-06 09:53:44.968596', '', 'jitin@interbitsolutions.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(18, '2019-11-12 10:02:01.673531', '2019-11-12 10:10:49.164076', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(19, '2019-11-12 10:10:56.519813', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(20, '2019-11-12 12:03:45.065775', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41');
/*!40000 ALTER TABLE `myuser_loginrecords` ENABLE KEYS */;

-- Dumping structure for table test_db.myuser_userrole
CREATE TABLE IF NOT EXISTS `myuser_userrole` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.myuser_userrole: ~5 rows (approximately)
/*!40000 ALTER TABLE `myuser_userrole` DISABLE KEYS */;
INSERT INTO `myuser_userrole` (`roleId`, `roleName`, `isActive`) VALUES
	(1, 'manager', 1),
	(2, 'principal', 1),
	(3, 'teacher', 1),
	(4, 'clerk', 1),
	(5, 'student', 1),
	(6, 'parents', 1);
/*!40000 ALTER TABLE `myuser_userrole` ENABLE KEYS */;

-- Dumping structure for table test_db.myuser_usersignup
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

-- Dumping data for table test_db.myuser_usersignup: ~5 rows (approximately)
/*!40000 ALTER TABLE `myuser_usersignup` DISABLE KEYS */;
INSERT INTO `myuser_usersignup` (`userFullName`, `userEmail`, `userPassword`, `userMobile`, `userState`, `isActive`, `roleId_id`, `confirmationLink`, `isVerified`, `otpTime`, `userOTP`, `userToken`) VALUES
	('Ankita', '050ankita@gmail.com', 'pbkdf2_sha256$100000$KzyOLsbepXSC$fcBcn3ee9JlZYrS12VrWmavBf/C3vkOepMm2eUxF5yY=', 9157567566, '34534564564sdfgdhdhfghfh', 1, 2, 'http://127.0.0.1/verifyuser/?email=050ankita@gmail.com&token=pbkdf2_sha256$100000$YSiHXBBVDukS$LzdTMkygcr45VFnbHlxLzM5A/tvR2jZ6lkMeMCLXbmY=', 0, '2019-11-12 10:16:39.175786', 'I70539b', 'pbkdf2_sha256$100000$YSiHXBBVDukS$LzdTMkygcr45VFnbHlxLzM5A/tvR2jZ6lkMeMCLXbmY='),
	('jitinprinci', 'jitin@interbitsolutions.com', 'pbkdf2_sha256$100000$XpjUuqI3gxKq$J9CMZTHzaCT1J7OicbBMSrVvoh2Cmarq7oWDjZBv5R4=', 8445656758, 'zirakpur', 1, 2, '', 1, '2019-10-17 19:11:59.404294', 'D24049k', 'pbkdf2_sha256$100000$RpWtI6olSDDQ$4ZLOS94h0WO4EgNnMwUfhgd3MjFfmEYRTa8BsEGghCk='),
	('nitin', 'kolishnitin@gmail.com', 'pbkdf2_sha256$100000$Ec8aP8dkuTvt$+rz+VzlbRLFCsmlKqB1/+J4WmlYtrgr4nz5/lihLr0c=', 878787979778, 'Punjab', 1, 1, 'http://127.0.0.1/verifyuser/?email=kolishnitin@gmail.com&token=pbkdf2_sha256$100000$FPiNG9m0owLR$/9aK7mC2ITve82RhEvELgIiPYI/bkk4smFRptgnuTvk=', 0, '2019-10-09 09:56:53.091780', 'b51900B', 'pbkdf2_sha256$100000$FPiNG9m0owLR$/9aK7mC2ITve82RhEvELgIiPYI/bkk4smFRptgnuTvk='),
	('Manoj Kumar', 'manoj.kumar@gmail.com', 'asdfg123#', 9876002081, 'sector 34 , chd', 1, 1, '', 0, '', '', ''),
	('jitin', 'truepbx247@gmail.com', 'pbkdf2_sha256$100000$I3GfsYPVWWEC$ruJlm3p8Xk2bSI2T24lcKJgVaPBj/BDN6H0nscQTMeg=', 7838534376, 'punjab', 1, 1, '', 1, '2019-10-10 09:10:09.993410', 'v36472q', 'pbkdf2_sha256$100000$sSl67qG8ejGC$qYcVFQsO9Ub4MygvloKg4RYe80J45VUqTXu1dW/dtOI=');
/*!40000 ALTER TABLE `myuser_usersignup` ENABLE KEYS */;

-- Dumping structure for table test_db.parents_parents
CREATE TABLE IF NOT EXISTS `parents_parents` (
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `last_login_time` varchar(255) DEFAULT NULL,
  `last_login_date` varchar(255) DEFAULT NULL,
  `last_logout` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `parents_parents_role_id_524eb4a6_fk_myUser_userrole_roleId` (`role_id`),
  CONSTRAINT `parents_parents_role_id_524eb4a6_fk_myUser_userrole_roleId` FOREIGN KEY (`role_id`) REFERENCES `myuser_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.parents_parents: ~0 rows (approximately)
/*!40000 ALTER TABLE `parents_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `parents_parents` ENABLE KEYS */;

-- Dumping structure for table test_db.principal_principle
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

-- Dumping data for table test_db.principal_principle: ~1 rows (approximately)
/*!40000 ALTER TABLE `principal_principle` DISABLE KEYS */;
INSERT INTO `principal_principle` (`name`, `email`, `gender`, `qualification`, `password`, `dob`, `doj`, `dol`, `address`, `mobile`, `status`, `session`, `image`, `last_login_time`, `last_login_date`, `last_logout`, `otp`, `otp_date_time`, `verify_link`, `role_id`) VALUES
	('jitinprinci', 'jitin@interbitsolutions.com', 'Male', 'b.tech', 'pbkdf2_sha256$100000$mpQl03905Tcg$683eKn98REt8EkgawypVbyJMACVY92rGALbrEmlAbZ0=', '1992-07-27', '2019-10-17', '', 'zirakpur', '8445656758', 1, '2019-2020', 'FB_IMG_1556964066110.jpg', '', '', '', 'D24049k', '2019-10-17 19:11:59.404294', 'http://127.0.0.1/verifyuser/?email=jitin@interbitsolutions.com&token=pbkdf2_sha256$100000$RpWtI6olSDDQ$4ZLOS94h0WO4EgNnMwUfhgd3MjFfmEYRTa8BsEGghCk=', 2);
/*!40000 ALTER TABLE `principal_principle` ENABLE KEYS */;

-- Dumping structure for table test_db.students_section
CREATE TABLE IF NOT EXISTS `students_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `class_id_id` int(11) NOT NULL,
  PRIMARY KEY (`section_id`),
  KEY `students_section_class_id_id_a1e852b5_fk_students_` (`class_id_id`),
  CONSTRAINT `students_section_class_id_id_a1e852b5_fk_students_` FOREIGN KEY (`class_id_id`) REFERENCES `students_student_class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.students_section: ~6 rows (approximately)
/*!40000 ALTER TABLE `students_section` DISABLE KEYS */;
INSERT INTO `students_section` (`section_id`, `section_name`, `is_active`, `class_id_id`) VALUES
	(1, 'A', 1, 1),
	(2, 'B', 1, 1),
	(3, 'A', 1, 2),
	(4, 'B', 1, 2),
	(5, 'A', 1, 3),
	(6, 'B', 1, 3);
/*!40000 ALTER TABLE `students_section` ENABLE KEYS */;

-- Dumping structure for table test_db.students_student
CREATE TABLE IF NOT EXISTS `students_student` (
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `admission_year` varchar(255) DEFAULT NULL,
  `admission_class` varchar(255) DEFAULT NULL,
  `admission_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `last_login_time` varchar(255) DEFAULT NULL,
  `last_login_date` varchar(255) DEFAULT NULL,
  `last_logout` varchar(255) DEFAULT NULL,
  `class_id_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `parent_email` varchar(255),
  `parent_name` varchar(255),
  `section_id_id` int(11) NOT NULL,
  PRIMARY KEY (`admission_id`),
  KEY `students_student_class_id_id_e4d5e4e8_fk_students_` (`class_id_id`),
  KEY `students_student_role_id_7c7e4953_fk_myUser_userrole_roleId` (`role_id`),
  KEY `students_student_section_id_id_2f90bd2e_fk_students_` (`section_id_id`),
  CONSTRAINT `students_student_section_id_id_2f90bd2e_fk_students_` FOREIGN KEY (`section_id_id`) REFERENCES `students_section` (`section_id`),
  CONSTRAINT `students_student_class_id_id_e4d5e4e8_fk_students_` FOREIGN KEY (`class_id_id`) REFERENCES `students_student_class` (`class_id`),
  CONSTRAINT `students_student_role_id_7c7e4953_fk_myUser_userrole_roleId` FOREIGN KEY (`role_id`) REFERENCES `myuser_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.students_student: ~0 rows (approximately)
/*!40000 ALTER TABLE `students_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_student` ENABLE KEYS */;

-- Dumping structure for table test_db.students_student_class
CREATE TABLE IF NOT EXISTS `students_student_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.students_student_class: ~10 rows (approximately)
/*!40000 ALTER TABLE `students_student_class` DISABLE KEYS */;
INSERT INTO `students_student_class` (`class_id`, `class_name`, `is_active`) VALUES
	(1, 'First', 1),
	(2, 'second', 1),
	(3, 'third', 1),
	(4, 'fourth', 1),
	(5, 'five', 1),
	(6, 'six', 1),
	(7, 'seven', 1),
	(8, 'eight', 1),
	(9, 'nine', 1),
	(10, 'ten', 1);
/*!40000 ALTER TABLE `students_student_class` ENABLE KEYS */;

-- Dumping structure for table test_db.teacher_teacherdetail
CREATE TABLE IF NOT EXISTS `teacher_teacherdetail` (
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
  `class_asn_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `teacher_teacherdetai_class_asn_id_f47bad73_fk_students_` (`class_asn_id`),
  KEY `teacher_teacherdetail_role_id_517d47fa_fk_myUser_userrole_roleId` (`role_id`),
  CONSTRAINT `teacher_teacherdetail_role_id_517d47fa_fk_myUser_userrole_roleId` FOREIGN KEY (`role_id`) REFERENCES `myuser_userrole` (`roleId`),
  CONSTRAINT `teacher_teacherdetai_class_asn_id_f47bad73_fk_students_` FOREIGN KEY (`class_asn_id`) REFERENCES `students_student_class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.teacher_teacherdetail: ~1 rows (approximately)
/*!40000 ALTER TABLE `teacher_teacherdetail` DISABLE KEYS */;
INSERT INTO `teacher_teacherdetail` (`name`, `email`, `gender`, `qualification`, `subject`, `password`, `dob`, `doj`, `dol`, `address`, `mobile`, `status`, `session`, `image`, `last_login_time`, `last_login_date`, `last_logout`, `class_asn_id`, `role_id`) VALUES
	('Ankita', '050ankita@gmail.com', 'on', 'BCOM', 'Math', 'qwerty123', '1998-07-25', '2019-11-12', '', '34534564564sdfgdhdhfghfh', '+9157567566', 1, '2019', NULL, '', '', '', 9, 3);
/*!40000 ALTER TABLE `teacher_teacherdetail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
