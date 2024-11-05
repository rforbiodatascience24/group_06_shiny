library("shiny")

# Load needed functions
source(file = "app_function.R")

# Run the frontend user interface ui.R
source(file = "ui.R")

# Run the backend server server.R
source(file = "server.R")



# Run the Shiny app
shinyApp(ui = ui, server = server)