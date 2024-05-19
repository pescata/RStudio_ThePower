#ejemplo modelo de clasificación
#dataset iris

head(iris)
summary(iris)

data(iris)

set.seed(568)
index <- createDataPartition(iris$Species,
                             p = 0.8,
                             list = FALSE)

train_set <- iris[index,]
test_set <- iris[-index,]

#Función de control
ctrl <- trainControl(method = "cv", number = 10, verboseIter = TRUE)

#KNN para clasificiación
knn_clasification_model <- train(Species ~ .,
                                 data = train_set,
                                 method = "knn",
                                 trControl = ctrl,
                                 tuneGrid = expand.grid(k = seq(2,15,1)))

knn_clasification_model

knn_clasification_predict <- predict(knn_clasification_model, test_set)

confusionMatrix(knn_clasification_predict, test_set$Species)
