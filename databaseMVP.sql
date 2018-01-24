-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Gostitelj: localhost
-- Čas nastanka: 24. jan 2018 ob 18.23
-- Različica strežnika: 10.1.24-MariaDB-cll-lve
-- Različica PHP: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `cherrijo_futurehack`
--

-- --------------------------------------------------------

--
-- Struktura tabele `button_hash`
--

CREATE TABLE `button_hash` (
  `id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `button_hash`
--

INSERT INTO `button_hash` (`id`, `hash`) VALUES
(1, '2c93c952096f305eaa95379e7d81a4d5'),
(2, 'cccbd735f7fc0a5fffd63cd29628e408'),
(3, '508a77415011b3bbd02b3dc2e637975e'),
(4, '81db052bc024c6a7ce0ee268cdf92028'),
(5, 'a6417308de88dda3011d8ce6fedd230b'),
(6, '730786b4faa177b6b24881dd77081017'),
(7, '68b29ac10088144cf34daad1a98953a3'),
(8, '6a949adf18c4303b6c560c613cd6e544'),
(9, '2e5506b5667d4e598be37ee31f3fe4d4'),
(10, 'ee509e1154bbd7fd757ae3e52a2a6e58'),
(11, 'ad01f57a451ed698a9a7463919d927ae'),
(12, 'fb9bb2dabdedb5a4546edd4276632237'),
(13, 'dc0451a811ffe7d86727e4045ee7c1f0'),
(14, '48287c0e26559ff2ed5cb25bf38bd426'),
(15, '1199178447050746ce131ed1cfa02167'),
(16, '13bca7db4572fd6c5dc04b009e90f383'),
(17, 'dbca2e807976c3ea6920e3fbc71fba88'),
(18, '0abd9e2ccee2afd962e70949950ddd36'),
(19, 'ca554ee8ba6ac6048bc2469193d67bbc'),
(20, '66eb46a5aac2871dd375f865ff93e100'),
(21, 'c07fa9b2cd345925bcf9df0204c7a13d'),
(22, '32fe84fb8afbc328d7458b41de9fc9fb'),
(23, 'f32d9cc8364ee00913145efdc0fcb965'),
(24, 'dc885ddc42a1a54c785acf4e1276d43f'),
(25, '85fb18fd9a3a77e291d8005e07d5189c'),
(26, 'f725684274f3e672bcd04bc9cb3c2a61'),
(27, '91af91b589204a5925c27e0656cc5b48'),
(28, 'c5f2e84f91e4aae779a0e07e743ea76d'),
(29, 'f23dd61cc4562f9db393271a335b157c'),
(30, '79fdb9324f3a0cad97e850d1a073efdd'),
(31, '6553a2f4d7ae9ce2b421e93d7602258d');

-- --------------------------------------------------------

--
-- Struktura tabele `campaign_type`
--

CREATE TABLE `campaign_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `nice_url` text,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `campaign_type`
--

INSERT INTO `campaign_type` (`id`, `name`, `img`, `nice_url`, `status_id`) VALUES
(1, 'Health', 'campaignicon1.png', 'health', 1),
(2, 'School', 'campaignicon2.png', 'school', 1),
(3, 'Natural disaster', 'naturaldisastericon3.png', 'natural-disaster', 1),
(4, 'Clean Water', 'watericon.png', 'clean-water', 1);

-- --------------------------------------------------------

--
-- Struktura tabele `campaign_updates`
--

CREATE TABLE `campaign_updates` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `page_content_id` int(10) UNSIGNED NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `datetime_utc` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL COMMENT '1:type, 2: brand',
  `parent_category_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `country_list`
--

CREATE TABLE `country_list` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `status_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `country_list`
--

INSERT INTO `country_list` (`id`, `country_code`, `country_name`, `status_id`) VALUES
(1, 'AF', 'Afghanistan', 0),
(2, 'AL', 'Albania', 0),
(3, 'DZ', 'Algeria', 0),
(4, 'DS', 'American Samoa', 0),
(5, 'AD', 'Andorra', 0),
(6, 'AO', 'Angola', 0),
(7, 'AI', 'Anguilla', 0),
(8, 'AQ', 'Antarctica', 0),
(9, 'AG', 'Antigua and Barbuda', 0),
(10, 'AR', 'Argentina', 0),
(11, 'AM', 'Armenia', 0),
(12, 'AW', 'Aruba', 0),
(13, 'AU', 'Australia', 0),
(14, 'AT', 'Austria', 0),
(15, 'AZ', 'Azerbaijan', 0),
(16, 'BS', 'Bahamas', 0),
(17, 'BH', 'Bahrain', 0),
(18, 'BD', 'Bangladesh', 0),
(19, 'BB', 'Barbados', 0),
(20, 'BY', 'Belarus', 0),
(21, 'BE', 'Belgium', 0),
(22, 'BZ', 'Belize', 0),
(23, 'BJ', 'Benin', 0),
(24, 'BM', 'Bermuda', 0),
(25, 'BT', 'Bhutan', 0),
(26, 'BO', 'Bolivia', 0),
(27, 'BA', 'Bosnia and Herzegovina', 0),
(28, 'BW', 'Botswana', 0),
(29, 'BV', 'Bouvet Island', 0),
(30, 'BR', 'Brazil', 0),
(31, 'IO', 'British Indian Ocean Territory', 0),
(32, 'BN', 'Brunei Darussalam', 0),
(33, 'BG', 'Bulgaria', 0),
(34, 'BF', 'Burkina Faso', 0),
(35, 'BI', 'Burundi', 0),
(36, 'KH', 'Cambodia', 0),
(37, 'CM', 'Cameroon', 0),
(38, 'CA', 'Canada', 0),
(39, 'CV', 'Cape Verde', 0),
(40, 'KY', 'Cayman Islands', 0),
(41, 'CF', 'Central African Republic', 0),
(42, 'TD', 'Chad', 0),
(43, 'CL', 'Chile', 0),
(44, 'CN', 'China', 0),
(45, 'CX', 'Christmas Island', 0),
(46, 'CC', 'Cocos (Keeling) Islands', 0),
(47, 'CO', 'Colombia', 0),
(48, 'KM', 'Comoros', 0),
(49, 'CG', 'Congo', 0),
(50, 'CK', 'Cook Islands', 0),
(51, 'CR', 'Costa Rica', 0),
(52, 'HR', 'Croatia (Hrvatska)', 0),
(53, 'CU', 'Cuba', 0),
(54, 'CY', 'Cyprus', 0),
(55, 'CZ', 'Czech Republic', 0),
(56, 'DK', 'Denmark', 0),
(57, 'DJ', 'Djibouti', 0),
(58, 'DM', 'Dominica', 0),
(59, 'DO', 'Dominican Republic', 0),
(60, 'TP', 'East Timor', 0),
(61, 'EC', 'Ecuador', 0),
(62, 'EG', 'Egypt', 0),
(63, 'SV', 'El Salvador', 0),
(64, 'GQ', 'Equatorial Guinea', 0),
(65, 'ER', 'Eritrea', 0),
(66, 'EE', 'Estonia', 0),
(67, 'ET', 'Ethiopia', 0),
(68, 'FK', 'Falkland Islands (Malvinas)', 0),
(69, 'FO', 'Faroe Islands', 0),
(70, 'FJ', 'Fiji', 0),
(71, 'FI', 'Finland', 0),
(72, 'FR', 'France', 0),
(73, 'FX', 'France, Metropolitan', 0),
(74, 'GF', 'French Guiana', 0),
(75, 'PF', 'French Polynesia', 0),
(76, 'TF', 'French Southern Territories', 0),
(77, 'GA', 'Gabon', 0),
(78, 'GM', 'Gambia', 0),
(79, 'GE', 'Georgia', 0),
(80, 'DE', 'Germany', 0),
(81, 'GH', 'Ghana', 0),
(82, 'GI', 'Gibraltar', 0),
(83, 'GK', 'Guernsey', 0),
(84, 'GR', 'Greece', 0),
(85, 'GL', 'Greenland', 0),
(86, 'GD', 'Grenada', 0),
(87, 'GP', 'Guadeloupe', 0),
(88, 'GU', 'Guam', 0),
(89, 'GT', 'Guatemala', 0),
(90, 'GN', 'Guinea', 0),
(91, 'GW', 'Guinea-Bissau', 0),
(92, 'GY', 'Guyana', 0),
(93, 'HT', 'Haiti', 0),
(94, 'HM', 'Heard and Mc Donald Islands', 0),
(95, 'HN', 'Honduras', 0),
(96, 'HK', 'Hong Kong', 0),
(97, 'HU', 'Hungary', 0),
(98, 'IS', 'Iceland', 0),
(99, 'IN', 'India', 0),
(100, 'IM', 'Isle of Man', 0),
(101, 'ID', 'Indonesia', 0),
(102, 'IR', 'Iran (Islamic Republic of)', 0),
(103, 'IQ', 'Iraq', 0),
(104, 'IE', 'Ireland', 0),
(105, 'IL', 'Israel', 0),
(106, 'IT', 'Italy', 0),
(107, 'CI', 'Ivory Coast', 0),
(108, 'JE', 'Jersey', 0),
(109, 'JM', 'Jamaica', 0),
(110, 'JP', 'Japan', 0),
(111, 'JO', 'Jordan', 0),
(112, 'KZ', 'Kazakhstan', 0),
(113, 'KE', 'Kenya', 0),
(114, 'KI', 'Kiribati', 0),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 0),
(116, 'KR', 'Korea, Republic of', 0),
(117, 'XK', 'Kosovo', 0),
(118, 'KW', 'Kuwait', 0),
(119, 'KG', 'Kyrgyzstan', 0),
(120, 'LA', 'Lao People\'s Democratic Republic', 0),
(121, 'LV', 'Latvia', 0),
(122, 'LB', 'Lebanon', 0),
(123, 'LS', 'Lesotho', 0),
(124, 'LR', 'Liberia', 0),
(125, 'LY', 'Libyan Arab Jamahiriya', 0),
(126, 'LI', 'Liechtenstein', 0),
(127, 'LT', 'Lithuania', 0),
(128, 'LU', 'Luxembourg', 0),
(129, 'MO', 'Macau', 0),
(130, 'MK', 'Macedonia', 0),
(131, 'MG', 'Madagascar', 0),
(132, 'MW', 'Malawi', 0),
(133, 'MY', 'Malaysia', 0),
(134, 'MV', 'Maldives', 0),
(135, 'ML', 'Mali', 0),
(136, 'MT', 'Malta', 0),
(137, 'MH', 'Marshall Islands', 0),
(138, 'MQ', 'Martinique', 0),
(139, 'MR', 'Mauritania', 0),
(140, 'MU', 'Mauritius', 0),
(141, 'TY', 'Mayotte', 0),
(142, 'MX', 'Mexico', 0),
(143, 'FM', 'Micronesia, Federated States of', 0),
(144, 'MD', 'Moldova, Republic of', 0),
(145, 'MC', 'Monaco', 0),
(146, 'MN', 'Mongolia', 0),
(147, 'ME', 'Montenegro', 0),
(148, 'MS', 'Montserrat', 0),
(149, 'MA', 'Morocco', 0),
(150, 'MZ', 'Mozambique', 0),
(151, 'MM', 'Myanmar', 0),
(152, 'NA', 'Namibia', 0),
(153, 'NR', 'Nauru', 0),
(154, 'NP', 'Nepal', 0),
(155, 'NL', 'Netherlands', 0),
(156, 'AN', 'Netherlands Antilles', 0),
(157, 'NC', 'New Caledonia', 0),
(158, 'NZ', 'New Zealand', 0),
(159, 'NI', 'Nicaragua', 0),
(160, 'NE', 'Niger', 0),
(161, 'NG', 'Nigeria', 0),
(162, 'NU', 'Niue', 0),
(163, 'NF', 'Norfolk Island', 0),
(164, 'MP', 'Northern Mariana Islands', 0),
(165, 'NO', 'Norway', 0),
(166, 'OM', 'Oman', 0),
(167, 'PK', 'Pakistan', 0),
(168, 'PW', 'Palau', 0),
(169, 'PS', 'Palestine', 0),
(170, 'PA', 'Panama', 0),
(171, 'PG', 'Papua New Guinea', 0),
(172, 'PY', 'Paraguay', 0),
(173, 'PE', 'Peru', 0),
(174, 'PH', 'Philippines', 0),
(175, 'PN', 'Pitcairn', 0),
(176, 'PL', 'Poland', 0),
(177, 'PT', 'Portugal', 0),
(178, 'PR', 'Puerto Rico', 0),
(179, 'QA', 'Qatar', 0),
(180, 'RE', 'Reunion', 0),
(181, 'RO', 'Romania', 0),
(182, 'RU', 'Russian Federation', 0),
(183, 'RW', 'Rwanda', 0),
(184, 'KN', 'Saint Kitts and Nevis', 0),
(185, 'LC', 'Saint Lucia', 0),
(186, 'VC', 'Saint Vincent and the Grenadines', 0),
(187, 'WS', 'Samoa', 0),
(188, 'SM', 'San Marino', 0),
(189, 'ST', 'Sao Tome and Principe', 0),
(190, 'SA', 'Saudi Arabia', 0),
(191, 'SN', 'Senegal', 0),
(192, 'RS', 'Serbia', 0),
(193, 'SC', 'Seychelles', 0),
(194, 'SL', 'Sierra Leone', 0),
(195, 'SG', 'Singapore', 0),
(196, 'SK', 'Slovakia', 0),
(197, 'SI', 'Slovenia', 1),
(198, 'SB', 'Solomon Islands', 0),
(199, 'SO', 'Somalia', 0),
(200, 'ZA', 'South Africa', 0),
(201, 'GS', 'South Georgia South Sandwich Islands', 0),
(202, 'ES', 'Spain', 0),
(203, 'LK', 'Sri Lanka', 0),
(204, 'SH', 'St. Helena', 0),
(205, 'PM', 'St. Pierre and Miquelon', 0),
(206, 'SD', 'Sudan', 0),
(207, 'SR', 'Suriname', 0),
(208, 'SJ', 'Svalbard and Jan Mayen Islands', 0),
(209, 'SZ', 'Swaziland', 0),
(210, 'SE', 'Sweden', 0),
(211, 'CH', 'Switzerland', 0),
(212, 'SY', 'Syrian Arab Republic', 0),
(213, 'TW', 'Taiwan', 0),
(214, 'TJ', 'Tajikistan', 0),
(215, 'TZ', 'Tanzania, United Republic of', 0),
(216, 'TH', 'Thailand', 0),
(217, 'TG', 'Togo', 0),
(218, 'TK', 'Tokelau', 0),
(219, 'TO', 'Tonga', 0),
(220, 'TT', 'Trinidad and Tobago', 0),
(221, 'TN', 'Tunisia', 0),
(222, 'TR', 'Turkey', 0),
(223, 'TM', 'Turkmenistan', 0),
(224, 'TC', 'Turks and Caicos Islands', 0),
(225, 'TV', 'Tuvalu', 0),
(226, 'UG', 'Uganda', 0),
(227, 'UA', 'Ukraine', 0),
(228, 'AE', 'United Arab Emirates', 0),
(229, 'GB', 'United Kingdom', 0),
(230, 'US', 'United States', 0),
(231, 'UM', 'United States minor outlying islands', 0),
(232, 'UY', 'Uruguay', 0),
(233, 'UZ', 'Uzbekistan', 0),
(234, 'VU', 'Vanuatu', 0),
(235, 'VA', 'Vatican City State', 0),
(236, 'VE', 'Venezuela', 0),
(237, 'VN', 'Vietnam', 0),
(238, 'VG', 'Virgin Islands (British)', 0),
(239, 'VI', 'Virgin Islands (U.S.)', 0),
(240, 'WF', 'Wallis and Futuna Islands', 0),
(241, 'EH', 'Western Sahara', 0),
(242, 'YE', 'Yemen', 0),
(243, 'YU', 'Yugoslavia', 0),
(244, 'ZR', 'Zaire', 0),
(245, 'ZM', 'Zambia', 0),
(246, 'ZW', 'Zimbabwe', 0);

