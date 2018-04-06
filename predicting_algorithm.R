
freq2_gr1<-readRDS("freq2_gr1.rds")
freq3_gr1<-readRDS("freq3_gr1.rds")
freq4_gr1<-readRDS("freq4_gr1.rds")
freq5_gr1<-readRDS("freq5_gr1.rds")
freq6_gr1<-readRDS("freq6_gr1.rds")

library(dplyr)

predict <- function(phrase){
        
        original_phrase<- phrase
        
        phrase<- tolower(phrase)
        phrase <- gsub("'", '', phrase)
        
        
        
        phrase_split<-strsplit(phrase, " ")
        
        length_phrase<-length(phrase_split[[1]])
        
        if(length_phrase >5){
                
                phrase_split<-phrase_split[[1]][-1:-(length(phrase_split[[1]])-5)]
                
                phrase<-paste(phrase_split[[1]],phrase_split[[2]],phrase_split[[3]],phrase_split[[4]],phrase_split[[5]])
                
        }
        
        if(length_phrase == 5){
                
                predictor <- freq6_gr1[freq6_gr1$input == phrase]
                
                if(dim(predictor)[1] >0 & dim(predictor)[2]>0){
                        predictor <- predictor[order(-predictor$frequency),]
                        predicted_word<-predictor[1,2]
                }
                
                if(dim(predictor)[1]==0 || dim(predictor)[2]==0){
                        phrase_split<-strsplit(phrase, " ")
                        phrase_split<-phrase_split[[1]][-1:-(length(phrase_split[[1]])-4)]
                        phrase<-paste(phrase_split[[1]],phrase_split[[2]],phrase_split[[3]],phrase_split[[4]])
                        length_phrase<-4
                }
                
        }
        
        if(length_phrase == 4){
                
                predictor <- freq5_gr1[freq5_gr1$input == phrase]
                
                if(dim(predictor)[1] >0 & dim(predictor)[2]>0){
                        predictor <- predictor[order(-predictor$frequency),]
                        predicted_word<-predictor[1,2]
                }
                
                if(dim(predictor)[1]==0 || dim(predictor)[2]==0){
                        phrase_split<-strsplit(phrase, " ")
                        phrase_split<-phrase_split[[1]][-1:-(length(phrase_split[[1]])-3)]
                        phrase<-paste(phrase_split[[1]],phrase_split[[2]],phrase_split[[3]])
                        length_phrase<-3
                }
                
        }
        
        
        if(length_phrase == 3){
                
                predictor <- freq4_gr1[freq4_gr1$input == phrase,]
                
                if(dim(predictor)[1] >0 & dim(predictor)[2]>0){
                        predictor <- predictor[order(-predictor$frequency),]
                        predicted_word<-predictor[1,2]
                }
                
                if(dim(predictor)[1]==0 || dim(predictor)[2]==0){
                        phrase_split<-strsplit(phrase, " ")
                        phrase_split<-phrase_split[[1]][-1:-(length(phrase_split[[1]])-2)]
                        phrase<-paste(phrase_split[[1]],phrase_split[[2]])
                        length_phrase<-2
                }
                
        }
        
        
        if(length_phrase == 2){
                
                predictor <- freq3_gr1[freq3_gr1$input == phrase,]
                
                if(dim(predictor)[1] >0 & dim(predictor)[2]>0){
                        predictor <- predictor[order(-predictor$frequency),]
                        predicted_word<-predictor[1,2]
                }
                
                if(dim(predictor)[1]==0 || dim(predictor)[2]==0){
                        phrase_split<-strsplit(phrase, " ")
                        phrase<-phrase_split[[1]][-1:-(length(phrase_split[[1]])-1)]
                        length_phrase<-1
                }
                
        }
        
        if(length_phrase == 1){
                
                predictor <- freq2_gr1[freq2_gr1$input == phrase,]
                
                if(dim(predictor)[1] >0 & dim(predictor)[2]>0){
                        predictor <- predictor[order(-predictor$frequency),]
                        predicted_word<-predictor[1,2]
                }
                
                if(dim(predictor)[2]==0){
                        predicted_word<-"you" #standard prediction if no better one can be determined.
                        #this is the most frequent single word used.
                }
                
        }
        
        return(predicted_word)
        
}