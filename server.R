#Load needed functions
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  output$dna <- renderText({ # This is for the output DNA: virtual gene func 1
    gene_dna(length = input$n_bases,
             base_probs = c(input$prob_A,input$prob_T,input$prob_C,input$prob_G))
  })
  

#Reverse transcription   
  counter <- reactiveVal(0)
  
  # Observe the button press event
  observeEvent(input$reverse_boolean, {
    counter(counter() + 1)

    # Action every second time button is pressed
    if (counter() %% 2 == 1) {
      # Show notification on every second press
      showNotification("Reverse Transcribed RNA")
      
      output$rna_seq <- renderText({
        rev_transcribe(dna = input$dna_seq)
      })
    }
    if (counter() %% 2 == 0) {
      # Show notification on every second press
      showNotification("Transcribed RNA")
      
      output$rna_seq <- renderText({
        transcribe_dna(dna = input$dna_seq)
      })
    
    }
  }, ignoreInit = FALSE)
  

  output$protein <- renderText({
    translate_rna(rna=input$rna)
  })
  
  output$base_freq <- renderText({ # This is for simple base count func 4
    base_freqs(gene = input$gene_seq)


  })
  
  
}


