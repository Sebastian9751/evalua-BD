# Promedio de encuesta por carrera


DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`%` PROCEDURE `getAverageByCareer` (IN `idCareer` INT(10))   BEGIN
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

DELIMITER ;





