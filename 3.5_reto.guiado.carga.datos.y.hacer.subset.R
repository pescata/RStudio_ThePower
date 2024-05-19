# 1.proceso descarga set de datos "mtcars" de R a Excel

#instalar paquete y libreria
install.packages("openxlsx")
library(openxlsx)

# Cargar el conjunto de datos mtcars si no está cargado
data(mtcars)

# Definir el nombre del archivo Excel de destino
coches <- "mtcars.xlsx"

# Especificar la ruta donde deseas guardar el archivo (por ejemplo, en el directorio de trabajo actual)
ruta <- file.path(getwd(), "mtcars.xlsx")

# Exportar mtcars a un archivo Excel
write.xlsx(mtcars, file = ruta, rowNames = TRUE)

# Mensaje de confirmación
cat("El archivo", coches, "se ha exportado exitosamente a", ruta, "\n")

# 2.leer el excel mtcars generado anteriormente
# instalar librería
install.packages("readxl")
library(readxl)
excel_sheets("mtcars.xlsx")
datos_coches <- read.xlsx("mtcars.xlsx", sheet = "coches")
head(datos_coches, n = 5) 

datos_coches [datos_coches$mod == "Mazda RX4",] #nos facilita datos del modelo indicado
datos_coches [datos_coches$mod == "Mazda RX4",] $mpg #nos indica las mpg (o la variable seleccionada) del modelo indicado previamente

?mtcars

automaticos <- datos[datos_coches$am==0,]
automaticos

resumen_aut <- automaticos [,c("mpg", "cyl", "hp", "gear")]
resumen_aut

# leer datos procedentes de una web (página de wikipedia)
install.packages("rvest")
library(rvest)
# Ver la versión de rvest instalada
packageVersion("rvest")
# Imprimir la ayuda de la función read_html
?read_html

url <- "https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"
page <- read_html(url) #vamos a guardar en la variable page el contenido de la página seleccionada
tablas <- html_table(html_elements(page,"table")) #con estas funciones html de la librería rvest obtenemos todas las tablas de la página
tabla <- tablas [[3]] #de esta manera seleccionamos la tabla con la que queremos operar
class(tabla)
head(tabla, n = 5)
tail(tabla, n = 5)

tabla$Mark

ny <- tabla[tabla$Venue == "New York",]
ny
