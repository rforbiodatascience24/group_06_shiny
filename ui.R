library("bslib")
# Define the User Interface (Frontend)

ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("This app can generate a nucleotide sequence based on defined propabilities")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 1,
                  max = 60,
                  value = 30,
                  width = "100%"),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(inputId = "prob_A",
                     label = "Probability of A",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_T",
                     label = "Probability of T",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_C",
                     label = "Probability of C",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_G",
                     label = "Probability of G",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1)
      ))), # Prints the virtual gene output
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene output"),
      mainPanel(
        verbatimTextOutput(outputId = "dna")
      )
    )), 
  # UI for transcribing DNA func 2 
  layout_columns(
    col_widths = 12,
    card(
      card_header("Transcribe DNA"),
      helpText("This can transcribe DNA to RNA by replacing 'T' with 'U'"),
      textInput(inputId = "dna_seq",
                label = "DNA sequence"),
      mainPanel(
        verbatimTextOutput(outputId = "rna_seq")
      )
    )), 
  # UI for translating mRNA func 3
  layout_columns(
    col_widths = 12,
    card(
      card_header("Translation"),
      mainPanel(
        textInput(inputId="rna",
                  label = "input your RNA")
      )
    )), 
  # UI for outputting func 3
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual protein output"),
      mainPanel(
        verbatimTextOutput(outputId = "protein")
        )
    )), 
  # UI for input for base frequencies func 4
  layout_columns(
    col_widths = 12,
    card(
      card_header("Base frequencies"),
      helpText("Input genetic sequence to return the bease frequency"),
        textInput(inputId = "gene_seq",
                  label = "DNA sequence for frequency"),
      mainPanel(
        verbatimTextOutput(outputId = "base_freq")
        )
     )),
  )