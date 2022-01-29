library(shiny)

ui <- fluidPage(
  titlePanel('Distribucion Muestral'),
  sidebarLayout(
    sidebarPanel(
      sliderInput('slidebar', label = 'Tamano Muestral',
                  min = 5, max = 500, value = 42),
      
      selectInput('distribucion',
                              label = "Distribucion", 
                              choices = list("Gaussiana" = 'norm',
                                             "Uniforme" = 'unif',
                                             "Poisson" = 'pois',
                                             "Gamma" = 'gamma'),
                  selected = 'norm'),
      actionButton('mostrar', label = 'Mostrar la distribucion')
      ),
    
      mainPanel(
        plotOutput("hist")
      )
    )
)

server <- function(input, output) {
  output$hist <- renderPlot({
    input$mostrar
    
    rdistribucion <- switch (isolate(input$distribucion),
                             'norm' = rnorm,
                             'unif' = runif)
    
    x <- rdistribucion(isolate(input$slidebar))
    
    hist(x)
  })

}

shinyApp(ui, server)
