#como hacer salidas con resultados intermedios del bloque shiny
library(shiny)

ui <- fluidPage(
  titlePanel('Ejemplo de Reactive'),
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput('slidebar', label = 'Tamaño de la muestra',
                  min = 2, max = 500, value = 30),
      
      numericInput('media',
                  label = "Media de la muestra",
                  value = 0),
      
      numericInput('desv',
                   label = "Desviacion Tipica de la muestra",
                   value = 1,
                   min=0),
      
      actionButton('calc',
                   label='Calcular')
      ),
    
    mainPanel(
      
      plotOutput("hist"),
      
      verbatimTextOutput('summary')
    )
  )
)

server <- function(input, output) {
  # un observador es un elemento del servidor que no genera valores, no se conecta con nadie
  # 
  observeEvent(input$calc, {
    print('Hola')
    showNotification('Has calculado una nueva distribución')
    
  }, priority = 5)
  
  observeEvent(input$calc, {
    print('Chau')
    showNotification('Has calculado una nueva distribución')
  }, priority = 3)
  
  x <- eventReactive(input$calc, {
    
    rnorm(input$slidebar,
                  mean=input$media,
                  sd=input$desv)
    })
  
  
  
  output$hist <- renderPlot({
    
    hist(x())
    
  })
 
  # renderPrint es un tipo de renderText que devuelve en forma directa el resultado que aparece en consola
  output$summary <- renderPrint({
    
    summary(x())
    
  })
   
}

shinyApp(ui, server)


