library("shiny")

#Define the User Interface (frontend)
ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      #creates a slider. input ID is what the server will call
      sliderInput(inputId = "bins",
                  #label will be displayed frontend
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

#Define the Server (Backend)
server <- function(input, output){
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x),max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
}

#Launch the shiny app
shinyApp(ui = ui, server = server)
