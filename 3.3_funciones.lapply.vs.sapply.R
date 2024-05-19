# Ejemplo: Aplicar una función que actua sobre todos los elementos de una lista
mi_lista2 <- list(1:5, 6:10, 11:15)
mi_lista2
raices <- lapply(mi_lista2,sqrt)
raices

# Ejemplo: ahora como funciona sobre una función anónima
cuadrado <- lapply(mi_lista2, function (x) x^2)
cuadrado

# Ejemplo: para calcular la suma de columnas de un data frame
df <- data.frame(a = c(1,2,3), b = c(4,5,6))
suma_columnas <- lapply(df, sum)
suma_columnas

# Ejemplo: aplicar una función con múltiples argumentos
estadisticos <- list(A = 1:10, B=50:80)
lapply(estadisticos,               # lista sobre la que actua la función
       quantile,                   # función a realizar
       probs = c(0.25, 0.5, 0.75)) #argumento adicional función quantile


# Ejemplo: lapply() vs sapply()
raices <- lapply(mi_lista2,sqrt)
raices
class(raices)

raices2 <- sapply(mi_lista2,sqrt)
raices2
class(raices2)

simple1 <- lapply(c(4,9,16), FUN = sqrt)
simple1
class(simple1)

simple2 <- sapply(c(4,9,16), FUN = sqrt)
simple2
class(simple2)






