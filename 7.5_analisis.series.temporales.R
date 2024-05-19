install.packages("forecast")
library(forecast)

?AirPassengers
class(AirPassengers)
AirPassengers

plot(AirPassengers)
#primero vamos a descomponer esta serie temporal, en este caso mediante el 
#método multiplicativo empleando la función decompose

desc <- decompose(AirPassengers, "multiplicative")
plot(desc)

#ahora vamos a separar el dataset en 2 bloques para entrenar nuestro modelo. 
#una parte con datos de test, y otra con datos de entrenamiento

start(AirPassengers)
end(AirPassengers)

trainData <- window(AirPassengers, start = c(1949,1), end = c(1959,12))
testData <- window(AirPassengers, start = c(1960,1), end = c(1960,12))

#ahora vamos a realizar las predicciones en base a estos datos que hemos preparado
#aplicaremos el modelo ARIMA

modelo_arima <- auto.arima(trainData) #este es el modelo que hemos entrenado

predic_arima <- forecast(modelo_arima, h = length(testData)) #aqui ejecutamos la predicción
plot(predic_arima) #vamos a representar la prediccion

accuracy(predic_arima, testData) #nos da el resultado de la predicción en base a una serie
#de medidas sobre la precisión de la predicción. Nos vamos a fijar en el dato MAPE
#que mide la media de porcentaje de error absoluto. En este caso es de un 4,18% que es muy ajustado

