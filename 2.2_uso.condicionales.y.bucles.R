# condicional if
edad_if <- 14

if (edad_if > 18) {
  print("eres mayor de edad")
}

# condicional if - else
edad_ifelse <- 19

if (edad_ifelse > 18) {
  print("eres mayor de edad")
  } else {
    print("eres menor de edad")
}


# condicional if - elseif - else
edad_ifelseifelse <-17
if (edad_ifelseifelse > 65) {
  print("estas en edad de jubilación")
} else if (edad_ifelseifelse > 18) {
  print("estas en edad de trabajar")
} else {
  print("eres menor de edad")
}

# ifelse (operaciones vectorizadas)
edad <- c(23, 14, 21, 17, 16, 18, 22, 24)
ifelse(edad > 18, "mayor", "menor")

# bucle FOR
numeros <- c(1, 2, 3, 4, 5)
for (numero in numeros) {
  print(numero)
}

# bucle WHILE
contador <- 1

while (contador <= 18) { 
  print(contador) 
  contador <- contador + 1 
}


# palabra reservada BREAK
for(i in 1:10) {
  if(i == 3) {
    break
  }
  print(i)
}

# palabra reservada NEXT
for(i in 1:10) {
  if(i == 3) {
    next
  }
  print(i)
}

# estructura repeat - break
contador <- 1

repeat {
  print(contador)
  contador <- contador + 1
  if (contador > 172) {
    break
  }
}
























