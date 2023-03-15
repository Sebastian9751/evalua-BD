-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-03-2023 a las 06:39:16
-- Versión del servidor: 5.5.68-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `evalua_i`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`SistemaEval`@`localhost` PROCEDURE `getAverageByCareer` (IN `idCareer` INT(10))  BEGIN
SELECT id_periodo, Grupo.clave_grupo,nombre_materia,nombre_carrera,nombre_corto, AVG(Respuesta.puntuacion) AS promedio_puntuacion
FROM Encuesta 
INNER JOIN Curso ON Encuesta.id_curso = Curso.id_curso 
INNER JOIN Grupo ON Curso.id_grupo = Grupo.id_grupo 
INNER JOIN Carrera ON Grupo.id_carrera = Carrera.id_carrera
INNER JOIN Materia ON Curso.id_materia = Materia.id_materia
INNER JOIN Respuesta ON Encuesta.id_encuesta = Respuesta.id_encuesta  
INNER JOIN Pregunta ON Respuesta.id_pregunta = Pregunta.id_pregunta

WHERE Carrera.id_carrera=  idCareer

GROUP BY Grupo.clave_grupo, nombre_materia, nombre_carrera, nombre_corto, id_periodo;

END$$

CREATE DEFINER=`SistemaEval`@`localhost` PROCEDURE `getAverageGroupByCarrer` (IN `idCareer` INT(10))  BEGIN

SELECT  id_periodo, clave_grupo, nombre_carrera, AVG(Respuesta.puntuacion) AS promedio_puntuacion
FROM Encuesta 
INNER JOIN Curso ON Encuesta.id_curso = Curso.id_curso 
INNER JOIN Grupo ON Curso.id_grupo = Grupo.id_grupo 
INNER JOIN Docente ON Curso.id_docente = Docente.id_docente
INNER JOIN Carrera ON Grupo.id_carrera = Carrera.id_carrera
INNER JOIN Materia ON Curso.id_materia = Materia.id_materia
INNER JOIN Respuesta ON Encuesta.id_encuesta = Respuesta.id_encuesta  
INNER JOIN Pregunta ON Respuesta.id_pregunta = Pregunta.id_pregunta

WHERE Carrera.id_carrera= idCareer

GROUP BY id_periodo,Grupo.clave_grupo, Carrera.nombre_carrera, id_periodo;

END$$

CREATE DEFINER=`SistemaEval`@`localhost` PROCEDURE `getAverageQuestionByGroup` (IN `idGroup` INT(10))  BEGIN
SELECT id_periodo, Pregunta.id_pregunta, Pregunta.pregunta, Pregunta.id_cuestionario_ad, Grupo.clave_grupo, AVG(Respuesta.puntuacion) AS promedio_puntuacion
FROM Encuesta 
INNER JOIN Curso ON Encuesta.id_curso = Curso.id_curso 
INNER JOIN Grupo ON Curso.id_grupo = Grupo.id_grupo 
INNER JOIN Carrera ON Grupo.id_carrera = Carrera.id_carrera
INNER JOIN Materia ON Curso.id_materia = Materia.id_materia
INNER JOIN Respuesta ON Encuesta.id_encuesta = Respuesta.id_encuesta  
INNER JOIN Pregunta ON Respuesta.id_pregunta = Pregunta.id_pregunta

WHERE Grupo.id_grupo =  idGroup

GROUP BY  Pregunta.id_pregunta, Pregunta.pregunta, Pregunta.id_cuestionario_ad, Grupo.clave_grupo, id_periodo;

 END$$

CREATE DEFINER=`SistemaEval`@`localhost` PROCEDURE `getGroupsByTeacher` (IN `idDoc` INT(10), IN `idCarr` INT(10))  BEGIN

SELECT Docente.id_docente, id_periodo, Grupo.clave_grupo,nombre_materia, Docente.nombre,Docente.apellido_materno, Docente.apellido_paterno, AVG(Respuesta.puntuacion) AS promedio_puntuacion
FROM Encuesta 
INNER JOIN Curso ON Encuesta.id_curso = Curso.id_curso 
INNER JOIN Grupo ON Curso.id_grupo = Grupo.id_grupo 
INNER JOIN Docente ON Curso.id_docente = Docente.id_docente
INNER JOIN Carrera ON Grupo.id_carrera = Carrera.id_carrera
INNER JOIN Materia ON Curso.id_materia = Materia.id_materia
INNER JOIN Respuesta ON Encuesta.id_encuesta = Respuesta.id_encuesta  
INNER JOIN Pregunta ON Respuesta.id_pregunta = Pregunta.id_pregunta

