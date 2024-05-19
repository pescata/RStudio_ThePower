data()
# Importar archivo desde una URL

# URL del archivo HTML que deseas descargar
url <- "https://archive.ics.uci.edu/dataset/53/iris"
# Ruta local donde deseas guardar el archivo descargado
ruta_local <- "Datos_R"
# Descargar el archivo HTML desde la URL
download.file(url, destfile = ruta_local, mode = "wb")


#Importar fichero en formato tabla/CSV
# Usando read.csv para un archivo CSV
datos_csv <- read.csv("Datos_R")
# Usando read.table para un archivo de texto delimitado por tabulaciones (por ejemplo)
datos_tabulado <- read.table("ruta/al/archivo.txt", sep = "\t", header = TRUE)

# Importar fichero EXCEL
# Instalar la librería si no está instalada
# install.packages("readxl")
# Cargar la librería
library(readxl)
# Leer datos desde un archivo Excel
datos_excel <- read_excel("ruta/al/archivo.xlsx")


# Importar fichero JSON
# Instalar la librería si no está instalada
# install.packages("jsonlite")
# Cargar la librería
library(jsonlite)
# Leer datos desde un archivo JSON
datos_json <- fromJSON("ruta/al/archivo.json")

# Exportar fichero JSON (hay que tener cargada la libreria jsonlite)
# Datos de ejemplo
datos <- list(
  Nombre = c("Juan", "María", "Pedro"),
  Edad = c(25, 30, 22),
  Puntuacion = c(85, 92, 78)
)

# Exportar a JSON
write_json(datos, "ruta/donde/guardar/datos.json")


# Función HEAD
head(datos_csv)  # Muestra las primeras filas del archivo CSV


# Función FILE.SHOW
file.show("ruta/al/archivo.txt")  # Muestra el contenido del archivo de texto


#función READLINES
lineas <- readLines("ruta/al/archivo.txt")  # Lee líneas del archivo de texto


# Exportar datos a CSV
# Creación de una tabla (función: data.frame) con los datos de ejemplo
datos <- data.frame(
  Nombre = c("Juan", "María", "Pedro"),
  Edad = c(25, 30, 22),
  Puntuacion = c(85, 92, 78)
)
# Exportar a CSV
write.csv(datos, file = "Datos_R/datos.csv", row.names = FALSE)


# Exportar a Excel
# Instalar y cargar la librería si no está instalada
install.packages("writexl")
library(writexl)

#Datos de ejemplo
datos2 <- data.frame(
  Nombre = c("Lía", "Nico", "Emi"),
  Edad = c(25, 30, 22),
  Puntuacion = c(85, 92, 78)
)
# Exportar a Excel
write_xlsx(datos2, path = "Datos_R/datos2.xlsx")



