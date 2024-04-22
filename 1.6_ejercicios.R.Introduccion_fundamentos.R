#Ejercicio 1: Variables y Tipos de Datos
#Enunciado: Define una variable llamada numero con el valor 10 y otra llamada 
#nombre con tu nombre.

numero <- 10
nombre<- "Alberto"

#Ejercicio 2: Funciones class e is.numeric
#Enunciado: Utiliza las funciones class e is.numeric para determinar el tipo de
#dato de numero .


class(numero)
is.numeric(numero)

#Ejercicio 3: Operaciones Aritméticas
#Enunciado: Realiza una operación aritmética que sume numero y el doble de 
#numero 

numero + numero*2

#Ejercicio 4: Vectores y Listas
#nunciado: Crea un vector llamado edades con las edades de tres personas y
#na lista llamada informacion con el nombre y la edad de una persona.

edades <- c(17,15,5)
edades
informacion <- list("Alberto", 23)
informacion

#Ejercicio 5: Funciones is.character e is.logical
#nunciado: Verifica si nombre es de tipo caracter y si es_numerico es de tipo
#ógico.

is.character(nombre)
is.logical(numero)

#Ejercicio 6: Operaciones Lógicas
#nunciado: Crea una variable llamada mayor_de_edad que sea TRUE si la edad
#e la primera persona en edades es mayor o igual a 18.

mayor_de_edad <- edades[1] >= 18
print(mayor_de_edad)

#Ejercicio 7: Comparaciones de Vectores
#nunciado: Utiliza el operador %in% para verificar si el valor 30 está presente
#n el vector edades .

esta_presente <- 30 %in% edades
print(esta_presente)

#Ejercicio 8: Operadores de Comparación
#nunciado: Compara si el doble de numero es mayor que edades[3] .


resultado <- (2 * numero) > edades[3]
print(resultado)

#Ejercicio 9: Utilizar Operador Lógico
#Enunciado: Define dos variables lógicas, condicion1 y condicion2 , ambas con
#alor TRUE . Comprueba si ambas condiciones son verdaderas.

condicion1 <- TRUE
condicion2 <- TRUE

ambas_condiciones <- condicion1 & condicion2
print(ambas_condiciones)

#Ejercicio 10: Utilizar Operador Lógico
#nunciado: Define una variable lógica, verdadero , con valor TRUE . Comprueba
#ue su valor NO sea verdadero

verdadero <- TRUE
no_es_verdadero <- !verdadero
print(no_es_verdadero)








