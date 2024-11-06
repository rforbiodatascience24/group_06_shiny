#Load needed functions
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  output$dna <- renderText({ # This is for the output DNA: virtual gene func 1
    gene_dna(length = input$n_bases,
             base_probs = c(input$prob_A,input$prob_T,input$prob_C,input$prob_G))
  })
  
  output$rna_seq <- renderText({ # This is for the virtual RNA polymerase func 2 
    transcribe_dna(dna = input$dna_seq)
  })
  
  output$bases <- renderTable({ # This is for simple base count func 4
    base_freqs(dna = input$gene_seq)
  })
}


