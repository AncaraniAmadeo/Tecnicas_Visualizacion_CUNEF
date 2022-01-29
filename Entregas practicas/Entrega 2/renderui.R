library(ggplot2)
df <- diamonds
df

library(dplyr)

library(shiny)

ui <- fluidPage(
  titlePanel('Explorador de Diamantes'),
  sidebarLayout(
    sidebarPanel(
      numericInput('muestra', 
                   label = 'Tamaño de la muestra',
                   value = 100),
      
      selectInput('cut',
                  label = "Filtro de cut", 
                  choices = list("Fair" = 'Fair',
                                 "Good" = 'Good',
                                 "Very Good" = 'Very Good',
                                 "Premium" = 'Premium',
                                 'Ideal' = 'Ideal'),
                  selected = 'Good')
      ),
    
    mainPanel(
      plotOutput("scatter")
    )
  )
)

server <- function(input, output) {
  
  output$scatter <- renderPlot({
    
    df <- diamonds[diamonds$cut == input$cut,]
    
    df <- df[sample(nrow(df), input$muestra), ]
    
    
    
    ggplot() +
      geom_point(data=df, aes(x = price, 
                                    y = carat, 
                                    color = color))
  
  })
  
}


shinyApp(ui, server)