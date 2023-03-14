-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 14-03-2023 a las 03:04:41
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.1.16

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alumno`
--

CREATE TABLE `Alumno` (
  `matricula` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrera`
--

CREATE TABLE `Carrera` (
  `id_carrera` int NOT NULL,
  `nombre_carrera` varchar(60) DEFAULT NULL,
  `nombre_corto` varchar(50) DEFAULT NULL,
  `correo_institucional` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CuestionarioAlumnoDocente`
--

CREATE TABLE `CuestionarioAlumnoDocente` (
  `id_cuestionario_ad` int NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id_curso` int NOT NULL,
  `id_periodo` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_grupo` int NOT NULL,
  `id_docente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso_has_Alumno`
--

CREATE TABLE `Curso_has_Alumno` (
  `id_curso` int NOT NULL,
  `matricula` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Docente`
--

CREATE TABLE `Docente` (
  `id_docente` int NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Encuesta`
--

CREATE TABLE `Encuesta` (
  `id_encuesta` int NOT NULL,
  `id_curso` int NOT NULL,
  `matricula_alumno` int NOT NULL,
  `id_cuestionario_ad` int NOT NULL,
  `estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Grupo`
--

CREATE TABLE `Grupo` (
  `id_grupo` int NOT NULL,
  `clave_grupo` varchar(20) DEFAULT NULL,
  `id_carrera` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Materia`
--

CREATE TABLE `Materia` (
  `id_materia` int NOT NULL,
  `nombre_materia` varchar(60) DEFAULT NULL,
  `nombre_corto_materia` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Periodo`
--

CREATE TABLE `Periodo` (
  `id_periodo` int NOT NULL,
  `Estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pregunta`
--

CREATE TABLE `Pregunta` (
  `id_pregunta` int NOT NULL,
  `id_cuestionario_ad` int NOT NULL,
  `pregunta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `id_encuesta` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `id_cuestionario_ad` int NOT NULL,
  `puntuacion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  ADD PRIMARY KEY (`id_docente`);

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
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `fk_Pregunta_CuestionarioAlumnoDocente1` (`id_cuestionario_ad`);

--
-- Indices de la tabla `Respuesta`
--
ALTER TABLE `Respuesta`
  ADD KEY `fk_Respuesta_CuestionarioAlumnoDocente1_idx` (`id_cuestionario_ad`),
  ADD KEY `fk_Respuesta_Pregunta2` (`id_pregunta`),
  ADD KEY `fk_Respuesta_Encuesta3` (`id_encuesta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Pregunta`
--
ALTER TABLE `Pregunta`
  MODIFY `id_pregunta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
