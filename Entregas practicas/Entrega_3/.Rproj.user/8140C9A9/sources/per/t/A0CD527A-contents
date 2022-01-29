#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Reactividad Avanzada"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput('variable',
                        label='Elige una variable',
                        choices= colnames(mpg)),
            
            uiOutput("value"),
            
            actionButton('eliminate',
                         label='Borrar subconjunto')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("point"),
            
            verbatimTextOutput('summary')
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$value <- renderUI({
        selectInput("value", "Elige un valor para eliminar", 
                    choices = unique(mpg[,input$variable]))
    })
    
    
    values <- reactiveValues()
    
    
    values$df <- mpg
    
    observeEvent(input$eliminate, {
        #values$df <- values$df[-input$rowno, ]
        values$df <- values$df[!values$df[,input$variable] == input$value,]
        
    })
    
    output$point <- renderPlot({
        req(values$df)
        ggplot(values$df) + geom_point(aes(x=displ, y=cty, color=manufacturer))
    })
    
    output$summary <- renderPrint({
        req(values$df)
        summary(values$df)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
