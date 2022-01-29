
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
                        step = 0.01)#,
            
            #actionButton('gen',
            #             label='Generar')
            
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput('dist')
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    df <- reactive({
        #Aqui calculamos una distribucion bivariada
        sigma <- matrix(c(1, input$corr, input$corr, 1), nrow=2)
        data.frame(rmvnorm(input$n, sigma=sigma, method='chol'))
    })
    
    output$dist <- renderPlot({
        ggplot(df()) + geom_point(aes(x=X1, y=X2))
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
