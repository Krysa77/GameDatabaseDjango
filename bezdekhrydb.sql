-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 11. pro 2024, 12:38
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `bezdekhrydb`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `hra`
--

CREATE TABLE `hra` (
  `id_Hra` int(11) NOT NULL,
  `nazev` varchar(45) NOT NULL,
  `rok_vydani` year(4) NOT NULL,
  `cena` int(11) NOT NULL,
  `popis` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `hra`
--

INSERT INTO `hra` (`id_Hra`, `nazev`, `rok_vydani`, `cena`, `popis`) VALUES
(1, 'Subnautica', '2018', 750, 'Descend into the depths of an alien underwater world filled with wonder and peril.'),
(2, 'Deep Rock Galactic', '2020', 750, 'Deep Rock Galactic is a 1-4 player co-op FPS featuring badass space Dwarves'),
(3, 'The Witcher 3: Wild Hunt', '2015', 500, 'You are Geralt of Rivia, mercenary monster slayer. Before you stands a war-torn, monster-infested continent you can explore at will.');

-- --------------------------------------------------------

--
-- Struktura tabulky `hrac`
--

CREATE TABLE `hrac` (
  `id_Hrac` int(11) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `hrac`
--

INSERT INTO `hrac` (`id_Hrac`, `nickname`, `email`) VALUES
(1, 'Pepa123', 'pepikmaradgulas@gmail.com'),
(2, 'MatejFojtik', 'matafojtik@seznam.cz'),
(3, 'ProFortnitePlayer', 'Ilovefortnite@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabulky `hra_has_platforma`
--

CREATE TABLE `hra_has_platforma` (
  `Hra_id_Hra` int(11) NOT NULL,
  `Platforma_id_Platforma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `hra_has_platforma`
--

INSERT INTO `hra_has_platforma` (`Hra_id_Hra`, `Platforma_id_Platforma`) VALUES
(1, 3),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `hra_has_zanr`
--

CREATE TABLE `hra_has_zanr` (
  `Hra_id_Hra` int(11) NOT NULL,
  `Zanr_id_Zanr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `hra_has_zanr`
--

INSERT INTO `hra_has_zanr` (`Hra_id_Hra`, `Zanr_id_Zanr`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Struktura tabulky `knihovna_hrace`
--

CREATE TABLE `knihovna_hrace` (
  `Hra_id_Hra` int(11) NOT NULL,
  `Hrac_id_Hrac` int(11) NOT NULL,
  `datum_ziskani` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `knihovna_hrace`
--

INSERT INTO `knihovna_hrace` (`Hra_id_Hra`, `Hrac_id_Hrac`, `datum_ziskani`) VALUES
(1, 1, '2022-12-15'),
(2, 2, '2023-08-09'),
(3, 3, '2016-03-16');

-- --------------------------------------------------------

--
-- Struktura tabulky `platforma`
--

CREATE TABLE `platforma` (
  `id_Platforma` int(11) NOT NULL,
  `nazev_platformy` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `platforma`
--

INSERT INTO `platforma` (`id_Platforma`, `nazev_platformy`) VALUES
(3, 'PC'),
(1, 'Playstation'),
(2, 'Xbox');

-- --------------------------------------------------------

--
-- Struktura tabulky `vydavatelstvi`
--

CREATE TABLE `vydavatelstvi` (
  `id_Vydavatelstvi` int(11) NOT NULL,
  `nazev_vydavatelstvi` varchar(45) NOT NULL,
  `Hra_id_Hra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `vydavatelstvi`
--

INSERT INTO `vydavatelstvi` (`id_Vydavatelstvi`, `nazev_vydavatelstvi`, `Hra_id_Hra`) VALUES
(1, ' Unknown Worlds Entertainment', 1),
(2, ' Coffee Stain Publishing', 2),
(3, ' CD PROJEKT RED', 3);

-- --------------------------------------------------------

--
-- Struktura tabulky `zanr`
--

CREATE TABLE `zanr` (
  `id_Zanr` int(11) NOT NULL,
  `nazev_zanru` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Vypisuji data pro tabulku `zanr`
--

INSERT INTO `zanr` (`id_Zanr`, `nazev_zanru`) VALUES
(3, 'Open World'),
(2, 'PvE'),
(1, 'Survival');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `hra`
--
ALTER TABLE `hra`
  ADD PRIMARY KEY (`id_Hra`),
  ADD UNIQUE KEY `nazev_UNIQUE` (`nazev`),
  ADD UNIQUE KEY `rok_vydani_UNIQUE` (`rok_vydani`);

--
-- Indexy pro tabulku `hrac`
--
ALTER TABLE `hrac`
  ADD PRIMARY KEY (`id_Hrac`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `nickname_UNIQUE` (`nickname`);

--
-- Indexy pro tabulku `hra_has_platforma`
--
ALTER TABLE `hra_has_platforma`
  ADD PRIMARY KEY (`Hra_id_Hra`,`Platforma_id_Platforma`),
  ADD KEY `fk_Hra_has_Platforma_Platforma1_idx` (`Platforma_id_Platforma`),
  ADD KEY `fk_Hra_has_Platforma_Hra_idx` (`Hra_id_Hra`);

--
-- Indexy pro tabulku `hra_has_zanr`
--
ALTER TABLE `hra_has_zanr`
  ADD PRIMARY KEY (`Hra_id_Hra`,`Zanr_id_Zanr`),
  ADD KEY `fk_Hra_has_Zanr_Zanr1_idx` (`Zanr_id_Zanr`),
  ADD KEY `fk_Hra_has_Zanr_Hra1_idx` (`Hra_id_Hra`);

--
-- Indexy pro tabulku `knihovna_hrace`
--
ALTER TABLE `knihovna_hrace`
  ADD PRIMARY KEY (`Hra_id_Hra`,`Hrac_id_Hrac`),
  ADD KEY `fk_Hra_has_Hrac_Hrac1_idx` (`Hrac_id_Hrac`),
  ADD KEY `fk_Hra_has_Hrac_Hra1_idx` (`Hra_id_Hra`);

--
-- Indexy pro tabulku `platforma`
--
ALTER TABLE `platforma`
  ADD PRIMARY KEY (`id_Platforma`),
  ADD UNIQUE KEY `nazev_platformy_UNIQUE` (`nazev_platformy`);

--
-- Indexy pro tabulku `vydavatelstvi`
--
ALTER TABLE `vydavatelstvi`
  ADD PRIMARY KEY (`id_Vydavatelstvi`),
  ADD UNIQUE KEY `nazev_vydavatelstvi_UNIQUE` (`nazev_vydavatelstvi`),
  ADD KEY `fk_Vydavatelstvi_Hra1_idx` (`Hra_id_Hra`);

--
-- Indexy pro tabulku `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`id_Zanr`),
  ADD UNIQUE KEY `nazev_zanru_UNIQUE` (`nazev_zanru`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `hra`
--
ALTER TABLE `hra`
  MODIFY `id_Hra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `hrac`
--
ALTER TABLE `hrac`
  MODIFY `id_Hrac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `platforma`
--
ALTER TABLE `platforma`
  MODIFY `id_Platforma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `vydavatelstvi`
--
ALTER TABLE `vydavatelstvi`
  MODIFY `id_Vydavatelstvi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `zanr`
--
ALTER TABLE `zanr`
  MODIFY `id_Zanr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `hra_has_platforma`
--
ALTER TABLE `hra_has_platforma`
  ADD CONSTRAINT `fk_Hra_has_Platforma_Hra` FOREIGN KEY (`Hra_id_Hra`) REFERENCES `hra` (`id_Hra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Hra_has_Platforma_Platforma1` FOREIGN KEY (`Platforma_id_Platforma`) REFERENCES `platforma` (`id_Platforma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `hra_has_zanr`
--
ALTER TABLE `hra_has_zanr`
  ADD CONSTRAINT `fk_Hra_has_Zanr_Hra1` FOREIGN KEY (`Hra_id_Hra`) REFERENCES `hra` (`id_Hra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Hra_has_Zanr_Zanr1` FOREIGN KEY (`Zanr_id_Zanr`) REFERENCES `zanr` (`id_Zanr`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `knihovna_hrace`
--
ALTER TABLE `knihovna_hrace`
  ADD CONSTRAINT `fk_Hra_has_Hrac_Hra1` FOREIGN KEY (`Hra_id_Hra`) REFERENCES `hra` (`id_Hra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Hra_has_Hrac_Hrac1` FOREIGN KEY (`Hrac_id_Hrac`) REFERENCES `hrac` (`id_Hrac`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `vydavatelstvi`
--
ALTER TABLE `vydavatelstvi`
  ADD CONSTRAINT `fk_Vydavatelstvi_Hra1` FOREIGN KEY (`Hra_id_Hra`) REFERENCES `hra` (`id_Hra`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
