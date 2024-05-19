##leccion regresiones logísticas R

#librerias ggplot2 y dplyr
#obtención de los datos
data("PimaIndiansDiabetes2", package = "mlbench")
head(PimaIndiansDiabetes2)

#preparación de los datos
diabetes <- na.omit(PimaIndiansDiabetes2) #quita los valores omitidos
rm(PimaIndiansDiabetes2) #mediante remove se eliminan aquellos  objetos con los que no estamos trabajando

#crear modelo de regresión logística múltiple
modelo_rlm <- glm(diabetes~ ., data = diabetes, family = "binomial") #al no indicar variables concretas, lo va a analizar en función de todas
#analizar el modelo múltiple
summary(modelo_rlm)

#crear modelo de regresión logística simple
modelo_rls <- glm(diabetes~glucose, data = diabetes, family = "binomial") #solo va a analizar en función de la glucosa
#analizar el modelo simple
summary(modelo_rls)

#representar el modelo con ggplot2
diabetes <- diabetes %>% mutate(probabilidad = ifelse(diabetes == "pos",1,0))
head(diabetes, n=7)

ggplot(diabetes, aes(x = glucose, y = probabilidad)) +
  geom_point() +
  geom_smooth(method = "glm", method.args = list(family = "binomial"))

#calcular predicciones a partir del modelo definido (para ello se emplea la función predict)
nuevos_datos <- data.frame(glucose=c(80,120,230,90,60))
est_probab <- predict(modelo_rls, nuevos_datos, type = "response")
est_probab