-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2023 a las 21:00:13
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `batallaraces`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `battle`
--

CREATE TABLE `battle` (
  `battle_id` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `id_warrior` int(11) NOT NULL,
  `warrior_weapon_id` int(11) NOT NULL,
  `oponent_id` int(11) NOT NULL,
  `oponent_weapon_id` int(11) NOT NULL,
  `injuries_caused` int(11) NOT NULL,
  `injuries_suffered` int(11) NOT NULL,
  `battle_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `player_name` char(30) NOT NULL,
  `player_password` char(30) NOT NULL,
  `player_global_points` int(11) DEFAULT NULL,
  `player_enemies_defeated` int(11) DEFAULT NULL,
  `player_damage_done` int(11) DEFAULT NULL,
  `player_damage_taken` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `players`
--

INSERT INTO `players` (`player_id`, `player_name`, `player_password`, `player_global_points`, `player_enemies_defeated`, `player_damage_done`, `player_damage_taken`) VALUES
(1, 'pau', 'admin', 0, 0, 0, 0),
(2, 'pol', 'admin', 0, 0, 0, 0),
(3, 'jordi', 'admin', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `races`
--

CREATE TABLE `races` (
  `race_id` int(11) NOT NULL,
  `race_name` char(20) DEFAULT NULL,
  `race_points` int(11) DEFAULT NULL,
  `race_life` int(11) DEFAULT NULL,
  `race_strenght` int(11) DEFAULT NULL,
  `race_defense` int(11) DEFAULT NULL,
  `race_agility` int(11) DEFAULT NULL,
  `race_speed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `races`
--

INSERT INTO `races` (`race_id`, `race_name`, `race_points`, `race_life`, `race_strenght`, `race_defense`, `race_agility`, `race_speed`) VALUES
(1, 'Nan', 21, 60, 6, 4, 4, 3),
(2, 'Huma', 20, 50, 5, 3, 6, 5),
(3, 'Elf', 19, 40, 4, 2, 7, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warriors`
--

CREATE TABLE `warriors` (
  `warrior_id` int(11) NOT NULL,
  `warrior_name` char(30) DEFAULT NULL,
  `id_race` int(11) DEFAULT NULL,
  `warrior_image_path` char(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `warriors`
--

INSERT INTO `warriors` (`warrior_id`, `warrior_name`, `id_race`, `warrior_image_path`) VALUES
(1, 'Bombur', 1, 'personatges/bombur.png'),
(2, 'Fili', 1, 'personatges/fili.png'),
(3, 'Kili', 1, 'personatges/kili.png'),
(4, 'Faramir', 2, 'personatges/faramir.png'),
(5, 'Boromir', 2, 'personatges/boromir.png'),
(6, 'Elendil', 2, 'personatges/elendil.png'),
(7, 'Thranduil', 3, 'personatges/thranduil.png'),
(8, 'Legolas', 3, 'personatges/legolas.png'),
(9, 'Elrond', 3, 'personatges/elrond.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `weapons`
--

CREATE TABLE `weapons` (
  `weapon_id` int(11) NOT NULL,
  `weapon_name` char(30) DEFAULT NULL,
  `weapon_speed` int(11) DEFAULT NULL,
  `weapon_strenght` int(11) DEFAULT NULL,
  `weapon_image_path` char(80) DEFAULT NULL,
  `weapon_points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `weapons`
--

INSERT INTO `weapons` (`weapon_id`, `weapon_name`, `weapon_speed`, `weapon_strenght`, `weapon_image_path`, `weapon_points`) VALUES
(1, 'Dagger', 3, 0, 'armes/daga.png', 10),
(2, 'Sword', 1, 1, 'armes/espasa.png', 10),
(3, 'Axe', 0, 3, 'armes/destral.png', 10),
(4, 'Double Sword', 2, 2, 'armes/espasesDobles.png', 14),
(5, 'Scimitar', 2, 1, 'armes/simitarra.png', 14),
(6, 'Bow', 5, 1, 'armes/arc.png', 15),
(7, 'Katana', 3, 2, 'armes/katana.png', 18),
(8, 'Dirk', 4, 0, 'armes/punyal.png', 12),
(9, 'Double Axe', 0, 5, 'armes/destralDuesMans.png', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `weapons_available`
--

CREATE TABLE `weapons_available` (
  `id_race` int(11) NOT NULL,
  `id_weapon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `weapons_available`
--

INSERT INTO `weapons_available` (`id_race`, `id_weapon`) VALUES
(1, 2),
(1, 3),
(1, 8),
(1, 9),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(2, 6),
(2, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `battle`
--
ALTER TABLE `battle`
  ADD PRIMARY KEY (`battle_id`),
  ADD KEY `fk_pid_pid` (`id_player`),
  ADD KEY `fk_wid_wid` (`id_warrior`),
  ADD KEY `fk_wwid_wid` (`warrior_weapon_id`),
  ADD KEY `fk_oid_pid` (`oponent_id`),
  ADD KEY `fk_owid_wid` (`oponent_weapon_id`);

--
-- Indices de la tabla `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`),
  ADD UNIQUE KEY `player_name` (`player_name`);

--
-- Indices de la tabla `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`race_id`);

--
-- Indices de la tabla `warriors`
--
ALTER TABLE `warriors`
  ADD PRIMARY KEY (`warrior_id`),
  ADD KEY `fk_idr_rid` (`id_race`);

--
-- Indices de la tabla `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`weapon_id`);

--
-- Indices de la tabla `weapons_available`
--
ALTER TABLE `weapons_available`
  ADD KEY `fk_wid_idw` (`id_race`),
  ADD KEY `fk_weid_idwe` (`id_weapon`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `races`
--
ALTER TABLE `races`
  MODIFY `race_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `warriors`
--
ALTER TABLE `warriors`
  MODIFY `warrior_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `weapons`
--
ALTER TABLE `weapons`
  MODIFY `weapon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `battle`
--
ALTER TABLE `battle`
  ADD CONSTRAINT `fk_oid_pid` FOREIGN KEY (`oponent_id`) REFERENCES `warriors` (`warrior_id`),
  ADD CONSTRAINT `fk_owid_wid` FOREIGN KEY (`oponent_weapon_id`) REFERENCES `weapons_available` (`id_weapon`),
  ADD CONSTRAINT `fk_pid_pid` FOREIGN KEY (`id_player`) REFERENCES `players` (`player_id`),
  ADD CONSTRAINT `fk_wid_wid` FOREIGN KEY (`id_warrior`) REFERENCES `warriors` (`warrior_id`),
  ADD CONSTRAINT `fk_wwid_wid` FOREIGN KEY (`warrior_weapon_id`) REFERENCES `weapons_available` (`id_weapon`);

--
-- Filtros para la tabla `warriors`
--
ALTER TABLE `warriors`
  ADD CONSTRAINT `fk_idr_rid` FOREIGN KEY (`id_race`) REFERENCES `races` (`race_id`);

--
-- Filtros para la tabla `weapons_available`
--
ALTER TABLE `weapons_available`
  ADD CONSTRAINT `fk_weid_idwe` FOREIGN KEY (`id_weapon`) REFERENCES `weapons` (`weapon_id`),
  ADD CONSTRAINT `fk_wid_idw` FOREIGN KEY (`id_race`) REFERENCES `races` (`race_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
