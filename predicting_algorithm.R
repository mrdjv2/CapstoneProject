setwd("C:/Coursera/Capstone Project")


freq2_gr1<-readRDS("freq2_gr1.rds")
freq3_gr1<-readRDS("freq3_gr1.rds")
freq4_gr1<-readRDS("freq4_gr1.rds")
freq5_gr1<-readRDS("freq5_gr1.rds")
freq6_gr1<-readRDS("freq6_gr1.rds")

library(dplyr)

phrase<-"that is a test with many words for testing bla bla bla another test"

test<-strsplit(phrase, " ")

length_test<-length(test[[1]])-1

if(length_test >5){
  
    test[[1]][-1:-(length(test[[1]])-5)]
  
  }

if(length_test == 5){
    
  predictor <- freq6_gr1[freq6_gr1$input == test]
  
}

if(length_test == 4){
  
  predictor <- freq5_gr1[freq5_gr1$input == test]
  
}


if(length_test == 3){
  
  predictor <- freq4_gr1[freq4_gr1$input == test]
  
}


if(length_test == 2){
  
  predictor <- freq3_gr1[freq3_gr1$input == test]
  
}

if(length_test == 1){
  
  predictor <- freq2_gr1[freq2_gr1$input == test]
  
}