#instalar y cargar la librería caret
install.packages("caret")
library(caret)

#breve descripción libreria
modelos <- getModelInfo()
names(modelos) #con esto podemos ver todos los algoritmos disponibles

modelLookup("knn") #si queremos saber para que métodos sirve un algoritmo, p.e. knn
modelLookup("neuralnet") #otro ejemplo, ahora con neuralnet

#ejemplo de regresión con el dataset mtcars
#comenzamos por hacer la partición de la muestra en datos entrenamiento y datos prueba,
#en este ejemplo haremos una partición 70-30 y almacenamos cada subset en una variable

data("mtcars")
set.seed(123)
index <- createDataPartition(mtcars$mpg,
                             p = 0.7,
                             list = FALSE) 
train_set <- mtcars[index,]
test_set <- mtcars[-index,] 

head(test_set)

#ejercicio: predecir mpg (dato numérico), por lo tanto procede un modelo de regresión

#comenzamos por definir una función de control valida para los distintos algoritmos
ctrl <- trainControl(method = "cv", number = 10, verboseIter = TRUE) 

#REGRESIÓN LINEAL
lr_model <- train(mpg ~ .,
                  data = train_set,
                  method = "lm",
                  trControl = ctrl
                  ) #con esta función entrenamos el modelo

lr_model

#ahora corresponde hacer las predicciones mediante la función predict
lr_predict <- predict(lr_model, test_set)

#ahora vamos a ver como de ajustado es el resultado del modelo midiendo el error cuadrático medio
lr_rmse <- sqrt(mean((lr_predict-test_set$mpg)^2))
lr_rmse


#KNN                
knn_model <- train(mpg ~ .,
                  data = train_set,
                  method = "knn",
                  trControl = ctrl,
                  tuneGrid = expand.grid(k = seq(1,20,1))
                  )
knn_model

knn_predict <- predict(knn_model, test_set)
knn_rmse <- sqrt(mean((knn_predict-test_set$mpg)^2))

#RED NEURONAL (neuralnet)                
nn_model <- train(mpg ~ .,
                  data = train_set,
                  method = "neuralnet",
                  trControl = ctrl,
                  tuneGrid = expand.grid(layer1 = c(1:3), layer2 = c(1:3), layer3 =0)
                  )

nn_model
nn_predict <- predict(nn_model,test_set)  
nn_rmse <- sqrt(mean((nn_predict-test_set$mpg)^2))  
nn_rmse

#ahora vamos a comparar los 3 modelos de regresión empleados con la función cat
cat("Regresión lineal", lr_rmse, "\n")
cat("KNN", knn_rmse, "\n")
cat("Red neuronal", nn_rmse, "\n")

# "\n" sirve para hacer salto de linea

#Conclusión: en este ejemplo el modelo que más se ajusta es KNN pues es el que tiene
#un error cuadrático medio (rmse) menor






