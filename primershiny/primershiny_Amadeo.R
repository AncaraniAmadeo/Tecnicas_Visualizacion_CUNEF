library(shiny)
library(ggplot2)

ui <- shinyUI(
  fluidPage(
    titlePanel("shiny visualizacion de ejes"),
    sidebarPanel(
      selectInput('varx',label="Elije variable x",choices=list("Engine displacement, in litres"="displ","Number of cylinders"="cyl","city miles per gallon"="cty")),
      selectInput('vary',label="Elije variable y",choices=list("Engine displacement, in litres"="displ","Number of cylinders"="cyl","city miles per gallon"="cty"))
    ),
    mainPanel(
      textOutput(),
      
      
    )
  )
)

server <- function(input, output) {
  output$subtitle <- renderText({
    paste0('Este es un grafico entre la variable ', input$varx, ' y la varaible ', input$vary)
  })
}
shinyApp(ui = ui, server = server)
