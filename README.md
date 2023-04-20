# evalua-BD docs

#### Al importar la base de datos en el gestor que este utlizando, debera asignarle el siguente cojetamiento
![image](https://user-images.githubusercontent.com/85807291/224874708-b552bd53-b3aa-44ab-8540-d87d8f7f92a5.png)


      
#### Este es el diagrama ER
![image](https://user-images.githubusercontent.com/85807291/233235383-31dd74a3-7343-4b41-a7e1-9a4e62c1d690.png)




#### <em> La base de datos contiene registros de prueba insertados </em>
##### Obtener el promedio de la encuesta por carrera

      CALL getAverageByCareer({id}, {id_periodo})       -> donde el "id" es el de la carrera 

    

##### Obtener la lista de profesores por periodo

      CALL getTeachersAverageByPeriod({periodo})       -> donde el "periodo" es el del cuatrimestre 


##### Obtener la lista de grupos por profesor

      CALL getGroupsByTeacher({id},{id_carrera}, {id_periodo}) -> donde el "id" es el del profesor

     


##### Obtener la puntuacion individual de cada grupo por carrera 

      CALL getAverageGroupByCarrer({id}, {id_periodo})   -> donde el "id" es el de la carrera 


##### Promedio de pregunta por grupo 

      CALL getAverageQuestionByGroup({id}, {id_perido})      -> donde el "id" es el del grupo
      

##### Detalles del total de encuestas respondidas y pendientes 

      CALL getStudentsByGroup({id_grupo}, {id_periodo});

##### Lista de profeso ,res por alumno (matricula)

      CALL getTeacherByStudent({matricula} )      ->donde "matricula" es la del alumno 
      
         
###### Nota: la consulta puede devolver una query vacia, si solicitan datos que no existen 


##### Preguntas del cuestionario actual

      CALL getCurrentQuestions()


##### Guardar las respuestas

      CALL   saveAnswer ({idEncuesta}, {idPregunta}, {idCuestionarioAd}, {valor})
   
##### Enviar comentario de la encuesta 

      Call   surveyCommentPost({id_encuesta},"comentario")

###### Nota: el comentario puede ser nullo, pero la consulta se debe ejecutar ya que actualiza el estado de la encuesta en automatico

##### Obtener el estado de las encuestas en general
     CALL getSurveyStats();

##### Obtener informacion general de la carrera
      CALL  getGenInfo({id_carrera});
      
##### Diccionario de datos
      https://upqrooedumx-my.sharepoint.com/:x:/g/personal/202000088_upqroo_edu_mx/EToKGm1MdOxKgo4qjm7eoqsBMklFEGd-YCiGB_mpqUtIqg?rtime=E95zl9VB20g



