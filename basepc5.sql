-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2015 a las 18:58:52
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `basepc5`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meta_fisica_proyecto`
--

CREATE TABLE IF NOT EXISTS `meta_fisica_proyecto` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `numeroProyecto` int(6) NOT NULL,
  `tareaActividad` varchar(25) NOT NULL,
  `unidades` varchar(20) NOT NULL,
  `totales` int(5) NOT NULL,
  `mes1` int(3) NOT NULL,
  `mes2` int(3) NOT NULL,
  `mes3` int(3) NOT NULL,
  `mes4` int(3) NOT NULL,
  `mes5` int(3) NOT NULL,
  `mes6` int(3) NOT NULL,
  `mes7` int(3) NOT NULL,
  `mes8` int(3) NOT NULL,
  `mes9` int(3) NOT NULL,
  `mes10` int(3) NOT NULL,
  `mes11` int(3) NOT NULL,
  `mes12` int(3) NOT NULL,
  `mes13` int(3) NOT NULL,
  `mes14` int(3) NOT NULL,
  `mes15` int(3) NOT NULL,
  `mes16` int(3) NOT NULL,
  `mes17` int(3) NOT NULL,
  `mes18` int(3) NOT NULL,
  `mes19` int(3) NOT NULL,
  `mes20` int(3) NOT NULL,
  `mes21` int(3) NOT NULL,
  `mes22` int(3) NOT NULL,
  `mes23` int(3) NOT NULL,
  `mes24` int(3) NOT NULL,
  `mes25` int(3) NOT NULL,
  `mes26` int(3) NOT NULL,
  `mes27` int(3) NOT NULL,
  `mes28` int(3) NOT NULL,
  `mes29` int(3) NOT NULL,
  `mes30` int(3) NOT NULL,
  `mes31` int(3) NOT NULL,
  `mes32` int(3) NOT NULL,
  `mes33` int(3) NOT NULL,
  `mes34` int(3) NOT NULL,
  `mes35` int(3) NOT NULL,
  `mes36` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `meta_fisica_proyecto`
--

INSERT INTO `meta_fisica_proyecto` (`id`, `numeroProyecto`, `tareaActividad`, `unidades`, `totales`, `mes1`, `mes2`, `mes3`, `mes4`, `mes5`, `mes6`, `mes7`, `mes8`, `mes9`, `mes10`, `mes11`, `mes12`, `mes13`, `mes14`, `mes15`, `mes16`, `mes17`, `mes18`, `mes19`, `mes20`, `mes21`, `mes22`, `mes23`, `mes24`, `mes25`, `mes26`, `mes27`, `mes28`, `mes29`, `mes30`, `mes31`, `mes32`, `mes33`, `mes34`, `mes35`, `mes36`) VALUES
(11, 22, 'A.1.1.Agricultura', 'Global', 10, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0),
(12, 25, 'A.1.1.orhjfrfoer', 'Informe tecnico', 34, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `numeroProyecto` int(6) NOT NULL,
  `ubicacion` varchar(40) NOT NULL,
  `razonSocial` varchar(40) NOT NULL,
  `direccionSoltte` varchar(40) NOT NULL,
  `formaLegal` varchar(40) NOT NULL,
  `coSolicitantes` varchar(40) NOT NULL,
  `entidAfiliada` varchar(40) DEFAULT NULL,
  `nacionalidad` varchar(40) DEFAULT NULL,
  `nIdentEuro` varchar(40) DEFAULT NULL,
  `nContrato` varchar(40) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `contrato` varchar(40) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `aporteSolicitante` decimal(9,2) DEFAULT NULL,
  `duracionTotal` varchar(15) DEFAULT NULL,
  `fechaPresentacion` varchar(15) DEFAULT NULL,
  `aporteUE` decimal(9,2) DEFAULT NULL,
  `fechaInicio` varchar(15) DEFAULT NULL,
  `fechaFin` varchar(15) DEFAULT NULL,
  `otrosAportes` decimal(9,2) DEFAULT NULL,
  `fechaContrato` varchar(15) DEFAULT NULL,
  `puntajeTotal` varchar(15) DEFAULT NULL,
  `montoTotal` decimal(9,2) DEFAULT NULL,
  `componentes` varchar(15) DEFAULT NULL,
  `beneficiario` varchar(15) DEFAULT NULL,
  `estadoDelProyecto` varchar(15) DEFAULT NULL,
  `tipoProyecto` varchar(15) DEFAULT NULL,
  `actividadDAS` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `titulo`, `numeroProyecto`, `ubicacion`, `razonSocial`, `direccionSoltte`, `formaLegal`, `coSolicitantes`, `entidAfiliada`, `nacionalidad`, `nIdentEuro`, `nContrato`, `telefono`, `fax`, `contrato`, `correo`, `aporteSolicitante`, `duracionTotal`, `fechaPresentacion`, `aporteUE`, `fechaInicio`, `fechaFin`, `otrosAportes`, `fechaContrato`, `puntajeTotal`, `montoTotal`, `componentes`, `beneficiario`, `estadoDelProyecto`, `tipoProyecto`, `actividadDAS`) VALUES
(14, 'Gestion', 22, 'Lima', 'UNI', 'Av. Marina 234', 'Firma Personal', '20111315D', 'UCV', 'Peruana', '4569349', '83747', '6483267032', 'o32874973', '454563', 'ca@gmail.c', NULL, '', '', NULL, '', '', NULL, '', '', NULL, 'SELECCIONE', '', 'SELECCIONE', 'SELECCIONE', 'SELECCIONE'),
(15, 'dhfkdhfk', 34, 'lkjbn', 'kb', 'khb', 'Sociedad Limitada', 'b', '', 'SELECCIONE', '', '', '', '', '', '', NULL, '', '', NULL, '', '', NULL, '', '', NULL, 'SELECCIONE', '', 'SELECCIONE', 'SELECCIONE', 'SELECCIONE'),
(16, 'kihih', 25, 'ho', 'ho', 'hih', 'Sociedad AnÃ³nima', 'hih', 'i', 'SELECCIONE', '', '', '', '', '', '', NULL, '', '', NULL, '', '', NULL, '', '', NULL, 'SELECCIONE', '', 'SELECCIONE', 'SELECCIONE', 'SELECCIONE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(10) DEFAULT NULL,
  `contrasenya` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `contrasenya`) VALUES
(1, 'profe', 'profe'),
(5, 'carlo', 'carlo'),
(6, 'andrea', 'andrea');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
