-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 01-03-2023 a las 03:35:29
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
-- Base de datos: `evalua-v2`
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

--
-- Volcado de datos para la tabla `Alumno`
--

INSERT INTO `Alumno` (`matricula`, `nombre`, `apellido_materno`, `apellido_paterno`) VALUES
(202000114, 'ALUMNO', 'A-2', 'A-2'),
(202000115, 'ALUMNO-2', 'A-1', 'Q-2');

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

--
-- Volcado de datos para la tabla `Carrera`
--

INSERT INTO `Carrera` (`id_carrera`, `nombre_carrera`, `nombre_corto`, `correo_institucional`) VALUES
(1, 'Ing.Software', 'SOTF', 'EJEMPLO@1.edu.mx'),
(2, 'Ing.Biomedica', 'BIO', 'EJEMPLO@-2.edu.mx'),
(3, 'Ing.Biotecnologia', 'BIOTEC', 'EJEMPLO@--3.edu.mx');

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
(1, 'Cuestionario v1 2022');

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

--
-- Volcado de datos para la tabla `Curso`
--

INSERT INTO `Curso` (`id_curso`, `id_periodo`, `id_materia`, `id_grupo`, `id_docente`) VALUES
(1, 3222, 1, 1, 1),
(2, 3322, 1, 2, 2),
(4, 3223, 1, 1, 1),
(6, 3222, 1, 2, 1),
(3, 3223, 2, 3, 1),
(5, 3222, 2, 4, 2);

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

--
-- Volcado de datos para la tabla `Docente`
--

INSERT INTO `Docente` (`id_docente`, `nombre`, `apellido_materno`, `apellido_paterno`, `correo`) VALUES
(1, 'DOCENTE ', 'PRUEBA 1', 'PRUEBA 1-1', 'EJEPLI@1.EDU.MX'),
(2, 'DOCENTE PRUEBA 2', 'PRUEBA 2', 'PRUEBA 2-2', 'EJEPLI@1.EDU.MX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Encuesta`
--

CREATE TABLE `Encuesta` (
  `id_encuesta` int NOT NULL,
  `id_curso` int NOT NULL,
  `matricula_alumno` int NOT NULL,
  `id_cuestionario_ad` int NOT NULL,
  `estatus` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Encuesta`
--

INSERT INTO `Encuesta` (`id_encuesta`, `id_curso`, `matricula_alumno`, `id_cuestionario_ad`, `estatus`) VALUES
(1, 1, 202000114, 1, 0),
(1, 2, 202000115, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Grupo`
--

CREATE TABLE `Grupo` (
  `id_grupo` int NOT NULL,
  `clave_grupo` varchar(20) DEFAULT NULL,
  `id_carrera` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Grupo`
--

INSERT INTO `Grupo` (`id_grupo`, `clave_grupo`, `id_carrera`) VALUES
(1, '28AV', 1),
(2, '28BIO', 2),
(3, '27BIOTEC', 3),
(4, '28AV', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Materia`
--

CREATE TABLE `Materia` (
  `id_materia` int NOT NULL,
  `nombre_materia` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Materia`
--

INSERT INTO `Materia` (`id_materia`, `nombre_materia`) VALUES
(1, 'Ingles I'),
(2, 'Algebra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Periodo`
--

CREATE TABLE `Periodo` (
  `id_periodo` int NOT NULL,
  `Estatus` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Periodo`
--

INSERT INTO `Periodo` (`id_periodo`, `Estatus`) VALUES
(3222, 0),
(3223, 1),
(3322, 0),
(3332, 0);

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
(1, 1, 'Hola'),
(2, 1, 'ola de mar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Respuesta`
--

CREATE TABLE `Respuesta` (
  `id_encuesta` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `id_cuestionario_ad` int NOT NULL,
  `puntuacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Respuesta`
--

INSERT INTO `Respuesta` (`id_encuesta`, `id_pregunta`, `id_cuestionario_ad`, `puntuacion`) VALUES
(1, 1, 1, 2),
(1, 1, 1, 2),
(1, 1, 1, 4),
(1, 2, 1, 4);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CuestionarioAlumnoDocente`
--
ALTER TABLE `CuestionarioAlumnoDocente`
  MODIFY `id_cuestionario_ad` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Curso`
--
ALTER TABLE `Curso`
  MODIFY `id_curso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Encuesta`
--
ALTER TABLE `Encuesta`
  MODIFY `id_encuesta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Pregunta`
--
ALTER TABLE `Pregunta`
  MODIFY `id_pregunta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Respuesta`
--
ALTER TABLE `Respuesta`
  MODIFY `id_encuesta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
