
library(ggplot2)
library(shiny)
library(mvtnorm)
# Define UI for application that draws a histogram
ui <- fluidPage(

    titlePanel("Plot Reactivo"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
            sliderInput('n',
                        label='Tamaño de la Muestra',
                        min=2,
                        max=500,
                        value=30),
            
            sliderInput('corr',
                        label='Correlación',
                        min=-1,
                        max=1,
                        value=0,
                        step = 0.05),
            
            actionButton('generate',
                         label='Generar'),
            
            actionButton('add',
                         label='Añadir un punto')
            
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput('dist', click = 'addclick')
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    miscosicas <- reactiveValues()
    
    observeEvent(input$generate, {
        sigma <- matrix(c(1, input$corr, input$corr, 1), nrow=2)
        miscosicas$df <- data.frame(rmvnorm(input$n, sigma=sigma, method='chol'))
        
    })
    
    observeEvent(input$add, {
        miscosicas$df <- rbind(miscosicas$df, runif(2, min=-2, max=2))
    })
    
    observeEvent(input$addclick, {
        miscosicas$df <- rbind(miscosicas$df, c(input$addclick$x, input$addclick$y))
    })
    
    output$dist <- renderPlot({
        req(miscosicas$df)
        ggplot(miscosicas$df) + geom_point(aes(x=X1, y=X2))
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
