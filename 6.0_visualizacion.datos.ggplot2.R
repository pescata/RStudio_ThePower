install.packages("gapminder") #dataset esperanza vida mundial
install.packages("ggplot2")

library(ggplot2)
library(gapminder)
library(dplyr)

head(gapminder, n=10)

#vamos a empezar a filtrar
spain <- filter(gapminder, country == "Spain")
head(spain)
ggplot(data = spain, aes(x = year, y = lifeExp)) +
  geom_line(color = "green") +
  geom_point(size = 3, color = "green") +
  geom_text(aes(label = lifeExp)) +
  labs(title = "Evolución esperanza de vida España",
       x = "años",
       y = "esperanza")

#ejemplo microlearning
# Cargar la librería ggplot2
library(ggplot2)

# Crear datos de ejemplo
datos <- data.frame(ejex = c(1, 2, 3, 4, 5),
                    ejey = c(2, 4, 1, 6, 3))

# Crear el gráfico de dispersión
ggplot(datos, aes(x = ejex, y = ejey)) +
  geom_point() +
  labs(title = "Diagrama de Dispersión",
       x = "Eje X",
       y = "Eje Y")
# Cargar la librería ggplot2
library(ggplot2)

# Crear datos de ejemplo
datos <- data.frame(ejex = c(1, 2, 3, 4, 5),
                    ejey = c(2, 4, 1, 6, 3))

# Crear el gráfico de dispersión
ggplot(datos, aes(x = ejex, y = ejey)) +
  geom_point() +
  labs(title = "Diagrama de Dispersión",
       x = "Eje X",
       y = "Eje Y")

# Crear un gráfico de barras

country <- gapminder %>% 
  select(country,continent) %>% 
  group_by(continent) %>% 
  filter(!duplicated(country))

ggplot(data = country) + geom_bar(aes(y=continent), fill = "blue") +
  labs(title = "Paises por continente", x = "Continente", y = "Num_paises")

# representar en un gráfico de puntos la esperanza de vida en toda Europa

europe <- filter(gapminder, continent == "Europe")
point <- ggplot(data = europe, aes(x =  year, y = lifeExp)) + #estamos almacenando este gráfico en una variable "point"
  geom_point(aes(color=gdpPercap, size=pop), alpha=3/5) +
  labs(title = "Evolución de la esperanza de vida en Europa",
       x = "Años",
       y = "Esperanza de vida") +
  theme(panel.background = element_blank()) 
  #theme(legend.position = "none") con esta instrucción se eliminaría la leyenda

point
