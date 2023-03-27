-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 27. 10:19
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazás`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jármű`
--

CREATE TABLE `jármű` (
  `járműAzon` int(11) NOT NULL,
  `típus` varchar(20) NOT NULL,
  `városAzon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tábla csonkolása beszúrás előtt `jármű`
--

TRUNCATE TABLE `jármű`;
--
-- A tábla adatainak kiíratása `jármű`
--

INSERT INTO `jármű` (`járműAzon`, `típus`, `városAzon`) VALUES
(11, 'Honda', 1),
(12, 'Volsvágen', 2),
(13, 'Mercédes', 3),
(14, 'Terepjáró', 5),
(15, 'Kamión', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sofőr`
--

CREATE TABLE `sofőr` (
  `sofőrAzon` int(11) NOT NULL,
  `vezetékNév` varchar(30) NOT NULL,
  `keresztNév` varchar(30) NOT NULL,
  `járműAzon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tábla csonkolása beszúrás előtt `sofőr`
--

TRUNCATE TABLE `sofőr`;
--
-- A tábla adatainak kiíratása `sofőr`
--

INSERT INTO `sofőr` (`sofőrAzon`, `vezetékNév`, `keresztNév`, `járműAzon`) VALUES
(1, 'Szabo', 'Malya', 11),
(2, 'Kics', 'Elek', 15),
(3, 'Nagy', 'Ernő', 13),
(4, 'Szép', 'Maris', 14),
(5, 'Kepzesí', 'Áron', 12);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `város`
--

CREATE TABLE `város` (
  `városAzon` int(11) NOT NULL,
  `név` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tábla csonkolása beszúrás előtt `város`
--

TRUNCATE TABLE `város`;
--
-- A tábla adatainak kiíratása `város`
--

INSERT INTO `város` (`városAzon`, `név`) VALUES
(1, 'Budapest'),
(2, 'Debrecen'),
(3, 'Fót'),
(4, 'Vesegyháza'),
(5, 'Pécs');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `jármű`
--
ALTER TABLE `jármű`
  ADD PRIMARY KEY (`járműAzon`),
  ADD UNIQUE KEY `járműAzon` (`járműAzon`),
  ADD KEY `városAzon` (`városAzon`);

--
-- A tábla indexei `sofőr`
--
ALTER TABLE `sofőr`
  ADD PRIMARY KEY (`sofőrAzon`),
  ADD UNIQUE KEY `sofőrAzon` (`sofőrAzon`),
  ADD KEY `járműAzon` (`járműAzon`);

--
-- A tábla indexei `város`
--
ALTER TABLE `város`
  ADD PRIMARY KEY (`városAzon`),
  ADD UNIQUE KEY `városAzon` (`városAzon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `jármű`
--
ALTER TABLE `jármű`
  MODIFY `járműAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `sofőr`
--
ALTER TABLE `sofőr`
  MODIFY `sofőrAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `város`
--
ALTER TABLE `város`
  MODIFY `városAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jármű`
--
ALTER TABLE `jármű`
  ADD CONSTRAINT `jármű_ibfk_2` FOREIGN KEY (`városAzon`) REFERENCES `város` (`városAzon`);

--
-- Megkötések a táblához `sofőr`
--
ALTER TABLE `sofőr`
  ADD CONSTRAINT `sofőr_ibfk_1` FOREIGN KEY (`járműAzon`) REFERENCES `jármű` (`járműAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
