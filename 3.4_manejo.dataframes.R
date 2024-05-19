# Manejo de DataFrames
# Crear un Data Frame
df<- data.frame(id = 1:4,
                nombres = c("Lía", "Nicolás", "Emilia", "Alberto"),
                edad = c(17,15,5,51))
df

# Propiedades principales de un Data Frame
class(df)
dim(df)
length(df)  #nos va a dar el número de variables, esto es, de columnas
ncol(df)   #el número de columnas nos da el número de variables (vectores)
nrow(df)   #el número de filas nos da el número de observaciones

# funciones que nos dan información sobre un Data Frame
names(df) #nos da los nombres de una columnas, y nos permite cambiarlos
head(df, n=3)  #nos presenta las n primeras líneas de un Data Frame
tail(df, n=3) #nos presenta las n últimas líneas de un Data Frame
summary(df)   #nos presenta un resumen de características de cada vector
str(df)       #nos presenta un resumen del contenido del Data Frame

# Como acceder a cada elemento de un Data Frame
df$nombres #acceso al vector (columna) por nombre con el símbolo $
df[[2]]    #acceso al vector (columna) por posición entre doble [[]]
df[,2]     #acceso al vector (columna) por posición
df[2,]     #acceso al registro (fila) indicado por posición
df[3,3]    #acceso a un elemento concreto por su posición

# Añadir/eliminar una nueva columna (variable)
df$zodiaco = c("libra", "acuario", "leo", "libra")
df
dim(df)
df <- cbind(df,mayor_edad = c(FALSE,FALSE,FALSE,TRUE)) #incorpora una columna al DataFrame indicado como primer argumento
df
df$mayor_edad <- NULL
df

# Renombrar columnas (variables)
names(df)
names(df)[2] <- "Names"
df

# Coerción o convertibilidad de los datos
df_numeros <- data.frame(A=1:10,B=11:20)
df_numeros
class(df)
matriz_numeros <- as.matrix(df_numeros) #función que convierte en matriz
matriz_numeros
class(matriz_numeros)

matriz_dist_datos <- as.matrix(df) #caso de df origen con distintos tipos de datos
matriz_dist_datos #al convertirlo a matriz convierte todos los datos a caracter para que sean datos homogéneos

df_numeros2 <- as.data.frame(matriz_numeros)
df_numeros2
class(df_numeros2)