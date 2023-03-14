-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: evalua_v2
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `matricula` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (202000109,'TEST','TES-1','TEST-2'),(202000110,'BIOALUM','ASA','AASS'),(202000111,'INCOGNITO','ap1','ap2'),(202000114,'Sebas','s','sm'),(202000115,'Unknow','unk','now');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(60) DEFAULT NULL,
  `nombre_corto` varchar(50) DEFAULT NULL,
  `correo_institucional` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Ing.Software','SOTF','@SOTF'),(2,'Ing.Biomedica','BIO','@BIO'),(3,'Ing.Biotecnologia','BIOTEC','@biotec');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionarioalumnodocente`
--

DROP TABLE IF EXISTS `cuestionarioalumnodocente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuestionarioalumnodocente` (
  `id_cuestionario_ad` int NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_cuestionario_ad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionarioalumnodocente`
--

LOCK TABLES `cuestionarioalumnodocente` WRITE;
/*!40000 ALTER TABLE `cuestionarioalumnodocente` DISABLE KEYS */;
INSERT INTO `cuestionarioalumnodocente` VALUES (1,'Cuestionario  2022');
/*!40000 ALTER TABLE `cuestionarioalumnodocente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `id_periodo` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_grupo` int NOT NULL,
  `id_docente` int NOT NULL,
  PRIMARY KEY (`id_curso`,`id_periodo`,`id_materia`,`id_grupo`,`id_docente`),
  KEY `fk_Curso_Materia2_idx` (`id_materia`),
  KEY `fk_Curso_Grupo2_idx` (`id_grupo`),
  KEY `fk_Curso_Docente2_idx` (`id_docente`),
  KEY `fk_Curso_Periodo1_idx` (`id_periodo`),
  CONSTRAINT `fk_Curso_Docente2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `fk_Curso_Grupo2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `fk_Curso_Materia2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `fk_Curso_Periodo1` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (2,3222,1,1,2),(4,3222,1,3,1),(1,3222,2,1,1),(3,3332,2,2,1),(5,3332,3,1,2);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_has_alumno`
--

DROP TABLE IF EXISTS `curso_has_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_has_alumno` (
  `id_curso` int NOT NULL,
  `matricula` int NOT NULL,
  PRIMARY KEY (`id_curso`,`matricula`),
  KEY `fk_Curso_has_Alumno_Alumno1_idx` (`matricula`),
  KEY `fk_Curso_has_Alumno_Curso1_idx` (`id_curso`),
  CONSTRAINT `fk_Curso_has_Alumno_Alumno1` FOREIGN KEY (`matricula`) REFERENCES `alumno` (`matricula`),
  CONSTRAINT `fk_Curso_has_Alumno_Curso1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_has_alumno`
--

LOCK TABLES `curso_has_alumno` WRITE;
/*!40000 ALTER TABLE `curso_has_alumno` DISABLE KEYS */;
INSERT INTO `curso_has_alumno` VALUES (5,202000109),(4,202000110),(3,202000111),(1,202000114),(5,202000114),(2,202000115);
/*!40000 ALTER TABLE `curso_has_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `id_docente` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Vanessa','PRUEBA 1','PRUEBA 1-1','@docente 1'),(2,'Roberto ','PRUEBA 2','PRUEBA 2-2','@docente 2');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta` (
  `id_encuesta` int NOT NULL,
  `id_curso` int NOT NULL,
  `matricula_alumno` int NOT NULL,
  `id_cuestionario_ad` int NOT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`id_encuesta`,`id_curso`,`matricula_alumno`,`id_cuestionario_ad`),
  KEY `fk_Encuesta_Curso2_idx` (`id_curso`),
  KEY `fk_Encuesta_Alumno2_idx` (`matricula_alumno`),
  KEY `fk_Encuesta_CuestionarioAlumnoDocente1_idx` (`id_cuestionario_ad`),
  CONSTRAINT `fk_Encuesta_Alumno2` FOREIGN KEY (`matricula_alumno`) REFERENCES `alumno` (`matricula`),
  CONSTRAINT `fk_Encuesta_CuestionarioAlumnoDocente1` FOREIGN KEY (`id_cuestionario_ad`) REFERENCES `cuestionarioalumnodocente` (`id_cuestionario_ad`),
  CONSTRAINT `fk_Encuesta_Curso2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,1,202000114,1,1),(2,2,202000115,1,1),(3,3,202000111,1,1),(4,4,202000110,1,1),(5,5,202000114,1,1),(6,5,202000109,1,1);
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `clave_grupo` varchar(20) DEFAULT NULL,
  `id_carrera` int NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_carrera`),
  KEY `fk_Grupo_Carrera2_idx` (`id_carrera`),
  CONSTRAINT `fk_Grupo_Carrera2` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'28AV',1),(2,'28BIO',2),(3,'27BIOTEC',3);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(60) DEFAULT NULL,
  `nombre_corto_materia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Ingles I','ingles'),(2,'Algebra','AGL'),(3,'Redes','RED');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `id_periodo` int NOT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (3222,0),(3332,0);
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `id_pregunta` int NOT NULL AUTO_INCREMENT,
  `id_cuestionario_ad` int NOT NULL,
  `pregunta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`,`id_cuestionario_ad`),
  KEY `fk_Pregunta_CuestionarioAlumnoDocente1_idx` (`id_cuestionario_ad`),
  CONSTRAINT `fk_Pregunta_CuestionarioAlumnoDocente1` FOREIGN KEY (`id_cuestionario_ad`) REFERENCES `cuestionarioalumnodocente` (`id_cuestionario_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,1,'El o la docente al inicio del cuatrimestre, dio a conocer: los objetivos de aprendizaje y programa de asignatura'),(2,1,'El o la docente al inicio del cuatrimestre, dio a conocer: los criterios y periodos de evaluación'),(3,1,'El o la docente al inicio del cuatrimestre, dio a conocer: la metodología de trabajo'),(4,1,'El o la docente al inicio del cuatrimestre, dio a conocer: las referencias o bibliografía actualizada'),(5,1,'El o la docente al inicio del cuatrimestre, dio a conocer: Realizó algún cuestionario de conocimientos generales de su asignatura'),(6,1,'El o la docente al inicio del cuatrimestre, dio a conocer: Dialogó los acuerdos o reglas del aula'),(7,1,'Enseña el 100% los contenidos de la asignatura durante todo el cuatrimestre'),(8,1,'Vincula el contenido nuevo con temas ya vistos'),(9,1,'Promueve actividades prácticas como: laboratorio, taller, visitas de estudio, reflexión de situaciones de la vida real, casos, etc.  vinculada a la teoría de la asignatura'),(10,1,'Promueve diversas formas de aprendizaje como trabajo en equipo y/o de manera individual'),(11,1,'Emplea diversos materiales para explicar los temas como: presentaciones, esquemas, vídeos, ejemplos, películas, juegos ya sean físicos o digitales'),(12,1,'Los materiales de clase son adaptados o creados correctamente y están relacionados con la asignatura'),(13,1,'Emplea las TIC en su clase como: presentaciones, juegos, demos, programas, audios, foros, información veraz y verificada de internet'),(14,1,'Emplea la plataforma educativa o el SIE para brindar seguimiento'),(15,1,'Explica de manera clara los temas de la asignatura'),(16,1,'Mantiene el interés y motivación de la clase'),(17,1,'Promueve la participación reflexiva'),(18,1,'Ayuda al repaso de temas ya vistos en clase'),(19,1,'Se asegura que la mayoría del grupo haya entendido los temas'),(20,1,'Considera la situación económica del alumnado en la solicitud de materiales para actividades'),(21,1,'Lleva a cabo diversas técnicas para evaluar como: casos, exámenes, retos, proyectos, ensayos, etc.'),(22,1,'Realiza comentarios a las evidencias solicitadas que ayudan a la mejora de forma individual'),(23,1,'Presenta los indicadores de cómo se calificarán las actividades asignadas'),(24,1,'Existe congruencia entre los temas vistos y evaluados en clases'),(25,1,'Entrega calificaciones parciales en el SIE de la Universidad'),(26,1,'Califica de manera justa de acuerdo con evidencias presentadas por las y los compañeros de clase'),(27,1,'Las normas de convivencia de la clase se basan en los valores de la Universidad'),(28,1,'Mantiene el comunicación positiva y constante con el grupo'),(29,1,'Promueve la práctica de la diversidad de ideas, creencias, valores y cultura'),(30,1,'Promueve el diálogo basado en el respeto, tolerancia, responsabilidad y armonía'),(31,1,'Promueve el cuidado de las instalaciones: limpieza, orden y medio ambiente'),(32,1,'Respeta su horario de clase'),(33,1,'Llega puntual y asiste al menos al 90% de las sesiones'),(34,1,'¿Cómo calificarías el desempeño de tu docente frente al grupo?');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta` (
  `id_encuesta` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `id_cuestionario_ad` int NOT NULL,
  `puntuacion` int DEFAULT NULL,
  KEY `fk_Respuesta_CuestionarioAlumnoDocente1_idx` (`id_cuestionario_ad`),
  KEY `fk_Respuesta_Pregunta2` (`id_pregunta`),
  KEY `fk_Respuesta_Encuesta3` (`id_encuesta`),
  CONSTRAINT `fk_Respuesta_CuestionarioAlumnoDocente1` FOREIGN KEY (`id_cuestionario_ad`) REFERENCES `cuestionarioalumnodocente` (`id_cuestionario_ad`),
  CONSTRAINT `fk_Respuesta_Encuesta3` FOREIGN KEY (`id_encuesta`) REFERENCES `encuesta` (`id_encuesta`),
  CONSTRAINT `fk_Respuesta_Pregunta2` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 18:39:59
