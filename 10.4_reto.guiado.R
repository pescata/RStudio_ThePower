#en este reto guiado crearemos una b.dd. SQLite, con información de la población de la OMS
#sobre la tuberculosis.
#extraeremos los datos mediante consultas y los analizaremos
#para ello utilizaremos el paquete RSQLite y dbplyr para establecer la equivalencia 
#del mismo proceso con ambos paquetes.

#¿qué vamos a hacer?
# 1.- crear una b.dd. SQLite
# 2.- crear en esa b.dd. las tablas who y population basados en los datasets homónimos sobre datos de población y tuberculosis
# 3.- consultas sql para crear un dataframe con las columnas: país, año, nuevos casos, población total
# siguiendo estos criterios_
#   - solo casos en España y México
#   - solo casos entre 2001 y 2008
#   - solo casos de mujeres entre 45 y 54 años
# 4.- realizar la misma operación empleando dplyr y mostrar que consulta sql construye

install.packages("tidyverse")
library(RSQLite)
library(tidyverse)
library(DBI)

#nombramos la b.dd
db <- "tuberculosis.db"

#creamos la conexión
con <- dbConnect(SQLite(), dbname = db)
dbListTables(con)

#añadir información a la b.dd
dbWriteTable(conn = con,
             name = "population",
             value = population)

dbWriteTable(conn = con,
             name = "who",
             value = who)

dbListTables(con)
tbl(con, "population")
tbl(con, "who")

#construir sentencias sql
select <- "SELECT who.year, who.country, who.new_sp_f4554, population.population"
from <- "FROM who"
left_join <- "LEFT JOIN population on who.country = population.country AND who.year= population.year"
where <- "WHERE (who.country = 'Spain' or who.country = 'Mexico') AND (who.year >= 2001 and who.year <= 2008)"

query <- paste(select, from, left_join, where)
query

resultados <- RSQLite::dbGetQuery(con, query)
class(resultados)
resultados


#ahora usando dplyr
q1 <- tbl(con, "who") %>% 
  filter(country %in% c("Spain", "Mexico"), year >= 2001, year <= 2008) %>% 
  select("country", "year", "new_sp_f4554") %>% 
  left_join(y = tbl(con, "population"), by = c("country", "year")) 

show_query(q1)

resultadosq1 <- q1 %>% collect()
class(resultadosq1)
resultadosq1

#ahora usando dplyr con un poco más de elaboración (group by y summarise)
q2 <- tbl(con, "who") %>% 
  filter(country %in% c("Spain", "Mexico"), year >= 2001, year <= 2008) %>% 
  select("country", "year", "new_sp_f4554") %>% 
  left_join(y = tbl(con, "population"), by = c("country", "year")) %>% 
  group_by(country, year) %>% 
  summarise("casos por millón" = new_sp_f4554 / population * 1000000)

show_query(q2)

resultadosq2 <- q2 %>% collect()
class(resultadosq2)
resultadosq2










