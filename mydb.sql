-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-07-2018 a las 15:09:51
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte`
--

DROP TABLE IF EXISTS `deporte`;
CREATE TABLE IF NOT EXISTS `deporte` (
  `Nombre` varchar(30) NOT NULL,
  `IdDeporte` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IdDeporte`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `deporte`
--

INSERT INTO `deporte` (`Nombre`, `IdDeporte`) VALUES
('Futbol', 1),
('Baloncesto', 2),
('Voleibol', 3),
('Futsal', 4),
('Ajedrez', 5),
('Domino', 6),
('Rompecabezas', 7),
('Jenga', 8),
('Parques', 9),
('Balonmano', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deuda`
--

DROP TABLE IF EXISTS `deuda`;
CREATE TABLE IF NOT EXISTS `deuda` (
  `Fecha` datetime NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `FechaVencimiento` datetime DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  `Prestamo_IdPrestamo` int(11) NOT NULL,
  `IdDeuda` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IdDeuda`),
  KEY `fk_Deuda_Prestamo1_idx` (`Prestamo_IdPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elementodeportivo`
--

DROP TABLE IF EXISTS `elementodeportivo`;
CREATE TABLE IF NOT EXISTS `elementodeportivo` (
  `IdElemento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Cantidad` int(10) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `deporte_IdDeporte` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdElemento`),
  KEY `fk_elementodeportivo_deporte1_idx` (`deporte_IdDeporte`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `elementodeportivo`
--

INSERT INTO `elementodeportivo` (`IdElemento`, `Nombre`, `Cantidad`, `Descripcion`, `Estado`, `deporte_IdDeporte`) VALUES
(1, 'Balon-Futbol', 9, NULL, NULL, 1),
(2, 'Balon-Baloncesto.', 4, NULL, NULL, 2),
(3, 'Balon-Voleibol', 2, NULL, NULL, 3),
(4, 'Ajedrez', 2, NULL, NULL, 5),
(5, 'Balon-BalonMano', 1, NULL, NULL, 10),
(6, 'Domino', 7, NULL, NULL, 6),
(7, 'Torre De Fichas', 2, NULL, NULL, 8),
(8, 'Balon-Futsal', 3, NULL, NULL, 4),
(9, 'Parques', 2, NULL, NULL, 9),
(10, 'Rompecavezas', 1, NULL, NULL, 7),
(11, 'Balon-Robye', 1, 'Balon o o ovoide', NULL, NULL),
(12, 'Balon-Waterpoll', 1, 'Juego de agua', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `Documento` varchar(20) DEFAULT NULL,
  `Codigo` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Id_Tipo` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `Documento_UNIQUE` (`Documento`),
  KEY `fk_id_Tipo` (`Id_Tipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Documento`, `Codigo`, `Nombre`, `Apellido`, `Estado`, `Id_Tipo`) VALUES
('33515526', '1151247', 'Diego Alejandro', 'Alirio Chavez', 'Activo', 1),
('1090500051', '1151253', 'Yhuver Andrey', 'Quintero Nino', 'Activo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
CREATE TABLE IF NOT EXISTS `prestamo` (
  `ElementoDeportivo_IdElemento` int(11) NOT NULL,
  `Persona_Codigo` varchar(45) NOT NULL,
  `FechaInicio` datetime DEFAULT NULL,
  `FechaSolicitud` datetime NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `IdPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `FechaFin` datetime DEFAULT NULL,
  PRIMARY KEY (`IdPrestamo`),
  KEY `fk_ElementoDeportivo_has_Persona_Persona1_idx` (`Persona_Codigo`),
  KEY `fk_ElementoDeportivo_has_Persona_ElementoDeportivo_idx` (`ElementoDeportivo_IdElemento`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`ElementoDeportivo_IdElemento`, `Persona_Codigo`, `FechaInicio`, `FechaSolicitud`, `Estado`, `IdPrestamo`, `FechaFin`) VALUES
(1, '1151253', '3918-07-15 08:00:00', '3918-07-15 22:54:37', 'Finalizado', 1, '3918-07-15 10:00:00'),
(2, '1151253', '3918-07-15 10:00:00', '3918-07-15 22:54:42', 'Deuda', 2, '3918-07-15 12:00:00'),
(1, '1151253', '3918-07-20 04:00:00', '3918-07-20 13:08:10', 'Finalizado', 3, '3918-07-20 06:00:00'),
(2, '1151253', '3918-07-21 08:00:00', '3918-07-20 13:08:28', 'Prestado', 4, '3918-07-21 10:00:00'),
(1, '1151253', '3918-07-20 02:00:00', '3918-07-20 13:30:52', 'Finalizado', 5, '3918-07-20 04:00:00'),
(1, '1151253', '3918-07-21 10:00:00', '3918-07-20 13:31:02', 'Finalizado', 6, '3918-07-21 12:00:00'),
(3, '1151253', '3918-07-21 04:00:00', '3918-07-20 13:31:10', 'Solicitado', 7, '3918-07-21 06:00:00'),
(1, '1151253', '3918-07-21 12:00:00', '3918-07-20 23:33:41', 'Solicitado', 8, '3918-07-21 14:00:00'),
(10, '1151247', '3918-07-20 08:00:00', '3918-07-21 01:21:50', 'Deuda', 9, '3918-07-21 10:00:00'),
(1, '1151253', '3918-07-21 02:00:00', '3918-07-21 10:52:07', 'Solicitado', 14, '3918-07-21 04:00:00'),
(1, '1151253', '3918-07-22 08:00:00', '3918-07-21 11:01:23', 'Solicitado', 15, '3918-07-22 10:00:00'),
(1, '1151253', '3918-07-22 02:00:00', '3918-07-22 11:14:38', 'Solicitado', 16, '3918-07-22 04:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

DROP TABLE IF EXISTS `tipo_persona`;
CREATE TABLE IF NOT EXISTS `tipo_persona` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id`, `Descripcion`) VALUES
(1, 'Usuario'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variable`
--

DROP TABLE IF EXISTS `variable`;
CREATE TABLE IF NOT EXISTS `variable` (
  `DiasPrestamo` int(11) NOT NULL,
  `MultaRetrasoDias` int(11) NOT NULL,
  `HoraInicio` varchar(45) NOT NULL,
  `HoraFin` varchar(45) NOT NULL,
  `Id` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `variable`
--

INSERT INTO `variable` (`DiasPrestamo`, `MultaRetrasoDias`, `HoraInicio`, `HoraFin`, `Id`) VALUES
(2, 12, '8', '6', '1');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deuda`
--
ALTER TABLE `deuda`
  ADD CONSTRAINT `fk_Deuda_Prestamo1` FOREIGN KEY (`Prestamo_IdPrestamo`) REFERENCES `prestamo` (`IdPrestamo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `elementodeportivo`
--
ALTER TABLE `elementodeportivo`
  ADD CONSTRAINT `fk_elementodeportivo_deporte1` FOREIGN KEY (`deporte_IdDeporte`) REFERENCES `deporte` (`IdDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_Persona_Tipo_Persona1` FOREIGN KEY (`Id_Tipo`) REFERENCES `tipo_persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_ElementoDeportivo_has_Persona_ElementoDeportivo` FOREIGN KEY (`ElementoDeportivo_IdElemento`) REFERENCES `elementodeportivo` (`IdElemento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ElementoDeportivo_has_Persona_Persona1` FOREIGN KEY (`Persona_Codigo`) REFERENCES `persona` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
