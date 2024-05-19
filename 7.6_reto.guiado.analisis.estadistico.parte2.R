#datos sobre el consumo millas por galón de un set de vehículos
#se analizará el consumo en relación con potencia, cilindros, litros, peso, transmisión

library(readxl)
library(dplyr)
library(ggplot2)
raw <- read_excel(path = "mtcars.xlsx", sheet = "coches")
head(raw)
summary(raw)

clean <- raw %>% 
  select(mpg, cyl, disp, hp, wt, am) %>% 
  mutate(am = factor(am, level = c(0,1), labels = c("automático", "manual")), cyl = as.factor(cyl))
summary(clean)

correlation <- cor(clean[,c("mpg", "disp", "hp", "wt")])
correlation
#podemos ver la correlación de forma gráfica empleando pairs
pairs(clean[,c("mpg", "disp", "hp", "wt")])

#ahora vamos a ver la relación con la variable am
ggplot(data = clean, aes(x = am, y = mpg, fill = am)) +
  geom_boxplot() + 
  labs(title = "relación entre consumo y tipo de transmisión",
       x = "tipo de transmisión",
       y = "consumo (millas por galón)")

ggplot(data = clean, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot() + 
  labs(title = "relación entre consumo y nº cilindros",
       x = "nº cilindros",
       y = "consumo (millas por galón)")

#ahora vamos a hacer un test estadístico que nos diga cuan cierta es la relación
#entre el consumo y el número de cilindros que nos dicen las gráficas.
#vamos a analizar la relacion entre las diferentes medias del consumo y la transmision
#esto es una comparación binomial (automático o manual) y un valor númerico
#por lo tanto encaja el test t de studendt

t <- t.test(mpg ~ am, data = clean)
t
#el resultado pone de manifiesto que si hay diferencia entre las medias de consumo por transmisión

#ahora procede el mismo análisis respecto al número de cilindros
#dato que el campo cilindros admite más de 2 valores, procede aplicar el test anova

anova <- aov(mpg ~ cyl, data = clean)
#para su interpretación vemos el resumen "summary"
summary(anova)
#arroja un nivel de signficación p insiginificante, por lo tanto si hay diferencia   
  

#ahora vamos a representar la regresión lineal de consumo y potencia
model <- lm(mpg ~ hp + disp +wt, data = clean)
summary(model)
