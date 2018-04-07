library(shiny)

fluidPage(
  
  
  mainPanel(
    h3("Introduction:"),
    h5("This application predicts the next word based on your entered string"),
    h3("Method:"),
    h5("Frequency analysis of n-grams"),
    
    textInput("Tcir",label=h3("Type in your phrase:")),
    submitButton('Submit'),
    h4('entered phrase: '),
    verbatimTextOutput("inputValue"),
    h4('next word :'),
    verbatimTextOutput("prediction")
    
  )
)