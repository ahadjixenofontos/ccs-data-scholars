#install.packages('dplyr')
#install.packages('stringr')
#install.packages("readr")

library(dplyr)
library(stringr)
library(readr)

#doc1<-"The sky is blue and the sun is bright."
#doc2<-"The sun in the sky is bright."
#doc3<-"We can see sun is bright, the sky is blue."

#read txt files
doc1<- read_file("C:/Research/ccs-data-scholars/text_project/nba1.txt")
doc2<- read_file("C:/Research/ccs-data-scholars/text_project/nba2.txt")
doc3<- read_file("C:/Research/ccs-data-scholars/text_project/science.txt")

# preprocess text
v_doc1 <- lapply(doc1, function(x) {
  text <- gsub("[[:punct:]]", "", x) %>% tolower()
  text <- gsub("\\s+", " ", text) %>% str_trim()  
  word <- strsplit(text, " ") %>% unlist()
  return(word)
})

v_doc2 <- lapply(doc2, function(x) {
  text <- gsub("[[:punct:]]", "", x) %>% tolower()
  text <- gsub("\\s+", " ", text) %>% str_trim()  
  word <- strsplit(text, " ") %>% unlist()
  return(word)
})

v_doc3 <- lapply(doc3, function(x) {
  text <- gsub("[[:punct:]]", "", x) %>% tolower()
  text <- gsub("\\s+", " ", text) %>% str_trim()  
  word <- strsplit(text, " ") %>% unlist()
  return(word)
})

v1<-v_doc1[[1]]
v2<-v_doc2[[1]]
v3<-v_doc3[[1]]

# find the number of intersection words between document 1 and 2
I12<-length(intersect(v1,v2))

# Calculate Jaccard similarity
S12<-I12/(length(v1)+length(v2)-I12)

S12

# find the number of intersection words between document 1 and 3
I13<-length(intersect(v1,v3))

# Calculate Jaccard similarity
S13<-I13/(length(v1)+length(v3)-I13)

S13











