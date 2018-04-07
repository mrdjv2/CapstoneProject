
source("predicting_algorithm.R")


freq2_gr1<-readRDS("./freq2_gr1.rds")
freq3_gr1<-readRDS("./freq3_gr1.rds")
freq4_gr1<-readRDS("./freq4_gr1.rds")
freq5_gr1<-readRDS("./freq5_gr1.rds")
freq6_gr1<-readRDS("./freq6_gr1.rds")

library(shiny)
library(tm)
library(dplyr)



shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$Tcir})
    output$prediction <- renderPrint({predict(input$Tcir)})
    
    
    
  }
)