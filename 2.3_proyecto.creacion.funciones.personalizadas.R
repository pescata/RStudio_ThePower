# proyecto 2.3: creación de función personalizada
# función que cálcula salario bruto y neto a parti de un coste hora
salario <- function(costehora, horas = 40, retención = 0.02) {
  if (horas > 45){
    horas_extra = horas - 45
    coste_hextra = costehora * 1.5
    bruto = 45 * costehora + horas_extra * coste_hextra
  } else {
    bruto = horas * costehora
  }
  neto = bruto * (1 - retención)
  return(list("salario bruto" = bruto, "salario neto" = neto))
}

salario (20, 46, 0.2)

# función que calcula la media de un vector numérico sumando todos sus elementos
# y dividiendo entre el número de elementos, sin emplear la función de R mean()

# empleando un bucle FOR
media <- function(x) {
  resultado <- 0
  for (i in 1:length(x)) {
    resultado = resultado + x[i]
  }
  resultado / length(x)
}

media (1:345)
mean(1:345)

# empleando un bucle WHILE
media_w <- function(x) {
  resultado_w <- 0
  i <- 1
  while (i<= length(x)) {
    resultado_w = resultado_w + x[i]
    i <- i + 1
  }
  resultado_w / length(x)
}

media_w (1:847)
mean(1:847)

# vectorización
media_v <- function(x) {
  sum(x) / length(x)
}

media_v(234:87659)
mean(234:87659)

# Definir la función con parámetros y un valor por defecto
operacion_matematica <- function(x, y = 2, multiplicar = TRUE) {
  if (multiplicar) {
    resultado <- x * y
  } else {
    resultado <- x + y
  }
  return(resultado)
}

# Llamar a la función sin especificar el parámetro 'y' (utilizará el valor por defecto)
resultado1 <- operacion_matematica(3)
print(resultado1)  # El resultado será 3 * 2 = 6

# Llamar a la función especificando el parámetro 'y'
resultado2 <- operacion_matematica(3, y = 4)
print(resultado2)  # El resultado será 3 * 4 = 12

# Llamar a la función especificando el parámetro 'y' y desactivando la multiplicación
resultado3 <- operacion_matematica(3, y = 4, multiplicar = FALSE)
print(resultado3)  # El resultado será 3 + 4 = 7
