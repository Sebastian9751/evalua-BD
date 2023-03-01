# evalua-BD docs
### Datos de prueba insertados

#Obtener el promedio de la encuesta por carrera

      CALL getAverageByCareer({id})       -> donde el "id" es el de la carrera 

       1 = Software
       2 = Biomedica
       3 = Biotecnologia

    

#Obtener la lista de profesores por periodo

      CALL getTeachersAverageByPeriod({periodo})      -> donde el "periodo" es el del cuatrimestre 

      #Periodos 
      -3222
      -3332

#Obtener la lista de grupos por profesor

      CALL getGroupsByTeacher({id}) -> donde el "id" es el del profesor

       1 = Vanessa
       2 = Roberto
