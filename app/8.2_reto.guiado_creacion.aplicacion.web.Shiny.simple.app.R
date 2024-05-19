#creación de una aplicación web para analizar como varia el precio de los diamantes
#en función de la calidad del corte, los quilates, y el color
#emplearemos el dataset diamantes incluido en RStudio

library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("DiamondsApp"),
  p("esta aplicación muestra datos del dataset diamonds"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "seleccione una variable", 
                  choices = c("carat", "cut", "color", "clarity")),
      sliderInput("muestra", "tamaño de la muestra",
                  min = 1000,
                  max = nrow(diamonds),
                  value = min(5000, nrow(diamonds)),
                  step = 500,
                  round = 0
                  )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Gráfico de dispersión", plotOutput("scatterplot")),
        tabPanel("Gráfico de barras", plotOutput("bar")),
        tabPanel("Tabla", tableOutput("table"))
      )
    )
  )
  
)

server <- function(input,output) {
  output$scatterplot <- renderPlot({
    ggplot(data = diamonds[sample(nrow(diamonds), input$muestra),],
           aes_string(x = input$variable, y = "price")) +
      geom_point()
  })
  
  output$bar <- renderPlot({
    ggplot(data = diamonds[sample(nrow(diamonds), input$muestra),],
           aes_string(x = input$variable)) +
      geom_bar()
  })
  
  output$table <- renderTable({
    diamonds[sample(nrow(diamonds), input$muestra),]
  })
}

shinyApp(ui,server)