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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.auth_permission: ~69 rows (approximately)
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
	(48, 'Can delete parents', 16, 'delete_parents'),
	(49, 'Can add time table', 17, 'add_timetable'),
	(50, 'Can change time table', 17, 'change_timetable'),
	(51, 'Can delete time table', 17, 'delete_timetable'),
	(52, 'Can add association', 18, 'add_association'),
	(53, 'Can change association', 18, 'change_association'),
	(54, 'Can delete association', 18, 'delete_association'),
	(55, 'Can add code', 19, 'add_code'),
	(56, 'Can change code', 19, 'change_code'),
	(57, 'Can delete code', 19, 'delete_code'),
	(58, 'Can add nonce', 20, 'add_nonce'),
	(59, 'Can change nonce', 20, 'change_nonce'),
	(60, 'Can delete nonce', 20, 'delete_nonce'),
	(61, 'Can add user social auth', 21, 'add_usersocialauth'),
	(62, 'Can change user social auth', 21, 'change_usersocialauth'),
	(63, 'Can delete user social auth', 21, 'delete_usersocialauth'),
	(64, 'Can add partial', 22, 'add_partial'),
	(65, 'Can change partial', 22, 'change_partial'),
	(66, 'Can delete partial', 22, 'delete_partial'),
	(67, 'Can add attendance', 23, 'add_attendance'),
	(68, 'Can change attendance', 23, 'change_attendance'),
	(69, 'Can delete attendance', 23, 'delete_attendance');
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
	(1, 'pbkdf2_sha256$100000$njGoW9tjgaSv$wgy7L367AW2MkbAm8KLC6w0fl5o1bZSKn551ZRUsX6Y=', '2019-11-14 09:34:07', 1, 'jitin', '', '', 'jitin@interbitsolutions.com', 1, 1, '2019-11-11 18:33:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.django_admin_log: ~50 rows (approximately)
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
	(18, '2019-11-12 06:34:11', '6', 'parents', 1, '[{"added": {}}]', 7, 1),
	(19, '2019-11-12 07:10:21', '7', 'Section object (7)', 1, '[{"added": {}}]', 15, 1),
	(20, '2019-11-12 07:10:28', '8', 'Section object (8)', 1, '[{"added": {}}]', 15, 1),
	(21, '2019-11-14 07:32:14', '1', 'TimeTable object (1)', 1, '[{"added": {}}]', 17, 1),
	(22, '2019-11-14 08:06:12', '2', 'TimeTable object (2)', 1, '[{"added": {}}]', 17, 1),
	(23, '2019-11-14 08:07:12', '3', 'TimeTable object (3)', 1, '[{"added": {}}]', 17, 1),
	(24, '2019-11-14 09:35:23', '4', 'TimeTable object (4)', 1, '[{"added": {}}]', 17, 1),
	(25, '2019-11-14 09:36:26', '5', 'TimeTable object (5)', 1, '[{"added": {}}]', 17, 1),
	(26, '2019-11-14 09:37:34', '6', 'TimeTable object (6)', 1, '[{"added": {}}]', 17, 1),
	(27, '2019-11-14 09:38:24', '7', 'TimeTable object (7)', 1, '[{"added": {}}]', 17, 1),
	(28, '2019-11-14 09:39:18', '8', 'TimeTable object (8)', 1, '[{"added": {}}]', 17, 1),
	(29, '2019-11-14 09:41:07', '9', 'TimeTable object (9)', 1, '[{"added": {}}]', 17, 1),
	(30, '2019-11-14 09:41:36', '10', 'TimeTable object (10)', 1, '[{"added": {}}]', 17, 1),
	(31, '2019-11-14 09:42:35', '11', 'TimeTable object (11)', 1, '[{"added": {}}]', 17, 1),
	(32, '2019-11-14 09:44:05', '12', 'TimeTable object (12)', 1, '[{"added": {}}]', 17, 1),
	(33, '2019-11-14 09:47:51', '13', 'TimeTable object (13)', 1, '[{"added": {}}]', 17, 1),
	(34, '2019-11-14 09:48:08', '14', 'TimeTable object (14)', 1, '[{"added": {}}]', 17, 1),
	(35, '2019-11-14 09:49:00', '15', 'TimeTable object (15)', 1, '[{"added": {}}]', 17, 1),
	(36, '2019-11-14 09:49:21', '16', 'TimeTable object (16)', 1, '[{"added": {}}]', 17, 1),
	(37, '2019-11-14 09:49:45', '17', 'TimeTable object (17)', 1, '[{"added": {}}]', 17, 1),
	(38, '2019-11-14 09:50:27', '18', 'TimeTable object (18)', 1, '[{"added": {}}]', 17, 1),
	(39, '2019-11-14 09:50:49', '19', 'TimeTable object (19)', 1, '[{"added": {}}]', 17, 1),
	(40, '2019-11-14 09:51:10', '20', 'TimeTable object (20)', 1, '[{"added": {}}]', 17, 1),
	(41, '2019-11-14 09:51:36', '21', 'TimeTable object (21)', 1, '[{"added": {}}]', 17, 1),
	(42, '2019-11-14 09:52:16', '22', 'TimeTable object (22)', 1, '[{"added": {}}]', 17, 1),
	(43, '2019-11-14 09:52:54', '23', 'TimeTable object (23)', 1, '[{"added": {}}]', 17, 1),
	(44, '2019-11-14 09:53:18', '24', 'TimeTable object (24)', 1, '[{"added": {}}]', 17, 1),
	(45, '2019-11-14 09:54:09', '25', 'TimeTable object (25)', 1, '[{"added": {}}]', 17, 1),
	(46, '2019-11-14 09:55:36', '26', 'TimeTable object (26)', 1, '[{"added": {}}]', 17, 1),
	(47, '2019-11-14 09:56:00', '27', 'TimeTable object (27)', 1, '[{"added": {}}]', 17, 1),
	(48, '2019-11-14 09:56:45', '28', 'TimeTable object (28)', 1, '[{"added": {}}]', 17, 1),
	(49, '2019-11-14 09:57:19', '29', 'TimeTable object (29)', 1, '[{"added": {}}]', 17, 1),
	(50, '2019-11-14 09:58:04', '30', 'TimeTable object (30)', 1, '[{"added": {}}]', 17, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table test_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.django_content_type: ~23 rows (approximately)
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
	(18, 'social_django', 'association'),
	(19, 'social_django', 'code'),
	(20, 'social_django', 'nonce'),
	(22, 'social_django', 'partial'),
	(21, 'social_django', 'usersocialauth'),
	(15, 'students', 'section'),
	(11, 'students', 'student'),
	(12, 'students', 'student_class'),
	(23, 'teacher', 'attendance'),
	(13, 'teacher', 'teacherdetail'),
	(17, 'teacher', 'timetable');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table test_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.django_migrations: ~51 rows (approximately)
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
	(29, 'parents', '0001_initial', '2019-11-12 06:17:28'),
	(30, 'students', '0005_remove_section_class_id', '2019-11-12 07:09:26'),
	(31, 'parents', '0002_parents_student_id', '2019-11-12 07:42:18'),
	(32, 'teacher', '0002_timetable', '2019-11-13 13:32:22'),
	(33, 'teacher', '0003_remove_timetable_table_date', '2019-11-14 07:30:17'),
	(34, 'default', '0001_initial', '2019-11-18 03:34:51'),
	(35, 'social_auth', '0001_initial', '2019-11-18 03:34:51'),
	(36, 'default', '0002_add_related_name', '2019-11-18 03:34:52'),
	(37, 'social_auth', '0002_add_related_name', '2019-11-18 03:34:52'),
	(38, 'default', '0003_alter_email_max_length', '2019-11-18 03:34:53'),
	(39, 'social_auth', '0003_alter_email_max_length', '2019-11-18 03:34:53'),
	(40, 'default', '0004_auto_20160423_0400', '2019-11-18 03:34:53'),
	(41, 'social_auth', '0004_auto_20160423_0400', '2019-11-18 03:34:53'),
	(42, 'social_auth', '0005_auto_20160727_2333', '2019-11-18 03:34:53'),
	(43, 'social_django', '0006_partial', '2019-11-18 03:34:54'),
	(44, 'social_django', '0007_code_timestamp', '2019-11-18 03:34:55'),
	(45, 'social_django', '0008_partial_timestamp', '2019-11-18 03:34:55'),
	(46, 'social_django', '0003_alter_email_max_length', '2019-11-18 03:34:55'),
	(47, 'social_django', '0005_auto_20160727_2333', '2019-11-18 03:34:55'),
	(48, 'social_django', '0002_add_related_name', '2019-11-18 03:34:55'),
	(49, 'social_django', '0004_auto_20160423_0400', '2019-11-18 03:34:55'),
	(50, 'social_django', '0001_initial', '2019-11-18 03:34:55'),
	(51, 'teacher', '0004_attendance', '2019-11-18 03:56:04');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table test_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.django_session: ~11 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('0x8qmhjlmlkk1k8idvbdkat3b5cwi2bs', 'ZjRjZGUyNjhhOGI3ODIxNjBjNDJkNzRlODJkNzlkMzc4Zjc0ZmRiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-11 18:44:34'),
	('4rqaqetg11vw7zmvygd171lc9bh9bm02', 'MDU2YTcxZTc4MTlhNDkzMTgwNWE5NDUyOWQ2ZGEwMDBkOWFiNDE0ODp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-14 10:08:08'),
	('5p0thjxmq46sul7r8ewahd93vu83d6lv', 'OWIyMWI0N2VjNzIyYmQ5ZTYzOGU5MTU2MTU3OTJiNjg3Y2NjYmMzMDp7fQ==', '2019-11-12 07:56:41'),
	('clp9ur9tu8e726680m7sktogmr6l1f4a', 'MTBlMzc5NWJkMzljYzFiMzFhNjMzNGE4MDVhN2M3YWRlYTBjZTc4YTp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoiYW5raXRhQGdtYWlsLmNvbSIsInJvbGVpZCI6M30=', '2019-11-14 10:57:40'),
	('d8zwwcwqr0nts04snyj6zv1yotxmplxj', 'MDU2YTcxZTc4MTlhNDkzMTgwNWE5NDUyOWQ2ZGEwMDBkOWFiNDE0ODp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoidHJ1ZXBieDI0N0BnbWFpbC5jb20iLCJyb2xlaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-12 06:44:12'),
	('g7fi8b7mii3dcw9rxinjrjiobi45uzbe', 'ZjRjZGUyNjhhOGI3ODIxNjBjNDJkNzRlODJkNzlkMzc4Zjc0ZmRiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-12 07:36:36'),
	('i5oke6h30kuductbsdqjob6jfij24v1s', 'MzFlYzU4MDNlNWI4OTlhZDMzZmIwZGExOGY1OTI2ZTEyOWFiNjIxNDp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbGlkIjoiaml0aW5AaW50ZXJiaXRzb2x1dGlvbnMuY29tIiwicm9sZWlkIjoyfQ==', '2019-11-13 11:50:48'),
	('i6mdwq4ra6fz4rttyqs11jdukryoix5k', 'ZjRjZGUyNjhhOGI3ODIxNjBjNDJkNzRlODJkNzlkMzc4Zjc0ZmRiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-11 19:21:16'),
	('jreab8kshs7hszdmm7bsrdweeuamwzca', 'ZjRjZGUyNjhhOGI3ODIxNjBjNDJkNzRlODJkNzlkMzc4Zjc0ZmRiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0In0=', '2019-11-14 08:18:27'),
	('mnj31df9fxdxur5ghfzd39sewdgpf9c2', 'NGU1NzgyYTFhMWQ2NDAzMTdmM2M4ZjNmNmI4ZTc2MjEyZWQ3NWQ5Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmQwYWMwNGUwYzRjNzllZjM1NDkyY2ViYTNmODRiMmMxMDY0ZWU0IiwiQXV0aGVudGljYXRpb24iOnRydWUsImVtYWlsaWQiOiJ0cnVlcGJ4MjQ3QGdtYWlsLmNvbSIsInJvbGVpZCI6MX0=', '2019-11-14 07:47:21'),
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.myuser_loginrecords: ~43 rows (approximately)
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
	(20, '2019-11-12 12:03:45.065775', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(21, '2019-11-13 15:58:18.453152', '2019-11-13 16:15:26.635145', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(22, '2019-11-13 16:15:33.401147', '', '050ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(23, '2019-11-13 16:15:48.045307', '', '050ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(24, '2019-11-13 16:19:44.393821', '', '050ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(25, '2019-11-13 16:20:03.053636', '', '050ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(26, '2019-11-13 16:20:54.987452', '', '050ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(27, '2019-11-13 16:25:21.300626', '', '050ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(28, '2019-11-13 16:29:05.895592', '', '050ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(29, '2019-11-13 16:30:34.555536', '2019-11-13 16:45:36.004707', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(30, '2019-11-13 16:45:42.607248', '', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(31, '2019-11-13 16:47:28.514355', '2019-11-13 16:49:07.155814', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(32, '2019-11-13 16:49:19.856329', '', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(33, '2019-11-13 16:50:45.800674', '', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(34, '2019-11-13 16:51:10.436908', '', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(35, '2019-11-13 16:51:33.607065', '', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(36, '2019-11-13 16:51:49.597076', '', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(37, '2019-11-13 16:52:33.521805', '', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(38, '2019-11-13 16:54:37.366975', '2019-11-13 17:02:33.254717', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(39, '2019-11-13 17:02:40.266291', '2019-11-13 17:05:43.421314', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(40, '2019-11-13 17:05:50.968141', '2019-11-13 17:05:54.618765', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(41, '2019-11-13 17:06:11.468120', '2019-11-13 17:07:33.793600', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(42, '2019-11-13 17:10:43.312378', '', 'jitin@interbitsolutions.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(43, '2019-11-14 13:03:41.523823', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(44, '2019-11-14 14:52:46.130880', '', 'truepbx247@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41'),
	(45, '2019-11-14 15:52:31.955990', '', 'ankita@gmail.com', '192.168.56.1', 'f4:30:b9:d8:62:41');
/*!40000 ALTER TABLE `myuser_loginrecords` ENABLE KEYS */;

-- Dumping structure for table test_db.myuser_userrole
CREATE TABLE IF NOT EXISTS `myuser_userrole` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.myuser_userrole: ~6 rows (approximately)
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

-- Dumping data for table test_db.myuser_usersignup: ~12 rows (approximately)
/*!40000 ALTER TABLE `myuser_usersignup` DISABLE KEYS */;
INSERT INTO `myuser_usersignup` (`userFullName`, `userEmail`, `userPassword`, `userMobile`, `userState`, `isActive`, `roleId_id`, `confirmationLink`, `isVerified`, `otpTime`, `userOTP`, `userToken`) VALUES
	('asdjvsdj', 'abc@gmail.com', 'pbkdf2_sha256$100000$nBNXLk33mt30$c4OrGsmVbBTIw24k/tzPxjYkNhWPXfY8W8pl+q+4iqk=', 915675886779, 'bdfbhdhhfgnhfg', 1, 5, 'http://127.0.0.1/verifyuser/?email=abc@gmail.com&token=pbkdf2_sha256$100000$y4HJMQ3Petdm$/Mpvy5W5rGH62x0sVlQeBMFAAv5CO9DTnH3SKSLD6AE=', 0, '2019-11-12 12:52:57.922543', 'W67827E', 'pbkdf2_sha256$100000$y4HJMQ3Petdm$/Mpvy5W5rGH62x0sVlQeBMFAAv5CO9DTnH3SKSLD6AE='),
	('Ankita', 'ankita@gmail.com', 'pbkdf2_sha256$100000$zI1gE2IQES8x$vI5BRW8JgmXqPn/kC8JNLzTG8KIz4DIXOITVHOyGkVs=', 918438458546, 'punjab', 1, 3, '', 1, '2019-11-13 16:44:18.477749', 'u69319q', 'pbkdf2_sha256$100000$qPBLHfCvwkeI$Pg796B6gSIJdWakPFu3Ba3TtqgpOsWDx8bQCVIIe/mE='),
	('diljit', 'diljit@gmail.com', 'pbkdf2_sha256$100000$Umz8Gcczbtod$YnCuC0Bt11u6N7XPW7NYoQ936krUkB3UbKoNoQJVnqU=', 914564576567, 'fsergrehrthjgyjmgm', 1, 6, 'http://127.0.0.1/verifyuser/?email=shivam@gmail.com&token=pbkdf2_sha256$100000$QakoBaihUR4S$i1nMcyMLn9YRKYqkRlW8KqbCRGqiYmc9Hi6IqIC8kno=', 0, '2019-11-12 13:16:30.202876', 'B41438N', 'pbkdf2_sha256$100000$QakoBaihUR4S$i1nMcyMLn9YRKYqkRlW8KqbCRGqiYmc9Hi6IqIC8kno='),
	('jitinprinci', 'jitin@interbitsolutions.com', 'pbkdf2_sha256$100000$XpjUuqI3gxKq$J9CMZTHzaCT1J7OicbBMSrVvoh2Cmarq7oWDjZBv5R4=', 8445656758, 'zirakpur', 1, 2, '', 1, '2019-10-17 19:11:59.404294', 'D24049k', 'pbkdf2_sha256$100000$RpWtI6olSDDQ$4ZLOS94h0WO4EgNnMwUfhgd3MjFfmEYRTa8BsEGghCk='),
	('nitin', 'kolishnitin@gmail.com', 'pbkdf2_sha256$100000$Ec8aP8dkuTvt$+rz+VzlbRLFCsmlKqB1/+J4WmlYtrgr4nz5/lihLr0c=', 878787979778, 'Punjab', 1, 1, 'http://127.0.0.1/verifyuser/?email=kolishnitin@gmail.com&token=pbkdf2_sha256$100000$FPiNG9m0owLR$/9aK7mC2ITve82RhEvELgIiPYI/bkk4smFRptgnuTvk=', 0, '2019-10-09 09:56:53.091780', 'b51900B', 'pbkdf2_sha256$100000$FPiNG9m0owLR$/9aK7mC2ITve82RhEvELgIiPYI/bkk4smFRptgnuTvk='),
	('Mohit', 'mohit@gmail.com', 'pbkdf2_sha256$100000$LCc0NmNyo3X4$tNX77WpmheXoEZjv/Lk60L5rXjFEx8Vx1yNeYZUk/6c=', 919848468584, 'Punjab', 1, 3, 'http://127.0.0.1/verifyuser/?email=mohit@gmail.com&token=pbkdf2_sha256$100000$agjBLRzZGrtL$b2kVWBrnylCdPEFbQ4gPcR9Qu688sph//xRhV4Y9S0=', 0, '2019-11-14 13:07:16.663992', 'z99516k', 'pbkdf2_sha256$100000$agjBLRzZGrtL$b2kVWBrnylCdPEFbQ4gPcR9Qu688sph//xRhV4Y9S0='),
	('Nitin', 'nitin@gmail.com', 'pbkdf2_sha256$100000$VIEDLpz371kn$Cp9N99IuRIxGINdfZpqHveesz2xZ25hsb+E7yo6R9eE=', 919848468546, 'New Chandigarh', 1, 3, 'http://127.0.0.1/verifyuser/?email=nitin@gmail.com&token=pbkdf2_sha256$100000$PSErrrNMHJjP$E0rfSZtgAfV8xk4A4eVYsfMUNKrv5BsLtbS1PJAfjj0=', 0, '2019-11-14 13:05:37.833080', 'w60571K', 'pbkdf2_sha256$100000$PSErrrNMHJjP$E0rfSZtgAfV8xk4A4eVYsfMUNKrv5BsLtbS1PJAfjj0='),
	('Rohini', 'rohi@gmail.com', 'pbkdf2_sha256$100000$LP36eUEeuMET$BGZmGzTdSecsd6Rt3AbLmzri/7OJQADRWCG8WkXPUVo=', 919848468741, 'Kurukshetra', 1, 3, 'http://127.0.0.1/verifyuser/?email=rohi@gmail.com&token=pbkdf2_sha256$100000$K16kBppmXtXr$/pMAy3ekrESKVbgQHmocF8vGS/VnhPd990LgtWeOY8=', 0, '2019-11-14 15:03:48.440849', 's58752s', 'pbkdf2_sha256$100000$K16kBppmXtXr$/pMAy3ekrESKVbgQHmocF8vGS/VnhPd990LgtWeOY8='),
	('Shivam', 'shivam@gmail.com', 'pbkdf2_sha256$100000$OpqpF1nrKqHt$fh0inGmXebnZPijkfQTwLMzaWdboFxYgY7XOfeYVGSw=', 914564576567, 'fsergrehrthjgyjmgm', 1, 5, 'http://127.0.0.1/verifyuser/?email=shivam@gmail.com&token=pbkdf2_sha256$100000$QakoBaihUR4S$i1nMcyMLn9YRKYqkRlW8KqbCRGqiYmc9Hi6IqIC8kno=', 0, '2019-11-12 13:16:30.202876', 'B41438N', 'pbkdf2_sha256$100000$QakoBaihUR4S$i1nMcyMLn9YRKYqkRlW8KqbCRGqiYmc9Hi6IqIC8kno='),
	('shubham', 'shubham@gmail.com', 'pbkdf2_sha256$100000$Co96RWdqIInU$KRzxoFRKLlNf0qKyc8cbYojfMCEvTL1Hv0rFuKyW2JU=', 919848468458, 'Chandigarh', 1, 3, 'http://127.0.0.1/verifyuser/?email=shubham@gmail.com&token=pbkdf2_sha256$100000$mDGRq0C2sZVQ$z7Qn1ml240DaOTWTH4Ehs/Uhnt6PkDxAWFk9ThtELy4=', 0, '2019-11-14 15:01:40.843614', 'X64882L', 'pbkdf2_sha256$100000$mDGRq0C2sZVQ$z7Qn1ml240DaOTWTH4Ehs/Uhnt6PkDxAWFk9ThtELy4='),
	('jitin', 'truepbx247@gmail.com', 'pbkdf2_sha256$100000$I3GfsYPVWWEC$ruJlm3p8Xk2bSI2T24lcKJgVaPBj/BDN6H0nscQTMeg=', 7838534376, 'punjab', 1, 1, '', 1, '2019-10-10 09:10:09.993410', 'v36472q', 'pbkdf2_sha256$100000$sSl67qG8ejGC$qYcVFQsO9Ub4MygvloKg4RYe80J45VUqTXu1dW/dtOI='),
	('jsdbvjwvbjn', 'xys@gmail.com', 'pbkdf2_sha256$100000$QcgZj0bJhUIK$Nsl5X3Q3q9X2ddPYHpiFRPMUBjzmfNoGIIKRO8hexqU=', 915675886779, 'bdfbhdhhfgnhfg', 1, 6, 'http://127.0.0.1/verifyuser/?email=abc@gmail.com&token=pbkdf2_sha256$100000$y4HJMQ3Petdm$/Mpvy5W5rGH62x0sVlQeBMFAAv5CO9DTnH3SKSLD6AE=', 0, '2019-11-12 12:52:57.922543', 'W67827E', 'pbkdf2_sha256$100000$y4HJMQ3Petdm$/Mpvy5W5rGH62x0sVlQeBMFAAv5CO9DTnH3SKSLD6AE=');
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
  `student_id_id` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `parents_parents_role_id_524eb4a6_fk_myUser_userrole_roleId` (`role_id`),
  KEY `parents_parents_student_id_id_4af668fe_fk_students_` (`student_id_id`),
  CONSTRAINT `parents_parents_student_id_id_4af668fe_fk_students_` FOREIGN KEY (`student_id_id`) REFERENCES `students_student` (`admission_id`),
  CONSTRAINT `parents_parents_role_id_524eb4a6_fk_myUser_userrole_roleId` FOREIGN KEY (`role_id`) REFERENCES `myuser_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.parents_parents: ~1 rows (approximately)
/*!40000 ALTER TABLE `parents_parents` DISABLE KEYS */;
INSERT INTO `parents_parents` (`name`, `email`, `password`, `address`, `mobile`, `is_active`, `image`, `last_login_time`, `last_login_date`, `last_logout`, `role_id`, `student_id_id`) VALUES
	('diljit', 'diljit@gmail.com', 'wrwertrer2343', 'fsergrehrthjgyjmgm', '+914564576567', 1, '', '', '', '', 6, 3);
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

-- Dumping structure for table test_db.social_auth_association
CREATE TABLE IF NOT EXISTS `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.social_auth_association: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;

-- Dumping structure for table test_db.social_auth_code
CREATE TABLE IF NOT EXISTS `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.social_auth_code: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;

-- Dumping structure for table test_db.social_auth_nonce
CREATE TABLE IF NOT EXISTS `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.social_auth_nonce: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;

-- Dumping structure for table test_db.social_auth_partial
CREATE TABLE IF NOT EXISTS `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.social_auth_partial: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;

-- Dumping structure for table test_db.social_auth_usersocialauth
CREATE TABLE IF NOT EXISTS `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.social_auth_usersocialauth: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;

-- Dumping structure for table test_db.students_section
CREATE TABLE IF NOT EXISTS `students_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.students_section: ~2 rows (approximately)
/*!40000 ALTER TABLE `students_section` DISABLE KEYS */;
INSERT INTO `students_section` (`section_id`, `section_name`, `is_active`) VALUES
	(7, 'A', 1),
	(8, 'B', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.students_student: ~1 rows (approximately)
/*!40000 ALTER TABLE `students_student` DISABLE KEYS */;
INSERT INTO `students_student` (`name`, `email`, `gender`, `admission_year`, `admission_class`, `admission_id`, `password`, `dob`, `address`, `mobile`, `status`, `image`, `last_login_time`, `last_login_date`, `last_logout`, `class_id_id`, `role_id`, `parent_email`, `parent_name`, `section_id_id`) VALUES
	('Shivam', 'shivam@gmail.com', 'male', '2019-11-12', '9', 3, 'wrwertrer2343', '1993-07-25', 'fsergrehrthjgyjmgm', '+914564576567', 1, NULL, '', '', '', 9, 5, 'diljit@gmail.com', 'diljit', 8);
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

-- Dumping structure for table test_db.teacher_attendance
CREATE TABLE IF NOT EXISTS `teacher_attendance` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `Attendance` varchar(255) DEFAULT NULL,
  `classid_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`index`),
  KEY `teacher_attendance_classid_id_56fef602_fk_students_` (`classid_id`),
  KEY `teacher_attendance_section_id_0df21d55_fk_students_` (`section_id`),
  KEY `teacher_attendance_student_id_89f40f48_fk_students_` (`student_id`),
  CONSTRAINT `teacher_attendance_student_id_89f40f48_fk_students_` FOREIGN KEY (`student_id`) REFERENCES `students_student` (`admission_id`),
  CONSTRAINT `teacher_attendance_classid_id_56fef602_fk_students_` FOREIGN KEY (`classid_id`) REFERENCES `students_student_class` (`class_id`),
  CONSTRAINT `teacher_attendance_section_id_0df21d55_fk_students_` FOREIGN KEY (`section_id`) REFERENCES `students_section` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.teacher_attendance: ~0 rows (approximately)
/*!40000 ALTER TABLE `teacher_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_attendance` ENABLE KEYS */;

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

-- Dumping data for table test_db.teacher_teacherdetail: ~5 rows (approximately)
/*!40000 ALTER TABLE `teacher_teacherdetail` DISABLE KEYS */;
INSERT INTO `teacher_teacherdetail` (`name`, `email`, `gender`, `qualification`, `subject`, `password`, `dob`, `doj`, `dol`, `address`, `mobile`, `status`, `session`, `image`, `last_login_time`, `last_login_date`, `last_logout`, `class_asn_id`, `role_id`) VALUES
	('Ankita', 'ankita@gmail.com', 'female', 'BSC', 'Math,Science', 'qwerty123', '1995-07-25', '2019-11-13', '', 'punjab', '+918438458546', 1, '2019', 'FB_IMG_1556022918388.jpg', '', '', '', 9, 3),
	('Mohit', 'mohit@gmail.com', 'male', 'BSC', 'Geography,History', 'qwerty123', '1994-04-26', '2019-11-14', '', 'Punjab', '+919848468584', 1, '2019', 'FB_IMG_1502534391901.jpg', '', '', '', 9, 3),
	('Nitin', 'nitin@gmail.com', 'male', 'Btech/BE', 'English,Hindi', 'qwerty123', '1996-05-24', '2019-11-14', '', 'New Chandigarh', '+919848468546', 1, '2019', 'FB_IMG_1501418394519.jpg', '', '', '', 9, 3),
	('Rohini', 'rohi@gmail.com', 'female', 'B.Ed', 'PE,CS', 'qwerty123', '1889-04-05', '2019-11-14', '', 'Kurukshetra', '+919848468741', 1, '2019', 'FB_IMG_1547548186352.jpg', '', '', '', 9, 3),
	('shubham', 'shubham@gmail.com', 'male', 'Mtech/ME', 'Punjabi, EVS', 'qwerty123', '1991-04-12', '2019-11-14', '', 'Chandigarh', '+919848468458', 1, '2019', 'FB_IMG_1556963924853.jpg', '', '', '', 9, 3);
/*!40000 ALTER TABLE `teacher_teacherdetail` ENABLE KEYS */;

-- Dumping structure for table test_db.teacher_timetable
CREATE TABLE IF NOT EXISTS `teacher_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_day` varchar(255) NOT NULL,
  `time_slot` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `classid_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `teacher_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_timetable_classid_id_77224aa6_fk_students_` (`classid_id`),
  KEY `teacher_timetable_section_id_5b20b87e_fk_students_` (`section_id`),
  KEY `teacher_timetable_teacher_id_58c7a97b_fk_teacher_t` (`teacher_id`),
  CONSTRAINT `teacher_timetable_classid_id_77224aa6_fk_students_` FOREIGN KEY (`classid_id`) REFERENCES `students_student_class` (`class_id`),
  CONSTRAINT `teacher_timetable_section_id_5b20b87e_fk_students_` FOREIGN KEY (`section_id`) REFERENCES `students_section` (`section_id`),
  CONSTRAINT `teacher_timetable_teacher_id_58c7a97b_fk_teacher_t` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_teacherdetail` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table test_db.teacher_timetable: ~30 rows (approximately)
/*!40000 ALTER TABLE `teacher_timetable` DISABLE KEYS */;
INSERT INTO `teacher_timetable` (`id`, `table_day`, `time_slot`, `subject`, `classid_id`, `section_id`, `teacher_id`) VALUES
	(1, 'Monday', '9:00 - 9:45', 'Math', 9, 7, 'ankita@gmail.com'),
	(2, 'Monday', '9:45 - 10:30', 'English', 9, 7, 'nitin@gmail.com'),
	(3, 'Monday', '10:30 - 11:15', 'Geography', 9, 7, 'mohit@gmail.com'),
	(4, 'Monday', '11:15 - 12:00', 'PE', 9, 7, 'rohi@gmail.com'),
	(5, 'Monday', '12:30 - 1:15', 'Punjabi', 9, 7, 'shubham@gmail.com'),
	(6, 'Monday', '1:15 - 2:00', 'Science', 9, 7, 'ankita@gmail.com'),
	(7, 'Tuesday', '9:00 - 9:45', 'Math', 9, 7, 'ankita@gmail.com'),
	(8, 'Tuesday', '9:45 - 10:30', 'Hindi', 9, 7, 'nitin@gmail.com'),
	(9, 'Tuesday', '10:30 - 11:15', 'History', 9, 7, 'mohit@gmail.com'),
	(10, 'Tuesday', '11:15 - 12:00', 'CS', 9, 7, 'rohi@gmail.com'),
	(11, 'Tuesday', '12:30 - 1:15', 'ENV', 9, 7, 'shubham@gmail.com'),
	(12, 'Tuesday', '1:15 - 2:00', 'Science', 9, 7, 'ankita@gmail.com'),
	(13, 'Wednesday', '9:00 - 9:45', 'English', 9, 7, 'nitin@gmail.com'),
	(14, 'Wednesday', '9:45 - 10:30', 'Science', 9, 7, 'ankita@gmail.com'),
	(15, 'Wednesday', '10:30 - 11:15', 'Geography', 9, 7, 'mohit@gmail.com'),
	(16, 'Wednesday', '11:15 - 12:00', 'CS', 9, 7, 'rohi@gmail.com'),
	(17, 'Wednesday', '12:30 - 1:15', 'Math', 9, 7, 'ankita@gmail.com'),
	(18, 'Wednesday', '1:15 - 2:00', 'ENV', 9, 7, 'shubham@gmail.com'),
	(19, 'Thursday', '9:00 - 9:45', 'Math', 9, 7, 'ankita@gmail.com'),
	(20, 'Thursday', '9:45 - 10:30', 'English', 9, 7, 'nitin@gmail.com'),
	(21, 'Thursday', '10:30 - 11:15', 'History', 9, 7, 'mohit@gmail.com'),
	(22, 'Thursday', '11:15 - 12:00', 'Hindi', 9, 7, 'nitin@gmail.com'),
	(23, 'Thursday', '12:30 - 1:15', 'Punjabi', 9, 7, 'shubham@gmail.com'),
	(24, 'Thursday', '1:15 - 2:00', 'Science', 9, 7, 'ankita@gmail.com'),
	(25, 'Friday', '9:00 - 9:45', 'English', 9, 7, 'nitin@gmail.com'),
	(26, 'Friday', '9:45 - 10:30', 'CS', 9, 7, 'rohi@gmail.com'),
	(27, 'Friday', '10:30 - 11:15', 'Math', 9, 7, 'ankita@gmail.com'),
	(28, 'Friday', '11:15 - 12:00', 'PE', 9, 7, 'rohi@gmail.com'),
	(29, 'Friday', '12:30 - 1:15', 'Geography', 9, 7, 'mohit@gmail.com'),
	(30, 'Friday', '1:15 - 2:00', 'Hindi', 9, 7, 'nitin@gmail.com');
/*!40000 ALTER TABLE `teacher_timetable` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
