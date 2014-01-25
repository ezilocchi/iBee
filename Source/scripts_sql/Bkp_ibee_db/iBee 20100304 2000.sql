-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.32-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ibee
--

CREATE DATABASE IF NOT EXISTS ibee;
USE ibee;

--
-- Definition of table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `idActividad` int(15) NOT NULL,
  `codTipoActividad` char(5) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaEsperadaDeCierre` datetime DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `idApiar` int(15) DEFAULT NULL,
  `idEstado` int(15) unsigned NOT NULL,
  PRIMARY KEY (`idActividad`),
  KEY `REL_TpoAct_Act` (`codTipoActividad`),
  CONSTRAINT `REL_TpoAct_Act` FOREIGN KEY (`codTipoActividad`) REFERENCES `tipoactividad` (`codTipoActividad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actividad`
--

/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` (`idActividad`,`codTipoActividad`,`denominacion`,`descripcion`,`fechaCreacion`,`fechaEsperadaDeCierre`,`fechaInicio`,`fechaFin`,`observaciones`,`idApiar`,`idEstado`) VALUES 
 (1,'C','Control General de Apiar','Verificar la higiene del lugar','2009-06-15 00:00:00','2009-06-30 00:00:00','2009-06-20 00:00:00','2009-06-30 00:00:00','',1,5),
 (2,'C','Control General de Apiar','Verificar la existencia de abeja reina en todas las colmenas','2009-06-15 00:00:00','2009-06-20 00:00:00','2009-06-20 00:00:00','2009-06-30 00:00:00','',2,5),
 (3,'C','Control General de Apiar','Controlar la flora del lugar','2009-06-15 00:00:00','2009-07-15 00:00:00','2009-06-20 00:00:00','2009-06-20 00:00:00','',3,5),
 (4,'C','Control General de Apiar','Realizar recorrido de inspección','2009-06-15 00:00:00','2009-07-15 00:00:00','2009-06-20 00:00:00',NULL,'',4,4),
 (5,'C','Control General de Apiar','Verificar la ubicación del mismo en el mapa','2009-06-15 00:00:00','2009-06-30 00:00:00','2009-06-20 00:00:00','2009-06-30 00:00:00','',5,5),
 (6,'C','Control General de Apiar','Revisar hormigueros en las cercanías','2009-06-15 00:00:00','2009-07-15 00:00:00','2009-06-20 00:00:00','2009-07-15 00:00:00','',6,5),
 (7,'C','Control General de Apiar','Colocar latas de aceite en las patas de las Colmenas.','2009-06-15 00:00:00','2009-06-25 00:00:00','2009-06-20 00:00:00',NULL,'',7,5),
 (8,'C','Control General de Apiar','Controlar buena salud de las abejas obreras','2009-06-15 00:00:00','2009-07-15 00:00:00','2009-06-20 00:00:00','2009-09-15 00:00:00','',7,5),
 (9,'C','Control General de Apiar','Controlar la temperatura de la colmena','2009-06-15 00:00:00','2009-07-15 00:00:00','2009-06-20 00:00:00','2009-06-30 00:00:00','',2,5),
 (10,'C','Control General de Apiar','Controlar el nivel de producción de la colmena','2009-06-15 00:00:00','2009-07-15 00:00:00',NULL,NULL,'',10,2),
 (11,'C','Control General de Apiar','Controlar el crecimiento de la familia','2009-06-15 00:00:00','2009-07-15 00:00:00',NULL,NULL,'',10,2),
 (12,'N','recolectar','Recolectar la producción','2009-06-15 00:00:00','2009-10-07 00:00:00',NULL,NULL,'',1,4),
 (13,'I','Control Anual de Colmenas','Se debe realizar el control anual previsto para el 2010.',NULL,'2010-02-28 00:00:00',NULL,NULL,'Además tener en cuenta el relevamiento de Zonas previsto.-',8,2),
 (14,'F','Control Anual de Colmenas ','Lalalelele',NULL,'2010-03-31 00:00:00',NULL,NULL,'',1,2);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;


--
-- Definition of table `agroquimico`
--

