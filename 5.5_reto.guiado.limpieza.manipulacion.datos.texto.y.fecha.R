install.packages("rvest")
install.packages("lubridate")
library(rvest)
library(stringr)
library(lubridate)

url <- "https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"
page <- read_html(url)
tablas <- html_table(html_elements(page, "table"))
raw <- as.data.frame(tablas[3])

summary(raw)
head(raw)

#proceso de obtención de las marcas en metros a partir del campo "Mark"
meters <- str_sub(raw$Mark,1,4) #extrae la marca en metros mediante la función str_sub seleccionando desde la posición 1 a la 4 ambas incluidas
head(meters)
class(meters)
meters <- as.numeric(meters) #conversión de caracter a numero con decimales (numeric)

#proceso de obtención del país y atleta a partir del campo "Athlete"
country <- str_sub(raw$Athlete,-4,-2) #en este caso la extracción comienza desde el final por eso signos negativos
head(country)
athlete <- str_sub(raw$Athlete,1,-6)
head(athlete, n=10)
athlete <- str_trim(athlete) #con la función str_trim eliminamos espacios en blanco
athlete <- str_to_upper(athlete) #pasar los nombres a mayúsculas

#proceso de limpieza de las fechas eliminado número entre corchetes al final, en este caso con la función str_replace
dates <- raw$Date
head(dates, n=7)
dates <- str_replace(dates,"\\[[1-9]\\]", "") #para eliminar los corchetes hay que usar el operador \\ delante
class(dates)

#proceso de conversión dates de caracter a fecha con el paquete lubridate, y posterior descomposición en años, mes, día y antiguedad records
dates <- dmy(dates)
dates
year <- year(dates)
head(year)
month <- month (dates)
day <- day (dates)
head(day)

record_time_elapsed <- year(today()) - year(dates)
head(record_time_elapsed)

#finalmente tras la preparación de los datos en crudo pasamos a crear un dataframe al que llamaremos clean_data
clean_data <- data.frame("Record" = meters,
                         "Athlete" = athlete,
                         "Country" = country,
                         "Record_date" = dates,
                         "Record_year" = year,
                         "Record_month" = month,
                         "Record_day" = day,
                         "Record_time_elapsed" = record_time_elapsed,
                         "City" = raw$Venue
                         )

install.packages("dplyr")
library(dplyr)

head(clean_data, n=7)
info <- clean_data %>% mutate("Multiple_records" = ifelse(duplicated(athlete),TRUE,FALSE)) %>% 
  select(Record,Athlete,Record_year,"Multiple_records",Country)
head(info)

info <- clean_data %>% select(Record,Athlete,Record_year,Country) %>% 
  filter(Record >= 2.3)  %>% group_by(Country) %>% 
  summarise("MaxRecord" = max(Record), "N_of_Records" = n()) %>% 
  arrange(desc(MaxRecord))
info
clean_data
