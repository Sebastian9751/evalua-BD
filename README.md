# evalua-BD docs

#### Al importar la base de datos en el gestor que este utlizando, debera asignarle el siguente cojetamiento
![image](https://user-images.githubusercontent.com/85807291/224874708-b552bd53-b3aa-44ab-8540-d87d8f7f92a5.png)


      
#### Este es el diagrama ER

![er](https://user-images.githubusercontent.com/85807291/224757342-5fd2eac9-c1ea-4e52-9377-aa64b33beceb.png)


#### <em> La base de datos contiene registros de prueba insertados </em>
##### Obtener el promedio de la encuesta por carrera

      CALL getAverageByCareer({id})       -> donde el "id" es el de la carrera 

       1 = Software
       2 = Biomedica
       3 = Biotecnologia

    

##### Obtener la lista de profesores por periodo

      CALL getTeachersAverageByPeriod({periodo})       -> donde el "periodo" es el del cuatrimestre 

      #Periodos 
      -3222
      -3332

##### Obtener la lista de grupos por profesor

      CALL getGroupsByTeacher({id},{id_carrera)) -> donde el "id" es el del profesor

       Profesores
      
       1 = Vanessa
       2 = Roberto
       
       Carreras id
       
       1 = Software
       2 = Biomedica
       3 = Biotecnologia


#### Obtener la puntuacion individual de cada grupo por carrera 

      CALL getAverageGroupByCarrer({id})   -> donde el "id" es el de la carrera 

       1 = Software
       2 = Biomedica
       3 = Biotecnologia


#### Promedio de pregunta por grupo 

      CALL getAverageQuestionByGroup({id})      -> donde el "id" es el del grupo
      
      1 = 28AV
      2 = 28BII
      3 = 27BIOTEC

#### Lista de estudiantes por grupo

      CALL getStudentsByGroup({id})       -> donde el "id" es el del grupo

      1 = 28AV
      2 = 28BII
      3 = 27BIOTEC

#### Lista de profeosres por alumno (matricula)

      CALL getTeacherByStudent({matricula}, {periodo})      ->donde "matricula" es la del alumno y
      "perido" es el del cuatrimestre
      
      Matriculas              #Periodos 
    
      - 202000109             - 3222
      - 202000110             - 3332                        
      - 202000111
      - 202000114
      - 202000115      
###### Nota: la consulta puede devolver una query vacia, si solicitan datos que no existen 


#### Preguntas por vercion del cuestionario

      CALL getQuestionsByVersion({id})  ->donde "id" es el del cuestionario (2)


#### Guardar las respuestas

   CALL   saveAnswer ({idEncuesta}, {idPregunta}, {idCuestionarioAd}, {valor})
   
