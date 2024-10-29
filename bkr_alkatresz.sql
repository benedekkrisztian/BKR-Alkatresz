-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 28. 10:26
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
-- Adatbázis: `bkr_alkatresz`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `f_id` int(11) NOT NULL,
  `f_felhasznalonev` varchar(30) NOT NULL,
  `f_jelszo` varchar(20) NOT NULL,
  `f_email` varchar(30) NOT NULL,
  `f_club` tinyint(1) NOT NULL,
  `f_club_periodus` datetime NOT NULL,
  `f_kartyanev` text NOT NULL,
  `f_kartyaszam` int(16) NOT NULL,
  `f_kartyalejaratidatum` int(11) NOT NULL,
  `f_kartyacvvcvc` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `garazs`
--

CREATE TABLE `garazs` (
  `g_nev` varchar(15) NOT NULL,
  `g_tipus` varchar(15) NOT NULL,
  `g_evjarat` int(4) NOT NULL,
  `g_uzemanyag` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kereses`
--

CREATE TABLE `kereses` (
  `k_tipus` varchar(6) NOT NULL,
  `k_kivitel` varchar(6) NOT NULL,
  `k_model` varchar(6) NOT NULL,
  `k_gyartasidatum` date NOT NULL,
  `k_motor` varchar(6) NOT NULL,
  `k_kormanyzas` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

CREATE TABLE `rendeles` (
  `r_id` int(11) NOT NULL,
  `r_nev` varchar(30) NOT NULL,
  `r_varos` varchar(20) NOT NULL,
  `r_utca` varchar(30) NOT NULL,
  `r_hazszam` varchar(5) NOT NULL,
  `r_iranyitoszam` int(4) NOT NULL,
  `r_telefonszam` int(11) NOT NULL,
  `r_alkatreszszam` int(10) NOT NULL,
  `r_rendelesdatum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `t_id` int(11) NOT NULL,
  `t_leiras` varchar(99) NOT NULL,
  `t_darabszam` int(10) NOT NULL,
  `t_alkatreszszam` int(11) NOT NULL,
  `t_ar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`f_id`);

--
-- A tábla indexei `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`r_id`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`t_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `termek`
--
ALTER TABLE `termek`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
