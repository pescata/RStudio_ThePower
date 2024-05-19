##lección regresión lineal R
##conceptos teóricos: relación entre una variable dependiente y una o varias variables dependientes (simple o múltiple)
##ecuación: y = ax + b

##a continuación el proceso paso a paso

#PASO_1: preparación de los datos
?diamonds

#PASO_2: crear el modelo de regresión lineal (función lm)
modelo <- lm(price~carat, data = diamonds)

#PASO_3: analizar el modelo de regresión con la función summary
summary(modelo)
#ecuación resultante: price = 7.756,43 carat - 2.256,36
#ajuste: 84,93% (multiple R-squared)
#nivel de significación: cercano a 0 (p-value)

#PASO_4: representar los modelos
#primero vamos a representar la totalidad del data set, y a continuación le 
#vamos a añadir la línea de tendencia de acuerdo con el modelo anterior
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red", se = FALSE) #se nos permite ver o no el intervalo de confianza
