#video_1 lección reto guiado

data(package = "mlbench", PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2, n=10)

#empezamos haciendo una primera exploracion de los datos
mean(PimaIndiansDiabetes2$glucose, na.rm = TRUE)
sd(PimaIndiansDiabetes2$glucose, na.rm = TRUE)
summary(PimaIndiansDiabetes2$glucose)
table(PimaIndiansDiabetes2$diabetes)
prop.table(table(PimaIndiansDiabetes2$diabetes))

summary(PimaIndiansDiabetes2)
hist(PimaIndiansDiabetes2$glucose)

t <- t.test(glucose ~ diabetes, data = PimaIndiansDiabetes2)
print(t)

datos.sin_na <- PimaIndiansDiabetes2 %>% na.omit()
cor(datos.sin_na$glucose, datos.sin_na$pressure)

#video_2 lección reto guiado
#datos sobre el consumo medido en galón por millas de una serie de vehículos (mtcars)
#vamos a analizar la relación entre los caballos de potencia, el número de cilindros,
#litros, el peso y la transmision, con la variable consumo

library(readxl)
library(dplyr)

a <- file.choos







