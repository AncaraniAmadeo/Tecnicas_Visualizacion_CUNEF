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
      actionButton('mostrar', label = 'Mostrar la distribucion'),
      
      #HUECO PARAMETROS
      uiOutput('parametros')
    ),
    
    mainPanel(
      plotOutput("hist")
    )
  )
)

server <- function(input, output) {
  output$hist <- renderPlot({
    input$mostrar
    
    n <- isolate(input$slidebar)
    
    distribucion <- isolate(input$distribucion)
    
    if (distribucion=='norm'){
      
      mean <- isolate(input$mean)
      sd <- isolate(input$sd)
      
      req(mean)
      req(sd)
      x <- rnorm(n, mean, sd)
    }
    else if (distribucion=='unif'){
      min <- isolate(input$min)
      max <- isolate(input$max)
      req(min)
      req(max, min < max)
      x <- runif(n, min = min, max = max)
    }
    else if (distribucion=='gamma'){
      alpha <- isolate(input$alpha)
      
      req(alpha)
      x <- rgamma(n, shape = alpha)
    }
    else if (distribucion=='pois'){
      lambda <- isolate(input$lambda)
      
      req(lambda)
      x <- rpois(n, lambda = lambda)
    }
    
    hist(x)
    
  })
  
  output$parametros <- renderUI({
    if (input$distribucion == 'norm'){
      tagList(
        numericInput('mean', 
                     label = 'media',
                     value = 5),
        
        numericInput('sd', 
                     label = 'sd',
                     value = 1)
        
              )
    }
    else if (input$distribucion == 'unif')
      tagList(
        numericInput('min',
                     label = 'Valor minimo',
                     value = 5),
        numericInput('max',
                     label = 'Valor maximo',
                     value = 10)
              )
    else if (input$distribucion == 'gamma')
      tagList(
        numericInput('alpha',
                     label = 'alpha',
                     value = 5)
      )
    else if (input$distribucion == 'pois')
      tagList(
        numericInput('lambda',
                     label = 'lambda',
                     value = 5)
      )
      
  })
  
}

shinyApp(ui, server)

