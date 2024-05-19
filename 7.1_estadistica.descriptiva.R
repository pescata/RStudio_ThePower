#lección estadística descriptiva en R empleando el conjunto de datos diamonds
d <- diamonds
head(d, n=10)

##medidas de posición

#media
#el argumento na.rm = TRUE, excluye del cálculos los NA
#el argumento trim permite excluir los valores extremos (outlayers)
mean(d$price)
mean(d$price, na.rm = TRUE, trim = 0.025)

#mediana
median(d$price)

#ejemplo microlearning
# Calcular la media y la mediana
datos <- c(10, 15, 20, 25, 30)
media_datos <- mean(datos)
mediana_datos <- median(datos)


#moda
#instalar paquete modeest
install.packages("modeest")
library(modeest)

mfv(d$price) #mfv es la función para calcular la moda
mfv(d$carat)

#tamaño de la muestra
length(d$price)

#frecuencias absolutas
t <- table(d$cut)
t

#frecuencias relativas
prop.table(t)
round(prop.table(t)*100,3)

#cuantiles
quantile(d$price, prob = c(0.25, 0.5, 0.75))


##medidas de dispersión

#mínimo
min(d$price)

#máximo
max(d$price)

#rango
range(d$price)

#varianza
var(d$price)

#desviación estándar
sd(d$price)


##forma de distribución
#requiere el paquete psych
install.packages("psych")
library(psych)

#coeficiente de simetría
skew(d$price)

#curtosis
kurtosi(d$price)

##resumen estadístico y análisis exploratorio: permite calcular varios estadísticos de forma agregada
summary(d$price)
describe(d$price)

summary(d)
describe(d)

##histograma de frecuencia de los quilates o del precio
hist(d$carat)
hist(d$price)

##gráfico de barras, frecuencia por corte
barplot(table(d$cut))
barplot(table(d$cut), col = "skyblue", ylab = "Frecuencia", main = "Frecuencia de cortes")

##gráfico de dispersión (precio vs quilate)
plot(x = d$price, y = d$carat)
cor(x = d$price, y = d$carat) #mide la correlación entre variables
