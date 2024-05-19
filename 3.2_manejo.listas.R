# crear un lista
vector <- 1:30
matriz <- matrix(51:100, nrow = 5)
df <- data.frame("id" = 1:5, "nombre" = c("Lia", "Nico", "Emilia", "Alberto", "María_Teresa"))

lista_sin_nombres <- list(vector, matriz, df)
lista_sin_nombres

mi_lista <- list("Matriz" =  matriz, "Vector" = vector, "Dataframe" = df)
mi_lista

lista_2 <- list("Lista Interna" = mi_lista, "Serie" = 1:45)
lista_2

# Acceder a elementos de la lista
# Método con caracter$ 
mi_lista$Dataframe
lista_2$Serie

# Método por nombre
mi_lista[["Dataframe"]]
lista_2[["Serie"]]

# Método por posición (En R los índices empiezan en 1)
mi_lista[[1]]
lista_2[[2]]

# Acceso a elementos de una lista dentro de una lista
lista_2$`Lista Interna`$Dataframe
lista_2$`Lista Interna`$Matriz[5,4]
lista_2$`Lista Interna`$Dataframe ["nombre"]



# Acceso a varios elementos lista (se realiza con vectores)
mi_lista[c("Dataframe", "Matriz")]


# Propiedades de una lista
class(mi_lista)
dim(mi_lista)
dim(lista_2)
length(mi_lista)
length(lista_2)

# Agregar elementos a una lista (por nombre o posición)
mi_lista$nuevo <- c("verdadero", "falso")
mi_lista$logic <- c(TRUE,FALSE)
mi_lista[[6]] <- 30:40
mi_lista

# Eliminar elementos a una lista
mi_lista$nuevo <- NULL
mi_lista

# Recorrer elementos de una lista
for (i in mi_lista){
   print(class(i))
}


