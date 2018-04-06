suppressPackageStartupMessages(c(
        library(dplyr),
        library(shiny)))

source("predicting_algorithm.R")


freq2_gr1<-readRDS("./freq2_gr1.rds")
freq3_gr1<-readRDS("./freq3_gr1.rds")
freq4_gr1<-readRDS("./freq4_gr1.rds")
freq5_gr1<-readRDS("./freq5_gr1.rds")
freq6_gr1<-readRDS("./freq6_gr1.rds")




library(shiny)

server <- function(input, output) {
        
        
               wordprediction <-reactive({
                       
                text <- input$textbox
                prediction <- predict(text)
                
                
                
        })
        
        
        
        
        output$textoutput <- renderPrint(wordprediction()) #renderPrint(text)
        
        }