-- --------------------------------------------------------

--
-- Struktura tabele `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `sign` varchar(2) NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `sign`, `status_id`) VALUES
(1, 'Euro', 'EUR', '€', 1),
(2, 'US Dollar', 'USD', '$', 0),
(3, 'British Pound', 'GBP', '£', 0);

-- --------------------------------------------------------

--
-- Struktura tabele `gender`
--

CREATE TABLE `gender` (
  `id` int(10) UNSIGNED NOT NULL,
  `gender` varchar(15) NOT NULL,
  `gender_slo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `gender`
--

INSERT INTO `gender` (`id`, `gender`, `gender_slo`) VALUES
(1, 'man', 'moški'),
(2, 'women', 'ženski');

-- --------------------------------------------------------

--
-- Struktura tabele `language`
--

CREATE TABLE `language` (
  `id` int(10) UNSIGNED NOT NULL,
  `short_name` varchar(5) NOT NULL,
  `long_name` varchar(50) NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `language`
--

INSERT INTO `language` (`id`, `short_name`, `long_name`, `status_id`) VALUES
(1, 'sl', 'slovenščina', 1),
(2, 'en', 'english', 1),
(3, 'de', 'german', 1);

-- --------------------------------------------------------

--
-- Struktura tabele `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `page_content_id` int(10) UNSIGNED DEFAULT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `nice_url` varchar(255) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `short_description` text,
  `meta_title` text,
  `meta_description` text,
  `order_num` int(10) UNSIGNED NOT NULL DEFAULT '99999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `media`
--

INSERT INTO `media` (`id`, `type_id`, `status_id`, `title`, `product_id`, `page_content_id`, `language_id`, `nice_url`, `datetime`, `user_id`, `short_description`, `meta_title`, `meta_description`, `order_num`) VALUES
(1, 10, 4, NULL, NULL, 1, NULL, NULL, '2018-01-23 15:36:22', NULL, NULL, NULL, NULL, 99999),
(2, 10, 4, NULL, NULL, 1, NULL, NULL, '2018-01-23 15:41:01', NULL, NULL, NULL, NULL, 99999),
(3, 10, 1, NULL, NULL, 1, NULL, NULL, '2018-01-23 15:41:24', NULL, NULL, NULL, NULL, 99999),
(4, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-23 15:49:36', NULL, NULL, NULL, NULL, 99999),
(5, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-23 15:50:03', NULL, NULL, NULL, NULL, 99999),
(6, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-23 15:50:15', NULL, NULL, NULL, NULL, 99999),
(7, 10, 4, NULL, NULL, 3, NULL, NULL, '2018-01-23 15:55:27', NULL, NULL, NULL, NULL, 99999),
(8, 10, 4, NULL, NULL, 3, NULL, NULL, '2018-01-23 15:55:39', NULL, NULL, NULL, NULL, 99999),
(9, 10, 1, NULL, NULL, 3, NULL, NULL, '2018-01-23 15:55:52', NULL, NULL, NULL, NULL, 99999),
(10, 10, 4, NULL, NULL, 4, NULL, NULL, '2018-01-23 16:02:53', NULL, NULL, NULL, NULL, 99999),
(11, 10, 4, NULL, NULL, 4, NULL, NULL, '2018-01-23 16:04:26', NULL, NULL, NULL, NULL, 99999),
(12, 10, 1, NULL, NULL, 4, NULL, NULL, '2018-01-23 16:04:39', NULL, NULL, NULL, NULL, 99999),
(13, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-23 20:20:03', NULL, NULL, NULL, NULL, 99999),
(14, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 09:04:29', NULL, NULL, NULL, NULL, 99999),
(15, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 09:05:27', NULL, NULL, NULL, NULL, 99999),
(16, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 09:14:47', NULL, NULL, NULL, NULL, 99999),
(17, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 09:34:31', NULL, NULL, NULL, NULL, 99999),
(18, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 09:47:54', NULL, NULL, NULL, NULL, 99999),
(19, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 10:11:24', NULL, NULL, NULL, NULL, 99999),
(20, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 10:34:08', NULL, NULL, NULL, NULL, 99999),
(21, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 11:23:49', NULL, NULL, NULL, NULL, 99999),
(22, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 11:41:56', NULL, NULL, NULL, NULL, 99999),
(23, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 11:53:25', NULL, NULL, NULL, NULL, 99999),
(24, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 11:55:27', NULL, NULL, NULL, NULL, 99999),
(25, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 12:25:24', NULL, NULL, NULL, NULL, 99999),
(26, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 15:02:41', NULL, NULL, NULL, NULL, 99999),
(27, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 15:09:53', NULL, NULL, NULL, NULL, 99999),
(28, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 16:21:13', NULL, NULL, NULL, NULL, 99999),
(29, 10, 4, NULL, NULL, 2, NULL, NULL, '2018-01-24 16:29:46', NULL, NULL, NULL, NULL, 99999),
(30, 10, 1, NULL, NULL, 2, NULL, NULL, '2018-01-24 16:30:09', NULL, NULL, NULL, NULL, 99999);

-- --------------------------------------------------------

--
-- Struktura tabele `media_element`
--

CREATE TABLE `media_element` (
  `id` int(10) UNSIGNED NOT NULL,
  `media_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `path` text NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED DEFAULT NULL COMMENT '1:cover img, thumbnail...',
  `title` text,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `media_element`
--

INSERT INTO `media_element` (`id`, `media_id`, `status_id`, `path`, `type_id`, `data_type_id`, `title`, `description`) VALUES
(1, 1, 1, '6funddescription.jpg', 3, 7, '', NULL),
(2, 1, 1, 'nddescription.jpg', 3, 9, '', NULL),
(3, 1, 1, '3funddescription.jpg', 3, 9, '', NULL),
(4, 2, 1, '6funddescription.jpg', 3, 7, '', NULL),
(5, 2, 1, 'nddescription.jpg', 3, 9, '', NULL),
(6, 2, 1, '3funddescription.jpg', 3, 9, '', NULL),
(7, 2, 1, '6funddescription.jpg', 3, 8, '', NULL),
(8, 3, 1, '6funddescription.jpg', 3, 7, '', NULL),
(9, 3, 1, 'nddescription.jpg', 3, 9, '', NULL),
(10, 3, 1, '3funddescription.jpg', 3, 9, '', NULL),
(11, 3, 1, '6funddescription.jpg', 3, 8, '', NULL),
(12, 3, 1, '6funddescription.jpg', 3, 9, '', NULL),
(13, 4, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(14, 5, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(15, 5, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(16, 5, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(17, 6, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(18, 6, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(19, 6, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(20, 6, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(21, 7, 1, 'harvey.jpg', 3, 7, '', NULL),
(22, 7, 1, 'charitiesof.jpg', 3, 9, '', NULL),
(23, 7, 1, 'islamicreliefusa9292.jpg', 3, 9, '', NULL),
(24, 8, 1, 'harvey.jpg', 3, 7, '', NULL),
(25, 8, 1, 'charitiesof.jpg', 3, 9, '', NULL),
(26, 8, 1, 'islamicreliefusa9292.jpg', 3, 9, '', NULL),
(27, 8, 1, 'harvey.jpg', 3, 9, '', NULL),
(28, 9, 1, 'harvey.jpg', 3, 7, '', NULL),
(29, 9, 1, 'charitiesof.jpg', 3, 9, '', NULL),
(30, 9, 1, 'islamicreliefusa9292.jpg', 3, 9, '', NULL),
(31, 9, 1, 'harvey.jpg', 3, 9, '', NULL),
(32, 9, 1, 'harvey.jpg', 3, 8, '', NULL),
(33, 10, 1, 'kenyaboycameraviewinwater2.jpg', 3, 7, '', NULL),
(34, 10, 1, 'africawaterwellcropped.jpg', 3, 9, '', NULL),
(35, 10, 1, 'nameiswater5.jpg', 3, 9, '', NULL),
(36, 11, 1, 'kenyaboycameraviewinwater2.jpg', 3, 7, '', NULL),
(37, 11, 1, 'africawaterwellcropped.jpg', 3, 9, '', NULL),
(38, 11, 1, 'nameiswater5.jpg', 3, 9, '', NULL),
(39, 11, 1, 'kenyaboycameraviewinwater2.jpg', 3, 9, '', NULL),
(40, 12, 1, 'kenyaboycameraviewinwater2.jpg', 3, 7, '', NULL),
(41, 12, 1, 'africawaterwellcropped.jpg', 3, 9, '', NULL),
(42, 12, 1, 'nameiswater5.jpg', 3, 9, '', NULL),
(43, 12, 1, 'kenyaboycameraviewinwater2.jpg', 3, 9, '', NULL),
(44, 12, 1, 'kenyaboycameraviewinwater2.jpg', 3, 8, '', NULL),
(45, 13, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(46, 13, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(47, 13, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(48, 13, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(49, 14, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(50, 14, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(51, 14, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(52, 14, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(53, 15, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(54, 15, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(55, 15, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(56, 15, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(57, 16, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(58, 16, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(59, 16, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(60, 16, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(61, 17, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(62, 17, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(63, 17, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(64, 17, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(65, 18, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(66, 18, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(67, 18, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(68, 18, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(69, 19, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(70, 19, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(71, 19, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(72, 19, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(73, 20, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(74, 20, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(75, 20, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(76, 20, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(77, 21, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(78, 21, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(79, 21, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(80, 21, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(81, 22, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(82, 22, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(83, 22, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(84, 22, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(85, 23, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(86, 23, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(87, 23, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(88, 23, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(89, 24, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(90, 24, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(91, 24, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(92, 24, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(93, 25, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(94, 25, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(95, 25, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(96, 25, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(97, 26, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(98, 26, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(99, 26, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(100, 26, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(101, 27, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(102, 27, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(103, 27, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(104, 27, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(105, 28, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(106, 28, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(107, 28, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(108, 28, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(109, 29, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(110, 29, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(111, 29, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(112, 29, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL),
(113, 30, 1, '63051131485453647.342.jpeg', 3, 7, '', NULL),
(114, 30, 1, '20140330d4a8291.jpg', 3, 9, '', NULL),
(115, 30, 1, '63051131485453647.342.jpeg', 3, 8, '', NULL),
(116, 30, 1, '63051131485453647.342.jpeg', 3, 9, '', NULL);

-- --------------------------------------------------------

--
-- Struktura tabele `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `phi` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `invoice` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `order_main`
--

CREATE TABLE `order_main` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `shipping_method_id` int(10) UNSIGNED NOT NULL,
  `payment_type_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `order_user`
--

CREATE TABLE `order_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `note` text,
  `send_to_different_address` tinyint(1) NOT NULL DEFAULT '0',
  `firstname1` varchar(100) DEFAULT NULL,
  `lastname1` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `zip1` varchar(100) DEFAULT NULL,
  `city1` varchar(100) DEFAULT NULL,
  `country1` varchar(100) DEFAULT NULL,
  `note1` text,
  `email1` varchar(100) DEFAULT NULL,
  `phone1` varchar(100) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `page_content`
--

CREATE TABLE `page_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `sub_title` text,
  `description` text,
  `short_description` text,
  `goal` text,
  `duration` text,
  `duration_datetime` datetime DEFAULT NULL,
  `campaign_type_id` int(10) UNSIGNED DEFAULT NULL,
  `eth_address` text,
  `location` varchar(100) DEFAULT NULL,
  `other_text4` text,
  `language_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL,
  `datetime_utc` datetime DEFAULT NULL,
  `datetime_latest_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `type_id` int(10) UNSIGNED NOT NULL,
  `nice_url` varchar(255) NOT NULL,
  `tag_nice_url` varchar(100) DEFAULT NULL,
  `meta_title` text,
  `meta_description` text,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `organisation_id` int(10) UNSIGNED NOT NULL,
  `page_content_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order_num` int(10) UNSIGNED NOT NULL DEFAULT '99999',
  `alias` varchar(5) DEFAULT NULL,
  `proof_image` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `page_content`
--

INSERT INTO `page_content` (`id`, `title`, `sub_title`, `description`, `short_description`, `goal`, `duration`, `duration_datetime`, `campaign_type_id`, `eth_address`, `location`, `other_text4`, `language_id`, `status_id`, `datetime`, `datetime_utc`, `datetime_latest_update`, `type_id`, `nice_url`, `tag_nice_url`, `meta_title`, `meta_description`, `user_id`, `organisation_id`, `page_content_parent_id`, `order_num`, `alias`, `proof_image`) VALUES
(1, 'Saving Mila — Time is Running Out!', 'Saving Mila — Time is Running Out!', 'In January 2017, we set out on a mission to find a cure for our daughter Mila&rsquo;s devastating condition, Batten Disease&mdash; a disorder that rips abilities, and then life, away from children.<br />\n<br />\nAfter fighting for Mila&#39;s life day and night for almost one year, it seems unreal that we are telling you that a LIFE-SAVING TREATMENT could be in sight for Mila this JANUARY. There&rsquo;s no other way to put it&mdash;my 7-year-old daughter, Mila, is dying.<br />\n<br />\nI lie by her side every night when she sleeps and my heart bleeds. My face burns from the tears. Mila could be your child. She splashed in the pool, begged for chocolate ice cream, and sang her favorite songs. She rode bikes. She skied. But at 4 years old, she started to fall over, to bump into things. She pulled books in close, got stuck on words. She was finally diagnosed with Batten Disease, a rare fatal genetic condition that robs normal children of everything. They end up bedridden, on a feeding tube, with seizures, and cognitively impaired.<br />\n<br />\nThere is no cure... yet. We were given no hope. But we discovered that scientists are just now able to STOP and even REVERSE genetic diseases like Batten. So we fought day and night and have raised over $1.5M to fund the science that could lead to a cure. Our tireless work and YOUR incredible support have paid off. A LIFE-SAVING treatment could be in sight for Mila this JANUARY.<br />\n<br />\nIt seems unreal. Mila is rapidly declining every day. Our team of scientists is working around the clock to make this treatment happen as soon as humanly possible. But Mila&#39;s future is still unknown so we are continung to raise money so we&#39;re prepared for the unexpected costs. And we have already begun working on our next project that could compliment Mila&#39;s treatment and help many other children.', 'In January 2017, we set out on a mission to find a cure for our daughter Mila&rsquo;s devastating condition, Batten Disease&mdash; a disorder that rips abilities, and then life, away from children.', '5', '30', '2018-02-22 23:59:59', 1, '0x583dd6b74894e46ebb35c70890c1cc8f940126a0', 'UK, London', NULL, 2, 1, '2018-01-23 16:36:22', '2018-01-23 15:36:22', '2018-01-24 17:10:21', 10, 'saving-mila-time-is-running-out', NULL, NULL, NULL, 1, 5, NULL, 99999, '7kxaK', NULL),
(2, 'Zimbabwe Orphanage & Education Fund', 'Zimbabwe Orphanage & Education Fund', 'Today is the first time I&#39;ve updated it since being here and I&#39;ve felt the need to alter almost everything that I think about this trip after today. We visited a heartbreaking orphanage that made us reassess who we are as much as what we can do to help on this trip. The initial trip was planned to help schools, and education and we&#39;ve been and visited 3 such schools in need of our help these last few days. We will continue to support and help those schools with the money that you have already sent of course, but after today we realise that the main focus of our efforts should be the orphanage. We couldn&#39;t believe what we saw today and it brought us both to tears. For those that haven&#39;t already read and seen the pictures, please copy and paste the link below into a browser. Thank you for reading, thank you for supporting and we&#39;ll be doing all we can to help.', 'This &quot;campaign description&quot; has been an ever evolving thing, as we have been raising money, reflecting the different sponsored events we&#39;ve been doing and also as we neared the date of arrival here.', '0.5', '15', '2018-02-07 23:59:59', 2, '0x80f5cc96a682fb94dad1fb31259e336f6f837fda', 'Zimbabwe', NULL, 2, 10, '2018-01-23 16:49:36', '2018-01-23 15:49:36', '2018-01-24 16:37:43', 10, 'zimbabwe-orphanage-education-fund', NULL, NULL, NULL, 1, 2, NULL, 99999, 'VKDUw', 'screenshot20180123at08.28.33_3.png'),
(3, 'Hurricane Harvey', 'Hurricane Harvey', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'People walk down a flooded street as they evacuate their homes after the area was inundated with flooding from Hurricane Harvey on August 28, 2017 in Houston, Texas.', '7', '40', '2018-03-04 23:59:59', 3, '0xb1265d812a39e806ae4ab1dd7c4dd442c3cd1db9', 'Houston, Texas', NULL, 2, 1, '2018-01-23 16:55:27', '2018-01-23 15:55:27', '2018-01-24 17:14:08', 10, 'hurricane-harvey', NULL, NULL, NULL, 1, 4, NULL, 99999, 'kER7L', NULL),
(4, 'Everyone deserves clean water', 'Everyone deserves clean water', 'Many of us have no idea what it&#39;s like to be thirsty. We have plenty of water to drink -- even the water in our toilets is clean! But many people around the world don&rsquo;t have that luxury. Every day, about 1,400 children die from diseases caused by unsafe water and poor sanitation. But it doesn&rsquo;t have to be that way. There are simple solutions like drilled wells, spring protections and BioSand filters that help provide clean water to communities around the world. I started this fundraising campaign to help charity: water build these types of projects around the world, and I&#39;m looking for anyone who can help me. Please donate to my campaign -- anything you can give is a huge help. 100% of the money will be used to build clean water projects, and when they&rsquo;re complete, charity: water will send us photos and GPS coordinates so we can see the exact community we helped.', 'Many of us have no idea what it&#39;s like to be thirsty. We have plenty of water to drink -- even the water in our toilets is clean!', '3', '60', '2018-03-24 23:59:59', 4, '0x7b88f88df813be1b5d851deec973f355c369a62a', 'Africa', NULL, 2, 1, '2018-01-23 17:02:53', '2018-01-23 16:02:53', '2018-01-24 17:16:04', 10, 'everyone-deserves-clean-water', NULL, NULL, NULL, 1, 3, NULL, 99999, 'hadSI', NULL);

-- --------------------------------------------------------

--
-- Struktura tabele `page_content_rating`
--

CREATE TABLE `page_content_rating` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_content_id` int(10) UNSIGNED NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `id_fb_user` varchar(255) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `page_content_views`
--

CREATE TABLE `page_content_views` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_content_id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `payment_type`
--

INSERT INTO `payment_type` (`id`, `name`, `status_id`) VALUES
(1, 'Paypal', 1),
(2, 'Prepay', 1);

-- --------------------------------------------------------

--
-- Struktura tabele `paypal_notify`
--

CREATE TABLE `paypal_notify` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `invoice` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `reference` varchar(150) DEFAULT NULL,
  `long_description` text NOT NULL,
  `short_description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `expose` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: make visible on first page',
  `recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: we recommend this product',
  `comment` text,
  `datetime` datetime NOT NULL,
  `datetime_utc` datetime NOT NULL,
  `datetime_last_change` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(50) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `meta_title` text,
  `meta_description` text,
  `nice_url` varchar(255) NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `product_category`
--

CREATE TABLE `product_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `proof_of_charity`
--

CREATE TABLE `proof_of_charity` (
  `id` int(10) UNSIGNED NOT NULL,
  `proof_of_charity_type_id` int(10) UNSIGNED DEFAULT '1',
  `user_id` int(10) UNSIGNED NOT NULL,
  `page_content_id` int(10) UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL,
  `datetime_utc` datetime NOT NULL,
  `click_from_ip` varchar(50) NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `url` text,
  `request_method` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `proof_of_charity`
--

INSERT INTO `proof_of_charity` (`id`, `proof_of_charity_type_id`, `user_id`, `page_content_id`, `datetime`, `datetime_utc`, `click_from_ip`, `status_id`, `url`, `request_method`) VALUES
(1, 1, 7, 2, '2017-12-20 19:13:50', '2017-12-20 18:13:50', '93.103.172.168', 1, 'https://dev2.cherr.io/campaigns/school/zimbabwe-orphanage-education-fund/gz12OSL51q', '{\"PATH\":\"\\/usr\\/local\\/bin:\\/usr\\/bin:\\/bin\",\"TEMP\":\"\\/tmp\",\"TMP\":\"\\/tmp\",\"TMPDIR\":\"\\/tmp\",\"PWD\":\"\\/\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate, br\",\"HTTP_ACCEPT_LANGUAGE\":\"en-GB,en;q=0.9\",\"HTTP_CONNECTION\":\"close\",\"CONTENT_LENGTH\":\"0\",\"HTTP_COOKIE\":\"__cfduid=d75a7d6161e84a68119f877cd47e6c3ff1513719371; _ga=GA1.2.1985190631.1513719359; _gid=GA1.2.1582499216.1513719359; ci_session=a%3A5%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%223a88dbb745a430c250f76bb9f774760a%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A14%3A%2293.103.172.168%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A114%3A%22Mozilla%2F5.0+%28Windows+NT+10.0%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F63.0.3239.84+Safari%2F537.36%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1513793394%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3B%7D934fce0c6c169208d4d907b6c66befe9b6a637e4; user_lang=en\",\"HTTP_HOST\":\"dev2.cherr.io\",\"HTTP_REFERER\":\"https:\\/\\/t.co\\/yN0lD66Pkv\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.84 Safari\\/537.36\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_X_FORWARDED_PROTO\":\"https\",\"HTTP_X_FORWARDED_PORT\":\"443\",\"HTTP_CF_CONNECTING_IP\":\"93.103.172.168\",\"REDIRECT_UNIQUE_ID\":\"WjqoXkCQiaHcjdS4mBs-8gAAAE4\",\"REDIRECT_HTTPS\":\"on\",\"REDIRECT_STATUS\":\"200\",\"UNIQUE_ID\":\"WjqoXkCQiaHcjdS4mBs-8gAAAE4\",\"HTTPS\":\"on\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"dev2.cherr.io\",\"SERVER_ADDR\":\"212.44.101.34\",\"SERVER_PORT\":\"443\",\"REMOTE_ADDR\":\"93.103.172.168\",\"DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/dev2.cherr.io\",\"REQUEST_SCHEME\":\"https\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/dev2.cherr.io\",\"SERVER_ADMIN\":\"webmaster@dev2.cherr.io\",\"SCRIPT_FILENAME\":\"\\/home\\/cherrijo\\/dev2.cherr.io\\/index.php\",\"REMOTE_PORT\":\"41524\",\"REDIRECT_URL\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"REDIRECT_QUERY_STRING\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"SCRIPT_NAME\":\"\\/index.php\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1513793630.7591,\"REQUEST_TIME\":1513793630}'),
(2, 1, 10, 1, '2017-12-20 19:15:39', '2017-12-20 18:15:39', '93.103.172.168', 1, 'https://dev2.cherr.io/campaigns/health/i-just-want-to-see-my-kids-grow-up/ax24fDZWxX', '{\"PATH\":\"\\/usr\\/local\\/bin:\\/usr\\/bin:\\/bin\",\"TEMP\":\"\\/tmp\",\"TMP\":\"\\/tmp\",\"TMPDIR\":\"\\/tmp\",\"PWD\":\"\\/\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate, br\",\"HTTP_ACCEPT_LANGUAGE\":\"sl-SI,sl;q=0.9,en-GB;q=0.8,en;q=0.7,und;q=0.6\",\"HTTP_CONNECTION\":\"close\",\"CONTENT_LENGTH\":\"0\",\"HTTP_COOKIE\":\"__cfduid=d1a181358e159ffb925805f105c26f3471509984001; _ga=GA1.2.1394854230.1506097236; _gid=GA1.2.2093055261.1513707162; user_lang=sl; ci_session=a%3A6%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%22c253e7018018f591cd6805ec403c4304%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A14%3A%2293.103.172.168%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A120%3A%22Mozilla%2F5.0+%28Macintosh%3B+Intel+Mac+OS+X+10_12_6%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F63.0.3239.84+Safari%2F537.36%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1513793552%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3Bs%3A14%3A%22logged_in_site%22%3Ba%3A6%3A%7Bs%3A2%3A%22id%22%3Bs%3A1%3A%227%22%3Bs%3A5%3A%22level%22%3Bs%3A1%3A%221%22%3Bs%3A5%3A%22email%22%3Bs%3A16%3A%22dtacer%40gmail.com%22%3Bs%3A9%3A%22firstname%22%3Bs%3A5%3A%22David%22%3Bs%3A8%3A%22lastname%22%3Bs%3A5%3A%22Tacer%22%3Bs%3A6%3A%22status%22%3Bb%3A1%3B%7D%7D1046f975aa735bf6839a7624136cc0c167fce572\",\"HTTP_HOST\":\"dev2.cherr.io\",\"HTTP_REFERER\":\"https:\\/\\/t.co\\/EVwzdSqdVv\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.84 Safari\\/537.36\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_X_FORWARDED_PROTO\":\"https\",\"HTTP_X_FORWARDED_PORT\":\"443\",\"HTTP_CF_CONNECTING_IP\":\"93.103.172.168\",\"REDIRECT_UNIQUE_ID\":\"Wjqoy0CQiaHcjdS4mBtOhgAAAHw\",\"REDIRECT_HTTPS\":\"on\",\"REDIRECT_STATUS\":\"200\",\"UNIQUE_ID\":\"Wjqoy0CQiaHcjdS4mBtOhgAAAHw\",\"HTTPS\":\"on\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"dev2.cherr.io\",\"SERVER_ADDR\":\"212.44.101.34\",\"SERVER_PORT\":\"443\",\"REMOTE_ADDR\":\"93.103.172.168\",\"DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/dev2.cherr.io\",\"REQUEST_SCHEME\":\"https\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/dev2.cherr.io\",\"SERVER_ADMIN\":\"webmaster@dev2.cherr.io\",\"SCRIPT_FILENAME\":\"\\/home\\/cherrijo\\/dev2.cherr.io\\/index.php\",\"REMOTE_PORT\":\"50712\",\"REDIRECT_URL\":\"\\/en\\/campaigns\\/health\\/i-just-want-to-see-my-kids-grow-up\\/ax24fDZWxX\",\"REDIRECT_QUERY_STRING\":\"\\/en\\/campaigns\\/health\\/i-just-want-to-see-my-kids-grow-up\\/ax24fDZWxX\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/en\\/campaigns\\/health\\/i-just-want-to-see-my-kids-grow-up\\/ax24fDZWxX\",\"SCRIPT_NAME\":\"\\/index.php\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1513793739.7227,\"REQUEST_TIME\":1513793739}'),
(3, 1, 7, 2, '2017-12-22 11:23:57', '2017-12-22 10:23:57', '178.32.216.192', 1, 'http://dev2.cherr.io/campaigns/school/zimbabwe-orphanage-education-fund/gz12OSL51q', '{\"PATH\":\"\\/usr\\/local\\/bin:\\/usr\\/bin:\\/bin\",\"TEMP\":\"\\/tmp\",\"TMP\":\"\\/tmp\",\"TMPDIR\":\"\\/tmp\",\"PWD\":\"\\/\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml\",\"HTTP_ACCEPT_ENCODING\":\"gzip\",\"HTTP_ACCEPT_LANGUAGE\":\"en-US,en\",\"HTTP_CONNECTION\":\"close\",\"CONTENT_LENGTH\":\"0\",\"HTTP_COOKIE\":\"\",\"HTTP_HOST\":\"dev2.cherr.io\",\"HTTP_REFERER\":\"http:\\/\\/dev2.cherr.io\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"HTTP_USER_AGENT\":\"LivelapBot\\/0.2 (http:\\/\\/site.livelap.com\\/crawler)\",\"HTTP_CF_CONNECTING_IP\":\"178.32.216.192\",\"REDIRECT_UNIQUE_ID\":\"WjzdPePb-hgZnK-g-XoQpQAAAB8\",\"REDIRECT_SCRIPT_URL\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"REDIRECT_SCRIPT_URI\":\"http:\\/\\/dev2.cherr.io\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"REDIRECT_STATUS\":\"200\",\"UNIQUE_ID\":\"WjzdPePb-hgZnK-g-XoQpQAAAB8\",\"SCRIPT_URL\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"SCRIPT_URI\":\"http:\\/\\/dev2.cherr.io\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"dev2.cherr.io\",\"SERVER_ADDR\":\"212.44.101.34\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"178.32.216.192\",\"DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/dev2.cherr.io\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/dev2.cherr.io\",\"SERVER_ADMIN\":\"webmaster@dev2.cherr.io\",\"SCRIPT_FILENAME\":\"\\/home\\/cherrijo\\/dev2.cherr.io\\/index.php\",\"REMOTE_PORT\":\"34108\",\"REDIRECT_URL\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"REDIRECT_QUERY_STRING\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/gz12OSL51q\",\"SCRIPT_NAME\":\"\\/index.php\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1513938237.1414,\"REQUEST_TIME\":1513938237}'),
(4, 1, 11, 3, '2018-01-09 16:55:22', '2018-01-09 15:55:22', '86.58.102.249', 1, 'http://dev2.cherr.io/campaigns/natural-disaster/vi-r3/tgfqSVCGdq', '{\"PATH\":\"\\/usr\\/local\\/bin:\\/usr\\/bin:\\/bin\",\"TEMP\":\"\\/tmp\",\"TMP\":\"\\/tmp\",\"TMPDIR\":\"\\/tmp\",\"PWD\":\"\\/\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"sl-SI,sl;q=0.9,en-GB;q=0.8,en;q=0.7\",\"HTTP_CONNECTION\":\"close\",\"CONTENT_LENGTH\":\"0\",\"HTTP_COOKIE\":\"__cfduid=d1d6002549191650ca76546bf7cbacc771510003845; _ga=GA1.2.50819563.1507572769; _gid=GA1.2.1937738652.1515481505\",\"HTTP_HOST\":\"dev2.cherr.io\",\"HTTP_REFERER\":\"https:\\/\\/t.co\\/5qjPw8io6B\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.84 Safari\\/537.36\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_CF_CONNECTING_IP\":\"86.58.102.249\",\"REDIRECT_UNIQUE_ID\":\"WlTl6nTUsGkAQcUiKDdqDQAAABw\",\"REDIRECT_SCRIPT_URL\":\"\\/en\\/campaigns\\/natural-disaster\\/vi-r3\\/tgfqSVCGdq\",\"REDIRECT_SCRIPT_URI\":\"http:\\/\\/dev2.cherr.io\\/en\\/campaigns\\/natural-disaster\\/vi-r3\\/tgfqSVCGdq\",\"REDIRECT_STATUS\":\"200\",\"UNIQUE_ID\":\"WlTl6nTUsGkAQcUiKDdqDQAAABw\",\"SCRIPT_URL\":\"\\/en\\/campaigns\\/natural-disaster\\/vi-r3\\/tgfqSVCGdq\",\"SCRIPT_URI\":\"http:\\/\\/dev2.cherr.io\\/en\\/campaigns\\/natural-disaster\\/vi-r3\\/tgfqSVCGdq\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"dev2.cherr.io\",\"SERVER_ADDR\":\"212.44.101.34\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"86.58.102.249\",\"DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/dev2.cherr.io\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/dev2.cherr.io\",\"SERVER_ADMIN\":\"webmaster@dev2.cherr.io\",\"SCRIPT_FILENAME\":\"\\/home\\/cherrijo\\/dev2.cherr.io\\/index.php\",\"REMOTE_PORT\":\"47896\",\"REDIRECT_URL\":\"\\/en\\/campaigns\\/natural-disaster\\/vi-r3\\/tgfqSVCGdq\",\"REDIRECT_QUERY_STRING\":\"\\/en\\/campaigns\\/natural-disaster\\/vi-r3\\/tgfqSVCGdq\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/en\\/campaigns\\/natural-disaster\\/vi-r3\\/tgfqSVCGdq\",\"SCRIPT_NAME\":\"\\/index.php\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1515513322.0178,\"REQUEST_TIME\":1515513322}'),
(5, 1, 6, 4, '2018-01-23 20:48:02', '2018-01-23 19:48:02', '93.103.172.168', 1, 'http://futurehack.cherr.io/campaigns/clean-water/everyone-deserves-clean-water/hadSIqwuJ8', '{\"PATH\":\"\\/usr\\/local\\/bin:\\/usr\\/bin:\\/bin\",\"TEMP\":\"\\/tmp\",\"TMP\":\"\\/tmp\",\"TMPDIR\":\"\\/tmp\",\"PWD\":\"\\/\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"en-GB,en;q=0.9\",\"HTTP_CONNECTION\":\"close\",\"CONTENT_LENGTH\":\"0\",\"HTTP_COOKIE\":\"__cfduid=d7916b42c91a0475c41c2f3f4b84a07e41509999332; _ga=GA1.2.160531121.1509999334; user_lang=en; ci_session=a%3A5%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%2248bb66901333670330a17a03438afcd8%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A14%3A%2293.103.172.168%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A104%3A%22Mozilla%2F5.0+%28X11%3B+Linux+x86_64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F63.0.3239.84+Safari%2F537.36%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1516736681%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3B%7D155614a56f371c0b525114bbc62891119c16f2a2\",\"HTTP_HOST\":\"futurehack.cherr.io\",\"HTTP_REFERER\":\"https:\\/\\/l.facebook.com\\/\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.84 Safari\\/537.36\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_CF_CONNECTING_IP\":\"93.103.172.168\",\"REDIRECT_UNIQUE_ID\":\"WmeRchdvSOsMgIuDkbmhYwAAAF8\",\"REDIRECT_SCRIPT_URL\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSIqwuJ8\",\"REDIRECT_SCRIPT_URI\":\"http:\\/\\/futurehack.cherr.io\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSIqwuJ8\",\"REDIRECT_STATUS\":\"200\",\"UNIQUE_ID\":\"WmeRchdvSOsMgIuDkbmhYwAAAF8\",\"SCRIPT_URL\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSIqwuJ8\",\"SCRIPT_URI\":\"http:\\/\\/futurehack.cherr.io\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSIqwuJ8\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"futurehack.cherr.io\",\"SERVER_ADDR\":\"212.44.101.34\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"93.103.172.168\",\"DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\",\"SERVER_ADMIN\":\"webmaster@futurehack.cherr.io\",\"SCRIPT_FILENAME\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\\/index.php\",\"REMOTE_PORT\":\"59720\",\"REDIRECT_URL\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSIqwuJ8\",\"REDIRECT_QUERY_STRING\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSIqwuJ8\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSIqwuJ8\",\"SCRIPT_NAME\":\"\\/index.php\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1516736882.2512,\"REQUEST_TIME\":1516736882}'),
(6, 1, 6, 2, '2018-01-23 23:08:39', '2018-01-23 22:08:39', '93.103.172.168', 1, 'http://futurehack.cherr.io/campaigns/school/zimbabwe-orphanage-education-fund/VKDUw', '{\"PATH\":\"\\/usr\\/local\\/bin:\\/usr\\/bin:\\/bin\",\"TEMP\":\"\\/tmp\",\"TMP\":\"\\/tmp\",\"TMPDIR\":\"\\/tmp\",\"PWD\":\"\\/\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"sl-SI,sl;q=0.9,en-GB;q=0.8,en;q=0.7,und;q=0.6\",\"HTTP_CONNECTION\":\"close\",\"CONTENT_LENGTH\":\"0\",\"HTTP_COOKIE\":\"__cfduid=d1a181358e159ffb925805f105c26f3471509984001; _ga=GA1.2.1394854230.1506097236; _gid=GA1.2.1609831273.1516635634; user_lang=en; ci_session=a%3A11%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%220fd49642c5d5564cf3b5e95beafab20c%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A14%3A%2293.103.172.168%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A120%3A%22Mozilla%2F5.0+%28Macintosh%3B+Intel+Mac+OS+X+10_12_6%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F63.0.3239.132+Safari%2F537.3%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1516745088%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3Bs%3A9%3A%22logged_in%22%3Ba%3A6%3A%7Bs%3A2%3A%22id%22%3Bs%3A1%3A%221%22%3Bs%3A8%3A%22username%22%3Bs%3A5%3A%22admin%22%3Bs%3A5%3A%22level%22%3Bs%3A1%3A%229%22%3Bs%3A9%3A%22firstname%22%3Bs%3A8%3A%22CHERR.IO%22%3Bs%3A8%3A%22nice_url%22%3Bs%3A13%3A%22cherrio-admin%22%3Bs%3A8%3A%22lastname%22%3Bs%3A6%3A%22Office%22%3B%7Ds%3A5%3A%22token%22%3Bs%3A27%3A%22wV0fIwAAAAAA3vymAAABYSRxFc8%22%3Bs%3A12%3A%22token_secret%22%3Bs%3A32%3A%22qwI4kmIizHwslEOpQjsyuyyIvBaqoVIL%22%3Bs%3A6%3A%22status%22%3Bs%3A8%3A%22verified%22%3Bs%3A8%3A%22userData%22%3Ba%3A4%3A%7Bs%3A14%3A%22oauth_provider%22%3Bs%3A7%3A%22twitter%22%3Bs%3A9%3A%22oauth_uid%22%3Bi%3A1391948419%3Bs%3A8%3A%22username%22%3Bs%3A10%3A%22TacerDavid%22%3Bs%3A11%3A%22accessToken%22%3Ba%3A5%3A%7Bs%3A11%3A%22oauth_token%22%3Bs%3A50%3A%221391948419-JV8196NRgyhAdxrgjuxsmTPTip68Iswuf5W9UtV%22%3Bs%3A18%3A%22oauth_token_secret%22%3Bs%3A45%3A%22iips76iPGIoPWLKml3isQYvTDDQZYIiptMT6n2lgfaPH6%22%3Bs%3A7%3A%22user_id%22%3Bs%3A10%3A%221391948419%22%3Bs%3A11%3A%22screen_name%22%3Bs%3A10%3A%22TacerDavid%22%3Bs%3A14%3A%22x_auth_expires%22%3Bs%3A1%3A%220%22%3B%7D%7Ds%3A14%3A%22logged_in_site%22%3Ba%3A6%3A%7Bs%3A2%3A%22id%22%3Bs%3A1%3A%222%22%3Bs%3A5%3A%22level%22%3Bs%3A1%3A%227%22%3Bs%3A5%3A%22email%22%3Bs%3A21%3A%22contactus%40amnesty.org%22%3Bs%3A9%3A%22firstname%22%3Bs%3A21%3A%22Amnesty+International%22%3Bs%3A8%3A%22lastname%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22status%22%3Bb%3A1%3B%7D%7Dee22c73c11edb63c4fe7bae1569f3c0da1fb23f7\",\"HTTP_HOST\":\"futurehack.cherr.io\",\"HTTP_REFERER\":\"http:\\/\\/futurehack.cherr.io\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.132 Safari\\/537.36\",\"HTTP_CACHE_CONTROL\":\"max-age=0\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_CF_CONNECTING_IP\":\"93.103.172.168\",\"REDIRECT_UNIQUE_ID\":\"WmeyZ1jk0UtlTtiRGL3W0wAAAFA\",\"REDIRECT_SCRIPT_URL\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"REDIRECT_SCRIPT_URI\":\"http:\\/\\/futurehack.cherr.io\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"REDIRECT_STATUS\":\"200\",\"UNIQUE_ID\":\"WmeyZ1jk0UtlTtiRGL3W0wAAAFA\",\"SCRIPT_URL\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"SCRIPT_URI\":\"http:\\/\\/futurehack.cherr.io\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"futurehack.cherr.io\",\"SERVER_ADDR\":\"212.44.101.34\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"93.103.172.168\",\"DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\",\"SERVER_ADMIN\":\"webmaster@futurehack.cherr.io\",\"SCRIPT_FILENAME\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\\/index.php\",\"REMOTE_PORT\":\"39104\",\"REDIRECT_URL\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"REDIRECT_QUERY_STRING\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/en\\/campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"SCRIPT_NAME\":\"\\/index.php\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1516745319.1427,\"REQUEST_TIME\":1516745319}'),
(7, 1, 6, 2, '2018-01-24 13:05:57', '2018-01-24 12:05:57', '93.103.172.168', 1, 'http://futurehack.cherr.io/past-campaigns/school/zimbabwe-orphanage-education-fund/VKDUw', '{\"PATH\":\"\\/usr\\/local\\/bin:\\/usr\\/bin:\\/bin\",\"TEMP\":\"\\/tmp\",\"TMP\":\"\\/tmp\",\"TMPDIR\":\"\\/tmp\",\"PWD\":\"\\/\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"sl-SI,sl;q=0.9,en-GB;q=0.8,en;q=0.7,hr;q=0.6,de;q=0.5,it;q=0.4,pl;q=0.3,ar;q=0.2\",\"HTTP_CONNECTION\":\"close\",\"CONTENT_LENGTH\":\"0\",\"HTTP_COOKIE\":\"__cfduid=d3f870cb4292e8d5ddd5635958d4424da1509897348; _ga=GA1.2.1726492429.1506022455; _gid=GA1.2.1438872365.1516636795; user_lang=en; ci_session=a%3A8%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%22e4a8b649ecc01ec84574fc93fbb3e1bd%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A14%3A%2293.103.172.168%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A115%3A%22Mozilla%2F5.0+%28Windows+NT+10.0%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F63.0.3239.132+Safari%2F537.36%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1516795308%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3Bs%3A5%3A%22token%22%3Bs%3A27%3A%224nBIHAAAAAAA3vymAAABYST7Gm8%22%3Bs%3A12%3A%22token_secret%22%3Bs%3A32%3A%22mg4lY82AkMfTqBBDs8rIjoLu4BQLCrZs%22%3Bs%3A14%3A%22logged_in_site%22%3Ba%3A6%3A%7Bs%3A2%3A%22id%22%3Bs%3A1%3A%222%22%3Bs%3A5%3A%22level%22%3Bs%3A1%3A%227%22%3Bs%3A5%3A%22email%22%3Bs%3A21%3A%22contactus%40amnesty.org%22%3Bs%3A9%3A%22firstname%22%3Bs%3A21%3A%22Amnesty+International%22%3Bs%3A8%3A%22lastname%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22status%22%3Bb%3A1%3B%7D%7Deac11f398908fc0e2d701bcd657238157ab8c92f\",\"HTTP_HOST\":\"futurehack.cherr.io\",\"HTTP_REFERER\":\"http:\\/\\/futurehack.cherr.io\\/en\\/past-campaigns\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.132 Safari\\/537.36\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_CF_CONNECTING_IP\":\"93.103.172.168\",\"REDIRECT_UNIQUE_ID\":\"Wmh2pQiA6qZamorvlRQcJgAAABE\",\"REDIRECT_SCRIPT_URL\":\"\\/en\\/past-campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"REDIRECT_SCRIPT_URI\":\"http:\\/\\/futurehack.cherr.io\\/en\\/past-campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"REDIRECT_STATUS\":\"200\",\"UNIQUE_ID\":\"Wmh2pQiA6qZamorvlRQcJgAAABE\",\"SCRIPT_URL\":\"\\/en\\/past-campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"SCRIPT_URI\":\"http:\\/\\/futurehack.cherr.io\\/en\\/past-campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"futurehack.cherr.io\",\"SERVER_ADDR\":\"212.44.101.34\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"93.103.172.168\",\"DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\",\"SERVER_ADMIN\":\"webmaster@futurehack.cherr.io\",\"SCRIPT_FILENAME\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\\/index.php\",\"REMOTE_PORT\":\"39202\",\"REDIRECT_URL\":\"\\/en\\/past-campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"REDIRECT_QUERY_STRING\":\"\\/en\\/past-campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/en\\/past-campaigns\\/school\\/zimbabwe-orphanage-education-fund\\/VKDUw\",\"SCRIPT_NAME\":\"\\/index.php\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1516795557.6069,\"REQUEST_TIME\":1516795557}'),
(8, 1, 6, 4, '2018-01-24 13:31:17', '2018-01-24 12:31:17', '93.103.172.168', 1, 'http://futurehack.cherr.io/campaigns/clean-water/everyone-deserves-clean-water/hadSI', '{\"PATH\":\"\\/usr\\/local\\/bin:\\/usr\\/bin:\\/bin\",\"TEMP\":\"\\/tmp\",\"TMP\":\"\\/tmp\",\"TMPDIR\":\"\\/tmp\",\"PWD\":\"\\/\",\"HTTP_ACCEPT\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"HTTP_ACCEPT_ENCODING\":\"gzip, deflate\",\"HTTP_ACCEPT_LANGUAGE\":\"sl-SI,sl;q=0.9,en-GB;q=0.8,en;q=0.7,hr;q=0.6,de;q=0.5,it;q=0.4,pl;q=0.3,ar;q=0.2\",\"HTTP_CONNECTION\":\"close\",\"CONTENT_LENGTH\":\"0\",\"HTTP_COOKIE\":\"__cfduid=d3f870cb4292e8d5ddd5635958d4424da1509897348; _ga=GA1.2.1726492429.1506022455; _gid=GA1.2.1438872365.1516636795; user_lang=en; ci_session=a%3A8%3A%7Bs%3A10%3A%22session_id%22%3Bs%3A32%3A%229a89c3de404e0a0a1da7eb9beb58cf86%22%3Bs%3A10%3A%22ip_address%22%3Bs%3A14%3A%2293.103.172.168%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A115%3A%22Mozilla%2F5.0+%28Windows+NT+10.0%3B+Win64%3B+x64%29+AppleWebKit%2F537.36+%28KHTML%2C+like+Gecko%29+Chrome%2F63.0.3239.132+Safari%2F537.36%22%3Bs%3A13%3A%22last_activity%22%3Bi%3A1516796995%3Bs%3A9%3A%22user_data%22%3Bs%3A0%3A%22%22%3Bs%3A14%3A%22logged_in_site%22%3Ba%3A6%3A%7Bs%3A2%3A%22id%22%3Bs%3A1%3A%222%22%3Bs%3A5%3A%22level%22%3Bs%3A1%3A%227%22%3Bs%3A5%3A%22email%22%3Bs%3A21%3A%22contactus%40amnesty.org%22%3Bs%3A9%3A%22firstname%22%3Bs%3A21%3A%22Amnesty+International%22%3Bs%3A8%3A%22lastname%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22status%22%3Bb%3A1%3B%7Ds%3A5%3A%22token%22%3Bs%3A27%3A%22robBfAAAAAAA3vymAAABYSglswA%22%3Bs%3A12%3A%22token_secret%22%3Bs%3A32%3A%22mieiOdsUPqpUOA9C2IlC5qhFKFTfFyc8%22%3B%7Db70343846401df705da972fcca4d1d83ea0d5fe8\",\"HTTP_HOST\":\"futurehack.cherr.io\",\"HTTP_REFERER\":\"http:\\/\\/futurehack.cherr.io\\/en\\/\",\"HTTP_USER_AGENT\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.132 Safari\\/537.36\",\"HTTP_UPGRADE_INSECURE_REQUESTS\":\"1\",\"HTTP_CF_CONNECTING_IP\":\"93.103.172.168\",\"REDIRECT_UNIQUE_ID\":\"Wmh8lfaKifMGGh6rjzJ23QAAAHI\",\"REDIRECT_SCRIPT_URL\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSI\",\"REDIRECT_SCRIPT_URI\":\"http:\\/\\/futurehack.cherr.io\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSI\",\"REDIRECT_STATUS\":\"200\",\"UNIQUE_ID\":\"Wmh8lfaKifMGGh6rjzJ23QAAAHI\",\"SCRIPT_URL\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSI\",\"SCRIPT_URI\":\"http:\\/\\/futurehack.cherr.io\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSI\",\"SERVER_SIGNATURE\":\"\",\"SERVER_SOFTWARE\":\"Apache\",\"SERVER_NAME\":\"futurehack.cherr.io\",\"SERVER_ADDR\":\"212.44.101.34\",\"SERVER_PORT\":\"80\",\"REMOTE_ADDR\":\"93.103.172.168\",\"DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\",\"REQUEST_SCHEME\":\"http\",\"CONTEXT_PREFIX\":\"\",\"CONTEXT_DOCUMENT_ROOT\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\",\"SERVER_ADMIN\":\"webmaster@futurehack.cherr.io\",\"SCRIPT_FILENAME\":\"\\/home\\/cherrijo\\/futurehack.cherr.io\\/index.php\",\"REMOTE_PORT\":\"58392\",\"REDIRECT_URL\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSI\",\"REDIRECT_QUERY_STRING\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSI\",\"SERVER_PROTOCOL\":\"HTTP\\/1.1\",\"REQUEST_METHOD\":\"GET\",\"QUERY_STRING\":\"\",\"REQUEST_URI\":\"\\/en\\/campaigns\\/clean-water\\/everyone-deserves-clean-water\\/hadSI\",\"SCRIPT_NAME\":\"\\/index.php\",\"PHP_SELF\":\"\\/index.php\",\"REQUEST_TIME_FLOAT\":1516797077.1665,\"REQUEST_TIME\":1516797077}');

-- --------------------------------------------------------

--
-- Struktura tabele `proof_of_charity_type`
--

CREATE TABLE `proof_of_charity_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `points` tinyint(3) UNSIGNED DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `proof_of_charity_type`
--

INSERT INTO `proof_of_charity_type` (`id`, `name`, `points`, `status_id`) VALUES
(1, 'Social dialog share', 25, 1);

-- --------------------------------------------------------

--
-- Struktura tabele `shipping_method`
--

CREATE TABLE `shipping_method` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `language_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `shipping_method`
--

INSERT INTO `shipping_method` (`id`, `name`, `price`, `status_id`, `language_id`) VALUES
(1, 'Dostava', 0.01, 1, 1),
(2, 'Express dostava', 7.50, 1, 1),
(3, 'Normal Shipping', 0.01, 1, 2),
(4, 'Express', 5.00, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabele `status`
--

CREATE TABLE `status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Expired'),
(3, 'Disabled'),
(4, 'Deleted'),
(5, 'Draft'),
(6, 'Waiting paiment'),
(7, 'Payment canceled'),
(8, 'Payment received'),
(9, 'Shipped'),
(10, 'Successful'),
(11, 'Unsuccessful'),
(12, 'Canceled');

-- --------------------------------------------------------

--
-- Struktura tabele `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `message` text,
  `subject` text,
  `birthdate` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_post` varchar(50) DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:subscribe, 1: contact form',
  `campaign` varchar(200) DEFAULT 'CHERR.IO MVP',
  `url` text,
  `start_hour` varchar(15) DEFAULT NULL,
  `end_hour` varchar(15) NOT NULL,
  `hours` varchar(10) DEFAULT NULL,
  `package` varchar(150) DEFAULT NULL,
  `book_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `type`
--

CREATE TABLE `type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `nice_url` text,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `type`
--

INSERT INTO `type` (`id`, `name`, `nice_url`, `status_id`) VALUES
(1, 'Categories', NULL, 3),
(2, 'Brand', NULL, 3),
(3, 'Image', NULL, 3),
(4, 'Video', NULL, 3),
(5, 'Audio', NULL, 3),
(6, 'Document', NULL, 3),
(7, 'Main image', NULL, 3),
(8, 'Thumbnail', NULL, 3),
(9, 'Gallery', NULL, 3),
(10, 'Campaigns', 'campaigns', 1);

-- --------------------------------------------------------

--
-- Struktura tabele `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `datetime_ut` datetime DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `pasword_no_secure` varchar(50) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` int(10) UNSIGNED DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `eth_address` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country_list_id` int(11) DEFAULT NULL,
  `post_number` text,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `website` text,
  `about_us` text,
  `mobile` varchar(50) DEFAULT NULL,
  `avatar_img` varchar(100) DEFAULT 'avatar4big.png',
  `register_type` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fb_user_id` varchar(150) DEFAULT NULL,
  `twitter_user_id` varchar(40) DEFAULT NULL,
  `twitter_user_hashtags` int(11) DEFAULT NULL,
  `twitter_page_follow` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(2) NOT NULL DEFAULT '1',
  `nice_url` varchar(255) DEFAULT NULL,
  `alias` varchar(5) DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `company` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:physical user, 1:company',
  `company_name` varchar(255) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `taxable_person` tinyint(4) DEFAULT NULL COMMENT '1:Yes, 2:no',
  `hash` varchar(255) DEFAULT NULL,
  `datetime_confirm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `users`
--

INSERT INTO `users` (`id`, `active`, `datetime`, `datetime_ut`, `username`, `password`, `pasword_no_secure`, `firstname`, `lastname`, `email`, `gender`, `birthdate`, `address`, `eth_address`, `city`, `country_list_id`, `post_number`, `country`, `phone`, `website`, `about_us`, `mobile`, `avatar_img`, `register_type`, `fb_user_id`, `twitter_user_id`, `twitter_user_hashtags`, `twitter_page_follow`, `level`, `nice_url`, `alias`, `status_id`, `company`, `company_name`, `vat`, `taxable_person`, `hash`, `datetime_confirm`) VALUES
(1, 1, '2014-11-11 14:15:29', '2014-11-11 13:15:29', 'admin', '21232f297a57a5a743894a0e4a801fc3', '21232f297a57a5a743894a0e4a801fc3', 'CHERR.IO', 'Office', 'info@cherr.io', NULL, NULL, 'Tržaška cesta 40', NULL, 'Maribor', 197, '9600', NULL, '', NULL, NULL, '', 'avatar4big.png', 0, NULL, NULL, NULL, 0, 9, 'cherrio-admin', NULL, 1, 0, NULL, NULL, 0, NULL, NULL),
(2, 1, '2018-01-23 16:20:55', '2018-01-23 15:20:55', 'contactus@amnesty.org', '8a7bf732d0ae6a3f4b6df07a6819ced5', 'ISMK', 'Amnesty International', '', 'contactus@amnesty.org', NULL, NULL, '1 Easton Street', NULL, 'London', NULL, '', 'United Kingdom', ' +44-20-74135500', 'https://www.amnesty.org', 'Amnesty International is a global movement of more than 7 million people who take injustice personally. We are campaigning for a world where human rights are enjoyed by all.', '', 'logoamnestyinternational.png', 0, NULL, NULL, NULL, 0, 7, 'amnesty-international', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(3, 1, '2018-01-23 16:23:21', '2018-01-23 15:23:21', 'info@charitywater.org', '18fe0b9c7cd9bba689907315422b34ba', '4CN7', 'Charity Water', '', 'info@charitywater.org', NULL, NULL, '40 Worth Street, Suite 330', NULL, 'New York', NULL, '10013', 'USA', ' 1-646-688-2323', 'https://www.charitywater.org', '', '', 'logocharitywater.png', 0, NULL, NULL, NULL, 0, 7, 'charity-water', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(4, 1, '2018-01-23 16:25:37', '2018-01-23 15:25:37', 'info@redcross.org', '5f93216c7abc0542e29f62f14f421edb', 'N9P4', 'American Red Cross', '', 'info@redcross.org', NULL, NULL, '', NULL, '', NULL, '', '', '', 'http://www.redcross.org/', 'Each day, thousands of people – people just like you – provide compassionate care to those in need. Our network of generous donors, volunteers and employees share a mission of preventing and relieving suffering, here at home and around the world.\n\nWe roll up our sleeves and donate time, money and blood. We learn or teach life-saving skills so our communities can be better prepared when the need arises. We do this every day because the Red Cross is needed - every day.', '', 'logoredcross.png', 0, NULL, NULL, NULL, 0, 7, 'american-red-cross', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(5, 1, '2018-01-23 16:28:40', '2018-01-23 15:28:40', 'info@unicef.org', '745294082438423938f8d50ad5bbef5c', 'NG4U', 'UNICEF', '', 'info@unicef.org', NULL, NULL, '125  Lane', NULL, 'New York', NULL, 'New York, NY 10038', 'USA', '(800) 367-5437', 'https://www.unicef.org', 'UNICEF works in 190 countries and territories to protect the rights of every child. UNICEF has spent 70 years working to improve the lives of children and their families. Defending children\'s rights throughout their lives requires a global presence, aiming to produce results and understand their effects.', '', 'logounicef.png', 0, NULL, NULL, NULL, 0, 7, 'unicef', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL),
(6, 1, '2018-01-23 18:27:00', '2018-01-23 17:27:00', '', 'e00cf25ad42683b3df678c61f42c6bda', NULL, 'David', 'Tacer', 'dtacer@gmail.com', NULL, NULL, NULL, '0x10a7c82Fb0322Dcc7D786E72283590b8C07197C8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avatar4big.png', 0, NULL, 'TacerDavid', 3, 1, 1, NULL, 'qwuJ8', 1, 0, NULL, NULL, NULL, '351e8d40d7a83bd79eacd93580d41eee', '2018-01-23 18:30:00'),
(7, 1, '2018-01-23 18:33:38', '2018-01-23 17:33:38', '', '552e6a97297c53e592208cf97fbb3b60', NULL, 'Mario', 'Markovic', 'mario@cherr.io', NULL, NULL, NULL, '0xF730796f2997184bb3Fd5E54F51293617b0F4666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avatar4big.png', 0, NULL, NULL, NULL, 0, 1, NULL, 'w9bUF', 1, 0, NULL, NULL, NULL, '3d22345b0b598a3f5214f8c4dd32e2a5', '2018-01-23 19:04:03'),
(8, 1, '2018-01-24 09:33:33', '2018-01-24 08:33:33', '', 'cc03e747a6afbbcbf8be7668acfebee5', NULL, 'Aljaz', 'Straser', 'aljazstraser@gmail.com', NULL, NULL, NULL, '0xc58ca3302b5b341Bb07Ca9857b2dA814DcCd6C86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avatar4big.png', 0, NULL, 'aljazstraser', 6, 1, 1, NULL, 'q4DbS', 1, 0, NULL, NULL, NULL, '16418f67f237fb8c49bea849d2280ef7', '2018-01-24 09:33:46'),
(9, 1, '2018-01-24 12:53:54', '2018-01-24 11:53:54', '', '1adbb3178591fd5bb0c248518f39bf6d', NULL, 'Simon', 'Furman', 'simon.furman989@gmail.com', NULL, NULL, NULL, '0xe6C8b42E02DaD9cB40a8B94f2549867566AB6CEA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avatar4big.png', 0, NULL, NULL, NULL, 0, 1, NULL, 'tPl3X', 1, 0, NULL, NULL, NULL, '40bc747865ced8ecf8edc7a09759f4fb', '2018-01-24 12:54:21');

-- --------------------------------------------------------

--
-- Struktura tabele `users_forgot_password`
--

CREATE TABLE `users_forgot_password` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `datetime_request` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_confirm` datetime DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  `hash` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `users_forgot_password`
--

INSERT INTO `users_forgot_password` (`id`, `email`, `datetime_request`, `datetime_confirm`, `status_id`, `hash`) VALUES
(1, 'dtacer@gmail.com', '2018-01-23 18:39:14', '2018-01-23 18:44:51', 2, '22524b590d0e0ba7f1af464b21abcbba');

-- --------------------------------------------------------

--
-- Struktura tabele `users_level`
--

CREATE TABLE `users_level` (
  `level` tinyint(2) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `users_level`
--

INSERT INTO `users_level` (`level`, `name`) VALUES
(1, 'Normal user'),
(7, 'Organisation'),
(8, 'Moderator'),
(9, 'Administrator');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `button_hash`
--
ALTER TABLE `button_hash`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `campaign_type`
--
ALTER TABLE `campaign_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksi tabele `campaign_updates`
--
ALTER TABLE `campaign_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `level_id` (`status_id`),
  ADD KEY `page_content_id` (`page_content_id`);

--
-- Indeksi tabele `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indeksi tabele `country_list`
--
ALTER TABLE `country_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`type_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `status_id_2` (`status_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksi tabele `media_element`
--
ALTER TABLE `media_element`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_id` (`media_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `media_id` (`media_id`),
  ADD KEY `status_id_2` (`status_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `data_type_id` (`data_type_id`);

--
-- Indeksi tabele `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `order_main`
--
ALTER TABLE `order_main`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `payment_type_id` (`payment_type_id`),
  ADD KEY `shipping_method_id` (`shipping_method_id`);

--
-- Indeksi tabele `order_user`
--
ALTER TABLE `order_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksi tabele `page_content`
--
ALTER TABLE `page_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `organisation_id` (`organisation_id`),
  ADD KEY `campaign_type_id` (`campaign_type_id`),
  ADD KEY `page_content_parent_id` (`page_content_parent_id`);

--
-- Indeksi tabele `page_content_rating`
--
ALTER TABLE `page_content_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beach_id` (`page_content_id`);

--
-- Indeksi tabele `page_content_views`
--
ALTER TABLE `page_content_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beach_id` (`page_content_id`);

--
-- Indeksi tabele `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksi tabele `paypal_notify`
--
ALTER TABLE `paypal_notify`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indeksi tabele `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksi tabele `proof_of_charity`
--
ALTER TABLE `proof_of_charity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `page_content_id` (`page_content_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `proof_of_charity_type_id` (`proof_of_charity_type_id`);

--
-- Indeksi tabele `proof_of_charity_type`
--
ALTER TABLE `proof_of_charity_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksi tabele `shipping_method`
--
ALTER TABLE `shipping_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksi tabele `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksi tabele `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeksi tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gender` (`gender`),
  ADD KEY `level` (`level`),
  ADD KEY `level_2` (`level`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `country_list_id` (`country_list_id`);

--
-- Indeksi tabele `users_forgot_password`
--
ALTER TABLE `users_forgot_password`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `users_level`
--
ALTER TABLE `users_level`
  ADD PRIMARY KEY (`level`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `button_hash`
--
ALTER TABLE `button_hash`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT tabele `campaign_type`
--
ALTER TABLE `campaign_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `campaign_updates`
--
ALTER TABLE `campaign_updates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `country_list`
--
ALTER TABLE `country_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT tabele `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabele `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabele `language`
--
ALTER TABLE `language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabele `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT tabele `media_element`
--
ALTER TABLE `media_element`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT tabele `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `order_main`
--
ALTER TABLE `order_main`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `order_user`
--
ALTER TABLE `order_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `page_content`
--
ALTER TABLE `page_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `page_content_rating`
--
ALTER TABLE `page_content_rating`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `page_content_views`
--
ALTER TABLE `page_content_views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabele `paypal_notify`
--
ALTER TABLE `paypal_notify`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `proof_of_charity`
--
ALTER TABLE `proof_of_charity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT tabele `proof_of_charity_type`
--
ALTER TABLE `proof_of_charity_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabele `shipping_method`
--
ALTER TABLE `shipping_method`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `status`
--
ALTER TABLE `status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT tabele `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabele `type`
--
ALTER TABLE `type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT tabele `users_forgot_password`
--
ALTER TABLE `users_forgot_password`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `campaign_updates`
--
ALTER TABLE `campaign_updates`
  ADD CONSTRAINT `campaign_updates_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `campaign_updates_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `campaign_updates_ibfk_3` FOREIGN KEY (`page_content_id`) REFERENCES `page_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `media_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `media_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `media_element`
--
ALTER TABLE `media_element`
  ADD CONSTRAINT `media_element_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `media_element_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `media_element_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `media_element_ibfk_4` FOREIGN KEY (`data_type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `order_main`
--
ALTER TABLE `order_main`
  ADD CONSTRAINT `order_main_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_main_ibfk_2` FOREIGN KEY (`payment_type_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_main_ibfk_3` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `page_content`
--
ALTER TABLE `page_content`
  ADD CONSTRAINT `page_content_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `page_content_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `page_content_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `page_content_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `page_content_ibfk_5` FOREIGN KEY (`organisation_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `page_content_ibfk_6` FOREIGN KEY (`campaign_type_id`) REFERENCES `campaign_type` (`id`);

--
-- Omejitve za tabelo `page_content_rating`
--
ALTER TABLE `page_content_rating`
  ADD CONSTRAINT `page_content_rating_ibfk_1` FOREIGN KEY (`page_content_id`) REFERENCES `page_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `payment_type`
--
ALTER TABLE `payment_type`
  ADD CONSTRAINT `payment_type_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_category_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `proof_of_charity`
--
ALTER TABLE `proof_of_charity`
  ADD CONSTRAINT `proof_of_charity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `proof_of_charity_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `proof_of_charity_ibfk_3` FOREIGN KEY (`page_content_id`) REFERENCES `page_content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `proof_of_charity_ibfk_4` FOREIGN KEY (`proof_of_charity_type_id`) REFERENCES `proof_of_charity_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `proof_of_charity_type`
--
ALTER TABLE `proof_of_charity_type`
  ADD CONSTRAINT `proof_of_charity_type_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `shipping_method`
--
ALTER TABLE `shipping_method`
  ADD CONSTRAINT `shipping_method_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipping_method_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `subscribe`
--
ALTER TABLE `subscribe`
  ADD CONSTRAINT `subscribe_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `type_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`gender`) REFERENCES `gender` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`country_list_id`) REFERENCES `country_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
