-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 20, 2024 at 10:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_module_feedbacktable`
--

CREATE TABLE `admin_module_feedbacktable` (
  `id` bigint(20) NOT NULL,
  `feedbackdate` datetime(6) NOT NULL,
  `f_user` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `feedback` longtext NOT NULL,
  `admin_reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add feedbacktable', 1, 'add_feedbacktable'),
(2, 'Can change feedbacktable', 1, 'change_feedbacktable'),
(3, 'Can delete feedbacktable', 1, 'delete_feedbacktable'),
(4, 'Can view feedbacktable', 1, 'view_feedbacktable'),
(5, 'Can add post_table', 2, 'add_post_table'),
(6, 'Can change post_table', 2, 'change_post_table'),
(7, 'Can delete post_table', 2, 'delete_post_table'),
(8, 'Can view post_table', 2, 'view_post_table'),
(9, 'Can add comments', 3, 'add_comments'),
(10, 'Can change comments', 3, 'change_comments'),
(11, 'Can delete comments', 3, 'delete_comments'),
(12, 'Can view comments', 3, 'view_comments'),
(13, 'Can add community_table', 4, 'add_community_table'),
(14, 'Can change community_table', 4, 'change_community_table'),
(15, 'Can delete community_table', 4, 'delete_community_table'),
(16, 'Can view community_table', 4, 'view_community_table'),
(17, 'Can add debate', 5, 'add_debate'),
(18, 'Can change debate', 5, 'change_debate'),
(19, 'Can delete debate', 5, 'delete_debate'),
(20, 'Can view debate', 5, 'view_debate'),
(21, 'Can add debate_reply', 6, 'add_debate_reply'),
(22, 'Can change debate_reply', 6, 'change_debate_reply'),
(23, 'Can delete debate_reply', 6, 'delete_debate_reply'),
(24, 'Can view debate_reply', 6, 'view_debate_reply'),
(25, 'Can add f_studymaterials', 7, 'add_f_studymaterials'),
(26, 'Can change f_studymaterials', 7, 'change_f_studymaterials'),
(27, 'Can delete f_studymaterials', 7, 'delete_f_studymaterials'),
(28, 'Can view f_studymaterials', 7, 'view_f_studymaterials'),
(29, 'Can add facultyprofile', 8, 'add_facultyprofile'),
(30, 'Can change facultyprofile', 8, 'change_facultyprofile'),
(31, 'Can delete facultyprofile', 8, 'delete_facultyprofile'),
(32, 'Can view facultyprofile', 8, 'view_facultyprofile'),
(33, 'Can add userprofile', 9, 'add_userprofile'),
(34, 'Can change userprofile', 9, 'change_userprofile'),
(35, 'Can delete userprofile', 9, 'delete_userprofile'),
(36, 'Can view userprofile', 9, 'view_userprofile'),
(37, 'Can add permission', 10, 'add_permission'),
(38, 'Can change permission', 10, 'change_permission'),
(39, 'Can delete permission', 10, 'delete_permission'),
(40, 'Can view permission', 10, 'view_permission'),
(41, 'Can add group', 11, 'add_group'),
(42, 'Can change group', 11, 'change_group'),
(43, 'Can delete group', 11, 'delete_group'),
(44, 'Can view group', 11, 'view_group'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add content type', 13, 'add_contenttype'),
(50, 'Can change content type', 13, 'change_contenttype'),
(51, 'Can delete content type', 13, 'delete_contenttype'),
(52, 'Can view content type', 13, 'view_contenttype'),
(53, 'Can add log entry', 14, 'add_logentry'),
(54, 'Can change log entry', 14, 'change_logentry'),
(55, 'Can delete log entry', 14, 'delete_logentry'),
(56, 'Can view log entry', 14, 'view_logentry'),
(57, 'Can add session', 15, 'add_session'),
(58, 'Can change session', 15, 'change_session'),
(59, 'Can delete session', 15, 'delete_session'),
(60, 'Can view session', 15, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$UeWZ2VL7Po8KOycqCFs0NP$+OxHbgSuUX/02B9+3rI20tKvvZ0CFQewfrzs5pWZsgM=', '2024-10-19 19:57:26.000000', 1, 'admin123', '', '', 'admin@gmail.com', 1, 1, '2024-10-19 19:56:23.000000'),
(2, 'pbkdf2_sha256$870000$v4sAFplxYGA5Kv0IiUAXz5$IYOCX0U+zkgMGz4KGP+Ds9H5pDVvIRHYMkh7SXAOx/4=', '2024-10-19 20:05:23.000000', 0, '1202', 'first', 'lastname', '', 0, 1, '2024-10-19 20:05:11.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credentials_facultyprofile`
--

CREATE TABLE `credentials_facultyprofile` (
  `id` bigint(20) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `department` varchar(10) NOT NULL,
  `Phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credentials_facultyprofile`
--

INSERT INTO `credentials_facultyprofile` (`id`, `firstname`, `lastname`, `email`, `profile_pic`, `department`, `Phone`) VALUES
(1, '', '', 'f@gmail.com', 'profiles/img.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `credentials_userprofile`
--

CREATE TABLE `credentials_userprofile` (
  `id` bigint(20) NOT NULL,
  `reg_no` varchar(8) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `department` varchar(10) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `dob` date DEFAULT NULL,
  `bio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credentials_userprofile`
--

INSERT INTO `credentials_userprofile` (`id`, `reg_no`, `firstname`, `lastname`, `email`, `profile_pic`, `gender`, `department`, `Phone`, `dob`, `bio`) VALUES
(1, '1202', 'first', 'lastname', 'first@gmail.com', 'profiles/img.jpg', 'Male', 'MCA', '121235656321212', '2024-04-09', '');

-- --------------------------------------------------------

--
-- Table structure for table `credentials_userprofile_followers`
--

CREATE TABLE `credentials_userprofile_followers` (
  `id` bigint(20) NOT NULL,
  `userprofile_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credentials_userprofile_following`
--

CREATE TABLE `credentials_userprofile_following` (
  `id` bigint(20) NOT NULL,
  `userprofile_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-19 19:57:54.000000', '1', 'userprofile object (1)', 1, '[{\"added\": {}}]', 9, 1),
(2, '2024-10-19 19:58:08.000000', '1', 'f@gmail.com', 1, '[{\"added\": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(14, 'admin', 'logentry'),
(1, 'admin_module', 'feedbacktable'),
(11, 'auth', 'group'),
(10, 'auth', 'permission'),
(12, 'auth', 'user'),
(13, 'contenttypes', 'contenttype'),
(8, 'credentials', 'facultyprofile'),
(9, 'credentials', 'userprofile'),
(4, 'faculty', 'community_table'),
(5, 'faculty', 'debate'),
(6, 'faculty', 'debate_reply'),
(7, 'faculty', 'f_studymaterials'),
(15, 'sessions', 'session'),
(3, 'student', 'comments'),
(2, 'student', 'post_table');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-10-19 19:54:16.000000'),
(2, 'auth', '0001_initial', '2024-10-19 19:54:24.000000'),
(3, 'credentials', '0001_initial', '2024-10-19 19:54:27.000000'),
(4, 'student', '0001_initial', '2024-10-19 19:55:16.000000'),
(5, 'faculty', '0001_initial', '2024-10-19 19:55:35.000000'),
(6, 'admin', '0001_initial', '2024-10-19 19:55:53.000000'),
(7, 'admin', '0002_logentry_remove_auto_add', '2024-10-19 19:55:53.000000'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-19 19:55:53.000000'),
(9, 'contenttypes', '0002_remove_content_type_name', '2024-10-19 19:55:54.000000'),
(10, 'auth', '0002_alter_permission_name_max_length', '2024-10-19 19:55:54.000000'),
(11, 'auth', '0003_alter_user_email_max_length', '2024-10-19 19:55:54.000000'),
(12, 'auth', '0004_alter_user_username_opts', '2024-10-19 19:55:54.000000'),
(13, 'auth', '0005_alter_user_last_login_null', '2024-10-19 19:55:55.000000'),
(14, 'auth', '0006_require_contenttypes_0002', '2024-10-19 19:55:55.000000'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2024-10-19 19:55:55.000000'),
(16, 'auth', '0008_alter_user_username_max_length', '2024-10-19 19:55:55.000000'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2024-10-19 19:55:55.000000'),
(18, 'auth', '0010_alter_group_name_max_length', '2024-10-19 19:55:56.000000'),
(19, 'auth', '0011_update_proxy_permissions', '2024-10-19 19:55:56.000000'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2024-10-19 19:55:56.000000'),
(21, 'sessions', '0001_initial', '2024-10-19 19:55:56.000000'),
(22, 'admin_module', '0001_initial', '2024-10-19 20:06:15.000000');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bqljcz0l9hffxj54hd48ngxwj1829aki', '.eJxVjMsOwiAURP-FtSHIU1y67zcQ7r0gVQNJaVfGf5cmXehy5pyZNwtxW0vYelrCTOzKzuz020HEZ6o7oEes98ax1XWZge8KP2jnU6P0uh3u30GJvYy1ko6i1x6UzN5kS0ldBKBN4L3GEYmktMbZ4YFUGbUhK7wGhY6EI_b5AuqsOBg:1t2FZm:6OQLDwcF_9Co3ftvvuCDVxJmoFMfnnbDmdO2OQI42rA', '2024-11-02 19:57:26.000000'),
('vw2uy46ehz3bo4tty499ab83xmp5gutz', '.eJxVjEEOwiAURO_C2hDgQwGX7j0Dgc9XqgaS0q6Md5cmXehuZt7MvFmI21rC1mkJc2ZnptjpN0sRn1R3kB-x3hvHVtdlTnyv8IN2fm2ZXpej-3dQYi9jrb2NKC2qBMZ5I6zJpP0Qw0eRyLgMYG6eEDVK1MZB1hP5SSgpACT7fAHKXjbm:1t2FhT:olOdADNkv2ngVWryjZpCNgR-hsysYNHge_Q1wKOhIAg', '2024-11-02 20:05:23.000000');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_community_table`
--

CREATE TABLE `faculty_community_table` (
  `id` bigint(20) NOT NULL,
  `facultyname` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `comm_post` longtext NOT NULL,
  `department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_debate`
--

CREATE TABLE `faculty_debate` (
  `id` bigint(20) NOT NULL,
  `facultyname` longtext NOT NULL,
  `topic` longtext NOT NULL,
  `d_date` datetime(6) NOT NULL,
  `department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_debate_reply`
--

CREATE TABLE `faculty_debate_reply` (
  `id` bigint(20) NOT NULL,
  `reply` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `debate_id` bigint(20) NOT NULL,
  `faculty_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_f_studymaterials`
--

CREATE TABLE `faculty_f_studymaterials` (
  `id` bigint(20) NOT NULL,
  `note` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `department` varchar(50) NOT NULL,
  `faculty_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_comments`
--

CREATE TABLE `student_comments` (
  `id` bigint(20) NOT NULL,
  `comment` varchar(300) NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_post_table`
--

CREATE TABLE `student_post_table` (
  `id` bigint(20) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `post` varchar(100) NOT NULL,
  `upload_date` datetime(6) NOT NULL,
  `post_profile_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_post_table_likes`
--

CREATE TABLE `student_post_table_likes` (
  `id` bigint(20) NOT NULL,
  `post_table_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_module_feedbacktable`
--
ALTER TABLE `admin_module_feedbacktable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `credentials_facultyprofile`
--
ALTER TABLE `credentials_facultyprofile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credentials_userprofile`
--
ALTER TABLE `credentials_userprofile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credentials_userprofile_followers`
--
ALTER TABLE `credentials_userprofile_followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `credentials_userprofile__userprofile_id_user_id_77401116_uniq` (`userprofile_id`,`user_id`),
  ADD KEY `credentials_userprof_user_id_2230862b_fk_auth_user` (`user_id`);

--
-- Indexes for table `credentials_userprofile_following`
--
ALTER TABLE `credentials_userprofile_following`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `credentials_userprofile__userprofile_id_user_id_df64dcf5_uniq` (`userprofile_id`,`user_id`),
  ADD KEY `credentials_userprof_user_id_18d2abc8_fk_auth_user` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `faculty_community_table`
--
ALTER TABLE `faculty_community_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty_debate`
--
ALTER TABLE `faculty_debate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty_debate_reply`
--
ALTER TABLE `faculty_debate_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_debate_reply_debate_id_f4849007_fk_faculty_debate_id` (`debate_id`),
  ADD KEY `faculty_debate_reply_faculty_id_766a2bc1_fk_credentia` (`faculty_id`),
  ADD KEY `faculty_debate_reply_user_id_4eb808a1_fk_credentia` (`user_id`);

--
-- Indexes for table `faculty_f_studymaterials`
--
ALTER TABLE `faculty_f_studymaterials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_f_studymater_faculty_id_e4538af0_fk_credentia` (`faculty_id`);

--
-- Indexes for table `student_comments`
--
ALTER TABLE `student_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_comments_user_id_1bdc5316_fk_credentials_userprofile_id` (`user_id`),
  ADD KEY `student_comments_post_id_983c65aa_fk_student_post_table_id` (`post_id`);

--
-- Indexes for table `student_post_table`
--
ALTER TABLE `student_post_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_post_table_post_profile_id_f0978455_fk_credentia` (`post_profile_id`),
  ADD KEY `student_post_table_user_id_cfe9d99c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `student_post_table_likes`
--
ALTER TABLE `student_post_table_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_post_table_likes_post_table_id_user_id_f2f78848_uniq` (`post_table_id`,`user_id`),
  ADD KEY `student_post_table_likes_user_id_b7ba140d_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_module_feedbacktable`
--
ALTER TABLE `admin_module_feedbacktable`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credentials_facultyprofile`
--
ALTER TABLE `credentials_facultyprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credentials_userprofile`
--
ALTER TABLE `credentials_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credentials_userprofile_followers`
--
ALTER TABLE `credentials_userprofile_followers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credentials_userprofile_following`
--
ALTER TABLE `credentials_userprofile_following`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `faculty_community_table`
--
ALTER TABLE `faculty_community_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty_debate`
--
ALTER TABLE `faculty_debate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty_debate_reply`
--
ALTER TABLE `faculty_debate_reply`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty_f_studymaterials`
--
ALTER TABLE `faculty_f_studymaterials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_comments`
--
ALTER TABLE `student_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_post_table`
--
ALTER TABLE `student_post_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_post_table_likes`
--
ALTER TABLE `student_post_table_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `credentials_userprofile_followers`
--
ALTER TABLE `credentials_userprofile_followers`
  ADD CONSTRAINT `credentials_userprof_user_id_2230862b_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `credentials_userprof_userprofile_id_41ed964d_fk_credentia` FOREIGN KEY (`userprofile_id`) REFERENCES `credentials_userprofile` (`id`);

--
-- Constraints for table `credentials_userprofile_following`
--
ALTER TABLE `credentials_userprofile_following`
  ADD CONSTRAINT `credentials_userprof_user_id_18d2abc8_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `credentials_userprof_userprofile_id_d9783c8f_fk_credentia` FOREIGN KEY (`userprofile_id`) REFERENCES `credentials_userprofile` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `faculty_debate_reply`
--
ALTER TABLE `faculty_debate_reply`
  ADD CONSTRAINT `faculty_debate_reply_debate_id_f4849007_fk_faculty_debate_id` FOREIGN KEY (`debate_id`) REFERENCES `faculty_debate` (`id`),
  ADD CONSTRAINT `faculty_debate_reply_faculty_id_766a2bc1_fk_credentia` FOREIGN KEY (`faculty_id`) REFERENCES `credentials_facultyprofile` (`id`),
  ADD CONSTRAINT `faculty_debate_reply_user_id_4eb808a1_fk_credentia` FOREIGN KEY (`user_id`) REFERENCES `credentials_userprofile` (`id`);

--
-- Constraints for table `faculty_f_studymaterials`
--
ALTER TABLE `faculty_f_studymaterials`
  ADD CONSTRAINT `faculty_f_studymater_faculty_id_e4538af0_fk_credentia` FOREIGN KEY (`faculty_id`) REFERENCES `credentials_facultyprofile` (`id`);

--
-- Constraints for table `student_comments`
--
ALTER TABLE `student_comments`
  ADD CONSTRAINT `student_comments_post_id_983c65aa_fk_student_post_table_id` FOREIGN KEY (`post_id`) REFERENCES `student_post_table` (`id`),
  ADD CONSTRAINT `student_comments_user_id_1bdc5316_fk_credentials_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `credentials_userprofile` (`id`);

--
-- Constraints for table `student_post_table`
--
ALTER TABLE `student_post_table`
  ADD CONSTRAINT `student_post_table_post_profile_id_f0978455_fk_credentia` FOREIGN KEY (`post_profile_id`) REFERENCES `credentials_userprofile` (`id`),
  ADD CONSTRAINT `student_post_table_user_id_cfe9d99c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `student_post_table_likes`
--
ALTER TABLE `student_post_table_likes`
  ADD CONSTRAINT `student_post_table_l_post_table_id_9c7a0ca3_fk_student_p` FOREIGN KEY (`post_table_id`) REFERENCES `student_post_table` (`id`),
  ADD CONSTRAINT `student_post_table_likes_user_id_b7ba140d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
