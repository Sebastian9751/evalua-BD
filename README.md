# evalua-BD docs

#### Al importar la base de datos en el gestor que este utlizando, debera asignarle el siguente cojetamiento
![image](https://user-images.githubusercontent.com/85807291/224874708-b552bd53-b3aa-44ab-8540-d87d8f7f92a5.png)


      
#### Este es el diagrama ER
![er](https://user-images.githubusercontent.com/85807291/226157309-e77cf798-d5ba-4614-976a-6d1450493b6d.png)




#### <em> La base de datos contiene registros de prueba insertados </em>
##### Obtener el promedio de la encuesta por carrera

      CALL getAverageByCareer({id}, {id_periodo})       -> donde el "id" es el de la carrera 

       1 = Software
       2 = Biomedica
       3 = Biotecnologia

    

##### Obtener la lista de profesores por periodo

      CALL getTeachersAverageByPeriod({periodo})       -> donde el "periodo" es el del cuatrimestre 


##### Obtener la lista de grupos por profesor

      CALL getGroupsByTeacher({id},{id_carrera}, {id_periodo}) -> donde el "id" es el del profesor

     


#### Obtener la puntuacion individual de cada grupo por carrera 

      CALL getAverageGroupByCarrer({id}, {id_periodo})   -> donde el "id" es el de la carrera 


#### Promedio de pregunta por grupo 

      CALL getAverageQuestionByGroup({id}, {id_perido})      -> donde el "id" es el del grupo
      

#### Lista de estudiantes por grupo

      TODO

#### Lista de profeso ,res por alumno (matricula)

      CALL getTeacherByStudent({matricula} )      ->donde "matricula" es la del alumno 
      
         
###### Nota: la consulta puede devolver una query vacia, si solicitan datos que no existen 


#### Preguntas del cuestionario actual

      CALL getCurrentQuestions()


#### Guardar las respuestas

      CALL   saveAnswer ({idEncuesta}, {idPregunta}, {idCuestionarioAd}, {valor})
   
#### Enviar comentario de la encuesta 

      Call   surveyCommentPost({id_encuesta},"comentario")

###### Nota: el comenatio puede ser nullo, pero la consulta se debe ejecutar ya que actualiza el estado de la encuesta en automatico
