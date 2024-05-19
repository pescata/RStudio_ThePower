#Reto: elegir entre un modelo de KNN y un modelo de regresión logística en función
#de cual predice mejor si un paciente es diabético o no
#paquete PimaIndiansDiabetes2

library(caret)
library(dplyr)

data(package = "mlbench", PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)
summary(PimaIndiansDiabetes2)

#vamos a hacer una primera limpieza para eliminar nos NA's
data <- PimaIndiansDiabetes2 %>% 
  select(pregnant, glucose, pressure, mass, pedigree, age, diabetes) %>% 
  na.omit()

#vamos con la partición
set.seed(478)
index <- createDataPartition(data$diabetes,
                             p = 0.7,
                             list = FALSE)

train_set <- data[index,]
test_set <- data[-index,]

#función de control
ctrl <- trainControl(method = "cv", number = 8, verboseIter = TRUE)
knn_params = expand.grid(k = c(2:20))

#KNN
modelLookup("knn")
knn_model <- train(diabetes ~ .,
                   data = train_set,
                   method = "knn",
                   trControl = ctrl,
                   tuneGrid = knn_params
                   )

knn_model
plot(knn_model) #permite ver gráficamente el modelo

knn_predict <- predict(knn_model, test_set)
confusionMatrix(knn_predict,test_set$diabetes)

#Modelo de Regresión logística
modelLookup("glm")
gm_model <- train(diabetes ~ .,
                  data = train_set,
                  method = "glm",
                  trControl = ctrl
                  )

gm_model

gm_predict <- predict(gm_model,test_set)
confusionMatrix(gm_predict, test_set$diabetes)

#en base a la especificidad el mejor modelo es el glm porque es el que mejor predice que personas tienen diabetes