WHERE Docente.id_docente = idDoc AND Carrera.id_carrera = idCarr 

GROUP BY id_periodo,Grupo.clave_grupo, Docente.id_docente, nombre_materia, Docente.nombre, Docente.apellido_materno, Docente.apellido_paterno;

END$$

CREATE DEFINER=`SistemaEval`@`localhost` PROCEDURE `getStudentsByGroup` (IN `idGroup` INT(10))  BEGIN
SELECT id_periodo, nombre_carrera, clave_grupo, matricula_alumno, nombre, apellido_materno, apellido_paterno 
FROM Encuesta 
INNER JOIN Curso ON Encuesta.id_curso = Curso.id_curso 
INNER JOIN Alumno ON Encuesta.matricula_alumno = Alumno.matricula
INNER JOIN Grupo ON Curso.id_grupo = Grupo.id_grupo 
INNER JOIN Carrera ON Grupo.id_carrera = Carrera.id_carrera

WHERE Grupo.id_grupo= idGroup;

END$$

CREATE DEFINER=`SistemaEval`@`localhost` PROCEDURE `getTeacherByStudent` (IN `Mt` INT(9), IN `Pe` INT(4))  BEGIN
SELECT Curso.id_periodo, Curso.id_curso, Materia.id_materia, Materia.nombre_materia,Grupo.clave_grupo, Materia.nombre_corto_materia, Docente.id_docente, Docente.nombre,Docente.apellido_materno, Docente.apellido_paterno,Carrera.nombre_carrera
FROM Curso_has_Alumno 
INNER JOIN Curso ON Curso_has_Alumno.id_curso= Curso.id_curso 
INNER JOIN Materia ON Curso.id_materia
INNER JOIN Docente ON Curso.id_docente= Docente.id_docente
INNER JOIN Grupo ON Curso.id_grupo = Grupo.id_grupo
INNER JOIN Carrera ON Grupo.id_carrera =Carrera.id_carrera

WHERE matricula = mt AND  Curso.id_periodo = Pe;
END$$

CREATE DEFINER=`SistemaEval`@`localhost` PROCEDURE `getTeachersAverageByPeriod` (IN `idPeriod` INT(4))  BEGIN
SELECT id_periodo, Grupo.clave_grupo,nombre_materia,nombre_carrera, Docente.nombre,Docente.apellido_materno, Docente.apellido_paterno ,AVG(Respuesta.puntuacion) AS promedio_puntuacion
FROM Encuesta 
INNER JOIN Curso ON Encuesta.id_curso = Curso.id_curso 
INNER JOIN Grupo ON Curso.id_grupo = Grupo.id_grupo 
INNER JOIN Docente ON Curso.id_docente = Docente.id_docente
INNER JOIN Carrera ON Grupo.id_carrera = Carrera.id_carrera
INNER JOIN Materia ON Curso.id_materia = Materia.id_materia
INNER JOIN Respuesta ON Encuesta.id_encuesta = Respuesta.id_encuesta  
INNER JOIN Pregunta ON Respuesta.id_pregunta = Pregunta.id_pregunta

WHERE id_periodo = idPeriod

GROUP BY id_periodo, Grupo.clave_grupo, nombre_materia, nombre_carrera, Docente.nombre, Docente.apellido_materno,Docente.apellido_paterno;



END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alumno`
--

CREATE TABLE `Alumno` (
  `matricula` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrera`
--

CREATE TABLE `Carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(60) DEFAULT NULL,
  `nombre_corto` varchar(50) DEFAULT NULL,
  `correo_institucional` varchar(120) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Carrera`
--

