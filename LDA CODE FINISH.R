

#Run this code and for loop to install packages
#This was needed when working in the computer lab
lda_packages <- c('quanteda', 
                  'tidyverse', 
                  'ggplot2', 
                  'scales', 
                  'RGraphics', 
                  'lubridate', 
                  'reshape2', 
                  'topicmodels',
                  'stringr', 
                  'Hmisc')

for(i in lda_packages){
  install.packages(i)
}


library(quanteda)
library(tidyverse)
library(ggplot2) 
library(scales) 
library(RGraphics)
library(lubridate)
library(reshape2)
library(topicmodels)
library(stringr)
library(Hmisc)
install.packages("Hmisc")

#load in the data
load("/Users/shanewery/Dropbox/Gills_disciples[L, K, S]/complete_tweets.Rda")

#make a subset of the data for the senators we are using
tweets <- tweets_data[,c(2,8,17,28,43,60,73,80,83,85,87)]
names(tweets) <- c('Shelby',
                   'Feinstein',
                   'Nelson',
                   'Grassley',
                   'Klobuchar',
                   'Menendez',
                   'Wyden',
                   'Thune',
                   'Corker',
                   'Hatch',
                   'Leahy')


#A for loop could have been useful here if we were running all senators, 
#but for the sake of time
#we used Rstudio to find and replace senator names quicklly in the code
#rather than taking the time to figure out how to make the for loop run

Klobuchar_tweets <- as.data.frame(as.character(tweets$Klobuchar))
 

### Take 10% of data for training 

Train_Klobuchar <- as.character(Klobuchar_tweets[1:100,])

#Take the rest for training
Test_Klobuchar <- as.character(Klobuchar_tweets[101:1000,])

#build a corpus 

Klobucharcorptrain <- corpus(Train_Klobuchar)


### build a corpus for the test set

Klobucharcorptest <- corpus(Test_Klobuchar)

#Tokenize data
Klobuchar_token <- tokens(Klobucharcorptrain, 
                          remove_punct = TRUE, 
                          remove_url = TRUE, 
                          remove_twitter = TRUE, 
                          remove_numbers = TRUE, 
                          remove_symbols = TRUE, 
                          remove_hyphens = TRUE, 
                          what = "fasterword")

Klobuchar_token1 <- tokens(Klobucharcorptest, 
                           remove_punct = TRUE, 
                           remove_url = TRUE, 
                           remove_twitter = TRUE, 
                           remove_numbers = TRUE, 
                           remove_symbols = TRUE,
                           remove_hyphens = TRUE, 
                           what = "fasterword")


# create document frequency matrix for training data 
dfm_Klobuchar <- dfm(Klobuchar_token, tolower = TRUE, remove = stopwords("english"))

dfm_Klobuchar <- dfm_select(dfm_Klobuchar, c("http",
                                             "www",
                                             "twitter.com",
                                             "https",
                                             "s", 
                                             "(1)", 
                                             "tatus",
                                             "rgia",
                                             "via", 
                                             "blah", 
                                             "pic.twitter.com",
                                             "���"), 
                                              selection = "remove", 
                                              valuetype = "regex")


### test data 
dfm_Klobuchar1 <- dfm(Klobuchar_token1, 
                      tolower = TRUE,
                      remove = stopwords("english"))


# convert dfm to non-quanteda format 
Klobuchar_tm <- convert(dfm_Klobuchar,
                        to ="topicmodels")


### test data 
Klobuchar_tm1 <- convert(dfm_Klobuchar1,
                         to ="topicmodels")


# run LDA using gibbs sampler 
# alpha set at 0.1; 10 topics specified 

set.seed(504)

LDA_Klobuchar <- LDA(Klobuchar_tm, 
                     method= "Gibbs", 
                     control = list(alpha = 0.1), 
                     k = 10)


## examine most likely terms and topics 

LDA_Klobuchar_terms <- terms(LDA_Klobuchar, 
                             k = 10)

LDA_Klobuchar <- topics(LDA_Klobuchar)

summary(LDA_Klobuchar)


## examine posterior distribution of topics and terms

post_LDA_Klobuchar <- posterior(LDA_Klobuchar,Klobuchar_tm1)


# Create dataframe of documents with probability associated with each topic (posterior distribution) ######

### data frame creation 
Klobuchar_table <- data.frame(post_LDA_Klobuchar$topics)

# create column for topic with highest likelihood 
Klobuchar_table$topic <- colnames(Klobuchar_table)[max.col(Klobuchar_table, 
                                                           ties.method= "first")]

# specify what document is associated with topics 
Klobuchar_table <- data.frame(docs=rownames(Klobuchar_table), Klobuchar_table)
rownames(Klobuchar_table) <- NULL

Klobuchar_t1 <- Klobuchar_table %>%group_by(topic)%>%count(X1:X10)
colnames(Klobuchar_t1) = c("Topic", "Average Likelihood", "Count") 
Klobuchar_t1$Topic <- c(1, 10, 2, 3, 4, 5, 6, 7, 8, 9)

#Make a list of the information we want to save for now

Shelby <- list(c(LDA_shelby_terms, shelby_t1))
Feinstein <- list(c(LDA_feinstein_terms, feinstein_t1))
Grassley <- list(c(LDA_grassley_terms, grassley_t1))
Nelson <- list(c(LDA_nelson_terms, nelson_t1))
Klobuchar <- list(c(LDA_klobuchar_terms, klobuchar_t1))
Menendez <- list(c(LDA_menendez_terms, menendez_t1))
Wyden <- list(c(LDA_wyden_terms, wyden_t1))
Thune <- list(c(LDA_thune_terms, thune_t1))
Corker <- list(c(LDA_corker_terms, corker_t1))



### Feinstein word cloud

Feinstein_tweets <- as.data.frame(as.character(fulltweets$Feinstein))


### Take 10% of data for training 

Train_Feinstein <- as.character(Feinstein_tweets[1:500,])

Test_Feinstein <- as.character(Feinstein_tweets[101:5000,])

#build a corpus 

Feinsteincorptrain <- corpus(Train_Feinstein)
topfeatures(fulltweets$Feinstein, 20)

FeinCorpus <- texts(Feinsteincorptrain)
FeinCorpus[2]

feinDFM <- dfm(FeinCorpus)
feinDFM

feinDFM[,1:5]
textplot_wordcloud(feinDFM)

feinDFM <- dfm(FeinCorpus,  tolower=TRUE,  remove=c(stopwords('english'), '@'),  
                                                    remove_punct=TRUE,    
                                                    remove_numbers=TRUE,    
                                                    remove_symbols=TRUE,   
                                                    remove_url=TRUE,  
                                                    stem=FALSE  )
topfein <- topfeatures(feinDFM, 10)

wcl_colors <- RColorBrewer::brewer.pal(8,"Dark2")# 
textplot_wordcloud(topfein,  random.order=FALSE,
                   colors = wcl_colors)



