#Vamos a utilizar la librería mlbench, de la cual utilizaremos el set de datos mpg que nos proporciona información de coches más populares en un periodo de tiempo.

install.packages("mlbench")
library(mlbench)

?mpg
head(mpg, n=10)

#Histograma
ggplot(mpg, aes(x = cyl)) +
  geom_histogram(binwidth = 1, color = "red", fill = "yellow") +
  labs(title = "Histograma: coches por cilindrada",
       x = "cilindros",
       y = "Num_coches")


#Gráfico de barras
ggplot(mpg, aes(x = class)) +
  geom_bar(aes(fill=manufacturer)) +
  labs(title = "Distribución de coches por clase",
       x = "clase",
       y = "Num_coches") +
  theme(panel.background = element_blank()) +
  theme(plot.title = element_text(color = "orange")) +
  theme(legend.position = "none")


#Boxplot
mpg$trans <- mpg$trans %>% str_sub(1,-5)

ggplot(mpg, aes(x = trans, y = cty)) +
  geom_boxplot(aes(fill = trans)) +
  labs(title = "Consumo por tipo de transmisión",
       x = "Transmisión",
       y = "Consumo urbano") +
  theme(legend.position = "none") +
  theme(panel.background = element_blank())


#Dispersión
ggplot(mpg, aes(x = cty, y =hwy)) + 
  geom_point(aes(color = trans, size = cyl))


#Facetado
ggplot(mpg, aes(x = cty, y =hwy)) + 
  geom_point(aes(color = class, size = cyl)) +
  facet_wrap(~trans)



