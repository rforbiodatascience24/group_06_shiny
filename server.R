#Load needed functions
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  output$dna <- renderText({
    gene_dna(length = input$n_bases, base_probs = c(input$prob_A,input$prob_T,input$prob_C,input$prob_G))
  })
  
  #If box checked reverse transcribe, otherwise transcribe
  #if(input$reverse_boolean=='TRUE'){
  
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
  }, ignoreInit = TRUE)
  
  output$protein <- renderText({
    translate_rna(rna=input$rna)})
  
}