DROP TABLE IF EXISTS `agroquimico`;
CREATE TABLE `agroquimico` (
  `idAgroquimico` int(15) NOT NULL,
  `idZona` int(15) NOT NULL,
  `idTipoAgroquimico` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`idAgroquimico`,`idZona`),
  KEY `REL_TipoAgro_Agro` (`idTipoAgroquimico`),
  KEY `REL_Zona_Agro` (`idZona`),
  CONSTRAINT `REL_TipoAgro_Agro` FOREIGN KEY (`idTipoAgroquimico`) REFERENCES `tipoagroquimico` (`idTipoAgroquimico`),
  CONSTRAINT `REL_Zona_Agro` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agroquimico`
--

/*!40000 ALTER TABLE `agroquimico` DISABLE KEYS */;
/*!40000 ALTER TABLE `agroquimico` ENABLE KEYS */;


--
-- Definition of table `alarma`
--

DROP TABLE IF EXISTS `alarma`;
CREATE TABLE `alarma` (
  `idAlarma` int(15) NOT NULL,
  `idZona` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `origen` varchar(25) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `idPeriodicidad` int(15) NOT NULL,
  `idTipoAlarma` int(15) NOT NULL,
  `idEstado` int(15) unsigned NOT NULL,
  `activado` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `rangoDesde` double DEFAULT NULL,
  `rangoHasta` double DEFAULT NULL,
  `idCargo` int(15) NOT NULL,
  PRIMARY KEY (`idAlarma`) USING BTREE,
  KEY `REL_Zona_Alarma` (`idZona`),
  KEY `REL_Per_Alarma` (`idPeriodicidad`),
  KEY `REL_Tipo_Alarma` (`idTipoAlarma`),
  KEY `REL_Est_Alarma` (`idEstado`),
  KEY `REL_Car_Alarma` (`idCargo`),
  CONSTRAINT `REL_Car_Alarma` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`),
  CONSTRAINT `REL_Est_Alarma` FOREIGN KEY (`idEstado`) REFERENCES `estadoalarma` (`idEstado`),
  CONSTRAINT `REL_Per_Alarma` FOREIGN KEY (`idPeriodicidad`) REFERENCES `periodicidad` (`idPeriodicidad`),
  CONSTRAINT `REL_Tipo_Alarma` FOREIGN KEY (`idTipoAlarma`) REFERENCES `tipoalarma` (`idTipoAlarma`),
  CONSTRAINT `REL_Zona_Alarma` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alarma`
--

/*!40000 ALTER TABLE `alarma` DISABLE KEYS */;
INSERT INTO `alarma` (`idAlarma`,`idZona`,`denominacion`,`descripcion`,`origen`,`fechaCreacion`,`fechaInicio`,`fechaFin`,`idPeriodicidad`,`idTipoAlarma`,`idEstado`,`activado`,`rangoDesde`,`rangoHasta`,`idCargo`) VALUES 
 (1,1,'Clima demasiado Bajoooooooo','Indica que la temperatura se mantuvo por debajo de los X grados...\nasdasdasdasdasd','Automatico','2009-06-15 00:00:00','2009-06-16 00:00:00','2011-06-11 00:00:00',1,2,1,1,40,50,1),
 (2,2,'Clima alto','Indica que la tarea posee mas de 5 dias de vencida','Actividades','2009-06-10 00:00:00','2009-06-12 00:00:00','2011-06-11 00:00:00',1,1,1,0,5,10,1),
 (3,3,'Clima alto','Indica que la tarea posee mas de 10 dias de vencida','Actividades','2009-06-10 00:00:00','2009-06-12 00:00:00','2011-06-11 00:00:00',1,2,1,0,5,10,1),
 (4,4,'Clima alto','Indica que la tarea posee mas de 15 dias de vencida','Actividades','2009-06-10 00:00:00','2009-06-12 00:00:00','2011-06-11 00:00:00',1,3,1,1,5,10,1),
 (5,5,'Clima alto','Indica que la zona no es apta para buena producción','Flora','2009-06-10 00:00:00','2009-06-12 00:00:00','2011-06-11 00:00:00',1,1,1,0,5,10,1),
 (6,1,'Clima alto','Indica que la zona posee demasiados agroquimicos alrededor','Agroquimicos','2009-06-10 00:00:00','2009-06-12 00:00:00','2011-06-11 00:00:00',1,1,1,0,5,10,1),
 (7,1,'prueba','asdasd','Usuario','2010-02-15 00:00:00','2010-02-25 00:00:00','2010-02-27 00:00:00',1,1,1,1,-10,0.5,1);
/*!40000 ALTER TABLE `alarma` ENABLE KEYS */;


--
-- Definition of table `alza`
--

DROP TABLE IF EXISTS `alza`;
CREATE TABLE `alza` (
  `numeroAlza` int(15) NOT NULL,
  `numeroCajon` int(15) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `tamanio` varchar(25) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `idTipoAlza` int(15) NOT NULL,
  PRIMARY KEY (`numeroAlza`,`numeroCajon`),
  KEY `REL_Cajon_Alza` (`numeroCajon`),
  CONSTRAINT `REL_Cajon_Alza` FOREIGN KEY (`numeroCajon`) REFERENCES `cajon` (`numeroCajon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alza`
--

/*!40000 ALTER TABLE `alza` DISABLE KEYS */;
/*!40000 ALTER TABLE `alza` ENABLE KEYS */;


--
-- Definition of table `apiar`
--

DROP TABLE IF EXISTS `apiar`;
CREATE TABLE `apiar` (
  `idApiar` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaAlta` datetime DEFAULT NULL,
  `fechaBaja` datetime DEFAULT NULL,
  `idLayout` int(15) DEFAULT NULL,
  `idUbicacion` int(15) DEFAULT NULL,
  `idZona` int(15) DEFAULT NULL,
  `idEstado` int(15) DEFAULT NULL,
  PRIMARY KEY (`idApiar`),
  KEY `REL_Col_Layout` (`idLayout`),
  KEY `REL_Apiar_Ubic` (`idUbicacion`),
  KEY `REL_Apiar_Zona` (`idZona`),
  CONSTRAINT `REL_Apiar_Ubic` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`),
  CONSTRAINT `REL_Apiar_Zona` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`),
  CONSTRAINT `REL_Col_Layout` FOREIGN KEY (`idLayout`) REFERENCES `layout` (`idLayout`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apiar`
--

/*!40000 ALTER TABLE `apiar` DISABLE KEYS */;
INSERT INTO `apiar` (`idApiar`,`denominacion`,`fechaCreacion`,`fechaAlta`,`fechaBaja`,`idLayout`,`idUbicacion`,`idZona`,`idEstado`) VALUES 
 (1,'Apiar Córdoba','2009-06-15 00:00:00','2009-06-15 00:00:00',NULL,1,1,1,1),
 (2,'Apiar Mina Clavero','2009-06-15 00:00:00','2009-06-15 00:00:00',NULL,1,2,2,1),
 (3,'Apiar Unquillo','2009-06-15 00:00:00','2009-06-15 00:00:00',NULL,1,3,3,1),
 (4,'Apiar Villa del Rosario','2009-06-15 00:00:00','2009-06-15 00:00:00',NULL,1,4,4,1),
 (5,'Apiar Alta Gracia','2009-06-15 00:00:00','2009-06-15 00:00:00',NULL,1,5,5,2),
 (6,'Apiar Río Primero','2009-06-15 00:00:00','2009-06-15 00:00:00',NULL,1,6,6,1),
 (7,'Apiar Embalse','2009-06-15 00:00:00','2009-06-15 00:00:00',NULL,1,7,7,2),
 (8,'Apiar Villa de Soto','2009-06-15 00:00:00','2009-06-15 00:00:00',NULL,1,8,8,3),
 (9,'Apiar Laguna Larga','2009-09-15 00:00:00','2009-09-15 00:00:00',NULL,1,9,9,3),
 (10,'Apiar Rio Tercero','2009-09-19 00:00:00','2009-09-19 00:00:00',NULL,1,10,10,1),
 (11,'Apiar Capilla del Monte','2009-09-22 00:00:00','2009-09-22 00:00:00',NULL,2,11,11,1);
/*!40000 ALTER TABLE `apiar` ENABLE KEYS */;


--
-- Definition of table `asignacioncolmena`
--

DROP TABLE IF EXISTS `asignacioncolmena`;
CREATE TABLE `asignacioncolmena` (
  `idApiar` int(15) NOT NULL,
  `numeroColmena` int(15) NOT NULL,
  `fechaDesde` datetime DEFAULT NULL,
  `fechaHasta` datetime DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`idApiar`,`numeroColmena`),
  KEY `REL_AsigCol_Colmena` (`numeroColmena`),
  CONSTRAINT `REL_AsigCol_Apiar` FOREIGN KEY (`idApiar`) REFERENCES `apiar` (`idApiar`),
  CONSTRAINT `REL_AsigCol_Colmena` FOREIGN KEY (`numeroColmena`) REFERENCES `colmena` (`numeroColmena`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asignacioncolmena`
--

/*!40000 ALTER TABLE `asignacioncolmena` DISABLE KEYS */;
INSERT INTO `asignacioncolmena` (`idApiar`,`numeroColmena`,`fechaDesde`,`fechaHasta`,`observaciones`) VALUES 
 (1,6,'2009-10-13 00:00:00','2009-10-13 00:00:00',NULL),
 (1,7,'2009-10-13 00:00:00',NULL,NULL),
 (1,8,'2009-10-13 00:00:00',NULL,NULL),
 (10,1,'2009-09-19 00:00:00',NULL,NULL),
 (10,5,'2009-09-19 00:00:00',NULL,NULL),
 (11,3,'2009-09-22 00:00:00',NULL,NULL),
 (11,4,'2009-09-22 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `asignacioncolmena` ENABLE KEYS */;


--
-- Definition of table `cajon`
--

DROP TABLE IF EXISTS `cajon`;
CREATE TABLE `cajon` (
  `numeroCajon` int(15) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `idEstadoCajon` int(15) unsigned DEFAULT NULL,
  `LegajoUsuFab` int(15) unsigned DEFAULT NULL,
  `fechafabricacion` datetime DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `cantidadalzas` int(15) DEFAULT NULL,
  `marcosporalza` int(15) DEFAULT NULL,
  `idTipoCajon` int(15) DEFAULT NULL,
  PRIMARY KEY (`numeroCajon`),
  KEY `REL_Cajon_EstCajon` (`idEstadoCajon`),
  KEY `REL_TipoCajon_tipo` (`idTipoCajon`),
  CONSTRAINT `REL_Cajon_EstCajon` FOREIGN KEY (`idEstadoCajon`) REFERENCES `estadocajon` (`idEstadoCajon`),
  CONSTRAINT `REL_TipoCajon_tipo` FOREIGN KEY (`idTipoCajon`) REFERENCES `tipocajon` (`idtipocajon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cajon`
--

/*!40000 ALTER TABLE `cajon` DISABLE KEYS */;
INSERT INTO `cajon` (`numeroCajon`,`descripcion`,`idEstadoCajon`,`LegajoUsuFab`,`fechafabricacion`,`observaciones`,`cantidadalzas`,`marcosporalza`,`idTipoCajon`) VALUES 
 (1,'Cajón 2A',2,1,'2009-09-01 00:00:00','Cajón de dos alzas',4,12,1),
 (2,'Cajón 2A y 1MA',2,1,'2009-09-02 00:00:00','Cajón de dos azlas y una media alza',5,10,1),
 (3,'Cajón 1A y 1MA',1,1,'2009-06-15 00:00:00','Cajón de una alza y una media alza',5,12,2),
 (4,'Cajón 1A',1,4,'2009-09-09 00:00:00','Cajón de una alza',5,10,1),
 (5,'Cajón 3A',2,1,'2009-09-26 00:00:00','Cajón de tres alzas',3,10,2);
/*!40000 ALTER TABLE `cajon` ENABLE KEYS */;


--
-- Definition of table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `idCargo` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cargo`
--

/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` (`idCargo`,`denominacion`,`descripcion`) VALUES 
 (1,'EMCO','Encargado de Monitoreo y Control'),
 (2,'EPRO','Encargado de Produccion'),
 (3,'EINS','Encargado de Inspeccion'),
 (4,'EADM','Encargado de Administracion'),
 (5,'EEXT','Encargado de Extraccion'),
 (6,'ETAL','Encargado de Taller'),
 (7,'ESAN','Encargado de Sanidad'),
 (8,'PARA','Parametrizador'),
 (9,'AACT','Administrador de Actividades');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;


--
-- Definition of table `clima`
--

DROP TABLE IF EXISTS `clima`;
CREATE TABLE `clima` (
  `idClima` int(15) NOT NULL,
  `idZona` int(15) NOT NULL,
  `fechaHora` datetime DEFAULT NULL,
  `salidaDelSol` varchar(45) DEFAULT NULL,
  `puestaDelSol` varchar(45) DEFAULT NULL,
  `temperatura` double DEFAULT NULL,
  `iconoTemperatura` int(10) unsigned DEFAULT NULL,
  `sensacionTermica` double DEFAULT NULL,
  `descripcionTemperatura` varchar(100) DEFAULT NULL,
  `presion` double DEFAULT NULL,
  `velocidadDelViento` double DEFAULT NULL,
  `direccionDelViento` varchar(45) DEFAULT NULL,
  `humedad` double DEFAULT NULL,
  `indiceUV` double DEFAULT NULL,
  `faseLuna` varchar(45) DEFAULT NULL,
  `iconoLuna` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idClima`,`idZona`) USING BTREE,
  KEY `REL_Zona_Clima` (`idZona`),
  CONSTRAINT `REL_Zona_Clima` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clima`
--

/*!40000 ALTER TABLE `clima` DISABLE KEYS */;
INSERT INTO `clima` (`idClima`,`idZona`,`fechaHora`,`salidaDelSol`,`puestaDelSol`,`temperatura`,`iconoTemperatura`,`sensacionTermica`,`descripcionTemperatura`,`presion`,`velocidadDelViento`,`direccionDelViento`,`humedad`,`indiceUV`,`faseLuna`,`iconoLuna`) VALUES 
 (1,1,'2009-08-29 00:00:00','7:38 AM','7:00 PM',33,19,32,'Sand',1004.1,11,'NW',15,0,'Waxing Gibbous',9),
 (1,2,'2009-08-29 00:00:00','7:29 AM','6:48 PM',34,19,33,'Blowing Dust',987.8,27,'NW',18,0,'Waxing Gibbous',9),
 (1,3,'2009-08-29 00:00:00','7:32 AM','6:52 PM',34,19,33,'Blowing Dust',987.8,27,'NW',18,0,'Waxing Gibbous',9),
 (1,4,'2009-08-29 00:00:00','7:29 AM','6:52 PM',34,19,33,'Blowing Dust',987.8,27,'NW',18,0,'Waxing Gibbous',9),
 (1,5,'2009-08-29 00:00:00','7:33 AM','6:53 PM',34,19,33,'Blowing Dust',987.8,27,'NW',18,0,'Waxing Gibbous',9),
 (1,6,'2009-08-29 00:00:00','7:38 AM','7:01 PM',33,19,32,'Sand',1004.1,11,'NW',15,0,'Waxing Gibbous',9),
 (1,7,'2010-02-17 00:00:00','6:57 AM','8:06 PM',31,30,31,'Partly Cloudy',940.4,14,'N',34,0,'Waxing Crescent',3),
 (1,8,'2010-02-17 00:00:00','7:01 AM','8:06 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (1,9,'2010-02-17 00:00:00','6:55 AM','8:03 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (1,10,'2010-02-17 00:00:00','6:56 AM','8:05 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (1,11,'2010-02-17 00:00:00','6:59 AM','8:05 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (2,1,'2009-08-29 00:00:00','7:38 AM','7:00 PM',33,19,32,'Sand',1004.1,11,'NW',15,0,'Waxing Gibbous',9),
 (2,2,'2009-08-29 00:00:00','7:29 AM','6:48 PM',34,19,33,'Blowing Dust',987.8,27,'NW',18,0,'Waxing Gibbous',9),
 (2,3,'2009-08-29 00:00:00','7:32 AM','6:52 PM',34,19,33,'Blowing Dust',987.8,27,'NW',18,0,'Waxing Gibbous',9),
 (2,4,'2009-08-29 00:00:00','7:29 AM','6:52 PM',34,19,33,'Blowing Dust',987.8,27,'NW',18,0,'Waxing Gibbous',9),
 (2,5,'2009-08-29 00:00:00','7:33 AM','6:53 PM',34,19,33,'Blowing Dust',987.8,27,'NW',18,0,'Waxing Gibbous',9),
 (2,6,'2009-08-29 00:00:00','7:38 AM','7:01 PM',33,19,32,'Sand',1004.1,11,'NW',15,0,'Waxing Gibbous',9),
 (2,7,'2010-02-19 00:00:00','6:59 AM','8:04 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (2,8,'2010-02-19 00:00:00','7:03 AM','8:04 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (2,9,'2010-02-19 00:00:00','6:57 AM','8:01 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (2,10,'2010-02-19 00:00:00','6:58 AM','8:03 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (2,11,'2010-02-19 00:00:00','7:01 AM','8:03 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (3,1,'2009-09-05 00:00:00','7:29 AM','7:04 PM',22,30,22,'Partly Cloudy',1014.9,32,'N',43,4,'Full',15),
 (3,2,'2009-09-05 00:00:00','7:20 AM','6:53 PM',17,30,17,'Partly Cloudy',1002,11,'NE',65,5,'Full',15),
 (3,3,'2009-09-05 00:00:00','7:23 AM','6:57 PM',17,30,17,'Partly Cloudy',1002,11,'NE',65,5,'Full',15),
 (3,4,'2009-09-05 00:00:00','7:21 AM','6:56 PM',17,30,17,'Partly Cloudy',1002,11,'NE',65,5,'Full',15),
 (3,5,'2009-09-05 00:00:00','7:24 AM','6:58 PM',17,30,17,'Partly Cloudy',1002,11,'NE',65,5,'Full',15),
 (3,6,'2009-09-05 00:00:00','7:29 AM','7:05 PM',22,30,22,'Partly Cloudy',1014.9,32,'N',43,4,'Full',15),
 (3,7,'2010-02-19 00:00:00','6:59 AM','8:04 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (3,8,'2010-02-19 00:00:00','7:03 AM','8:04 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (3,9,'2010-02-19 00:00:00','6:57 AM','8:01 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (3,10,'2010-02-19 00:00:00','6:58 AM','8:03 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (3,11,'2010-02-19 00:00:00','7:01 AM','8:03 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (4,1,'2009-09-05 00:00:00','7:29 AM','7:04 PM',22,30,22,'Partly Cloudy',1014.9,32,'N',43,4,'Full',15),
 (4,2,'2009-09-05 00:00:00','7:20 AM','6:53 PM',17,30,17,'Partly Cloudy',1002,11,'NE',65,5,'Full',15),
 (4,3,'2009-09-05 00:00:00','7:23 AM','6:57 PM',17,30,17,'Partly Cloudy',1002,11,'NE',65,5,'Full',15),
 (4,4,'2009-09-05 00:00:00','7:21 AM','6:56 PM',17,30,17,'Partly Cloudy',1002,11,'NE',65,5,'Full',15),
 (4,5,'2009-09-05 00:00:00','7:24 AM','6:58 PM',17,30,17,'Partly Cloudy',1002,11,'NE',65,5,'Full',15),
 (4,6,'2009-09-05 00:00:00','7:29 AM','7:05 PM',22,30,22,'Partly Cloudy',1014.9,32,'N',43,4,'Full',15),
 (4,7,'2010-03-03 00:00:00','7:09 AM','7:50 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (4,8,'2010-03-03 00:00:00','7:12 AM','7:52 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (4,9,'2010-03-03 00:00:00','7:06 AM','7:48 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (4,10,'2010-03-03 00:00:00','7:07 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (4,11,'2010-03-03 00:00:00','7:10 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (5,1,'2009-09-12 00:00:00','6:41 AM','7:27 PM',23,34,23,'Fair',1011.9,24,'NNE',14,0,'Waning Crescent',23),
 (5,2,'2009-09-12 00:00:00','6:30 AM','7:18 PM',24,32,24,'Sunny',996.3,11,'W',19,0,'Waning Crescent',23),
 (5,3,'2009-09-12 00:00:00','6:34 AM','7:21 PM',24,32,24,'Sunny',996.3,11,'W',19,0,'Waning Crescent',23),
 (5,4,'2009-09-12 00:00:00','6:33 AM','7:19 PM',24,32,24,'Sunny',996.3,11,'W',19,0,'Waning Crescent',23),
 (5,5,'2009-09-12 00:00:00','6:35 AM','7:22 PM',24,32,24,'Sunny',996.3,11,'W',19,0,'Waning Crescent',23),
 (5,6,'2009-09-12 00:00:00','6:42 AM','7:27 PM',23,34,23,'Fair',1011.9,24,'NNE',14,0,'Waning Crescent',23),
 (5,7,'2010-03-03 00:00:00','7:09 AM','7:50 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (5,8,'2010-03-03 00:00:00','7:12 AM','7:52 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (5,9,'2010-03-03 00:00:00','7:06 AM','7:48 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (5,10,'2010-03-03 00:00:00','7:07 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (5,11,'2010-03-03 00:00:00','7:10 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (6,1,'2009-09-15 00:00:00','6:41 AM','7:27 PM',20,33,20,'Fair',1011.9,24,'N',20,0,'Waning Crescent',23),
 (6,2,'2009-09-15 00:00:00','6:30 AM','7:06 AM',24,32,24,'Sunny',996.3,11,'W',19,0,'Waning Crescent',23),
 (6,3,'2009-09-15 00:00:00','6:34 AM','7:21 PM',24,32,24,'Sunny',996.3,11,'W',19,0,'Waning Crescent',23),
 (6,4,'2009-09-15 00:00:00','6:33 AM','7:19 PM',24,32,24,'Sunny',996.3,11,'W',19,0,'Waning Crescent',23),
 (6,5,'2009-09-15 00:00:00','6:35 AM','7:22 PM',24,32,24,'Sunny',996.3,11,'W',19,0,'Waning Crescent',23),
 (6,6,'2009-09-15 00:00:00','6:42 AM','7:27 PM',20,33,20,'Fair',1011.9,24,'N',20,0,'Waning Crescent',23),
 (6,7,'2010-03-03 00:00:00','7:09 AM','7:50 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (6,8,'2010-03-03 00:00:00','7:12 AM','7:52 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (6,9,'2010-03-03 00:00:00','7:06 AM','7:48 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (6,10,'2010-03-03 00:00:00','7:07 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (6,11,'2010-03-03 00:00:00','7:10 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (7,1,'2009-09-17 00:00:00','6:41 AM','7:28 PM',17,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (7,2,'2009-09-17 00:00:00','6:30 AM','7:19 PM',16,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (7,3,'2009-09-17 00:00:00','6:34 AM','7:22 PM',16,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (7,4,'2009-09-17 00:00:00','6:33 AM','7:19 PM',16,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (7,5,'2009-09-17 00:00:00','6:35 AM','7:23 PM',16,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (7,6,'2009-09-17 00:00:00','6:42 AM','7:28 PM',17,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (7,7,'2010-03-03 00:00:00','7:09 AM','7:50 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (7,8,'2010-03-03 00:00:00','7:12 AM','7:52 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (7,9,'2010-03-03 00:00:00','7:06 AM','7:48 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (7,10,'2010-03-03 00:00:00','7:07 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (7,11,'2010-03-03 00:00:00','7:10 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (8,1,'2009-09-19 00:00:00','6:41 AM','7:28 PM',20,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (8,2,'2009-09-19 00:00:00','6:30 AM','7:19 PM',25,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (8,3,'2009-09-19 00:00:00','6:34 AM','7:22 PM',19,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (8,4,'2009-09-19 00:00:00','6:33 AM','7:19 PM',15,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (8,5,'2009-09-19 00:00:00','6:35 AM','7:23 PM',23,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (8,6,'2009-09-19 00:00:00','6:42 AM','7:28 PM',22,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (8,7,'2010-03-03 00:00:00','7:09 AM','7:50 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (8,8,'2010-03-03 00:00:00','7:12 AM','7:52 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (8,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',27,30,28,'Partly Cloudy',1016.9,0,'NE',58,0,'Waning Gibbous',19),
 (8,10,'2010-03-03 00:00:00','7:07 AM','7:49 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (8,11,'2010-03-03 00:00:00','7:10 AM','7:50 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (9,1,'2009-09-23 00:00:00','6:54 PM','7:28 PM',22,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (9,2,'2009-09-23 00:00:00','6:30 AM','7:19 PM',23,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (9,3,'2009-09-23 00:00:00','6:34 AM','7:22 PM',19,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (9,4,'2009-09-23 00:00:00','6:33 AM','7:19 PM',18,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (9,5,'2009-09-23 00:00:00','6:35 AM','7:23 PM',19,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (9,6,'2009-09-23 00:00:00','6:42 AM','7:28 PM',22,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (9,7,'2010-03-03 00:00:00','7:09 AM','7:50 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (9,8,'2010-03-03 00:00:00','7:12 AM','7:52 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (9,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (9,10,'2010-03-03 00:00:00','7:07 AM','7:49 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (9,11,'2010-03-03 00:00:00','7:10 AM','7:50 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (10,1,'2009-09-27 00:00:00','6:41 AM','7:28 PM',23,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (10,2,'2009-09-27 00:00:00','6:30 AM','7:19 PM',21,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (10,3,'2009-09-27 00:00:00','6:34 AM','7:22 PM',20,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (10,4,'2009-09-27 00:00:00','6:33 AM','7:19 PM',19,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (10,5,'2009-09-27 00:00:00','6:35 AM','7:23 PM',19,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (10,6,'2009-09-27 00:00:00','6:42 AM','7:28 PM',21,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (10,7,'2010-03-03 00:00:00','7:09 AM','7:49 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (10,8,'2010-03-03 00:00:00','7:12 AM','7:51 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (10,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (10,10,'2010-03-03 00:00:00','7:07 AM','7:48 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (10,11,'2010-03-03 00:00:00','7:10 AM','7:49 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (11,1,'2009-09-29 00:00:00','6:41 AM','7:28 PM',24,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (11,2,'2009-09-29 00:00:00','6:30 AM','7:19 PM',22,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (11,3,'2009-09-29 00:00:00','6:34 AM','7:22 PM',21,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (11,4,'2009-09-29 00:00:00','6:33 AM','7:19 PM',20,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (11,5,'2009-09-29 00:00:00','6:35 AM','7:23 PM',21,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (11,6,'2009-09-29 00:00:00','6:42 AM','7:28 PM',23,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (11,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (11,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (11,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (11,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (11,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',27,30,28,'Partly Cloudy',1016.9,0,'NE',58,0,'Waning Gibbous',19),
 (12,1,'2009-10-02 00:00:00','6:41 AM','7:28 PM',25,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (12,2,'2009-10-02 00:00:00','6:30 AM','7:19 PM',24,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (12,3,'2009-10-02 00:00:00','6:34 AM','7:22 PM',22,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (12,4,'2009-10-02 00:00:00','6:33 AM','7:19 PM',23,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (12,5,'2009-10-02 00:00:00','6:35 AM','7:23 PM',21,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (12,6,'2009-10-02 00:00:00','6:42 AM','7:28 PM',25,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (12,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (12,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (12,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (12,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (12,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (13,1,'2009-10-05 00:00:00','6:41 AM','7:28 PM',26,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (13,2,'2009-10-05 00:00:00','6:30 AM','7:19 PM',23,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (13,3,'2009-10-05 00:00:00','6:34 AM','7:22 PM',22,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (13,4,'2009-10-05 00:00:00','6:33 AM','7:19 PM',22,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (13,5,'2009-10-05 00:00:00','6:35 AM','7:23 PM',23,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (13,6,'2009-10-05 00:00:00','6:42 AM','7:28 PM',24,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (13,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (13,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (13,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (13,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (13,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (14,1,'2009-10-07 00:00:00','6:41 AM','7:28 PM',23,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (14,2,'2009-10-07 00:00:00','6:30 AM','7:19 PM',21,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (14,3,'2009-10-07 00:00:00','6:34 AM','7:22 PM',20,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (14,4,'2009-10-07 00:00:00','6:33 AM','7:19 PM',22,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (14,5,'2009-10-07 00:00:00','6:35 AM','7:23 PM',21,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (14,6,'2009-10-07 00:00:00','6:42 AM','7:28 PM',22,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (14,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (14,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (14,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (14,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (14,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (15,1,'2009-10-10 00:00:00','6:41 AM','7:28 PM',21,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (15,2,'2009-10-10 00:00:00','6:30 AM','7:19 PM',21,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (15,3,'2009-10-10 00:00:00','6:34 AM','7:22 PM',20,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (15,4,'2009-10-10 00:00:00','6:33 AM','7:19 PM',19,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (15,5,'2009-10-10 00:00:00','6:35 AM','7:23 PM',20,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (15,6,'2009-10-10 00:00:00','6:42 AM','7:28 PM',19,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (15,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (15,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (15,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (15,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (15,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (16,1,'2009-10-12 00:00:00','6:41 AM','7:28 PM',19,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (16,2,'2009-10-12 00:00:00','6:30 AM','7:19 PM',18,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (16,3,'2009-10-12 00:00:00','6:34 AM','7:22 PM',19,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (16,4,'2009-10-12 00:00:00','6:33 AM','7:19 PM',18,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (16,5,'2009-10-12 00:00:00','6:35 AM','7:23 PM',19,31,16,'Clear',997.6,2,'N',49,0,'Waning Crescent',23),
 (16,6,'2009-10-12 00:00:00','6:42 AM','7:28 PM',20,33,17,'Fair',1012.9,19,'N',27,0,'Waning Crescent',23),
 (16,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (16,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (16,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (16,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (16,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (17,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',23,21,23,'Haze',1012.9,11,'SE',69,0,'Waning Crescent',26),
 (17,2,'2010-02-10 00:00:00','6:39 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (17,3,'2010-02-10 00:00:00','6:43 AM','8:05 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (17,4,'2010-02-10 00:00:00','6:43 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (17,5,'2010-02-10 00:00:00','6:44 AM','8:06 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (17,6,'2010-02-10 00:00:00','6:53 AM','8:10 PM',23,21,23,'Haze',1012.9,11,'SE',69,0,'Waning Crescent',26),
 (17,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (17,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (17,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (17,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (17,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (18,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',23,21,23,'Haze',1012.9,11,'SE',69,0,'Waning Crescent',26),
 (18,2,'2010-02-10 00:00:00','6:39 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (18,3,'2010-02-10 00:00:00','6:43 AM','8:05 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (18,4,'2010-02-10 00:00:00','6:43 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (18,5,'2010-02-10 00:00:00','6:44 AM','8:06 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (18,6,'2010-02-10 00:00:00','6:53 AM','8:10 PM',23,21,23,'Haze',1012.9,11,'SE',69,0,'Waning Crescent',26),
 (18,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (18,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (18,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (18,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (18,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (19,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (19,2,'2010-02-10 00:00:00','6:39 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (19,3,'2010-02-10 00:00:00','6:43 AM','8:05 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (19,4,'2010-02-10 00:00:00','6:43 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (19,5,'2010-02-10 00:00:00','6:44 AM','8:06 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (19,6,'2010-02-10 00:00:00','6:53 AM','8:10 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (19,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (19,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (19,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (19,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (19,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (20,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (20,2,'2010-02-10 00:00:00','6:39 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (20,3,'2010-02-10 00:00:00','6:43 AM','8:05 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (20,4,'2010-02-10 00:00:00','6:43 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (20,5,'2010-02-10 00:00:00','6:44 AM','8:06 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (20,6,'2010-02-10 00:00:00','6:53 AM','8:10 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (20,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (20,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (20,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (20,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (20,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (21,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (21,2,'2010-02-10 00:00:00','6:39 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (21,3,'2010-02-10 00:00:00','6:43 AM','8:05 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (21,4,'2010-02-10 00:00:00','6:43 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (21,5,'2010-02-10 00:00:00','6:44 AM','8:06 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (21,6,'2010-02-10 00:00:00','6:53 AM','8:10 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (21,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (21,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (21,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (21,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (21,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (22,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (22,2,'2010-02-10 00:00:00','6:39 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (22,3,'2010-02-10 00:00:00','6:43 AM','8:05 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (22,4,'2010-02-10 00:00:00','6:43 AM','8:02 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (22,5,'2010-02-10 00:00:00','6:44 AM','8:06 PM',24,29,26,'Partly Cloudy',995.6,3,'SE',90,0,'Waning Crescent',26),
 (22,6,'2010-02-10 00:00:00','6:53 AM','8:10 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (22,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (22,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (22,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (22,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (22,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (23,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (23,2,'2010-02-17 00:00:00','7:00 AM','8:07 PM',31,30,31,'Partly Cloudy',940.4,14,'N',34,0,'Waxing Crescent',3),
 (23,3,'2010-02-17 00:00:00','6:58 AM','8:04 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (23,4,'2010-02-17 00:00:00','6:54 AM','8:02 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (23,5,'2010-02-17 00:00:00','6:58 AM','8:05 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (23,6,'2010-02-17 00:00:00','6:55 AM','8:02 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (23,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (23,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (23,9,'2010-03-04 00:00:00','7:07 AM','7:46 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (23,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (23,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (24,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (24,2,'2010-03-03 00:00:00','7:11 AM','7:52 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (24,3,'2010-02-19 00:00:00','6:59 AM','8:02 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (24,4,'2010-02-19 00:00:00','6:56 AM','8:00 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (24,5,'2010-02-19 00:00:00','6:59 AM','8:03 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (24,6,'2010-02-19 00:00:00','6:56 AM','8:00 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (24,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (24,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (24,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (24,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (25,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (25,2,'2010-03-03 00:00:00','7:11 AM','7:52 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (25,3,'2010-02-19 00:00:00','6:59 AM','8:02 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (25,4,'2010-02-19 00:00:00','6:56 AM','8:00 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (25,5,'2010-02-19 00:00:00','6:59 AM','8:03 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (25,6,'2010-02-19 00:00:00','6:56 AM','8:00 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (25,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (25,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (25,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (25,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (26,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (26,2,'2010-03-03 00:00:00','7:11 AM','7:52 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (26,3,'2010-03-03 00:00:00','7:09 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (26,4,'2010-03-03 00:00:00','7:05 AM','7:46 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (26,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (26,6,'2010-03-03 00:00:00','7:06 AM','7:47 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (26,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (26,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (26,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (26,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (27,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (27,2,'2010-03-03 00:00:00','7:11 AM','7:52 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (27,3,'2010-03-03 00:00:00','7:09 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (27,4,'2010-03-03 00:00:00','7:05 AM','7:46 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (27,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (27,6,'2010-03-03 00:00:00','7:06 AM','7:47 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (27,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (27,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (27,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (27,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (28,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (28,2,'2010-03-03 00:00:00','7:11 AM','7:52 PM',28,30,28,'Partly Cloudy',946.2,0,'CALM',48,0,'Waning Gibbous',18),
 (28,3,'2010-03-03 00:00:00','7:09 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (28,4,'2010-03-03 00:00:00','7:05 AM','7:46 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (28,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (28,6,'2010-03-03 00:00:00','7:06 AM','7:47 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (28,7,'2010-03-04 00:00:00','7:09 AM','7:49 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (28,8,'2010-03-04 00:00:00','7:13 AM','7:51 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (28,10,'2010-03-04 00:00:00','7:08 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (28,11,'2010-03-04 00:00:00','7:11 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (29,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (29,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (29,3,'2010-03-03 00:00:00','7:09 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (29,4,'2010-03-03 00:00:00','7:05 AM','7:46 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (29,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (29,6,'2010-03-03 00:00:00','7:06 AM','7:47 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (30,1,'2010-02-10 00:00:00','6:52 AM','8:11 PM',22,31,22,'Clear',1013.9,3,'S',73,0,'Waning Crescent',26),
 (30,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (30,3,'2010-03-03 00:00:00','7:09 AM','7:49 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (30,4,'2010-03-03 00:00:00','7:05 AM','7:46 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (30,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (30,6,'2010-03-03 00:00:00','7:06 AM','7:47 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (31,1,'2010-02-17 00:00:00','6:57 AM','8:04 PM',21,30,21,'Partly Cloudy',1011.9,19,'NE',78,0,'Waxing Crescent',3),
 (31,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (31,3,'2010-03-03 00:00:00','7:09 AM','7:49 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (31,4,'2010-03-03 00:00:00','7:05 AM','7:46 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (31,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (31,6,'2010-03-03 00:00:00','7:06 AM','7:47 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (32,1,'2010-02-19 00:00:00','6:59 AM','8:02 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (32,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (32,3,'2010-03-03 00:00:00','7:09 AM','7:48 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (32,4,'2010-03-03 00:00:00','7:05 AM','7:45 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (32,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (32,6,'2010-03-03 00:00:00','7:06 AM','7:45 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (33,1,'2010-02-19 00:00:00','6:59 AM','8:02 PM',27,4,31,'Light Rain with Thunder',1010.2,21,'SE',89,0,'Waxing Crescent',5),
 (33,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (33,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (33,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (33,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (33,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (34,1,'2010-03-03 00:00:00','7:08 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (34,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (34,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (34,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (34,5,'2010-03-03 00:00:00','7:09 AM','7:50 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (34,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (35,1,'2010-03-03 00:00:00','7:08 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (35,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (35,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (35,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (35,5,'2010-03-03 00:00:00','7:09 AM','7:49 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (35,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (36,1,'2010-03-03 00:00:00','6:25 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (36,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (36,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (36,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (36,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (36,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (37,1,'2010-03-03 00:00:00','7:08 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (37,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (37,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (37,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (37,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (37,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (38,1,'2010-03-03 00:00:00','7:08 AM','7:49 PM',25,30,26,'Partly Cloudy',1014.9,0,'NE',65,0,'Waning Gibbous',18),
 (38,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (38,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (38,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (38,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (38,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (39,1,'2010-03-03 00:00:00','7:08 AM','7:49 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (39,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (39,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (39,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (39,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (39,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (40,1,'2010-03-03 00:00:00','7:08 AM','7:49 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (40,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (40,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (40,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (40,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (40,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (41,1,'2010-03-03 00:00:00','7:08 AM','7:49 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (41,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (41,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (41,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (41,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (41,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (42,1,'2010-03-03 00:00:00','7:08 AM','7:49 PM',23,29,23,'Partly Cloudy',1014.9,0,'W',73,0,'Waning Gibbous',18),
 (42,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (42,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (42,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (42,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (42,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (43,1,'2010-03-03 00:00:00','7:08 AM','7:48 PM',22,33,22,'Fair',1015.9,0,'NW',78,0,'Waning Gibbous',18),
 (43,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (43,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (43,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (43,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (43,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (44,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',27,30,28,'Partly Cloudy',1016.9,0,'NE',58,0,'Waning Gibbous',19),
 (44,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (44,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (44,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (44,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (44,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (45,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (45,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (45,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (45,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (45,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (45,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (46,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (46,2,'2010-03-04 00:00:00','7:12 AM','7:51 PM',30,30,31,'Partly Cloudy',948.2,0,'CALM',45,0,'Waning Gibbous',19),
 (46,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (46,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (46,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (46,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (47,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (47,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (47,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (47,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (47,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (48,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (48,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (48,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (48,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (48,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (49,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (49,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (49,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (49,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (49,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (50,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (50,3,'2010-03-04 00:00:00','7:10 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (50,4,'2010-03-04 00:00:00','7:06 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (50,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (50,6,'2010-03-04 00:00:00','7:07 AM','7:45 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (51,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (51,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (52,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (52,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (53,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (53,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (54,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (54,5,'2010-03-04 00:00:00','7:10 AM','7:49 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (55,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (56,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (57,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (58,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (59,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (60,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (61,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19),
 (62,1,'2010-03-04 00:00:00','7:09 AM','7:48 PM',26,30,27,'Partly Cloudy',1016.9,0,'NE',65,0,'Waning Gibbous',19);
/*!40000 ALTER TABLE `clima` ENABLE KEYS */;


--
-- Definition of table `colmena`
--

DROP TABLE IF EXISTS `colmena`;
CREATE TABLE `colmena` (
  `numeroColmena` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `fechaAlta` datetime DEFAULT NULL,
  `fechaBaja` datetime DEFAULT NULL,
  `numeroFamilia` int(15) DEFAULT NULL,
  `idColmenaOriginal` int(15) DEFAULT NULL,
  `idTipoMiel` int(15) DEFAULT NULL,
  `numeroCajon` int(15) DEFAULT NULL,
  `idPosicion` int(15) DEFAULT NULL,
  `idEstadoColmena` int(15) DEFAULT NULL,
  PRIMARY KEY (`numeroColmena`),
  KEY `REL_Colmena_Cajon` (`numeroCajon`),
  KEY `REL_Colmena_ColmenaOrig` (`idColmenaOriginal`),
  KEY `REL_Colmena_Familia` (`numeroFamilia`),
  KEY `REL_Col_Pos` (`idPosicion`),
  KEY `REL_Colmena_TipoMiel` (`idTipoMiel`),
  KEY `REL_Colmena_Estado` (`idEstadoColmena`),
  CONSTRAINT `REL_Colmena_Cajon` FOREIGN KEY (`numeroCajon`) REFERENCES `cajon` (`numeroCajon`),
  CONSTRAINT `REL_Colmena_ColmenaOrig` FOREIGN KEY (`idColmenaOriginal`) REFERENCES `colmena` (`numeroColmena`),
  CONSTRAINT `REL_Colmena_Estado` FOREIGN KEY (`idEstadoColmena`) REFERENCES `estadocolmena` (`idEstadocolmena`),
  CONSTRAINT `REL_Colmena_Familia` FOREIGN KEY (`numeroFamilia`) REFERENCES `familia` (`numeroFamilia`),
  CONSTRAINT `REL_Colmena_TipoMiel` FOREIGN KEY (`idTipoMiel`) REFERENCES `tipomiel` (`idTipoMiel`),
  CONSTRAINT `REL_Col_Pos` FOREIGN KEY (`idPosicion`) REFERENCES `posicion` (`idPosicion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colmena`
--

/*!40000 ALTER TABLE `colmena` DISABLE KEYS */;
INSERT INTO `colmena` (`numeroColmena`,`denominacion`,`fechaAlta`,`fechaBaja`,`numeroFamilia`,`idColmenaOriginal`,`idTipoMiel`,`numeroCajon`,`idPosicion`,`idEstadoColmena`) VALUES 
 (1,'Colmena C01 AP Rio Tercero','2009-06-20 00:00:00',NULL,4,NULL,7,1,1,2),
 (3,'Colmena C01 AP Capilla del Monte','2009-09-19 00:00:00',NULL,3,NULL,1,2,NULL,2),
 (4,'Colmena C02 AP Capilla del Monte','2009-09-19 00:00:00',NULL,2,NULL,1,4,1,2),
 (5,'Colmena C02 AP Rio Tercero','2009-09-22 00:00:00',NULL,7,NULL,2,5,2,2),
 (6,'Colmena C01 AP Córdoba','2009-09-09 00:00:00',NULL,5,NULL,8,1,1,1),
 (7,'Colmena C02 AP Córdoba','2009-09-09 00:00:00',NULL,9,NULL,8,2,1,2),
 (8,'Colmena C03 AP Córdoba','2009-09-10 00:00:00',NULL,1,NULL,8,5,1,2);
/*!40000 ALTER TABLE `colmena` ENABLE KEYS */;


--
-- Definition of table `criticidad`
--

DROP TABLE IF EXISTS `criticidad`;
CREATE TABLE `criticidad` (
  `idCriticidad` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCriticidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criticidad`
--

/*!40000 ALTER TABLE `criticidad` DISABLE KEYS */;
INSERT INTO `criticidad` (`idCriticidad`,`denominacion`,`descripcion`) VALUES 
 (1,'Alta','Se refiere a que la enfermedad debe ser tratada URGENTE'),
 (2,'Media','Se refiere a que la enfermedad debe ser tratada NORMALMENTE'),
 (3,'Baja','Se refiere a que la enfermedad debe ser tratada con BAJA PRIORIDAD');
/*!40000 ALTER TABLE `criticidad` ENABLE KEYS */;


--
-- Definition of table `criticidadalarma`
--

DROP TABLE IF EXISTS `criticidadalarma`;
CREATE TABLE `criticidadalarma` (
  `idCriticidadAlarma` int(15) NOT NULL DEFAULT '0',
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idCriticidadAlarma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criticidadalarma`
--

/*!40000 ALTER TABLE `criticidadalarma` DISABLE KEYS */;
INSERT INTO `criticidadalarma` (`idCriticidadAlarma`,`denominacion`,`descripcion`) VALUES 
 (1,'Baja',NULL),
 (2,'Media',NULL),
 (3,'Alta',NULL);
/*!40000 ALTER TABLE `criticidadalarma` ENABLE KEYS */;


--
-- Definition of table `datoderecoleccion`
--

DROP TABLE IF EXISTS `datoderecoleccion`;
CREATE TABLE `datoderecoleccion` (
  `codDatoDeRecoleccion` char(5) NOT NULL,
  `codTipoTarea` char(5) NOT NULL,
  `codTipoActividad` char(5) NOT NULL,
  `nombreDato` varchar(100) DEFAULT NULL,
  `idTipoDato` int(15) DEFAULT NULL,
  `valoresPermitidos` varchar(250) DEFAULT NULL,
  `extension` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codTipoActividad`,`codTipoTarea`,`codDatoDeRecoleccion`),
  KEY `REL_TpoDat_DatDeRec` (`idTipoDato`),
  KEY `REL_TpoTar_DatDeRec` (`codTipoTarea`,`codTipoActividad`),
  CONSTRAINT `REL_TpoDat_DatDeRec` FOREIGN KEY (`idTipoDato`) REFERENCES `tipodato` (`idTipoDato`),
  CONSTRAINT `REL_TpoTar_DatDeRec` FOREIGN KEY (`codTipoTarea`, `codTipoActividad`) REFERENCES `tipotarea` (`codTipoTarea`, `codTipoActividad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datoderecoleccion`
--

/*!40000 ALTER TABLE `datoderecoleccion` DISABLE KEYS */;
INSERT INTO `datoderecoleccion` (`codDatoDeRecoleccion`,`codTipoTarea`,`codTipoActividad`,`nombreDato`,`idTipoDato`,`valoresPermitidos`,`extension`) VALUES 
 ('C01','C','C','Estado General',1,NULL,NULL),
 ('C02','C','C','Necesita Extracción',1,NULL,NULL),
 ('C03','C','C','Necesita Mantenimiento',1,NULL,NULL),
 ('C04','C','C','Necesita Control de Salidad',1,NULL,NULL),
 ('D001','T','N','Nombre',1,'',NULL),
 ('D002','T','N','Apellido',1,'',NULL),
 ('D001','R001','S','Fecha',4,'',NULL),
 ('D002','R001','S','Observaciones',1,'',NULL),
 ('D003','R001','S','Descripción General de Estado',1,'',NULL);
/*!40000 ALTER TABLE `datoderecoleccion` ENABLE KEYS */;


--
-- Definition of table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `legajo` int(15) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `idEstadoEmpleado` int(10) unsigned DEFAULT NULL,
  `idCargo` int(15) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fechaAlta` datetime DEFAULT NULL,
  `fechaBaja` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`legajo`),
  KEY `REL_Cargo_Emp` (`idCargo`),
  KEY `REL_Emp_EstEmp` (`idEstadoEmpleado`),
  CONSTRAINT `REL_Cargo_Emp` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`),
  CONSTRAINT `REL_Emp_EstEmp` FOREIGN KEY (`idEstadoEmpleado`) REFERENCES `estadoempleado` (`idEstadoEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empleado`
--

/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` (`legajo`,`nombre`,`apellido`,`idEstadoEmpleado`,`idCargo`,`observaciones`,`usuario`,`password`,`fechaAlta`,`fechaBaja`,`email`) VALUES 
 (1,'Juan Martin','Possi',1,1,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com'),
 (2,'Ignacio','Tallapiedra',1,2,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com'),
 (3,'Jesica','Gimenez',1,3,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com'),
 (4,'Erica','Gomez',1,4,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com'),
 (5,'Raul','Santos',1,5,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com'),
 (6,'Matias','Salcedo',1,6,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com'),
 (7,'Francisco','Martinez',1,7,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com'),
 (8,'Pedro','Medrano',1,8,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com'),
 (9,'Valentina','Saez',1,9,'No Comments','','','2009-08-29 00:00:00',NULL,'ibeeproject@gmail.com');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


--
-- Definition of table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
CREATE TABLE `enfermedad` (
  `idEnfermedad` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `duracionAproximada` varchar(25) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `idCriticidad` int(15) DEFAULT NULL,
  PRIMARY KEY (`idEnfermedad`),
  KEY `REL_Enf_Crit` (`idCriticidad`),
  CONSTRAINT `REL_Enf_Crit` FOREIGN KEY (`idCriticidad`) REFERENCES `criticidad` (`idCriticidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enfermedad`
--

/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
INSERT INTO `enfermedad` (`idEnfermedad`,`denominacion`,`descripcion`,`duracionAproximada`,`observaciones`,`idCriticidad`) VALUES 
 (1,'Varroasis','Ocurre cuando se observa poca actividad en la Colmena','10 dias','Sin Observaciones',1),
 (2,'Amebiasis','Se trata de una enfermedad contagiosa','15 días','Su agente patógeno es una  ameba parásita (por ello el nombre de la enfermedad), del Phylium  Protozoarios, del Orden  Sarcodino, denominada científicamente,  Malpighamoeba mellificae (Prell 1927)',2),
 (3,'Acariosis','Enfermedad parasitaria de la  abeja de la miel.','5 días','Acarapis woodi pertenece al tipo  Artrópodo, clase  Arachnida, orden  Acarina, familia  Tarsonemidae y es parásito específico de la abeja de miel.',1),
 (4,'Loque europea','La loque europea es una enfermedad de la cría de las abejas melíferas. Es una enfermedad que ataca las larvas y pupas de las abejas.','5 días','Se trata de un  coco oval lanceolado, con un tamaño de un micrón o más en el largo, forman cadena o pequeñas colonias. No esporula, por lo cual resulta menos peligroso que la  Loque americana.',3),
 (5,'Loque Americana','Ocurre cuando se encuentra en la Colmena especial agitación.','30 dias','Sin Comentarios.',2),
 (6,'Fiebre Americana','La temperatura de la abeja reina es demasiado elevada.','30 dias','Sin Comentarios.',2);
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;


--
-- Definition of table `enfermedadencolmena`
--

DROP TABLE IF EXISTS `enfermedadencolmena`;
CREATE TABLE `enfermedadencolmena` (
  `numeroColmena` int(15) NOT NULL,
  `idEnfermedad` int(15) NOT NULL,
  `fechaDesde` datetime DEFAULT NULL,
  `fechaHasta` datetime DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`numeroColmena`,`idEnfermedad`),
  KEY `REL_EnfEnCol_Enfermedad` (`idEnfermedad`),
  CONSTRAINT `REL_EnfEnCol_Colmena` FOREIGN KEY (`numeroColmena`) REFERENCES `colmena` (`numeroColmena`),
  CONSTRAINT `REL_EnfEnCol_Enfermedad` FOREIGN KEY (`idEnfermedad`) REFERENCES `enfermedad` (`idEnfermedad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enfermedadencolmena`
--

/*!40000 ALTER TABLE `enfermedadencolmena` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedadencolmena` ENABLE KEYS */;


--
-- Definition of table `especie`
--

DROP TABLE IF EXISTS `especie`;
CREATE TABLE `especie` (
  `idEspecie` int(15) NOT NULL,
  `denominacion` varchar(20) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idEspecie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `especie`
--

/*!40000 ALTER TABLE `especie` DISABLE KEYS */;
INSERT INTO `especie` (`idEspecie`,`denominacion`,`descripcion`) VALUES 
 (1,'Cerana','Abeja Americana'),
 (2,'Mellifera','Abeja Africana'),
 (3,'Nativa','Abeja Nativa');
/*!40000 ALTER TABLE `especie` ENABLE KEYS */;


--
-- Definition of table `estadoactividad`
--

DROP TABLE IF EXISTS `estadoactividad`;
CREATE TABLE `estadoactividad` (
  `idEstado` int(15) unsigned NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadoactividad`
--

/*!40000 ALTER TABLE `estadoactividad` DISABLE KEYS */;
INSERT INTO `estadoactividad` (`idEstado`,`estado`) VALUES 
 (1,'Pendiente'),
 (2,'Asignada'),
 (3,'En Ejecucion'),
 (4,'Anulada'),
 (5,'Finalizada');
/*!40000 ALTER TABLE `estadoactividad` ENABLE KEYS */;


--
-- Definition of table `estadoalarma`
--

DROP TABLE IF EXISTS `estadoalarma`;
CREATE TABLE `estadoalarma` (
  `idEstado` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadoalarma`
--

/*!40000 ALTER TABLE `estadoalarma` DISABLE KEYS */;
INSERT INTO `estadoalarma` (`idEstado`,`estado`) VALUES 
 (1,'Creada'),
 (2,'Midiendo'),
 (3,'Disparada'),
 (4,'Solucionada');
/*!40000 ALTER TABLE `estadoalarma` ENABLE KEYS */;


--
-- Definition of table `estadoapiar`
--

DROP TABLE IF EXISTS `estadoapiar`;
CREATE TABLE `estadoapiar` (
  `idEstado` int(15) unsigned NOT NULL,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadoapiar`
--

/*!40000 ALTER TABLE `estadoapiar` DISABLE KEYS */;
INSERT INTO `estadoapiar` (`idEstado`,`estado`) VALUES 
 (1,'Creado'),
 (2,'Vigente'),
 (3,'No Vigente');
/*!40000 ALTER TABLE `estadoapiar` ENABLE KEYS */;


--
-- Definition of table `estadocajon`
--

DROP TABLE IF EXISTS `estadocajon`;
CREATE TABLE `estadocajon` (
  `idEstadoCajon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstadoCajon`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadocajon`
--

/*!40000 ALTER TABLE `estadocajon` DISABLE KEYS */;
INSERT INTO `estadocajon` (`idEstadoCajon`,`estado`) VALUES 
 (1,'No Asignado'),
 (2,'Asignado');
/*!40000 ALTER TABLE `estadocajon` ENABLE KEYS */;


--
-- Definition of table `estadocolmena`
--

DROP TABLE IF EXISTS `estadocolmena`;
CREATE TABLE `estadocolmena` (
  `idEstadocolmena` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEstadocolmena`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadocolmena`
--

/*!40000 ALTER TABLE `estadocolmena` DISABLE KEYS */;
INSERT INTO `estadocolmena` (`idEstadocolmena`,`denominacion`,`descripcion`) VALUES 
 (1,'No Asignado','No Asignado'),
 (2,'En Producción','En Producción'),
 (3,'No Productiva','No Productiva'),
 (4,'De Baja','De Baja');
/*!40000 ALTER TABLE `estadocolmena` ENABLE KEYS */;


--
-- Definition of table `estadoempleado`
--

DROP TABLE IF EXISTS `estadoempleado`;
CREATE TABLE `estadoempleado` (
  `idEstadoEmpleado` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstadoEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadoempleado`
--

/*!40000 ALTER TABLE `estadoempleado` DISABLE KEYS */;
INSERT INTO `estadoempleado` (`idEstadoEmpleado`,`estado`) VALUES 
 (1,'Creado'),
 (2,'Activo'),
 (3,'Inactivo'),
 (4,'Bloqueado');
/*!40000 ALTER TABLE `estadoempleado` ENABLE KEYS */;


--
-- Definition of table `estadofamilia`
--

DROP TABLE IF EXISTS `estadofamilia`;
CREATE TABLE `estadofamilia` (
  `idEstadoFamilia` int(15) NOT NULL,
  `denominacion` varchar(50) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idEstadoFamilia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadofamilia`
--

/*!40000 ALTER TABLE `estadofamilia` DISABLE KEYS */;
INSERT INTO `estadofamilia` (`idEstadoFamilia`,`denominacion`,`descripcion`) VALUES 
 (1,'Activada','Estan actualmente en Produccion'),
 (2,'Desactivada','Fueron dadas de baja por duracion'),
 (3,'Baja por Enfermedad','Dada de baja por una infeccion o enfermedad');
/*!40000 ALTER TABLE `estadofamilia` ENABLE KEYS */;


--
-- Definition of table `estadotarea`
--

DROP TABLE IF EXISTS `estadotarea`;
CREATE TABLE `estadotarea` (
  `idEstadoTarea` int(15) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idEstadoTarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadotarea`
--

/*!40000 ALTER TABLE `estadotarea` DISABLE KEYS */;
INSERT INTO `estadotarea` (`idEstadoTarea`,`descripcion`) VALUES 
 (1,'Pendiente'),
 (2,'Asignada'),
 (3,'En ejecucion'),
 (4,'Anulada'),
 (5,'Finalizada');
/*!40000 ALTER TABLE `estadotarea` ENABLE KEYS */;


--
-- Definition of table `familia`
--

DROP TABLE IF EXISTS `familia`;
CREATE TABLE `familia` (
  `numeroFamilia` int(15) NOT NULL,
  `caracteristicas` varchar(200) DEFAULT NULL,
  `fechaAlta` datetime DEFAULT NULL,
  `idEspecie` int(15) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `denominacion` varchar(45) DEFAULT NULL,
  `idEstadoFamilia` int(15) DEFAULT NULL,
  PRIMARY KEY (`numeroFamilia`),
  KEY `REL_Fam_Esp` (`idEspecie`),
  KEY `REL_EstFam_Fam` (`idEstadoFamilia`),
  CONSTRAINT `REL_EstFam_Fam` FOREIGN KEY (`idEstadoFamilia`) REFERENCES `estadofamilia` (`idEstadoFamilia`),
  CONSTRAINT `REL_Fam_Esp` FOREIGN KEY (`idEspecie`) REFERENCES `especie` (`idEspecie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `familia`
--

/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` (`numeroFamilia`,`caracteristicas`,`fechaAlta`,`idEspecie`,`observaciones`,`denominacion`,`idEstadoFamilia`) VALUES 
 (1,'Peligrosas','2009-09-21 00:00:00',1,'Como las de raza cubana que atacan directamente','Familia Epsilon',1),
 (2,'La reina se capturo en el Rio de la Plata','2009-06-15 00:00:00',2,'La reina fue recolectada en el rio de la Plata','Familia Ro',2),
 (3,'De buena calidad','2009-06-19 00:00:00',3,'De la mejor calidad y mejor implementacion','Familia Alfa',1),
 (4,'De segunda calidad','2009-05-25 00:00:00',3,'De segunda calidad y listas para produccion','Familia Beta',1),
 (5,'Usadas para probar la zona','2009-06-01 00:00:00',2,'Son de pruebas para la lluvia y el terreno','Familia Gamma',3),
 (7,'Capturadas','2009-09-15 00:00:00',2,'Fue armada por medio de un aviso brindado por vecino','Familia Tita',1),
 (9,'Buenas constructuras','2009-07-15 00:00:00',2,'Son constructoras por defecto','Familia Utitlis',1);
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;


--
-- Definition of table `flora`
--

DROP TABLE IF EXISTS `flora`;
CREATE TABLE `flora` (
  `idFlora` int(15) NOT NULL,
  `idZona` int(15) NOT NULL,
  `idTipoFlora` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`idFlora`,`idZona`),
  KEY `REL_TpoFlora_Flora` (`idTipoFlora`),
  KEY `REL_Zona_Flora` (`idZona`),
  CONSTRAINT `REL_TpoFlora_Flora` FOREIGN KEY (`idTipoFlora`) REFERENCES `tipoflora` (`idTipoFlora`),
  CONSTRAINT `REL_Zona_Flora` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flora`
--

/*!40000 ALTER TABLE `flora` DISABLE KEYS */;
/*!40000 ALTER TABLE `flora` ENABLE KEYS */;


--
-- Definition of table `gmaplatlng`
--

DROP TABLE IF EXISTS `gmaplatlng`;
CREATE TABLE `gmaplatlng` (
  `idapiar` int(15) DEFAULT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `latitud` decimal(15,5) DEFAULT NULL,
  `longitud` decimal(15,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gmaplatlng`
--

/*!40000 ALTER TABLE `gmaplatlng` DISABLE KEYS */;
/*!40000 ALTER TABLE `gmaplatlng` ENABLE KEYS */;


--
-- Definition of table `historialalarma`
--

DROP TABLE IF EXISTS `historialalarma`;
CREATE TABLE `historialalarma` (
  `idHistorialAlarma` int(15) NOT NULL,
  `idAlarma` int(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `idCriticidad` int(15) DEFAULT NULL,
  `acciones` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`idHistorialAlarma`) USING BTREE,
  KEY `REL_CRIT_HISALARM` (`idCriticidad`),
  KEY `REL_ALARM_HISTALARM` (`idAlarma`),
  CONSTRAINT `REL_ALARM_HISTALARM` FOREIGN KEY (`idAlarma`) REFERENCES `alarma` (`idAlarma`),
  CONSTRAINT `REL_CRIT_HISALARM` FOREIGN KEY (`idCriticidad`) REFERENCES `criticidad` (`idCriticidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historialalarma`
--

/*!40000 ALTER TABLE `historialalarma` DISABLE KEYS */;
INSERT INTO `historialalarma` (`idHistorialAlarma`,`idAlarma`,`fecha`,`valor`,`idCriticidad`,`acciones`) VALUES 
 (1,1,'2009-06-16 00:00:00',35,3,0),
 (2,1,'2010-02-10 00:00:00',22,3,0),
 (3,1,'2010-02-10 00:00:00',22,3,0),
 (4,1,'2010-02-10 00:00:00',22,3,0),
 (5,6,'2010-02-10 00:00:00',22,1,0),
 (6,2,'2010-02-10 00:00:00',24,1,0),
 (7,4,'2010-02-10 00:00:00',24,1,0),
 (8,3,'2010-02-10 00:00:00',24,1,0),
 (9,5,'2010-02-10 00:00:00',24,1,0),
 (10,1,'2010-02-10 00:00:00',22,3,0),
 (11,6,'2010-02-10 00:00:00',22,2,0),
 (12,2,'2010-02-10 00:00:00',24,2,0),
 (13,4,'2010-02-10 00:00:00',24,2,0),
 (14,3,'2010-02-10 00:00:00',24,2,0),
 (15,5,'2010-02-10 00:00:00',24,2,0),
 (16,5,'2010-02-17 00:00:00',21,3,0),
 (17,1,'2010-02-17 00:00:00',21,3,0),
 (18,6,'2010-02-17 00:00:00',21,3,0),
 (19,3,'2010-02-17 00:00:00',21,3,0),
 (20,2,'2010-02-17 00:00:00',31,3,0),
 (21,4,'2010-02-17 00:00:00',21,3,0),
 (22,5,'2010-02-19 00:00:00',27,3,0),
 (23,1,'2010-02-19 00:00:00',27,3,0),
 (24,6,'2010-02-19 00:00:00',27,3,0),
 (25,3,'2010-02-19 00:00:00',27,3,0),
 (26,4,'2010-02-19 00:00:00',27,3,0),
 (27,5,'2010-02-19 00:00:00',27,3,0),
 (28,1,'2010-02-19 00:00:00',27,3,0),
 (29,6,'2010-02-19 00:00:00',27,3,0),
 (30,3,'2010-02-19 00:00:00',27,3,0),
 (31,4,'2010-02-19 00:00:00',27,3,0),
 (32,5,'2010-03-03 00:00:00',25,3,0),
 (33,1,'2010-03-03 00:00:00',25,3,0),
 (34,6,'2010-03-03 00:00:00',25,3,0),
 (35,3,'2010-03-03 00:00:00',25,3,0),
 (36,2,'2010-03-03 00:00:00',28,3,0),
 (37,4,'2010-03-03 00:00:00',25,3,0),
 (38,5,'2010-03-03 00:00:00',25,3,0),
 (39,1,'2010-03-03 00:00:00',25,3,0),
 (40,6,'2010-03-03 00:00:00',25,3,0),
 (41,3,'2010-03-03 00:00:00',25,3,0),
 (42,2,'2010-03-03 00:00:00',28,3,0),
 (43,4,'2010-03-03 00:00:00',25,3,0),
 (44,5,'2010-03-03 00:00:00',25,3,0),
 (45,1,'2010-03-03 00:00:00',25,3,0),
 (46,6,'2010-03-03 00:00:00',25,3,0),
 (47,3,'2010-03-03 00:00:00',25,3,0),
 (48,2,'2010-03-03 00:00:00',28,3,0),
 (49,4,'2010-03-03 00:00:00',25,3,0),
 (50,5,'2010-03-03 00:00:00',25,3,0),
 (51,1,'2010-03-03 00:00:00',25,3,0),
 (52,6,'2010-03-03 00:00:00',25,3,0),
 (53,3,'2010-03-03 00:00:00',25,3,0),
 (54,2,'2010-03-03 00:00:00',28,3,0),
 (55,4,'2010-03-03 00:00:00',25,3,0),
 (56,5,'2010-03-03 00:00:00',25,3,0),
 (57,1,'2010-03-03 00:00:00',25,3,0),
 (58,1,'2010-03-03 00:00:00',23,3,0),
 (59,1,'2010-03-03 00:00:00',23,3,0),
 (60,1,'2010-03-03 00:00:00',23,3,0),
 (61,1,'2010-03-03 00:00:00',23,3,0),
 (62,4,'2010-03-03 00:00:00',23,3,0),
 (63,1,'2010-03-03 00:00:00',22,3,0),
 (64,4,'2010-03-03 00:00:00',22,3,0),
 (65,1,'2010-03-04 00:00:00',27,3,0),
 (66,4,'2010-03-04 00:00:00',26,3,0),
 (67,1,'2010-03-04 00:00:00',26,3,0),
 (68,1,'2010-03-04 00:00:00',26,3,0),
 (69,4,'2010-03-04 00:00:00',26,3,0),
 (70,1,'2010-03-04 00:00:00',26,3,0),
 (71,4,'2010-03-04 00:00:00',26,3,0),
 (72,1,'2010-03-04 00:00:00',26,3,0),
 (73,4,'2010-03-04 00:00:00',26,3,0),
 (74,1,'2010-03-04 00:00:00',26,3,0),
 (75,4,'2010-03-04 00:00:00',26,3,0),
 (76,1,'2010-03-04 00:00:00',26,3,0),
 (77,4,'2010-03-04 00:00:00',26,3,0),
 (78,1,'2010-03-04 00:00:00',26,3,0),
 (79,4,'2010-03-04 00:00:00',26,3,0),
 (80,1,'2010-03-04 00:00:00',26,3,0),
 (81,4,'2010-03-04 00:00:00',26,3,0),
 (82,1,'2010-03-04 00:00:00',26,3,0),
 (83,4,'2010-03-04 00:00:00',26,3,0),
 (84,1,'2010-03-04 00:00:00',26,3,0),
 (85,4,'2010-03-04 00:00:00',26,3,0),
 (86,1,'2010-03-04 00:00:00',26,3,0),
 (87,4,'2010-03-04 00:00:00',26,3,0),
 (88,1,'2010-03-04 00:00:00',26,3,0),
 (89,4,'2010-03-04 00:00:00',26,3,0),
 (90,1,'2010-03-04 00:00:00',26,3,0),
 (91,4,'2010-03-04 00:00:00',26,3,0),
 (92,1,'2010-03-04 00:00:00',26,3,0),
 (93,4,'2010-03-04 00:00:00',26,3,0),
 (94,1,'2010-03-04 00:00:00',26,3,0),
 (95,4,'2010-03-04 00:00:00',26,3,0),
 (96,1,'2010-03-04 00:00:00',26,3,0),
 (97,4,'2010-03-04 00:00:00',26,3,0),
 (98,1,'2010-03-04 00:00:00',26,3,0),
 (99,4,'2010-03-04 00:00:00',26,3,0),
 (100,1,'2010-03-04 00:00:00',26,3,0),
 (101,4,'2010-03-04 00:00:00',26,3,0);
/*!40000 ALTER TABLE `historialalarma` ENABLE KEYS */;


--
-- Definition of table `historialestadocolmena`
--

DROP TABLE IF EXISTS `historialestadocolmena`;
CREATE TABLE `historialestadocolmena` (
  `idEstadoColmena` int(15) NOT NULL,
  `numeroColmena` int(15) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idEstadoColmena`,`numeroColmena`),
  KEY `REL_HistEstadoCol_Colmena` (`numeroColmena`),
  CONSTRAINT `REL_HistEstadoCol_Colmena` FOREIGN KEY (`numeroColmena`) REFERENCES `colmena` (`numeroColmena`),
  CONSTRAINT `REL_HistEStadoCol_Estado` FOREIGN KEY (`idEstadoColmena`) REFERENCES `estadocolmena` (`idEstadocolmena`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historialestadocolmena`
--

/*!40000 ALTER TABLE `historialestadocolmena` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialestadocolmena` ENABLE KEYS */;


--
-- Definition of table `historialestadofamilia`
--

DROP TABLE IF EXISTS `historialestadofamilia`;
CREATE TABLE `historialestadofamilia` (
  `numeroFamilia` int(15) NOT NULL,
  `idEstadoFamilia` int(15) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`numeroFamilia`,`idEstadoFamilia`),
  KEY `REL_HistEstFam_EstFam` (`idEstadoFamilia`),
  CONSTRAINT `REL_HistEstFam_EstFam` FOREIGN KEY (`idEstadoFamilia`) REFERENCES `estadofamilia` (`idEstadoFamilia`),
  CONSTRAINT `REL_HistEstFam_Fam` FOREIGN KEY (`numeroFamilia`) REFERENCES `familia` (`numeroFamilia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historialestadofamilia`
--

/*!40000 ALTER TABLE `historialestadofamilia` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialestadofamilia` ENABLE KEYS */;


--
-- Definition of table `layout`
--

DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout` (
  `idLayout` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `disenio` varchar(100) DEFAULT NULL,
  `ventaja` varchar(150) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `ancho` int(10) unsigned NOT NULL,
  `largo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idLayout`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layout`
--

/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
INSERT INTO `layout` (`idLayout`,`denominacion`,`disenio`,`ventaja`,`observaciones`,`fechaCreacion`,`ancho`,`largo`) VALUES 
 (1,'En I','La dispoción de las colmenas es en forma de I','Facilidad de mantenimiento','','2009-06-15 00:00:00',5,5),
 (2,'En L','La dispoción de las colmenas es en forma de L','Mejor desempeño en zonas ventosas',NULL,'2009-08-29 00:00:00',4,4),
 (3,'en Y','se arma asi para evitar bacterias','provee mayor visibilidad','sin obs','2009-09-21 00:00:00',6,6),
 (4,'En H','Es necesario por condicion','','','2009-09-22 00:00:00',3,3);
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;


--
-- Definition of table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE `localidad` (
  `idLocalidad` varchar(15) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `temperatura` double DEFAULT NULL,
  `iconoTemperatura` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `localidad`
--

/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` (`idLocalidad`,`nombre`,`latitud`,`longitud`,`temperatura`,`iconoTemperatura`) VALUES 
 ('ARCA0001','Alta Gracia',-31.66,-64.43,23,34),
 ('ARCA0023','Cordoba',-31.4,-64.19,23,34),
 ('ARCA0026','Cruz Del Eje',-30.72,-64.81,23,34),
 ('ARCA0042','La Falda',-31.09,-64.47,23,34),
 ('ARCA0073','Rio Cuarto',-33.13,-64.35,26,32),
 ('ARCA0075','Rio Segundo',-31.67,-63.92,23,34),
 ('ARCA0076','Rio Tercero',-32.18,-64.12,23,34),
 ('ARCA0082','San Francisco',-31.43,-62.09,24,32),
 ('ARCA0108','Villa Carlos Paz',-31.42,-64.5,16,31),
 ('ARCA0110','Villa Dolores',-31.95,-65.15,23,34),
 ('ARCA0124','Marcos Juarez',-32.71,-62.11,24,32),
 ('ARCA0126','Laboulaye',-34.13,-63.39,26,32),
 ('ARCA0191','Villa General Belgrano',-31.98,-64.57,16,31),
 ('ARCA2189','Cruz Alta',-33.02,-61.82,24,32),
 ('ARCA2413','Freyre',-31.17,-62.1,25,32),
 ('ARCA2417','Altos De Chipion',-30.93,-62.28,25,32),
 ('ARCA2421','Morteros',-30.7,-62,25,32),
 ('ARCA2424','Devoto',-31.4,-62.32,24,32),
 ('ARCA2426','La Francia',-31.4,-62.63,24,32),
 ('ARCA2432','El Tio',-31.39,-62.82,23,34),
 ('ARCA2433','Villa Concepcion Del Tio',-31.32,-62.83,23,34),
 ('ARCA2434','Arroyito',-31.42,-63.05,23,34),
 ('ARCA2436','Transito',-31.42,-63.18,23,34),
 ('ARCA2550','Bell Ville',-32.62,-62.7,24,32),
 ('ARCA2553','Justiniano Posse',-32.88,-62.67,24,32),
 ('ARCA2557','Idiazabal',-32.8,-63.03,24,32),
 ('ARCA2559','Cintra',-32.25,-62.64,24,32),
 ('ARCA2563','Noetinger',-32.37,-62.32,24,32),
 ('ARCA2568','Morrison',-32.6,-62.83,24,32),
 ('ARCA2572','Ballesteros',-32.55,-62.98,24,32),
 ('ARCA2581','Los Surgentes',-32.97,-62.02,24,32),
 ('ARCA2583','General Baldissera',-33.12,-62.32,24,32),
 ('ARCA2585','Camilo Aldao',-33.13,-62.1,24,32),
 ('ARCA2587','Inriville',-32.94,-62.29,24,32),
 ('ARCA2589','Monte Buey',-32.92,-62.45,24,32),
 ('ARCA2592','General Roca',-32.73,-61.92,24,32),
 ('ARCA2594','Leones',-32.65,-62.3,24,32),
 ('ARCA2624','Arias',-33.63,-62.42,24,32),
 ('ARCA2625','Cavanagh',-33.48,-62.35,24,32),
 ('ARCA2627','Guatimozin',-33.45,-62.45,24,32),
 ('ARCA2645','Corral De Bustos',-33.28,-62.2,24,32),
 ('ARCA2650','Canals',-33.55,-62.88,24,32),
 ('ARCA2651','Viamonte',-33.81,-62.97,24,32),
 ('ARCA2655','Wenceslao Escalante',-33.17,-62.75,24,32),
 ('ARCA2657','Laborde',-33.15,-62.85,24,32),
 ('ARCA2659','Monte Maiz',-33.2,-62.6,24,32),
 ('ARCA2662','Alejo Ledesma',-33.62,-62.62,24,32),
 ('ARCA2670','La Carlota',-33.43,-63.3,26,32),
 ('ARCA2671','Assunta',-33.52,-63.21,26,32),
 ('ARCA2677','Ucacha',-33.03,-63.52,26,32),
 ('ARCA2679','Pascanas',-33.13,-63.05,24,32),
 ('ARCA2681','Etruria',-32.93,-63.25,26,32),
 ('ARCA5105','Villa Allende',-31.3,-64.3,23,34),
 ('ARCA5107','Agua De Oro',-31.07,-64.3,23,34),
 ('ARCA5109','Unquillo',-31.23,-64.32,23,34),
 ('ARCA5111','Rio Ceballos',-31.17,-64.33,23,34),
 ('ARCA5115','La Granja',-31.02,-64.27,23,34),
 ('ARCA5119','Rafael Garcia',-31.65,-64.26,23,34),
 ('ARCA5123','Toledo',-31.57,-64.02,23,34),
 ('ARCA5125','Malvinas Argentinas',-31.35,-63.8,23,34),
 ('ARCA5127','Rio Primero',-31.33,-63.62,23,34),
 ('ARCA5137','La Para',-30.87,-62.98,23,34),
 ('ARCA5139','Marull',-30.97,-62.83,25,32),
 ('ARCA5141','Balnearia',-31,-62.67,25,32),
 ('ARCA5143','Miramar',-30.9,-62.67,25,32),
 ('ARCA5155','Tanti',-31.33,-64.6,23,34),
 ('ARCA5166','Cosquin',-31.25,-64.48,23,34),
 ('ARCA5168','Valle Hermoso',-31.12,-64.48,23,34),
 ('ARCA5182','San Esteban',-30.92,-64.55,23,34),
 ('ARCA5184','Capilla Del Monte',-30.85,-64.52,23,34),
 ('ARCA5187','San Clemente',-31.72,-64.63,16,31),
 ('ARCA5191','San Agustin',-31.98,-64.38,23,34),
 ('ARCA5196','Santa Rosa De Calamuchita',-32.07,-64.55,23,34),
 ('ARCA5200','Dean Funes',-30.43,-64.35,23,34),
 ('ARCA5201','La Posta',-30.55,-63.52,23,34),
 ('ARCA5214','Quilino',-30.21,-64.48,23,34),
 ('ARCA5220','Jesus Maria',-30.98,-64.1,23,34),
 ('ARCA5223','Colonia Caroya',-31.03,-64.08,23,34),
 ('ARCA5225','Atahona',-30.83,-63.55,23,34),
 ('ARCA5231','Sebastian Elcano',-30.15,-63.58,23,34),
 ('ARCA5244','San Jose De La Dormida',-30.35,-63.93,23,34),
 ('ARCA5246','Rayo Cortado',-30.08,-63.82,23,34),
 ('ARCA5270','Serrezuela',-30.63,-65.38,29,32),
 ('ARCA5284','Villa De Soto',-30.85,-64.98,23,34),
 ('ARCA5295','Salsacate',-31.32,-65.08,16,31),
 ('ARCA5801','Alpa Corral',-32.68,-64.73,26,32),
 ('ARCA5805','Carnerillo',-32.92,-64.03,26,32),
 ('ARCA5807','Bengolea',-33.03,-63.68,26,32),
 ('ARCA5809','General Cabrera',-32.8,-63.87,26,32),
 ('ARCA5811','Coronel Baigorria',-32.85,-64.35,26,32),
 ('ARCA5813','Alcira',-32.75,-64.33,26,32),
 ('ARCA5815','Elena',-32.57,-64.39,26,32),
 ('ARCA5817','Berrotaran',-32.46,-64.39,26,32),
 ('ARCA5823','Los Condores',-32.33,-64.27,26,32),
 ('ARCA5825','Santa Catalina',-33.2,-64.45,26,32),
 ('ARCA5833','Achiras',-33.17,-65,26,32),
 ('ARCA5837','Suco',-33.45,-64.83,26,32),
 ('ARCA5841','San Basilio',-33.48,-64.32,26,32),
 ('ARCA5843','Adelia Maria',-33.62,-64.03,26,32),
 ('ARCA5847','Coronel Moldes',-33.68,-64.57,26,32),
 ('ARCA5853','Corralito',-32.05,-64.2,23,34),
 ('ARCA5854','Almafuerte',-32.2,-64.25,23,34),
 ('ARCA5856','Embalse',-32.18,-64.42,23,34),
 ('ARCA5862','Villa Del Dique',-32.17,-64.48,23,34),
 ('ARCA5864','Villa Rumipal',-32.18,-64.48,23,34),
 ('ARCA5885','Las Tapias',-31.94,-65.07,23,34),
 ('ARCA5889','Mina Clavero',-31.72,-65,16,31),
 ('ARCA5893','Panaholma',-31.62,-65.11,16,31),
 ('ARCA5901','Ausonia',-32.35,-63.22,24,32),
 ('ARCA5903','Villa Nueva',-32.43,-63.25,24,32),
 ('ARCA5911','La Playosa',-32.1,-63.03,24,32),
 ('ARCA5915','Carrilobo',-31.87,-63.13,23,34),
 ('ARCA5917','Arroyo Cabral',-32.52,-63.43,26,32),
 ('ARCA5919','Dalmacio Velez',-32.6,-63.58,26,32),
 ('ARCA5921','Las Perdices',-32.7,-63.7,26,32),
 ('ARCA5923','General Deheza',-32.73,-63.77,26,32),
 ('ARCA5925','Ticino',-32.69,-63.44,26,32),
 ('ARCA5929','Hernando',-32.42,-63.73,26,32),
 ('ARCA5931','Las Isletillas',-32.38,-63.78,26,32),
 ('ARCA5933','General Fotheringham',-32.29,-63.93,26,32),
 ('ARCA5935','Villa Ascasubi',-32.17,-63.89,23,34),
 ('ARCA5936','Tio Pujio',-32.28,-63.37,26,32),
 ('ARCA5940','Las Varillas',-31.87,-62.72,24,32),
 ('ARCA5945','Sacanta',-31.67,-63.07,23,34),
 ('ARCA5949','Alicia',-31.99,-62.47,24,32),
 ('ARCA5963','Villa Del Rosario',-31.58,-63.53,23,34),
 ('ARCA5965','Colazo',-31.88,-63.42,23,34),
 ('ARCA5967','Luque',-31.65,-63.37,23,34),
 ('ARCA5969','Calchin',-31.67,-63.19,23,34),
 ('ARCA5972','Pilar',-31.73,-63.88,23,34),
 ('ARCA5974','Laguna Larga',-31.77,-63.8,23,34),
 ('ARCA5980','Oliva',-32.05,-63.57,23,34),
 ('ARCA5984','James Craik',-32.15,-63.47,23,34),
 ('ARCA5986','Oncativo',-31.92,-63.67,23,34),
 ('ARCA6101','La Cesira',-33.95,-62.98,24,32),
 ('ARCA6121','Pacheco De Melo',-33.76,-63.49,26,32),
 ('ARCA6123','Melo',-34.42,-63.57,26,32),
 ('ARCA6125','Serrano',-34.45,-63.55,26,32),
 ('ARCA6128','Villa Rossi',-34.3,-63.27,26,32),
 ('ARCA6132','General Levalle',-34.02,-63.93,26,32),
 ('ARCA6134','Rio Bamba',-34.06,-63.73,26,32),
 ('ARCA6141','Tosquita',-33.83,-64.46,26,32),
 ('ARCA6144','Washington',-33.88,-64.7,26,32),
 ('ARCA6270','Huinca Renanco',-34.83,-64.38,26,32),
 ('ARCA6275','Villa Huidobro',-34.84,-64.58,26,32),
 ('ARCA6354','La Cumbre',-33.73,-64.17,26,32),
 ('ARCA8146','Isla Verde',-36.24,-62.51,16,22);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;


--
-- Definition of table `marco`
--

DROP TABLE IF EXISTS `marco`;
CREATE TABLE `marco` (
  `numeroMarco` int(15) NOT NULL,
  `numeroAlza` int(15) NOT NULL,
  `numeroCajon` int(15) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `tamanio` varchar(25) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`numeroMarco`,`numeroAlza`,`numeroCajon`),
  KEY `REL_Alza_Marco` (`numeroAlza`,`numeroCajon`),
  CONSTRAINT `REL_Alza_Marco` FOREIGN KEY (`numeroAlza`, `numeroCajon`) REFERENCES `alza` (`numeroAlza`, `numeroCajon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marco`
--

/*!40000 ALTER TABLE `marco` DISABLE KEYS */;
/*!40000 ALTER TABLE `marco` ENABLE KEYS */;


--
-- Definition of table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE `mensajes` (
  `idMensaje` int(15) NOT NULL AUTO_INCREMENT,
  `idAlarma` int(15) DEFAULT NULL,
  `texto` varchar(250) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idMensaje`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mensajes`
--

/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` (`idMensaje`,`idAlarma`,`texto`,`fecha`) VALUES 
 (1,1,'Alarma: Clima demasiado Bajoooooooo en estado: Alta ','2010-03-04 00:00:00'),
 (2,4,'Alarma: Clima alto en estado: Alta ','2010-03-04 00:00:00'),
 (3,1,'Alarma: Clima demasiado Bajoooooooo en estado: Alta ','2010-03-04 00:00:00'),
 (4,4,'Alarma: Clima alto en estado: Alta ','2010-03-04 00:00:00');
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;


--
-- Definition of table `miembrofamilia`
--

DROP TABLE IF EXISTS `miembrofamilia`;
CREATE TABLE `miembrofamilia` (
  `idMiembroFamilia` int(15) NOT NULL,
  `numeroFamilia` int(15) DEFAULT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `fechaNac` datetime DEFAULT NULL,
  `fechaAlta` datetime DEFAULT NULL,
  `fechaBaja` datetime DEFAULT NULL,
  `idTipoAbeja` int(15) DEFAULT NULL,
  `cantidad` int(15) DEFAULT NULL,
  PRIMARY KEY (`idMiembroFamilia`) USING BTREE,
  KEY `REL_Fam_MiembroFam` (`numeroFamilia`),
  KEY `REL_MiembroFam_TipoAbeja` (`idTipoAbeja`),
  CONSTRAINT `REL_Fam_MiembroFam` FOREIGN KEY (`numeroFamilia`) REFERENCES `familia` (`numeroFamilia`),
  CONSTRAINT `REL_MiembroFam_TipoAbeja` FOREIGN KEY (`idTipoAbeja`) REFERENCES `tipoabeja` (`idTipoAbeja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `miembrofamilia`
--

/*!40000 ALTER TABLE `miembrofamilia` DISABLE KEYS */;
INSERT INTO `miembrofamilia` (`idMiembroFamilia`,`numeroFamilia`,`denominacion`,`fechaNac`,`fechaAlta`,`fechaBaja`,`idTipoAbeja`,`cantidad`) VALUES 
 (1,1,'Reina 001','2009-01-13 00:00:00','2009-06-15 00:00:00','2009-06-15 00:00:00',1,1),
 (2,1,'Zanganos 001','2009-03-15 00:00:00','2009-06-15 00:00:00','2009-06-15 00:00:00',3,400),
 (3,1,'Obrera 001','2009-02-15 00:00:00','2009-06-11 00:00:00','2009-06-11 00:00:00',4,345),
 (4,1,'Obreras 002','2009-06-11 00:00:00','2009-06-11 00:00:00','2009-06-11 00:00:00',4,500),
 (5,1,'Obreras 003','2009-06-01 00:00:00','2009-06-01 00:00:00','2009-08-01 00:00:00',4,300),
 (6,2,'Reina 002','2008-12-11 00:00:00','2008-12-11 00:00:00',NULL,1,1),
 (7,2,'Zanganos 002','2006-04-15 00:00:00','2006-04-18 00:00:00',NULL,3,300),
 (8,2,'Obreras 004','2005-06-15 00:00:00','2005-08-15 00:00:00',NULL,4,400),
 (9,3,'Zanganos 003','2009-03-15 00:00:00','2009-09-15 00:00:00',NULL,3,300),
 (10,4,'Reina 003','2009-01-18 00:00:00','2009-09-18 00:00:00',NULL,1,1),
 (11,5,'Obreras 005','2005-02-15 00:00:00','2005-02-22 00:00:00',NULL,4,200),
 (12,7,'Obreras 006','2007-06-30 00:00:00','2007-07-30 00:00:00',NULL,4,100);
/*!40000 ALTER TABLE `miembrofamilia` ENABLE KEYS */;


--
-- Definition of table `periodicidad`
--

DROP TABLE IF EXISTS `periodicidad`;
CREATE TABLE `periodicidad` (
  `idPeriodicidad` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPeriodicidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `periodicidad`
--

/*!40000 ALTER TABLE `periodicidad` DISABLE KEYS */;
INSERT INTO `periodicidad` (`idPeriodicidad`,`denominacion`) VALUES 
 (1,'Diaria'),
 (2,'Semanal'),
 (3,'Mensual'),
 (4,'Anual');
/*!40000 ALTER TABLE `periodicidad` ENABLE KEYS */;


--
-- Definition of table `posicion`
--

DROP TABLE IF EXISTS `posicion`;
CREATE TABLE `posicion` (
  `idPosicion` int(15) NOT NULL,
  `posHorizontal` varchar(25) DEFAULT NULL,
  `posVertical` varchar(25) DEFAULT NULL,
  `idLayout` int(15) NOT NULL,
  PRIMARY KEY (`idPosicion`,`idLayout`) USING BTREE,
  KEY `REL_Pos_Lay` (`idLayout`),
  CONSTRAINT `REL_Pos_Lay` FOREIGN KEY (`idLayout`) REFERENCES `layout` (`idLayout`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posicion`
--

/*!40000 ALTER TABLE `posicion` DISABLE KEYS */;
INSERT INTO `posicion` (`idPosicion`,`posHorizontal`,`posVertical`,`idLayout`) VALUES 
 (1,'1','1',1),
 (1,'1','1',2),
 (2,'2','1',1),
 (2,'1','2',2),
 (3,'3','1',1),
 (3,'1','3',2),
 (4,'2','2',1),
 (4,'1','4',2),
 (5,'2','3',1),
 (5,'2','4',2),
 (6,'2','4',1),
 (6,'3','4',2),
 (7,'1','4',1),
 (7,'4','4',2),
 (8,'3','4',1);
/*!40000 ALTER TABLE `posicion` ENABLE KEYS */;


--
-- Definition of table `recolecciondato`
--

DROP TABLE IF EXISTS `recolecciondato`;
CREATE TABLE `recolecciondato` (
  `idActividad` int(15) NOT NULL,
  `idTarea` int(15) NOT NULL,
  `idRecoleccionDato` int(15) NOT NULL,
  `codTipoActividad` char(5) NOT NULL,
  `codTipoTarea` char(5) NOT NULL,
  `codDatoDeRecoleccion` char(5) NOT NULL,
  `valor` varchar(250) DEFAULT NULL,
  KEY `REL_Tar_RecDato` (`idActividad`,`idTarea`),
  CONSTRAINT `REL_Tar_RecDato` FOREIGN KEY (`idActividad`, `idTarea`) REFERENCES `tarea` (`idActividad`, `idTarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recolecciondato`
--

/*!40000 ALTER TABLE `recolecciondato` DISABLE KEYS */;
/*!40000 ALTER TABLE `recolecciondato` ENABLE KEYS */;


--
-- Definition of table `sintoma`
--

DROP TABLE IF EXISTS `sintoma`;
CREATE TABLE `sintoma` (
  `idSintoma` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`idSintoma`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sintoma`
--

/*!40000 ALTER TABLE `sintoma` DISABLE KEYS */;
INSERT INTO `sintoma` (`idSintoma`,`denominacion`,`descripcion`,`observaciones`) VALUES 
 (1,'Gran mortandad de abejas','Se produce una inflamación intestinal, se observa el abdomen inflamado, hay  diarrea, hay deyecciones acuosas de coloración amarillenta, pudiéndose observar las mismas en la piquera',NULL),
 (2,'Debilidad general ','Las abejas tienen síntomas de debilidad general y una imposibilidad de volar, probablemente a consecuencia de unacompresión de los sacos aéreos abdominales. Se manifiestan temblores y parálisis.',NULL),
 (3,'Escaso Movimiento','Ocurre cuando en las colmenas observamos menos movimiento que el habitual.','Posible Varroasis'),
 (4,'Colmena agitada','Ocurre cuando observamos que las abejas se encuentran mas agitadas de lo normal.','Posible Loque Americana');
/*!40000 ALTER TABLE `sintoma` ENABLE KEYS */;


--
-- Definition of table `sintomaporenfermedad`
--

DROP TABLE IF EXISTS `sintomaporenfermedad`;
CREATE TABLE `sintomaporenfermedad` (
  `idEnfermedad` int(15) NOT NULL,
  `idSintoma` int(15) NOT NULL,
  PRIMARY KEY (`idEnfermedad`,`idSintoma`),
  KEY `REL_SintEnf_Sint` (`idSintoma`),
  CONSTRAINT `REL_SintEnf_Enf` FOREIGN KEY (`idEnfermedad`) REFERENCES `enfermedad` (`idEnfermedad`),
  CONSTRAINT `REL_SintEnf_Sint` FOREIGN KEY (`idSintoma`) REFERENCES `sintoma` (`idSintoma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sintomaporenfermedad`
--

/*!40000 ALTER TABLE `sintomaporenfermedad` DISABLE KEYS */;
INSERT INTO `sintomaporenfermedad` (`idEnfermedad`,`idSintoma`) VALUES 
 (1,3),
 (2,3),
 (6,3),
 (5,4);
/*!40000 ALTER TABLE `sintomaporenfermedad` ENABLE KEYS */;


--
-- Definition of table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
CREATE TABLE `tarea` (
  `idActividad` int(15) NOT NULL,
  `idTarea` int(15) NOT NULL,
  `codTipoActividad` char(5) NOT NULL,
  `codTipoTarea` char(5) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `idEstadoTarea` int(15) DEFAULT NULL,
  `fechaRealizacion` datetime DEFAULT NULL,
  `fechaPrevista` datetime DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `legajoEmpleado` int(15) DEFAULT NULL,
  `idColmena` int(15) DEFAULT NULL,
  `idFamilia` int(15) DEFAULT NULL,
  `idCajon` int(15) DEFAULT NULL,
  `idSintoma` int(15) DEFAULT NULL,
  `idTratamiento` int(15) DEFAULT NULL,
  `idEnfermedad` int(15) DEFAULT NULL,
  `idApiar` int(15) DEFAULT NULL,
  `idLayout` int(15) DEFAULT NULL,
  `idZona` int(15) DEFAULT NULL,
  `idAlarma` int(15) DEFAULT NULL,
  PRIMARY KEY (`idActividad`,`idTarea`),
  KEY `REL_Emp_Tar` (`legajoEmpleado`),
  KEY `REL_EstTar_Tar` (`idEstadoTarea`),
  KEY `REL_TpoTar_Tar` (`codTipoActividad`,`codTipoTarea`),
  KEY `REL_Col_Tar` (`idColmena`),
  KEY `REL_Fam_Tar` (`idFamilia`),
  KEY `REL_Cajon_Tar` (`idCajon`),
  KEY `REL_Sint_Tar` (`idSintoma`),
  KEY `REL_Trat_Tar` (`idTratamiento`),
  KEY `REL_Enf_Tar` (`idEnfermedad`),
  KEY `REL_Apiar_Tar` (`idApiar`),
  KEY `REL_Lay_Tar` (`idLayout`),
  KEY `idZona` (`idZona`),
  KEY `REL_Alar_Tar` (`idAlarma`),
  CONSTRAINT `idZona` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`),
  CONSTRAINT `REL_Act_Tar` FOREIGN KEY (`idActividad`) REFERENCES `actividad` (`idActividad`),
  CONSTRAINT `REL_Alar_Tar` FOREIGN KEY (`idAlarma`) REFERENCES `alarma` (`idAlarma`),
  CONSTRAINT `REL_Apiar_Tar` FOREIGN KEY (`idApiar`) REFERENCES `apiar` (`idApiar`),
  CONSTRAINT `REL_Cajon_Tar` FOREIGN KEY (`idCajon`) REFERENCES `cajon` (`numeroCajon`),
  CONSTRAINT `REL_Col_Tar` FOREIGN KEY (`idColmena`) REFERENCES `colmena` (`numeroColmena`),
  CONSTRAINT `REL_Emp_Tar` FOREIGN KEY (`legajoEmpleado`) REFERENCES `empleado` (`legajo`),
  CONSTRAINT `REL_Enf_Tar` FOREIGN KEY (`idEnfermedad`) REFERENCES `enfermedad` (`idEnfermedad`),
  CONSTRAINT `REL_EstTar_Tar` FOREIGN KEY (`idEstadoTarea`) REFERENCES `estadotarea` (`idEstadoTarea`),
  CONSTRAINT `REL_Fam_Tar` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`numeroFamilia`),
  CONSTRAINT `REL_Lay_Tar` FOREIGN KEY (`idLayout`) REFERENCES `layout` (`idLayout`),
  CONSTRAINT `REL_Sint_Tar` FOREIGN KEY (`idSintoma`) REFERENCES `sintoma` (`idSintoma`),
  CONSTRAINT `REL_TpoTar_Tar` FOREIGN KEY (`codTipoActividad`, `codTipoTarea`) REFERENCES `tipotarea` (`codTipoActividad`, `codTipoTarea`),
  CONSTRAINT `REL_Trat_Tar` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarea`
--

/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` (`idActividad`,`idTarea`,`codTipoActividad`,`codTipoTarea`,`descripcion`,`idEstadoTarea`,`fechaRealizacion`,`fechaPrevista`,`observaciones`,`legajoEmpleado`,`idColmena`,`idFamilia`,`idCajon`,`idSintoma`,`idTratamiento`,`idEnfermedad`,`idApiar`,`idLayout`,`idZona`,`idAlarma`) VALUES 
 (1,1,'C','C','Realizar revision General mensual',1,NULL,'2009-09-01 18:00:00','Sin comentarios adicionales',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (1,2,'C','C','Realizar revision Medica Mensual.',1,NULL,'2009-09-01 18:00:00','Sin comentarios adicionales',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (11,1,'C','A','Realizar control periodico del apiar',2,NULL,'2009-07-17 00:00:00','',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (11,2,'C','C','Realizar control periodico de la colmena',2,NULL,'2009-07-17 00:00:00','',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (12,1,'N','T','recolectar la produccion existente',4,NULL,'2009-10-14 00:00:00','hola que tal',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (14,1,'F','C','Analizar Colmenas',2,NULL,'2010-01-31 00:00:00','Analizar el estado gral.-',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (14,2,'F','C','Controlar estado particular',5,NULL,'2010-03-25 00:00:00','Controlar el estado particular de cada colmena, como así también integrantes, y demas cuestiones.-',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;


--
-- Definition of table `tipoabeja`
--

DROP TABLE IF EXISTS `tipoabeja`;
CREATE TABLE `tipoabeja` (
  `idTipoAbeja` int(15) NOT NULL,
  `denominacion` varchar(10) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `cuidados` varchar(200) DEFAULT NULL,
  `tiempoRecomendado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTipoAbeja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoabeja`
--

/*!40000 ALTER TABLE `tipoabeja` DISABLE KEYS */;
INSERT INTO `tipoabeja` (`idTipoAbeja`,`denominacion`,`descripcion`,`cuidados`,`tiempoRecomendado`) VALUES 
 (1,'Reina','Son las que manejan la Colmena','Cuidar su salud porque es el centro de la colmena','2'),
 (2,'Nodriza','Son aquellas que crian a las demas criaturas','No requieren cuidado','3'),
 (3,'Zangano','Son aquellos que fecundan a la reina','Verificar que tengan la sificiente comida','1'),
 (4,'Obrera','Son las que salen a buscar el polen','Verificar que esten saludables para poder salir a recolectar el polen','3');
/*!40000 ALTER TABLE `tipoabeja` ENABLE KEYS */;


--
-- Definition of table `tipoactividad`
--

DROP TABLE IF EXISTS `tipoactividad`;
CREATE TABLE `tipoactividad` (
  `codTipoActividad` char(5) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `idCargo` int(15) DEFAULT NULL,
  PRIMARY KEY (`codTipoActividad`),
  KEY `REL_TpoAct_Cargo` (`idCargo`),
  CONSTRAINT `REL_TpoAct_Cargo` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoactividad`
--

/*!40000 ALTER TABLE `tipoactividad` DISABLE KEYS */;
INSERT INTO `tipoactividad` (`codTipoActividad`,`denominacion`,`descripcion`,`idCargo`) VALUES 
 ('C','De Control','Se corresponde con las actividades de control',1),
 ('F','De Fabricación','Se corresponde con las actividades de fabricación',6),
 ('I','De Inspección','Se corresponde con las actividades de inspección',3),
 ('N','De Recoleccion','Se corresponde con las actividades de recolección',5),
 ('S','De Sanidad','Se corresponde con las actividades de sanidad',7);
/*!40000 ALTER TABLE `tipoactividad` ENABLE KEYS */;


--
-- Definition of table `tipoagroquimico`
--

DROP TABLE IF EXISTS `tipoagroquimico`;
CREATE TABLE `tipoagroquimico` (
  `idTipoAgroquimico` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idTipoAgroquimico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoagroquimico`
--

/*!40000 ALTER TABLE `tipoagroquimico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoagroquimico` ENABLE KEYS */;


--
-- Definition of table `tipoalarma`
--

DROP TABLE IF EXISTS `tipoalarma`;
CREATE TABLE `tipoalarma` (
  `idTipoAlarma` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTipoAlarma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoalarma`
--

/*!40000 ALTER TABLE `tipoalarma` DISABLE KEYS */;
INSERT INTO `tipoalarma` (`idTipoAlarma`,`denominacion`,`descripcion`) VALUES 
 (1,'Baja','Esta alarma es generada por Pantalla'),
 (2,'Media','Esta alarma es generada por E-mail'),
 (3,'Alta','Esta alarma es generada por Sms');
/*!40000 ALTER TABLE `tipoalarma` ENABLE KEYS */;


--
-- Definition of table `tipoalza`
--

DROP TABLE IF EXISTS `tipoalza`;
CREATE TABLE `tipoalza` (
  `idTipoAlza` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoalza`
--

/*!40000 ALTER TABLE `tipoalza` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoalza` ENABLE KEYS */;


--
-- Definition of table `tipocajon`
--

DROP TABLE IF EXISTS `tipocajon`;
CREATE TABLE `tipocajon` (
  `idtipocajon` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `tamanoprimeraalza` float DEFAULT NULL,
  `tamanoalza` float DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`idtipocajon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipocajon`
--

/*!40000 ALTER TABLE `tipocajon` DISABLE KEYS */;
INSERT INTO `tipocajon` (`idtipocajon`,`denominacion`,`tamanoprimeraalza`,`tamanoalza`,`observaciones`) VALUES 
 (1,'Langstroth',40,60,NULL),
 (2,'Dadant',60,60,NULL);
/*!40000 ALTER TABLE `tipocajon` ENABLE KEYS */;


--
-- Definition of table `tipodato`
--

DROP TABLE IF EXISTS `tipodato`;
CREATE TABLE `tipodato` (
  `idTipoDato` int(15) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTipoDato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipodato`
--

/*!40000 ALTER TABLE `tipodato` DISABLE KEYS */;
INSERT INTO `tipodato` (`idTipoDato`,`descripcion`) VALUES 
 (1,'Cadena'),
 (2,'Entero'),
 (3,'Flotante'),
 (4,'Fecha');
/*!40000 ALTER TABLE `tipodato` ENABLE KEYS */;


--
-- Definition of table `tipoflora`
--

DROP TABLE IF EXISTS `tipoflora`;
CREATE TABLE `tipoflora` (
  `idTipoFlora` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idTipoFlora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoflora`
--

/*!40000 ALTER TABLE `tipoflora` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoflora` ENABLE KEYS */;


--
-- Definition of table `tipomiel`
--

DROP TABLE IF EXISTS `tipomiel`;
CREATE TABLE `tipomiel` (
  `idTipoMiel` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idTipoMiel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipomiel`
--

/*!40000 ALTER TABLE `tipomiel` DISABLE KEYS */;
INSERT INTO `tipomiel` (`idTipoMiel`,`denominacion`,`descripcion`) VALUES 
 (1,'Miel de azahar','De color ámbar claro, perfumada y suave al paladar. De efectos sedantes ayuda a conciliar el sueño a niños y ancianos. Es también antiespasmódica.\r\n'),
 (2,'Miel de romero','De color ámbar muy claro y blanco cuando está cristalizada. Aromática y dulce. Eficaz estimulante hepático que favorece la descongestión del hígado. Indicada para las úlceras del aparato digestivo y la dismenorrea.\r\nNo recomendada a hipertensos ya que es un poco tonificante.'),
 (3,'Miel de eucalyptus','De color ocre. Muy aromática con un sabor característico a madera. Antiséptico de las vías respiratorias y urinarias, de efectos balsámicos y vermífugos. Está indicada contra catarros y afecciones del árbol respiratorio. La más indicada para los diabéticos.'),
 (4,'Miel de tomillo','De tono rojizo y sabor agradable. Indicada para las afecciones respiratorias de tipo inflamatorio, tos convulsiva y asma. Reguladora de la tensión arterial. Muy indicada como tonificante ante la fatiga y la astenia.\r\n'),
 (5,'Miel de espliego','De color ámbar y sabor característico a lavanda. Por su poder bactericida y antiséptico es la más indicada en uso externo para picaduras de insectos, quemaduras y heridas. Buen antidiarreico. También se utiliza en afecciones respiratorias.\r\n'),
 (6,'Mielato de encina','De color muy oscuro casi negro. De olor y sabor a malta muy poco dulce. Muy indicada para combatir la anemia por su alto contenido en hierro. También se utiliza en afecciones respiratorias.\r\n'),
 (7,'Miel de brezo','De color caoba oscuro y sabor poco dulce ligeramente amargo. Muy recomendada en problemas cardíacos: insuficiencia coronaria, arritmias, cardiopatías, angina de pecho e infarto. Ideal para prevenir la formación de cálculos y las inflamaciones en la vejiga, riñón y uretra. Antirreumática. Por su contenido en minerales está indicada para la anemia, inapetencia y fatiga.\r\n'),
 (8,'Miel de milflores','Procedente de varias floraciones simultáneas presenta un color y sabor muy variables, generalmente de un ámbar oscuro y sabor intenso. Antiinflamatoria, digestiva y cicatrizante.');
/*!40000 ALTER TABLE `tipomiel` ENABLE KEYS */;


--
-- Definition of table `tipotarea`
--

DROP TABLE IF EXISTS `tipotarea`;
CREATE TABLE `tipotarea` (
  `codTipoActividad` char(5) NOT NULL,
  `codTipoTarea` char(5) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `usaApiar` tinyint(1) DEFAULT NULL,
  `usaFamilia` tinyint(1) DEFAULT NULL,
  `usaCajon` tinyint(1) DEFAULT NULL,
  `usaTratamiento` tinyint(1) DEFAULT NULL,
  `usaEnfermedad` tinyint(1) DEFAULT NULL,
  `usaSintoma` tinyint(1) DEFAULT NULL,
  `idCargo` int(15) DEFAULT NULL,
  `usaColmena` tinyint(1) DEFAULT NULL,
  `usaLayout` tinyint(1) DEFAULT NULL,
  `usaZona` tinyint(1) DEFAULT NULL,
  `usaAlarma` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codTipoTarea`,`codTipoActividad`),
  KEY `REL_TpoAct_TpoTar` (`codTipoActividad`),
  KEY `REL_TpoTar_Cargo` (`idCargo`),
  CONSTRAINT `REL_TpoAct_TpoTar` FOREIGN KEY (`codTipoActividad`) REFERENCES `tipoactividad` (`codTipoActividad`),
  CONSTRAINT `REL_TpoTar_Cargo` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipotarea`
--

/*!40000 ALTER TABLE `tipotarea` DISABLE KEYS */;
INSERT INTO `tipotarea` (`codTipoActividad`,`codTipoTarea`,`denominacion`,`descripcion`,`usaApiar`,`usaFamilia`,`usaCajon`,`usaTratamiento`,`usaEnfermedad`,`usaSintoma`,`idCargo`,`usaColmena`,`usaLayout`,`usaZona`,`usaAlarma`) VALUES 
 ('C','A','Controlar Apiar','Actividades necesarias para controlar un apiar',0,0,1,0,0,0,NULL,0,0,0,1),
 ('F','A','Fabricar Apiar','Actividades necesarias para fabricar un apiar',0,0,1,0,0,0,NULL,0,0,0,0),
 ('C','C','Controlar Colmena','Actividades necesarias para controlar una colmena',0,0,0,0,0,0,NULL,1,0,0,0),
 ('F','C','Fabricar Colmena','Actividades necesarias para fabricar una colmena',0,0,1,0,0,0,NULL,0,0,0,0),
 ('S','R001','Revisión Mensual de Colmena','Actividades a realizar periodicamente para controlar el estado de la colmena',0,0,0,0,0,0,NULL,0,0,0,0),
 ('N','T','Recoleccion de miel','Actividades necesarias para efectuar la recolección de miel',1,1,1,0,0,0,NULL,1,0,0,0);
/*!40000 ALTER TABLE `tipotarea` ENABLE KEYS */;


--
-- Definition of table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
CREATE TABLE `tratamiento` (
  `idTratamiento` int(15) NOT NULL,
  `denominacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `costeo` float DEFAULT NULL,
  PRIMARY KEY (`idTratamiento`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tratamiento`
--

/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` (`idTratamiento`,`denominacion`,`descripcion`,`costeo`) VALUES 
 (1,'Ácido oxálico','Acaricida orgánico contra la Varroasis',12.32),
 (2,'Ácido fórnico','Acaricida orgánico contra la Varroasis',25.55),
 (3,'Ácido orgánico','Acaricida orgánico contra la Varroasis',45),
 (4,'Tilosina','Antibiótico contra el Loque europeo y el Loque americaca',12),
 (5,'Fumagilina','Antibiótico contra Nosemosis',25),
 (6,'Bacillus thuringiensis','Insecticida biológico contra la Galleriosis',23);
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;


--
-- Definition of table `tratamientosporenfermedad`
--

DROP TABLE IF EXISTS `tratamientosporenfermedad`;
CREATE TABLE `tratamientosporenfermedad` (
  `idEnfermedad` int(15) NOT NULL,
  `idTratamiento` int(15) NOT NULL,
  PRIMARY KEY (`idEnfermedad`,`idTratamiento`),
  KEY `REL_TratPorEnf_Trat` (`idTratamiento`),
  CONSTRAINT `REL_TratPorEnf_Enf` FOREIGN KEY (`idEnfermedad`) REFERENCES `enfermedad` (`idEnfermedad`),
  CONSTRAINT `REL_TratPorEnf_Trat` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tratamientosporenfermedad`
--

/*!40000 ALTER TABLE `tratamientosporenfermedad` DISABLE KEYS */;
INSERT INTO `tratamientosporenfermedad` (`idEnfermedad`,`idTratamiento`) VALUES 
 (5,1),
 (2,2),
 (5,2),
 (1,3),
 (4,4);
/*!40000 ALTER TABLE `tratamientosporenfermedad` ENABLE KEYS */;


--
-- Definition of table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
CREATE TABLE `ubicacion` (
  `idUbicacion` int(15) NOT NULL AUTO_INCREMENT,
  `latitud` decimal(15,5) DEFAULT NULL,
  `longitud` decimal(15,5) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`idUbicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ubicacion`
--

/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` (`idUbicacion`,`latitud`,`longitud`,`observaciones`) VALUES 
 (1,'-31.44400','-64.15664',NULL),
 (2,'-31.74400','-64.99664',NULL),
 (3,'-31.23500','-64.31700',NULL),
 (4,'-31.58400','-63.53664',NULL),
 (5,'-31.65800','-64.42664',NULL),
 (6,'-31.33340','-63.62000',NULL),
 (7,'-32.20640','-64.38680',NULL),
 (8,'-30.89900','-64.99664',NULL),
 (9,'-31.78660','-63.82240',NULL),
 (10,'-32.18877','-64.11770',NULL),
 (11,'-30.86939','-64.51720',NULL),
 (12,'-31.17051','-64.45679',NULL),
 (13,'-31.35305','-64.20135',NULL),
 (14,'-30.74184','-65.46753',NULL),
 (15,'-31.41900','-64.18762',NULL),
 (16,'-32.91649','-69.03809',NULL),
 (17,'-31.26212','-64.44855',NULL),
 (18,'-30.97761','-64.59961',NULL),
 (19,'-31.24803','-64.26178',NULL),
 (20,'-31.29733','-64.42383',NULL),
 (21,'-51.61930','-69.20194',NULL),
 (22,'-31.33018','-64.17732',NULL),
 (23,'-31.44296','-64.19399',NULL),
 (24,'-51.61884','-69.20211',NULL),
 (25,'-30.75246','-64.62708',NULL),
 (26,'-31.44400','-64.15664',NULL),
 (27,'-31.44400','-64.15664',NULL),
 (28,'-31.58400','-63.53664',NULL);
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;


--
-- Definition of table `ubicaciondezona`
--

DROP TABLE IF EXISTS `ubicaciondezona`;
CREATE TABLE `ubicaciondezona` (
  `idUbicacion` int(15) NOT NULL,
  `idZona` int(15) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`idUbicacion`,`idZona`),
  KEY `REL_UbicDeZona_Zona` (`idZona`),
  CONSTRAINT `REL_UbicDeZona_Zona` FOREIGN KEY (`idZona`) REFERENCES `zona` (`idZona`),
  CONSTRAINT `REL_Ubic_UbicDeZona` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ubicaciondezona`
--

/*!40000 ALTER TABLE `ubicaciondezona` DISABLE KEYS */;
INSERT INTO `ubicaciondezona` (`idUbicacion`,`idZona`,`fecha`,`observaciones`) VALUES 
 (1,1,NULL,NULL),
 (2,1,NULL,NULL),
 (3,1,NULL,NULL),
 (4,1,NULL,NULL),
 (5,2,NULL,NULL),
 (6,2,NULL,NULL),
 (7,2,NULL,NULL);
/*!40000 ALTER TABLE `ubicaciondezona` ENABLE KEYS */;


--
-- Definition of table `zona`
--

DROP TABLE IF EXISTS `zona`;
CREATE TABLE `zona` (
  `idZona` int(15) NOT NULL,
  `zona` varchar(100) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `fechaAlta` datetime DEFAULT NULL,
  `fechaBaja` datetime DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `tieneAgroquimico` tinyint(1) DEFAULT NULL,
  `tieneFlora` tinyint(1) DEFAULT NULL,
  `tieneClima` tinyint(1) DEFAULT NULL,
  `idLocalidad` varchar(45) DEFAULT NULL,
  `legajoUsuAlta` int(15) DEFAULT NULL,
  PRIMARY KEY (`idZona`),
  KEY `FK_zona_1` (`idLocalidad`),
  KEY `REL_Usu_UsuFab` (`legajoUsuAlta`),
  CONSTRAINT `REL_Usu_UsuFab` FOREIGN KEY (`legajoUsuAlta`) REFERENCES `empleado` (`legajo`),
  CONSTRAINT `REL_Zona_Loc` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zona`
--

/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` (`idZona`,`zona`,`estado`,`fechaAlta`,`fechaBaja`,`observaciones`,`tieneAgroquimico`,`tieneFlora`,`tieneClima`,`idLocalidad`,`legajoUsuAlta`) VALUES 
 (1,'Gran Córdoba','Alta','2009-06-15 11:07:59',NULL,'No Obs',0,0,0,'ARCA0023',NULL),
 (2,'Valle de Traslasierra','Alta','2009-08-29 00:00:00',NULL,'No Obs',98,98,98,'ARCA5889',NULL),
 (3,'Falda Oriental Sierras Chicas','Alta','2009-08-29 00:00:00',NULL,'No Obs',98,98,98,'ARCA5109',NULL),
 (4,'Villa del Rosario','Alta','2009-08-29 00:00:00',NULL,'No Obs',98,98,98,'ARCA5963',NULL),
 (5,'Valle de Paravachasca','Alta','2009-08-29 00:00:00',NULL,'No Obs',98,98,98,'ARCA0001',NULL),
 (6,'Río Primero','Alta','2009-08-29 00:00:00',NULL,'No Obs',98,98,98,'ARCA5127',NULL),
 (7,'Valle de Calamuchita','Alta','2009-08-29 00:00:00',NULL,'No Obs',0,0,0,'ARCA5856',NULL),
 (8,'Villa de Soto','Alta','2009-08-29 00:00:00',NULL,'No Obs',0,0,0,'ARCA5284',NULL),
 (9,'Laguna Larga','Alta','2009-08-29 00:00:00',NULL,'No Obs',0,0,0,'ARCA5974',NULL),
 (10,'Penillanura','Alta','2009-08-29 00:00:00',NULL,'No Obs',0,0,0,'ARCA0076',NULL),
 (11,'Punilla','Alta','2009-08-29 00:00:00',NULL,'No Obs',0,0,0,'ARCA5184',NULL);
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
