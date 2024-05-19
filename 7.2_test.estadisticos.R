##lección test estadísticos
##vamos a ver difertentes tipos y cuando sería apropiado su uso

#TEST T DE STUDENT: apropiado para comparar las medias entre 2 grupos
data(package = "mlbench", PimaIndiansDiabetes2)
head(PimaIndiansDiabetes2)

t <- t.test(glucose~diabetes, data = PimaIndiansDiabetes2) 
#va a testar si hay relación entre glucosa y diabetes en el set de datos PimaIndiansDiabetes2 a partir de la comparación de medias
#el test parte de la hipótesis nula H0 según la cual no hay diferencias entre las medias de glucosa en sangre en función de ser o no diabético
#el resultado del test establece que es cierta la hipótesis alternativa (si hay diferencia), además en el rango de intervalo de confianza no está incluido el valor 0
print(t)


#TEST ANOVA: apropiado para comparar la media de varios grupos (no solo 2 como T DE STUDENT)
data(package = "ggplot2", diamonds)
anova <- aov(price~cut, data = diamonds)
#el valor de Pr al ser menor al 0.05 se considera que si hay explicado estadístico, por lo tanto procedería validar la hipótesis alternativa
print(summary(anova))


#TEST DE CHI-CUADRADO: relación entre 2 variables categóricas
#en este ejemplo vamos a ver si hay relación estadística entre el corte y el color de los diamantes
tabla_contingencia <- table(diamonds$cut, diamonds$color)
tabla_contingencia

chi_cuadrado <- chisq.test(tabla_contingencia)
#el resultado establece que la hipótesis nula (no hay relación entre corte y color),
#al presentar un valor de p tan bajo (menor a 0.05), lo cual rechaza la hipótesis nula.
#por lo tanto si se puede concluir que hay relación entre ambas dimensiones
chi_cuadrado


#TEST DE CORRELACIÓN DE PEARSON: relación lineal entre 2 variables
cor_tes <- cor.test(PimaIndiansDiabetes2$glucose, PimaIndiansDiabetes2$mass)
print(cor_tes)



#TEST DE WILCOXON: medianas de 2 grupos, no hay normalidad (valido para datos numéricos)
precio_antes <- diamonds$price[1:100]
precio_despues <- diamonds$price[101:200]

wilcoxon <- wilcox.test(precio_antes, precio_despues, paired = TRUE) 
#el parámetro paired, sirve para indicar si ambos grupos son comparables o hay una relación lógica natural
wilcoxon









