

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting words"),
  
  #input text here
  textInput("textbox", "Enter text here", value = "", width = NULL, placeholder = NULL),
  
  actionButton("predict", "Predict next word"),
  
  textOutput("textoutput")

  )
)
