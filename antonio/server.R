# Define the Server (Backend)
source(file = "app_function.R")
server <- function(input, output) {
  output$dna <- renderText({
    gene_dna(length = input$n_bases, base_probs = c(input$probA, input$probG, input$probT, input$probC))
  }
  )
  output$protein <- renderText({
    translate_rna(rna=input$rna)
  })
} 