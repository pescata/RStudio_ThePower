install.packages("RSQLite")
library(RSQLite)
library(DBI)

data(package = "mlbench", PimaIndiansDiabetes2)

#nombrar b.dd
db <- "PimaIndians.db"

#crear conexión b.dd
con <- dbConnect(SQLite(), dbname = db)
dbListTables(con) #comprobamos su contenido. Inicialmente vacia

#almacenar el dataset PimaIndians en nuestra b.dd
dbWriteTable(conn = con,
             name = "Pima",
             value = PimaIndiansDiabetes2)

dbListTables(con) #comprobamos su contenido para verificar que ya contiene la tabla Pima

#realizar consultas SQL a nuestra b.dd.
#consulta_1: obtener los casos con diabetes = positivo
query1 <- "SELECT * FROM Pima WHERE diabetes = 'pos'" #consulta
resultado1 <- RSQLite::dbGetQuery(conn = con, statement = query1)
resultado1
class(resultado1)
table(resultado1$diabetes)

#consulta_2: obtener los casos con glucosa > 160 y edad >50
query2 <- "SELECT * FROM Pima WHERE glucose > 160 AND age > 50" #consulta
resultado2 <- RSQLite::dbGetQuery(conn = con, statement = query2)
resultado2

table(resultado2$diabetes)

#consulta_3: obtener solo la glucosa, el número de embarazos y índice de masa corporal de
#los casos con diabetes positivo y glucosa > 180
query3 <- "SELECT glucose, pregnant, mass FROM Pima WHERE glucose > 180 AND diabetes = 'pos'" #consulta
resultado3 <- RSQLite::dbGetQuery(conn = con, statement = query3)
resultado3

summary(resultado3$glucose)