INSERT INTO `Carrera` (`id_carrera`, `nombre_carrera`, `nombre_corto`, `correo_institucional`, `status`) VALUES
(1, 'INGENIERIA EN BIOTECNOLOGIA', 'ING. BIOTECNOLOGIA', '@miuniversidad.edu', 1),
(2, 'INGENIERIA EN SOFTWARE', 'ING. SOFTWARE', '@miuniversidad.edu', 1),
(3, 'INGENIERIA FINANCIERA', 'ING. FINANCIERA', '@miuniversidad.edu', 1),
(4, 'LICENCIATURA EN ADMINISTRACIÓN Y GESTIÓN EMPRESARIAL ', 'LIC. GES.Y PYMES', '@miuniversidad.edu', 0),
(5, 'LICENCIATURA EN TERAPIA FISICA', 'LIC. TERAPIA FISICA', '@miuniversidad.edu', 1),
(6, 'INGENIERIA EN BIOMÉDICA', 'ING. BIOMEDICA', '@miuniversidad.edu', 1),
(7, 'LICENCIATURA ADMINISTRACION Y GESTION DE PYMES', 'LAGE', '@miuniversidad.edu', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CuestionarioAlumnoDocente`
--

CREATE TABLE `CuestionarioAlumnoDocente` (
  `id_cuestionario_ad` int(11) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CuestionarioAlumnoDocente`
--

INSERT INTO `CuestionarioAlumnoDocente` (`id_cuestionario_ad`, `descripcion`) VALUES
(1, 'Cuestionario v1 2022'),
(2, 'Cuestionario v2 2022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso`
--

CREATE TABLE `Curso` (
  `id_curso` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso_has_Alumno`
--

CREATE TABLE `Curso_has_Alumno` (
  `id_curso` int(11) NOT NULL,
  `matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Docente`
--

CREATE TABLE `Docente` (
  `id_docente` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Encuesta`
--

CREATE TABLE `Encuesta` (
  `id_encuesta` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `matricula_alumno` int(11) NOT NULL,
  `id_cuestionario_ad` int(11) NOT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Grupo`
--

CREATE TABLE `Grupo` (
  `id_grupo` int(11) NOT NULL,
  `clave_grupo` varchar(20) DEFAULT NULL,
  `id_carrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Materia`
--

CREATE TABLE `Materia` (
  `id_materia` int(11) NOT NULL,
  `nombre_materia` varchar(60) DEFAULT NULL,
  `nombre_corto_materia` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Periodo`
--

CREATE TABLE `Periodo` (
  `id_periodo` int(11) NOT NULL,
  `Estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pregunta`
--

CREATE TABLE `Pregunta` (
  `id_pregunta` int(11) NOT NULL,
  `id_cuestionario_ad` int(11) NOT NULL,
  `pregunta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Pregunta`
--

INSERT INTO `Pregunta` (`id_pregunta`, `id_cuestionario_ad`, `pregunta`) VALUES
(1, 2, 'El o la docente al inicio del cuatrimestre, dio a conocer: los objetivos de aprendizaje y programa de asignatura'),
(2, 2, 'El o la docente al inicio del cuatrimestre, dio a conocer: los criterios y periodos de evaluación'),
(3, 2, 'El o la docente al inicio del cuatrimestre, dio a conocer: la metodología de trabajo'),
(4, 2, 'El o la docente al inicio del cuatrimestre, dio a conocer: las referencias o bibliografía actualizada'),
(5, 2, 'El o la docente al inicio del cuatrimestre, dio a conocer: Realizó algún cuestionario de conocimientos generales de su asignatura'),
(6, 2, 'El o la docente al inicio del cuatrimestre, dio a conocer: Dialogó los acuerdos o reglas del aula'),
(7, 2, 'Enseña el 200% los contenidos de la asignatura durante todo el cuatrimestre'),
(8, 2, 'Vincula el contenido nuevo con temas ya vistos'),
(9, 2, 'Promueve actividades prácticas como: laboratorio, taller, visitas de estudio, reflexión de situaciones de la vida real, casos, etc.  vinculada a la teoría de la asignatura'),
(10, 2, 'Promueve diversas formas de aprendizaje como trabajo en equipo y/o de manera individual'),
(11, 2, 'Emplea diversos materiales para explicar los temas como: presentaciones, esquemas, vídeos, ejemplos, películas, juegos ya sean físicos o digitales'),
(12, 2, 'Los materiales de clase son adaptados o creados correctamente y están relacionados con la asignatura'),
(13, 2, 'Emplea las TIC en su clase como: presentaciones, juegos, demos, programas, audios, foros, información veraz y verificada de internet'),
(14, 2, 'Emplea la plataforma educativa o el SIE para brindar seguimiento'),
(15, 2, 'Explica de manera clara los temas de la asignatura'),
(16, 2, 'Mantiene el interés y motivación de la clase'),
(17, 2, 'Promueve la participación reflexiva'),
(18, 2, 'Ayuda al repaso de temas ya vistos en clase'),
(19, 2, 'Se asegura que la mayoría del grupo haya entendido los temas'),
(20, 2, 'Considera la situación económica del alumnado en la solicitud de materiales para actividades'),
(21, 2, 'Lleva a cabo diversas técnicas para evaluar como: casos, exámenes, retos, proyectos, ensayos, etc.'),
(22, 2, 'Realiza comentarios a las evidencias solicitadas que ayudan a la mejora de forma individual'),
(23, 2, 'Presenta los indicadores de cómo se calificarán las actividades asignadas'),
(24, 2, 'Existe congruencia entre los temas vistos y evaluados en clases'),
(25, 2, 'Entrega calificaciones parciales en el SIE de la Universidad'),
(26, 2, 'Califica de manera justa de acuerdo con evidencias presentadas por las y los compañeros de clase'),
(27, 2, 'Las normas de convivencia de la clase se basan en los valores de la Universidad'),
(28, 2, 'Mantiene el comunicación positiva y constante con el grupo'),
(29, 2, 'Promueve la práctica de la diversidad de ideas, creencias, valores y cultura'),
(30, 2, 'Promueve el diálogo basado en el respeto, tolerancia, responsabilidad y armonía'),
(31, 2, 'Promueve el cuidado de las instalaciones: limpieza, orden y medio ambiente'),
(32, 2, 'Respeta su horario de clase'),
(33, 2, 'Llega puntual y asiste al menos al 90% de las sesiones'),
(34, 2, '¿Cómo calificarías el desempeño de tu docente frente al grupo?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuesta`
--

CREATE TABLE `Respuesta` (
  `id_encuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_cuestionario_ad` int(11) NOT NULL,
  `puntuacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_docente`
--

CREATE TABLE `tipo_docente` (
  `id_tipo` int(11) NOT NULL,
  `clave_tipo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_docente`
--

INSERT INTO `tipo_docente` (`id_tipo`, `clave_tipo`, `descripcion`) VALUES
(1, 'PA', 'Profesor de asignatura'),
(2, 'PCT', 'Profesor de tiempo completo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Alumno`
--
ALTER TABLE `Alumno`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `Carrera`
--
ALTER TABLE `Carrera`
  ADD PRIMARY KEY (`id_carrera`);

--
-- Indices de la tabla `CuestionarioAlumnoDocente`
--
ALTER TABLE `CuestionarioAlumnoDocente`
  ADD PRIMARY KEY (`id_cuestionario_ad`);

--
-- Indices de la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD PRIMARY KEY (`id_curso`,`id_periodo`,`id_materia`,`id_grupo`,`id_docente`),
  ADD KEY `fk_Curso_Materia2_idx` (`id_materia`),
  ADD KEY `fk_Curso_Grupo2_idx` (`id_grupo`),
  ADD KEY `fk_Curso_Docente2_idx` (`id_docente`),
  ADD KEY `fk_Curso_Periodo1_idx` (`id_periodo`);

--
-- Indices de la tabla `Curso_has_Alumno`
--
ALTER TABLE `Curso_has_Alumno`
  ADD PRIMARY KEY (`id_curso`,`matricula`),
  ADD KEY `fk_Curso_has_Alumno_Alumno1_idx` (`matricula`),
  ADD KEY `fk_Curso_has_Alumno_Curso1_idx` (`id_curso`);

--
-- Indices de la tabla `Docente`
--
ALTER TABLE `Docente`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `Encuesta`
--
ALTER TABLE `Encuesta`
  ADD PRIMARY KEY (`id_encuesta`,`id_curso`,`matricula_alumno`,`id_cuestionario_ad`),
  ADD KEY `fk_Encuesta_Curso2_idx` (`id_curso`),
  ADD KEY `fk_Encuesta_Alumno2_idx` (`matricula_alumno`),
  ADD KEY `fk_Encuesta_CuestionarioAlumnoDocente1_idx` (`id_cuestionario_ad`);

--
-- Indices de la tabla `Grupo`
--
ALTER TABLE `Grupo`
  ADD PRIMARY KEY (`id_grupo`,`id_carrera`),
  ADD KEY `fk_Grupo_Carrera2_idx` (`id_carrera`);

--
-- Indices de la tabla `Materia`
--
ALTER TABLE `Materia`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `Periodo`
--
ALTER TABLE `Periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `Pregunta`
--
ALTER TABLE `Pregunta`
  ADD PRIMARY KEY (`id_pregunta`,`id_cuestionario_ad`),
  ADD KEY `fk_Pregunta_CuestionarioAlumnoDocente1_idx` (`id_cuestionario_ad`);

--
-- Indices de la tabla `Respuesta`
--
ALTER TABLE `Respuesta`
  ADD KEY `fk_Respuesta_CuestionarioAlumnoDocente1_idx` (`id_cuestionario_ad`),
  ADD KEY `fk_Respuesta_Pregunta2` (`id_pregunta`),
  ADD KEY `fk_Respuesta_Encuesta3` (`id_encuesta`);

--
-- Indices de la tabla `tipo_docente`
--
ALTER TABLE `tipo_docente`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Carrera`
--
ALTER TABLE `Carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `Curso`
--
ALTER TABLE `Curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Encuesta`
--
ALTER TABLE `Encuesta`
  MODIFY `id_encuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Grupo`
--
ALTER TABLE `Grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Materia`
--
ALTER TABLE `Materia`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pregunta`
--
ALTER TABLE `Pregunta`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `tipo_docente`
--
ALTER TABLE `tipo_docente`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD CONSTRAINT `fk_Curso_Docente2` FOREIGN KEY (`id_docente`) REFERENCES `Docente` (`id_docente`),
  ADD CONSTRAINT `fk_Curso_Grupo2` FOREIGN KEY (`id_grupo`) REFERENCES `Grupo` (`id_grupo`),
  ADD CONSTRAINT `fk_Curso_Materia2` FOREIGN KEY (`id_materia`) REFERENCES `Materia` (`id_materia`),
  ADD CONSTRAINT `fk_Curso_Periodo1` FOREIGN KEY (`id_periodo`) REFERENCES `Periodo` (`id_periodo`);

--
-- Filtros para la tabla `Curso_has_Alumno`
--
ALTER TABLE `Curso_has_Alumno`
  ADD CONSTRAINT `fk_Curso_has_Alumno_Alumno1` FOREIGN KEY (`matricula`) REFERENCES `Alumno` (`matricula`),
  ADD CONSTRAINT `fk_Curso_has_Alumno_Curso1` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id_curso`);

--
-- Filtros para la tabla `Docente`
--
ALTER TABLE `Docente`
  ADD CONSTRAINT `Docente_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_docente` (`id_tipo`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `Encuesta`
--
ALTER TABLE `Encuesta`
  ADD CONSTRAINT `fk_Encuesta_Alumno2` FOREIGN KEY (`matricula_alumno`) REFERENCES `Alumno` (`matricula`),
  ADD CONSTRAINT `fk_Encuesta_CuestionarioAlumnoDocente1` FOREIGN KEY (`id_cuestionario_ad`) REFERENCES `CuestionarioAlumnoDocente` (`id_cuestionario_ad`),
  ADD CONSTRAINT `fk_Encuesta_Curso2` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id_curso`);

--
-- Filtros para la tabla `Grupo`
--
ALTER TABLE `Grupo`
  ADD CONSTRAINT `fk_Grupo_Carrera2` FOREIGN KEY (`id_carrera`) REFERENCES `Carrera` (`id_carrera`);

--
-- Filtros para la tabla `Pregunta`
--
ALTER TABLE `Pregunta`
  ADD CONSTRAINT `fk_Pregunta_CuestionarioAlumnoDocente1` FOREIGN KEY (`id_cuestionario_ad`) REFERENCES `CuestionarioAlumnoDocente` (`id_cuestionario_ad`);

--
-- Filtros para la tabla `Respuesta`
--
ALTER TABLE `Respuesta`
  ADD CONSTRAINT `fk_Respuesta_CuestionarioAlumnoDocente1` FOREIGN KEY (`id_cuestionario_ad`) REFERENCES `CuestionarioAlumnoDocente` (`id_cuestionario_ad`),
  ADD CONSTRAINT `fk_Respuesta_Encuesta3` FOREIGN KEY (`id_encuesta`) REFERENCES `Encuesta` (`id_encuesta`),
  ADD CONSTRAINT `fk_Respuesta_Pregunta2` FOREIGN KEY (`id_pregunta`) REFERENCES `Pregunta` (`id_pregunta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
