-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 16. 13:28
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `bkr-alkatresz`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felhasznalo_id` int(11) NOT NULL,
  `felhasznalonev` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `jelszo` varchar(50) NOT NULL,
  `club` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `rendeles_id` int(11) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `iranyitoszam` int(4) NOT NULL,
  `varos` varchar(25) NOT NULL,
  `utca` varchar(30) NOT NULL,
  `telefonszam` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `termek_id` int(11) NOT NULL,
  `leiras` varchar(255) NOT NULL,
  `darab` int(11) NOT NULL,
  `alkatreszszam` bigint(20) NOT NULL,
  `ar` int(11) NOT NULL,
  `tipus_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `termekek`
--

INSERT INTO `termekek` (`termek_id`, `leiras`, `darab`, `alkatreszszam`, `ar`, `tipus_id`) VALUES
(1, 'Csatlakozó', 1, 11531709232, 7082, 73),
(2, 'O-gyűrű', 1, 11531709157, 800, 73),
(3, 'Hatszögletű csavar alátétel', 1, 719904527, 300, 73),
(4, 'Tömítőgyűrű', 1, 719963200, 250, 73),
(5, 'Csavar', 1, 719904539, 1000, 73),
(6, 'Fedőlemez', 1, 11141734019, 4400, 73),
(7, 'Tömítés', 1, 11141432240, 1200, 73),
(8, 'Borítókészlet', 1, 11141437774, 36700, 73),
(9, 'Hatszögletű csavar alátéttel', 4, 7119905400, 200, 73),
(10, 'Illesztőhüvely', 2, 11121726238, 600, 73),
(11, 'Záródugó', 1, 11111714541, 550, 73),
(12, 'Főtengely jeladó', 1, 12141709616, 46400, 73),
(13, 'O-gyűrű', 1, 12141748398, 450, 73),
(14, 'Töltőfejű csavar', 1, 11421740488, 400, 73),
(15, 'Ping érzékelő', 1, 13627568422, 36000, 73),
(16, 'Hatszögletű csavar', 2, 711913659, 200, 73),
(17, 'Fedél', 1, 11141730453, 1250, 73),
(18, 'Motorblokk tömítőkészlet', 1, 11111712981, 53000, 73),
(19, 'Motorblokk dugattyúval', 1, 11111712975, 819050, 73),
(20, 'Olajperemező', 4, 11111739907, 7000, 73),
(21, 'Hatszögletű csavar', 10, 1111735525, 400, 73),
(24, 'Fedél', 4, 11111717939, 850, 73),
(25, 'Dugó', 1, 1111268539, 250, 73),
(26, 'Illesztőhüvely', 4, 11121726238, 600, 73),
(27, 'Illesztőhüvely', 2, 1111743118, 500, 73),
(28, 'Illesztőhüvely', 2, 11121726241, 600, 73),
(29, 'Zárófedél olajszivattyúval', 1, 11141739525, 130000, 73),
(30, 'Profil tömítés', 1, 11141709593, 3200, 73),
(31, 'Tömítés', 1, 11141739868, 500, 73),
(32, 'Hatszögletű csavar alátéttel', 1, 7119905147, 400, 73),
(33, 'Hatszögletű csavar alátéttel', 4, 719904527, 200, 73),
(34, 'Torx csavar alátéttel', 3, 7129905423, 250, 73),
(35, 'Hatszögletű csavar alátéttel', 2, 719906123, 300, 73),
(36, 'Hatszögletű csavar alátéttel', 1, 7119905377, 200, 73),
(37, 'Hatszögletű csavar alátéttel', 1, 7119905855, 350, 73),
(38, 'Illesztőhüvely', 2, 11121726242, 400, 73),
(39, 'Időzítő tok fedele (felső)', 1, 11141433353, 38900, 73),
(40, 'Időzítő tok fedele (alsó)', 1, 11141439645, 63450, 73),
(41, 'Tengelytömítés', 1, 11141439570, 10050, 73),
(42, 'Tengely helyzetérzékelő', 1, 12147518628, 46500, 73),
(43, 'O-gyűrű', 1, 12141748398, 400, 73),
(44, 'Töltőfejű csavar', 1, 11421740488, 400, 73),
(45, 'Hatszögletű csavar alátéttel', 10, 719904589, 200, 73),
(46, 'Hatszögletű csavar alátéttel', 1, 7119905532, 500, 73),
(47, 'Hatszögletű csavar alátéttel', 3, 719904527, 150, 73),
(48, 'Hatszögletű csavar alátéttel', 11, 719906123, 350, 73),
(49, 'Hatszögletű csavar alátéttel', 2, 719906270, 1100, 73),
(50, 'Profil tömítés', 1, 11141709594, 2600, 73),
(51, 'Tömítés', 1, 11141739905, 6250, 73),
(52, 'Tömítés', 1, 11141739906, 7000, 73),
(53, 'Csatlakozó ház', 1, 12521433917, 850, 73),
(54, 'SLK 2.8 ELA csatlakozó', 1, 12520143433, 1600, 73),
(55, 'Védő sapka', 1, 12521732694, 800, 73),
(56, 'Olajteknő', 1, 11131432721, 125000, 73),
(57, 'Olajleeresztő csavar', 1, 11137535106, 1200, 73),
(58, 'Tömítőgyűrű', 1, 711963151, 200, 73),
(59, 'Tőcsavar', 3, 7129904544, 500, 73),
(60, 'Olajterelő', 1, 11131709575, 1200, 73),
(61, 'Csavar', 4, 11131247056, 250, 73),
(62, 'Olajteknő tömítés', 1, 11131432109, 10000, 73),
(63, 'Hatszögletű csavar alátéttel', 1, 11141747633, 400, 73),
(64, 'Hatszögletű csavar alátéttel', 18, 719906123, 200, 73),
(65, 'Hatszögletű csavar alátéttel', 2, 719906124, 500, 73),
(66, 'Nívópálca', 1, 11431247530, 2000, 73),
(67, 'Vezető cső', 1, 11431432748, 1500, 73),
(68, 'O-gyűrű', 2, 11431717666, 300, 73),
(69, 'O-gyűrű', 1, 11431287541, 450, 73),
(70, 'Hatszögletű csavar alátéttel', 2, 719906124, 200, 73),
(71, 'Hatszögletű csavar alátéttel', 18, 719906123, 500, 73),
(72, 'Hatszögletű csavar alátéttel', 1, 719906085, 200, 73),
(73, 'Hatszögletű csavar alátéttel', 1, 719900509, 500, 73),
(74, 'Olajszint érzékelő', 1, 12617508003, 45000, 73),
(75, 'Tömítőgyűrű', 1, 12611744292, 2000, 73),
(76, 'Peremes anya', 3, 7129904553, 250, 73),
(77, 'Kiegyenlítő tengely ház', 1, 11271433604, 30000, 73),
(78, 'Torx csavar', 6, 11271433607, 250, 73),
(79, 'Távtartó', 1, 11271439584, 1000, 73),
(80, 'Tőcsavar', 6, 11271711992, 600, 73),
(81, 'Illesztőhüvely', 2, 11121726238, 500, 73),
(82, 'Hengerfej', 1, 111217116621, 125000, 73),
(83, 'Szelepvezető', 8, 11121709860, 2000, 73),
(84, 'Tőcsavar', 1, 7129908122, 120, 73),
(85, 'Peremes anya', 1, 11617545279, 300, 73),
(86, 'Tőcsavar', 5, 11617545279, 250, 73),
(87, 'Tőcsavar', 8, 7129908122, 250, 73),
(88, 'Tömítőgyűrű', 1, 719963073, 50, 73),
(89, 'Zárócsavar', 1, 7119904393, 600, 73),
(90, 'Zárócsavar', 1, 711919017, 600, 73),
(91, 'Kipufogó szelepülés gyűrű', 4, 11121715253, 7500, 73),
(92, 'Hengerfej fedél', 1, 11121739645, 15000, 73),
(93, 'Hengerfej tömítés', 1, 11121432885, 5000, 73),
(94, 'Olajbetöltő dugó', 1, 11121743294, 2000, 73),
(95, 'Peremes csavar', 8, 11127568809, 450, 73),
(96, 'Alátét', 8, 11121721896, 400, 73),
(97, 'Tömítés', 8, 11121721879, 200, 73),
(98, 'Kartergáz szűrő', 1, 11157501567, 10000, 73),
(99, 'Alátétes csavar', 2, 7119900678, 300, 73),
(100, 'Kartergáz cső', 1, 11151743386, 10000, 73),
(101, 'Kartergáz cső bilincs', 1, 7129952109, 300, 73),
(102, 'Kartergáz cső bilincs', 1, 7129952107, 300, 73),
(103, 'Vízcső csatlakozó', 1, 11531708808, 3500, 73),
(104, 'O-gyűrű', 1, 11511739691, 600, 73),
(105, 'Hatszögletű csavar alátéttel', 2, 719904527, 200, 73),
(106, 'Hengerfej csavar készlet', 1, 11121721939, 7500, 73),
(107, 'Alátét készlet', 1, 11127550856, 200, 73),
(108, 'Hengerfej tömítés', 1, 11121708585, 10000, 73),
(109, 'Tartó', 1, 11611739345, 2000, 73),
(110, 'Bilincs', 1, 11611739346, 2000, 73),
(111, 'Hatszögletű csavar alátéttel', 1, 7119901679, 200, 73),
(112, 'Hatszögletű csavar', 1, 711912478, 500, 73),
(113, 'Csavar dugó', 1, 711991928, 300, 73),
(114, 'Tömítőgyűrű', 1, 7119963201, 100, 73),
(115, 'Hőmérséklet jeladó', 1, 13621433076, 5000, 73),
(116, 'Aljzat ház', 1, 12521427787, 500, 73),
(117, 'Rezgéscsillapító', 1, 11231708816, 2500, 73),
(118, 'Főtengely szíjtárcsa', 1, 11281433684, 3000, 73),
(119, 'Hatszögletű csavar alátéttel', 3, 7119905527, 200, 73),
(120, 'Hatszögletű csavar', 1, 11211721100, 500, 73),
(121, 'Alátét', 1, 11231709977, 200, 73),
(122, 'Vezérműlánc fogaskerék', 1, 11211717913, 5000, 73),
(123, 'Woodruff kulcs', 1, 711951480, 300, 73),
(124, 'Hosszbordás szíj vízpumpához', 1, 11281437369, 10000, 73),
(125, 'Szíjfeszítő', 1, 11281432104, 5000, 73),
(126, 'Porvédő', 1, 11281435114, 2000, 73),
(127, 'Csavar', 1, 7119905720, 500, 73),
(128, 'Terelőgörgő', 1, 11281435594, 12500, 73),
(129, 'Porvédő', 1, 11281435114, 1000, 73),
(130, 'Hosszbordás szíj klímakompresszorhoz', 1, 11281433948, 10000, 73),
(131, 'Szíjfeszítő', 1, 11281433571, 15000, 73),
(132, 'Hatszögletű csavar alátéttel', 2, 7119905533, 200, 73),
(133, 'Lendkerék', 1, 21207508409, 150000, 73),
(134, 'Hatszögletű csavar', 8, 1122243051, 1000, 73),
(135, 'Illesztő csap', 3, 11221709069, 2000, 73),
(136, 'Illesztő hüvely', 1, 11121726242, 600, 73),
(137, 'Hatszögletű csavar', 8, 1122243051, 1000, 73),
(138, 'Csapágy', 1, 11211720310, 10000, 73),
(139, 'Dugattyú', 4, 11251437176, 1000000, 73),
(140, 'Hajtókar illesztő gyűrű', 8, 7119934460, 100, 73),
(141, 'Dugattyúgyűrűk', 4, 11251437061, 15000, 73),
(142, 'Hajtókar', 1, 11241437617, 35000, 73),
(143, 'Dugattyú csapszeg', 4, 11241278209, 5000, 73),
(144, 'Hajtókar csavar', 8, 11241739729, 6400, 73),
(145, 'Csapágy héj felső', 4, 11241284850, 5000, 73),
(146, 'Csapágy héj alsó', 4, 11241284849, 5000, 73),
(147, 'Főtengely', 1, 11211433591, 35000, 73),
(148, 'Főtengely csapágy felső', 4, 11211706847, 5000, 73),
(149, 'Főtengely vezetőcsapágy felső', 1, 11211743457, 5000, 73),
(150, 'Főtengely vezetőcsapágy alsó', 5, 11211717526, 5000, 73),
(151, 'Főtengely fordulat szám jeladó', 1, 11211247050, 15000, 73),
(152, 'Rögzítő csavar', 4, 11211739272, 1000, 73),
(153, 'Vezérműlánc', 1, 11311734392, 22845, 73),
(154, 'Lánckerék', 1, 11311435992, 5810, 73),
(155, 'Hatszögletű csavar', 4, 11311727306, 151, 73),
(156, 'Lánckerék', 1, 11211717913, 9846, 73),
(157, 'Ékkulcs', 1, 7119951480, 308, 73),
(158, 'Vezetősín', 1, 11311435969, 11277, 73),
(159, 'Ovális fejű csavar forgásgátlóval', 2, 7129904259, 879, 73),
(160, 'Vezető', 1, 11311734694, 5698, 73),
(161, 'Belső Torx csavar alátéttel', 2, 7129905558, 154, 73),
(162, 'Láncfeszítő', 1, 11311435970, 11071, 73),
(163, 'Persely', 1, 11311247452, 2093, 73),
(164, 'Hatszögletű csavar', 1, 7119904504, 403, 73),
(165, 'Láncfeszítő', 1, 11311247952, 21500, 73),
(166, 'O-gyűrű', 1, 11121247857, 200, 73),
(167, 'Tányérfejű csavar alátéttel', 3, 7119900678, 248, 73),
(168, 'Jeladó kerék', 1, 11311435847, 5000, 73),
(169, 'Alátét', 2, 7119904202, 250, 73),
(170, 'Vezérműtengely', 1, 11311436853, 25000, 73),
(171, 'Görgős himba kar', 8, 11331747592, 19278, 73),
(172, 'Pozícionáló elem', 8, 11331712010, 11375, 73),
(173, 'Szívószelep', 4, 11341739114, 20000, 73),
(174, 'Szívószelep +0,1mm túlmértes VA rendszerhez', 4, 11341739659, 14942, 73),
(175, 'Szívószelep +0,2mm túlmértes VA rendszerhez', 4, 11341739660, 14942, 73),
(176, 'Kipufogószelep +0,1mm túlmértes VA rendszerhez', 4, 11341739666, 40086, 73),
(177, 'Kipufogószelep +0,1mm túlmértes VA rendszerhez', 4, 11341739668, 20000, 73),
(178, 'Kipufogószelep +0,2mm túlmértes VA rendszerhez', 4, 11341739667, 40233, 73),
(179, 'Kipufogószelep +0,2mm túlmértes VA rendszerhez', 4, 11341739669, 6000, 73),
(180, 'Kipufogószelep', 4, 11341739113, 5000, 73),
(181, 'Javítókészlet szelepszár tömítőgyűrűhöz', 1, 11349059171, 12352, 73),
(182, 'Alsó rugótányér', 8, 11341735254, 1318, 73),
(183, 'Szeleprugó', 8, 11341403709, 2758, 73),
(184, 'Felső rugótányér', 8, 11341436854, 1318, 73),
(185, 'Szelepék', 16, 11341307136, 378, 73),
(186, 'Olajcső', 1, 11421727054, 8925, 73),
(187, 'Üreges csavar', 1, 11121432205, 466, 73),
(188, 'Hatszögletű csavar', 2, 7119905138, 200, 73),
(189, 'Olajszűrő műanyag fedéllel', 1, 11421715878, 75068, 73),
(190, 'Olajszűrő elem készlet', 1, 11421716192, 3798, 73),
(191, 'Olajszűrő fedél', 1, 11421715960, 9258, 73),
(192, 'Persely', 1, 11421432228, 2832, 73),
(193, 'O-gyűrű', 2, 11421709513, 1008, 73),
(194, 'Tömítés (azbesztmentes)', 1, 11421709800, 847, 73),
(195, 'Hatszögletű csavar alátéttel', 4, 7119904589, 165, 73),
(196, 'Hatszögletű csavar alátéttel', 2, 7119905881, 287, 73),
(197, 'Olajnyomás kapcsoló', 1, 12618611273, 7500, 73),
(198, 'Végfedél olajpumpával', 1, 11141739525, 5000, 73),
(199, 'Rotor készlet', 1, 11141714611, 18050, 73),
(200, 'Olajpumpa fedél', 1, 11141714613, 4480, 73),
(201, 'ISA csavar', 4, 7129903401, 88, 73),
(202, 'Szabályozó szelep', 1, 11141247393, 3210, 73),
(203, 'Tekercsrugó', 1, 11411706809, 1200, 73),
(204, 'Távtartó persely', 1, 11141247397, 749, 73),
(205, 'Zárógyűrű', 1, 7119934625, 84, 73),
(206, 'Szívócső', 1, 11411432270, 6104, 73),
(207, 'O-gyűrű', 1, 11411715298, 0, 73),
(208, 'Gallér csavar', 2, 11131247056, 165, 73),
(209, 'Hűtővíz pumpa, mechanikus', 1, 11510393338, 40541, 73),
(210, 'O-gyűrű', 1, 11511714519, 2436, 73),
(211, 'Hatszögletű csavar alátéttel', 3, 7119904527, 154, 73),
(212, 'Tányérfejű csavar alátéttel', 1, 7119901977, 200, 73),
(213, 'Termosztátház termosztáttal', 1, 11531437085, 36852, 73),
(214, 'Axiális tömítés', 1, 11531437149, 1495, 73),
(215, 'Karima', 1, 11531743329, 12775, 73),
(216, 'Axiális tömítés', 1, 11531247124, 1400, 73),
(217, 'Csatlakozó', 1, 11531708808, 4141, 73),
(218, 'O-gyűrű', 1, 11511739691, 658, 73),
(219, 'Szíjtárcsa', 1, 11511739527, 10612, 73),
(220, 'Szíjtárcsa', 1, 11511437719, 5000, 73),
(221, 'Hatszögletű csavar alátéttel', 4, 7119904524, 88, 73),
(222, 'Foglalat', 1, 12521427615, 606, 73),
(223, 'Csatlakozó SLK 2.8 ELA', 2, 12521427612, 175, 73),
(224, 'Vízcső', 1, 11531436407, 14528, 73),
(225, 'Légtelenítő csavar', 1, 17111712788, 1110, 73),
(226, 'Vízcső', 1, 11531436409, 11886, 73),
(227, 'Vízcső', 1, 11531436368, 2500, 73),
(228, 'Csatlakozó', 1, 11531709232, 6195, 73),
(229, 'O-gyűrű', 1, 11531709157, 714, 73),
(230, 'Vízcső', 1, 11531247398, 5282, 73),
(231, 'Tömlő', 1, 11151743386, 11421, 73),
(232, 'Bilincs', 2, 7129952107, 326, 73),
(233, 'Bilincs', 2, 7129952109, 375, 73),
(234, 'Hűtőfolyadék hőmérséklet-érzékelő', 1, 13621433077, 8760, 73),
(235, 'Kábelkötegelő', 1, 61131391721, 620, 73),
(236, 'Hűtőfolyadék hőmérséklet-érzékelő', 1, 13621433077, 8760, 73),
(237, 'Csatlakozó SLK 2.8 ELA', 2, 12521427612, 175, 73),
(238, 'Foglalat', 1, 12521427615, 606, 73),
(239, 'Támasz', 1, 11611743662, 250, 73),
(240, 'Hatszögletű csavar', 4, 7119912478, 497, 73),
(241, 'Alátét', 6, 7119907030, 200, 73),
(242, 'Támasz', 1, 11611739345, 0, 73),
(243, 'Bilincs', 1, 11611739346, 250, 73),
(244, 'Hatszögletű csavar', 2, 7119912478, 497, 73),
(245, 'Hatszögletű csavar alátéttel', 1, 7119901679, 217, 73),
(246, 'Támasz', 1, 11611743700, 500, 73),
(247, 'Hatszögletű csavar alátéttel', 1, 7119900509, 105, 73),
(248, 'Szívócső rendszer', 1, 11611432032, 15000, 73),
(249, 'Szívócső rendszer', 1, 11611432033, 15000, 73),
(250, 'Csapcsavar', 2, 11611438821, 250, 73),
(251, 'Csapcsavar', 2, 11611438822, 200, 73),
(252, 'Profil tömítés', 4, 11611437384, 1271, 73),
(253, 'Karima', 1, 11611435716, 15733, 73),
(254, 'Profil tömítés', 4, 11611437383, 1442, 73),
(255, 'O-gyűrű', 1, 11611437691, 1967, 73),
(256, 'Peremes anya', 7, 11617545279, 165, 73),
(257, 'Hatszögletű csavar alátéttel', 1, 7119901683, 375, 73),
(258, 'Csavar', 3, 11611709223, 300, 73),
(259, 'Fedél', 1, 11611435714, 2000, 73),
(260, 'Levegőzáró szelep', 1, 11611435988, 9180, 73),
(261, 'Szívó sugárszivattyú', 1, 11611708578, 5000, 73),
(262, 'Tömlő könyök', 1, 11611435981, 2818, 73),
(263, 'Gumigyűrű', 1, 11611435984, 805, 73),
(264, 'Tömlő bilincs', 1, 7129952107, 326, 73),
(265, 'Konzol', 1, 11611437519, 728, 73),
(266, 'Klip rögzítő', 1, 61138368029, 150, 73),
(267, 'Vákuum tömlő fekete', 1, 11727545323, 5187, 73),
(268, 'T-alakú csatlakozó', 1, 11721439973, 375, 73),
(269, 'Vákuum tömlő fekete', 1, 11727545323, 5187, 73),
(270, 'Visszacsapó szelep', 1, 11611312737, 6195, 73),
(271, 'Vákuum tömlő fekete', 1, 11727545323, 5187, 73),
(272, 'Kábel tartó', 2, 12421284411, 623, 73),
(273, 'Tartály', 1, 11611318212, 2898, 73),
(274, 'Gumi rögzítő', 1, 13411705564, 840, 73),
(275, 'Kábel bilincs', 1, 12527511152, 273, 73),
(276, 'Tartó, vákuum tartály', 1, 11731707353, 0, 73),
(277, 'Gallér csavar', 5, 12517805605, 203, 73),
(278, 'Vákuum tömlő', 1, 11731437786, 500, 73),
(279, 'Elektromos szelep', 1, 11747810831, 16345, 73),
(280, 'Vákuum tömlő', 1, 11731437785, 2500, 73),
(281, 'Szelep', 1, 11721708575, 39967, 73),
(282, 'Tömítés (azbesztmentes)', 1, 11727505259, 2128, 73),
(283, 'Levegő beömlő cső', 1, 11721732925, 5000, 73),
(284, 'Önzáró hatszögletű anya', 2, 11721742644, 175, 73),
(285, 'Tömítés (azbesztmentes)', 1, 11721435367, 2128, 73),
(286, 'Hatszögletű anya', 3, 11721437202, 252, 73),
(287, 'Foglalat', 1, 12521427615, 606, 73),
(288, 'Csatlakozó SLK 2.8 ELA', 2, 12521427612, 175, 73),
(289, 'Védősapka', 1, 12521732694, 735, 73),
(290, 'Levegő szivattyú', 1, 11721715347, 139832, 73),
(291, 'Gumi rögzítő', 3, 11727559515, 5460, 73),
(292, 'Másodlagos levegő szivattyú konzol', 1, 11721703029, 0, 73),
(293, 'Hatszögletű anya tányérral', 3, 7129904553, 224, 73),
(294, 'Hatszögletű anya tányérral', 3, 7149156628, 88, 73),
(295, 'Másodlagos levegő szűrő', 1, 11721716578, 5460, 73),
(296, 'Szívócső', 1, 11721715295, 12372, 73),
(297, 'Nyomó tömlő', 1, 11721715051, 12002, 73),
(298, 'Tömlő bilincs', 1, 7129952115, 445, 73),
(299, 'Bilincs', 3, 11721716559, 497, 73),
(300, 'Önzáró hatszögletű anya', 3, 64509123157, 245, 73),
(301, 'Táguló szegecs', 1, 17111712963, 95, 73),
(302, 'Kipufogócső', 1, 11621732924, 10000, 73),
(303, 'Kipufogócső', 1, 11621437233, 24000, 73),
(304, 'Csapcsavar', 2, 11621437204, 500, 73),
(305, 'Csapcsavar', 1, 11621437203, 500, 73),
(306, 'Csapcsavar', 4, 11621708999, 770, 73),
(307, 'Tömítés hővédő pajzzsal azbesztmentes', 1, 11621743719, 16128, 73),
(308, 'Hatszögletű anya peremes', 8, 18307620549, 500, 73),
(309, 'Hatszögletű anya', 4, 18301737774, 578, 73),
(310, 'Tömítés (azbesztmentes)', 1, 18301728208, 6181, 73),
(311, 'Hatszögletű anya', 4, 18301737774, 578, 73),
(312, 'Törlőlapát STARK SKWIB-0940064', 1, 4059191307012, 3283, NULL),
(313, 'Törlőlapát BOSCH Aerotwin Retro AR 531 S', 2, 3397118901, 10071, NULL),
(314, '2204218 TotalEnergies Quartz INEO Long Life 5W-30 5L', 1, 2204218, 20293, NULL),
(315, '109471 MOTUL 8100 X-CLEAN EFE 5W-30 5L', 1, 109471, 21531, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tipus`
--

CREATE TABLE `tipus` (
  `tipus_id` int(11) NOT NULL,
  `tipus` varchar(50) NOT NULL,
  `kivitel` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `motorkod` varchar(50) DEFAULT NULL,
  `gyartasiciklus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `tipus`
--

INSERT INTO `tipus` (`tipus_id`, `tipus`, `kivitel`, `model`, `motorkod`, `gyartasiciklus`) VALUES
(1, 'E21', 'Szedán', '315', 'M10B15', '1979-1983'),
(2, 'E21', 'Szedán', '316', 'M10B16', '1975-1983'),
(3, 'E21', 'Szedán', '318', 'M10B18', '1981-1983'),
(4, 'E21', 'Szedán', '320', 'M20B20', '1975-1983'),
(5, 'E21', 'Szedán', '320i', 'M20B20', '1978-1983'),
(6, 'E21', 'Szedán', '323i', 'M20B23', '1978-1982'),
(7, 'E21', 'Szedán', '316i', 'M10B18', '1983'),
(8, 'E21', 'Szedán', '320is', 'M20B20', '1983'),
(9, 'E21', 'Szedán', '323i (Baur)', 'M20B23', '1978-1982'),
(10, 'E21', 'Szedán', '316 (16V)', 'M10B16', '1982-1983'),
(11, 'E21', 'Szedán', '320 (16V)', 'M20B20', '1982-1983'),
(12, 'E21', 'Szedán', 'Baur TC', 'M20B23', '1979-1983'),
(13, 'E30', 'Coupé', '316', 'M10B16', '1982-1986'),
(14, 'E30', 'Coupé', '316i', 'M40B16', '1987-1994'),
(15, 'E30', 'Coupé', '318i', 'M10B18', '1983-1994'),
(16, 'E30', 'Coupé', '320i', 'M20B20', '1982-1985'),
(17, 'E30', 'Coupé', '323i', 'M20B23', '1982-1985'),
(18, 'E30', 'Coupé', '325e', 'M20B27', '1985-1987'),
(19, 'E30', 'Coupé', '325i', 'M20B25', '1985-1992'),
(20, 'E30', 'Coupé', 'M3', 'S14B23', '1982-1991'),
(21, 'E30', 'Szedán', '316', 'M10B16', '1982-1987'),
(22, 'E30', 'Szedán', '316i', 'M40B16', '1987-1994'),
(23, 'E30', 'Szedán', '318i', 'M10B18', '1982-1987'),
(24, 'E30', 'Szedán', '320i', 'M20B20', '1982-1985'),
(25, 'E30', 'Szedán', '323i', 'M20B23', '1982-1985'),
(26, 'E30', 'Szedán', '325e', 'M20B27', '1985-1987'),
(27, 'E30', 'Szedán', '325i', 'M20B25', '1983-1992'),
(28, 'E30', 'Touring', '316i', 'M40B16', '1987-1994'),
(29, 'E30', 'Touring', '318i', 'M10B18', '1989-1994'),
(30, 'E30', 'Touring', '320i', 'M20B20', '1987-1991'),
(31, 'E30', 'Touring', '324td', 'M21', '1988-1994'),
(32, 'E30', 'Touring', '325i', 'M20B25', '1987-1994'),
(33, 'E30', 'Touring', '325ix', 'M20B25', '1988-1994'),
(34, 'E30', 'Kabrió', '318i', 'M40B16', '1987-1994'),
(35, 'E30', 'Kabrió', '320i', 'M20B20', '1987-1994'),
(36, 'E30', 'Kabrió', '325i', 'M20B25', '1987-1994'),
(37, 'E30', 'Kabrió', '325ix', 'M20B25', '1987-1994'),
(38, 'E36', 'Szedán', '316', 'M43B16', '1990-1997'),
(39, 'E36', 'Szedán', '318i', 'M42B18', '1990-1994'),
(40, 'E36', 'Szedán', '318is', 'M44B19', '1992-1996'),
(41, 'E36', 'Szedán', '320i', 'M50B20', '1990-1998'),
(42, 'E36', 'Szedán', '323i', 'M52B25', '1995-2000'),
(43, 'E36', 'Szedán', '325i', 'M50B25', '1990-1995'),
(44, 'E36', 'Szedán', '328i', 'M52B28', '1995-2000'),
(45, 'E36', 'Szedán', '316i', 'M43B16', '1990-1994'),
(46, 'E36', 'Szedán', '320i', 'M52B20', '1996-1998'),
(47, 'E36', 'Szedán', '325td', 'M21', '1991-1998'),
(48, 'E36', 'Szedán', '325tds', 'M51B25', '1993-1998'),
(49, 'E36', 'Coupé', '316i', 'M43B16', '1991-1999'),
(50, 'E36', 'Coupé', '318i', 'M42B18', '1992-1999'),
(51, 'E36', 'Coupé', '318is', 'M44B19', '1992-1996'),
(52, 'E36', 'Coupé', '320i', 'M50B20', '1991-1999'),
(53, 'E36', 'Coupé', '323i', 'M52B25', '1995-1999'),
(54, 'E36', 'Coupé', '325i', 'M50B25', '1992-1999'),
(55, 'E36', 'Coupé', '328i', 'M52B28', '1995-1999'),
(56, 'E36', 'Kabrió', '318i', 'M43B16', '1994-1999'),
(57, 'E36', 'Kabrió', '320i', 'M50B20', '1993-1995'),
(58, 'E36', 'Kabrió', '325i', 'M50B25', '1993-1995'),
(59, 'E36', 'Kabrió', '323i', 'M52B25', '1995-1999'),
(60, 'E36', 'Kabrió', '328i', 'M52B28', '1995-1999'),
(61, 'E36', 'Compact', '316i', 'M43B16', '1993-2000'),
(62, 'E36', 'Compact', '318i', 'M42B18', '1994-2000'),
(63, 'E36', 'Compact', '318ti', 'M44B19', '1995-2000'),
(64, 'E36', 'Compact', '318tds', 'M41D17', '1995-2000'),
(65, 'E36', 'Compact', '323ti', 'M52B25', '1995-2000'),
(66, 'E36', 'Touring', '316i', 'M43B16', '1993-2000'),
(67, 'E36', 'Touring', '318i', 'M42B18', '1994-2000'),
(68, 'E36', 'Touring', '320i', 'M50B20', '1994-2000'),
(69, 'E36', 'Touring', '323i', 'M52B25', '1995-2000'),
(70, 'E36', 'Touring', '325i', 'M50B25', '1994-1999'),
(71, 'E36', 'Touring', '328i', 'M52B28', '1995-2000'),
(72, 'E36', 'Touring', '325tds', 'M41D17', '1993-1999'),
(73, 'E46', 'Szedán', '316i', 'M43B16', '1998-2001'),
(74, 'E46', 'Szedán', '318i', 'M43B19', '1998-2001'),
(75, 'E46', 'Szedán', '320i', 'M54B22', '1998-2001'),
(76, 'E46', 'Szedán', '323i', 'M52B25', '1998-2001'),
(77, 'E46', 'Szedán', '325i', 'M54B30', '1998-2001'),
(78, 'E46', 'Szedán', '328i', 'M52B28', '1998-2001'),
(79, 'E46', 'Szedán', '330i', 'M54B30', '2000-2006'),
(80, 'E46', 'Szedán', '320d', 'M47D20', '1998-2001'),
(81, 'E46', 'Szedán', '330d', 'M57D30', '1999-2001'),
(82, 'E46', 'Coupé', '316Ci', 'M43B16', '1998-2006'),
(83, 'E46', 'Coupé', '318Ci', 'M43B19', '1998-2006'),
(84, 'E46', 'Coupé', '320Ci', 'M54B22', '1998-2006'),
(85, 'E46', 'Coupé', '323Ci', 'M52B25', '1998-2006'),
(86, 'E46', 'Coupé', '325Ci', 'M54B30', '1998-2006'),
(87, 'E46', 'Coupé', '328Ci', 'M52B28', '1998-2006'),
(88, 'E46', 'Coupé', '330Ci', 'M54B30', '2000-2006'),
(89, 'E46', 'Coupé', '320Cd', 'M47D20', '1998-2006'),
(90, 'E46', 'Coupé', '330Cd', 'M57D30', '1999-2006'),
(91, 'E46', 'Coupé', 'M3', 'S54B32', '2000-2006'),
(92, 'E46', 'Kabrió', '316Ci', 'M43B16', '1998-2006'),
(93, 'E46', 'Kabrió', '318Ci', 'M43B19', '1998-2006'),
(94, 'E46', 'Kabrió', '320Ci', 'M54B22', '1998-2006'),
(95, 'E46', 'Kabrió', '323Ci', 'M52B25', '1998-2006'),
(96, 'E46', 'Kabrió', '325Ci', 'M54B30', '1998-2006'),
(97, 'E46', 'Kabrió', '330Ci', 'M54B30', '2000-2006'),
(98, 'E46', 'Kabrió', '320Cd', 'M47D20', '1998-2006'),
(99, 'E46', 'Kabrió', '330Cd', 'M57D30', '1999-2006'),
(100, 'E46', 'Compact', '316ti', 'M43B16', '1998-2005'),
(101, 'E46', 'Compact', '318ti', 'M43B19', '1998-2005'),
(102, 'E46', 'Compact', '320td', 'M47D20', '2000-2005'),
(103, 'E46', 'Touring', '316i', 'M43B16', '1998-2005'),
(104, 'E46', 'Touring', '318i', 'M43B19', '1998-2005'),
(105, 'E46', 'Touring', '320i', 'M54B22', '1998-2005'),
(106, 'E46', 'Touring', '323i', 'M52B25', '1998-2005'),
(107, 'E46', 'Touring', '325i', 'M54B30', '1998-2005'),
(108, 'E46', 'Touring', '328i', 'M52B28', '1998-2005'),
(109, 'E46', 'Touring', '330i', 'M54B30', '2000-2005'),
(110, 'E46', 'Touring', '320d', 'M47D20', '1998-2005'),
(111, 'E46', 'Touring', '330d', 'M57D30', '1999-2005'),
(112, 'E90', 'Szedán', '316i', 'M43B16', '2005-2012'),
(113, 'E90', 'Szedán', '316i (ED)', 'N43B16', '2008-2012'),
(114, 'E90', 'Szedán', '318i', 'M43B18', '2005-2012'),
(115, 'E90', 'Szedán', '318i (ED)', 'N43B18', '2008-2012'),
(116, 'E90', 'Szedán', '320i', 'N43B20', '2005-2012'),
(117, 'E90', 'Szedán', '323i', 'N52B25', '2006-2012'),
(118, 'E90', 'Szedán', '325i', 'N52B30', '2005-2012'),
(119, 'E90', 'Szedán', '330i', 'N52B30', '2005-2012'),
(120, 'E90', 'Szedán', '335i', 'N54B30', '2006-2012'),
(121, 'E90', 'Szedán', '320d', 'M47D20', '2005-2012'),
(122, 'E90', 'Szedán', '325d', 'N57D20', '2006-2012'),
(123, 'E90', 'Szedán', '330d', 'N57D30', '2005-2012'),
(124, 'E90', 'Szedán', '335d', 'N57D30', '2008-2012'),
(125, 'E90', 'Szedán', 'M3', 'S65B40', '2007-2013'),
(126, 'E91', 'Touring', '316i', 'N43B16', '2005-2012'),
(127, 'E91', 'Touring', '318i', 'N43B20', '2005-2012'),
(128, 'E91', 'Touring', '320i', 'N43B20', '2005-2012'),
(129, 'E91', 'Touring', '323i', 'N52B25', '2006-2012'),
(130, 'E91', 'Touring', '325i', 'N52B30', '2005-2012'),
(131, 'E91', 'Touring', '330i', 'N52B30', '2005-2012'),
(132, 'E91', 'Touring', '335i', 'N54B30', '2006-2012'),
(133, 'E91', 'Touring', '320d', 'M47D20', '2005-2012'),
(134, 'E91', 'Touring', '325d', 'N57D20', '2006-2012'),
(135, 'E91', 'Touring', '330d', 'N57D30', '2005-2012'),
(136, 'E91', 'Touring', '335d', 'N57D30', '2008-2012'),
(137, 'E92', 'Coupé', '316i', 'N43B16', '2006-2013'),
(138, 'E92', 'Coupé', '318i', 'N43B20', '2006-2013'),
(139, 'E92', 'Coupé', '320i', 'N43B20', '2006-2013'),
(140, 'E92', 'Coupé', '323i', 'N52B25', '2007-2013'),
(141, 'E92', 'Coupé', '325i', 'N52B30', '2006-2013'),
(142, 'E92', 'Coupé', '330i', 'N52B30', '2006-2013'),
(143, 'E92', 'Coupé', '335i', 'N54B30', '2007-2013'),
(144, 'E92', 'Coupé', 'M3', 'S65B40', '2007-2013'),
(145, 'E92', 'Coupé', '320d', 'M47D20', '2006-2013'),
(146, 'E92', 'Coupé', '325d', 'N57D20', '2007-2013'),
(147, 'E92', 'Coupé', '330d', 'N57D30', '2006-2013'),
(148, 'E92', 'Coupé', '335d', 'N57D30', '2008-2013'),
(149, 'E93', 'Kabrió', '316i', 'N43B16', '2007-2013'),
(150, 'E93', 'Kabrió', '318i', 'N43B20', '2007-2013'),
(151, 'E93', 'Kabrió', '320i', 'N43B20', '2007-2013'),
(152, 'E93', 'Kabrió', '323i', 'N52B25', '2007-2013'),
(153, 'E93', 'Kabrió', '325i', 'N52B30', '2007-2013'),
(154, 'E93', 'Kabrió', '330i', 'N52B30', '2007-2013'),
(155, 'E93', 'Kabrió', '335i', 'N54B30', '2007-2013'),
(156, 'E93', 'Kabrió', 'M3', 'S65B40', '2007-2013'),
(157, 'E93', 'Kabrió', '320d', 'M47D20', '2007-2013'),
(158, 'E93', 'Kabrió', '325d', 'N57D20', '2007-2013'),
(159, 'E93', 'Kabrió', '330d', 'N57D30', '2007-2013'),
(160, 'E93', 'Kabrió', '335d', 'N57D30', '2008-2013'),
(161, 'F30', 'Szedán', '316i', 'N13B16', '2011-2019'),
(162, 'F30', 'Szedán', '318i', 'N18B20', '2012-2019'),
(163, 'F30', 'Szedán', '320i', 'N20B20', '2011-2019'),
(164, 'F30', 'Szedán', '328i', 'N20B20', '2011-2016'),
(165, 'F30', 'Szedán', '330i', 'B48B20', '2016-2019'),
(166, 'F30', 'Szedán', '335i', 'N55B30', '2011-2016'),
(167, 'F30', 'Szedán', '340i', 'B58B30', '2016-2019'),
(168, 'F30', 'Szedán', '316d', 'N47D20', '2012-2019'),
(169, 'F30', 'Szedán', '318d', 'N47D20', '2012-2019'),
(170, 'F30', 'Szedán', '320d', 'N47D20', '2011-2019'),
(171, 'F30', 'Szedán', '325d', 'N57D20', '2012-2019'),
(172, 'F30', 'Szedán', '330d', 'N57D30', '2012-2019'),
(173, 'F30', 'Szedán', '335d', 'N57D30', '2012-2019'),
(174, 'F31', 'Touring', '316i', 'N13B16', '2012-2019'),
(175, 'F31', 'Touring', '318i', 'N18B20', '2012-2019'),
(176, 'F31', 'Touring', '320i', 'N20B20', '2012-2019'),
(177, 'F31', 'Touring', '328i', 'N20B20', '2012-2016'),
(178, 'F31', 'Touring', '330i', 'B48B20', '2016-2019'),
(179, 'F31', 'Touring', '335i', 'N55B30', '2012-2016'),
(180, 'F31', 'Touring', '340i', 'B58B30', '2016-2019'),
(181, 'F31', 'Touring', '316d', 'N47D20', '2012-2019'),
(182, 'F31', 'Touring', '318d', 'N47D20', '2012-2019'),
(183, 'F31', 'Touring', '320d', 'N47D20', '2012-2019'),
(184, 'F31', 'Touring', '325d', 'N57D20', '2012-2019'),
(185, 'F31', 'Touring', '330d', 'N57D30', '2012-2019'),
(186, 'F31', 'Touring', '335d', 'N57D30', '2012-2019'),
(187, 'F34', 'Gran Turismo', '316i', 'N13B16', '2013-2019'),
(188, 'F34', 'Gran Turismo', '318i', 'N18B20', '2013-2019'),
(189, 'F34', 'Gran Turismo', '320i', 'N20B20', '2013-2019'),
(190, 'F34', 'Gran Turismo', '328i', 'N20B20', '2013-2016'),
(191, 'F34', 'Gran Turismo', '330i', 'B48B20', '2016-2019'),
(192, 'F34', 'Gran Turismo', '335i', 'N55B30', '2013-2016'),
(193, 'F34', 'Gran Turismo', '340i', 'B58B30', '2016-2019'),
(194, 'F34', 'Gran Turismo', '316d', 'N47D20', '2013-2019'),
(195, 'F34', 'Gran Turismo', '318d', 'N47D20', '2013-2019'),
(196, 'F34', 'Gran Turismo', '320d', 'N47D20', '2013-2019'),
(197, 'F34', 'Gran Turismo', '325d', 'N57D20', '2013-2019'),
(198, 'F34', 'Gran Turismo', '330d', 'N57D30', '2013-2019'),
(199, 'F34', 'Gran Turismo', '335d', 'N57D30', '2013-2019'),
(200, 'F80', 'Szedán', 'M3', 'S55B30', '2014-2019'),
(201, 'G20', 'Szedán', '316i', 'B38B15', '2018-'),
(202, 'G20', 'Szedán', '318i', 'B38B15', '2018-'),
(203, 'G20', 'Szedán', '320i', 'B48B20', '2018-'),
(204, 'G20', 'Szedán', '330i', 'B48B20', '2018-'),
(205, 'G20', 'Szedán', 'M340i', 'B58B30', '2018-'),
(206, 'G20', 'Szedán', '316d', 'B37D15', '2018-'),
(207, 'G20', 'Szedán', '318d', 'B47D20', '2018-'),
(208, 'G20', 'Szedán', '320d', 'B47D20', '2018-'),
(209, 'G20', 'Szedán', '330d', 'B57D30', '2018-'),
(210, 'G21', 'Touring', '316i', 'B38B15', '2018-'),
(211, 'G21', 'Touring', '318i', 'B38B15', '2018-'),
(212, 'G21', 'Touring', '320i', 'B48B20', '2018-'),
(213, 'G21', 'Touring', '330i', 'B48B20', '2018-'),
(214, 'G21', 'Touring', 'M340i', 'B58B30', '2018-'),
(215, 'G21', 'Touring', '316d', 'B37D15', '2018-'),
(216, 'G21', 'Touring', '318d', 'B47D20', '2018-'),
(217, 'G21', 'Touring', '320d', 'B47D20', '2018-'),
(218, 'G21', 'Touring', '330d', 'B57D30', '2018-'),
(219, 'G28', 'Gran Limousine', '316i', 'B38B15', '2018-'),
(220, 'G28', 'Gran Limousine', '318i', 'B38B15', '2018-'),
(221, 'G28', 'Gran Limousine', '320i', 'B48B20', '2018-'),
(222, 'G28', 'Gran Limousine', '330i', 'B48B20', '2018-'),
(223, 'G28', 'Gran Limousine', 'M340i', 'B58B30', '2018-'),
(224, 'G28', 'Gran Limousine', '316d', 'B37D15', '2018-'),
(225, 'G28', 'Gran Limousine', '318d', 'B47D20', '2018-'),
(226, 'G28', 'Gran Limousine', '320d', 'B47D20', '2018-'),
(227, 'G28', 'Gran Limousine', '330d', 'B57D30', '2018-'),
(228, 'G80', 'Szedán', 'M3', 'S58B30', '2020-'),
(229, 'G81', 'Touring', 'M3', 'S58B30', '2022-');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`felhasznalo_id`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`rendeles_id`),
  ADD KEY `felhasznalo_id` (`felhasznalo_id`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`termek_id`),
  ADD KEY `tipus_id` (`tipus_id`);

--
-- A tábla indexei `tipus`
--
ALTER TABLE `tipus`
  ADD PRIMARY KEY (`tipus_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhasznalo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `rendeles_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT a táblához `tipus`
--
ALTER TABLE `tipus`
  MODIFY `tipus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD CONSTRAINT `felhasznalok_ibfk_1` FOREIGN KEY (`felhasznalo_id`) REFERENCES `rendelesek` (`felhasznalo_id`);

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `rendelesek_ibfk_1` FOREIGN KEY (`termek_id`) REFERENCES `termekek` (`termek_id`);

--
-- Megkötések a táblához `termekek`
--
ALTER TABLE `termekek`
  ADD CONSTRAINT `termekek_ibfk_1` FOREIGN KEY (`tipus_id`) REFERENCES `tipus` (`tipus_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
