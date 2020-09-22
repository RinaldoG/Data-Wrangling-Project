install.packages("readr")
install.packages("tidyverse")
install.packages("rmarkdown")
library(tidyverse)
library(readr)
library(rmarkdown)

df<-read_csv("https://github.com/frankbi/price-of-weed/raw/master/data/weedprices01012014.csv")
head(df)

# https://github.com/frankbi/price-of-weed/raw/master/data/weedprices01012014.csv

# This data frame 'price-of-weed' comes from the user 'frankbi' hosted on GitHub. It was last edited on the 2nd Jan 2014. 
# The data frame consists of 7 varibles highlighted below:

# 'State' variable is a character based varible consisting of the names of each state located within the USA.
# 'HighQ' variable is a character based variable denoting the average price, in USD, of high quality weed within the state.
# 'HighQN' variable is a double based variable totaling the quantity of high quality weed price reports made within the state.
# 'MedQ' variable is a character based variable denoting the average price, in USD, of medium quality weed within the state.
# 'MedQn' variable is a double based variable totaling the quantity of medium quality weed price reports made within the state.
# 'LowQ' variable is a character based variable denoting the average price, in USD, of low quality weed within the state.
# 'LowQN' variable is a double based variable totaling the quantity of low quality weed price reports made within the state.

##Dimension display of dataframe
dim(df)

##Variable data frame identified
sapply(df,mode)
# State = character
# HighQ = character
# HighQN = numeric
# MedQ  = character
# MedQN = numeric
# LowQ  = character
# LowQN = numeric

#Attempted Change ~ Talk about how you can't change data type if it's not in the right format 
df$HighQ <- as.numeric(df$HighQ)
df$MedQ <- as.numeric(df$MedQ)
df$LowQ <- as.numeric(df$LowQ)

#Removal of '$' sign from columns HighQ, MedQ, and LowQ 
df$HighQ <- gsub("\\$", "", df$HighQ)
df$MedQ <- gsub("\\$", "", df$MedQ)
df$LowQ <- gsub("\\$", "", df$LowQ)
head(df)
#Data Type Change 
df$HighQ <- as.numeric(df$HighQ)
df$MedQ <- as.numeric(df$MedQ)
df$LowQ <- as.numeric(df$LowQ)


#Rounding to nearest dollar
df[2:7] <- round(df[2:7])

#Column data type check
sapply(df,mode)

##Levels chech with column state as thats the only factorable column
levels(df$State)

#Level assigment for column state
df$State <- factor(df$State,levels=df$State)
#No need for other column levels as other columns are numerical

##Column Names Change
df <- rename(df,High_Quality_Price_USD=HighQ,
             High_Quality_Reports=HighQN,
             Medium_Quality_Price_USD=MedQ,
             Medium_Quality_Reports=MedQN,
             Low_Quality_Price_USD=LowQ,
             Low_Quality_Reports=LowQN)
head(df)

##Final Outout
df
colnames(df)
################################################

##Subsetting of dataframe with first 10 observations
subDf<- head(df,10)
subDf

##Dataframe to matrix conversion
matrixDf <- data.matrix(subDf[2:7])
rownames(matrixDf) <- subDf$State
matrixDf

##Structure of Data Frame Check
mode(matrixDf)
attributes(matrixDf)
#The resulating matrix is numeric as the function data.matrix coverts all variables within the dataframe to numeric data type,
#before binding together all columns of the matrix. The column 'State' is converted to numerical numbers corresponding to thier
#factors assigned above.

################################################

##Dataframe creation

#Ordinal Variable Vector
chilli_colour <- c('Red','Yellow','Red','Green','Green','Orange','Yellow','Green','Red','Orange')
#Ordinal Variable chilli_colour is the observed colour for the chillies present for the data frame

#Interger Variable Vector
chilli_length_cm <- c(3,8,2,12,10,5,9,15,2,6)
#Integer Variable chilli_Length is the respective lengths of the chillis in centimeters

#Actual creation of dataframe
chilli_df <- data.frame(chilli_colour,chilli_length_cm)

#Data frame variable data types
sapply(chilli_df,mode)

#Factor and levels of ordinal data
levels(chilli_df$chilli_colour) #Wrong
#Reordering of ordinal variable
chilli_df$chilli_colour <- factor(chilli_df$chilli_colour, levels=c('Red','Orange','Yellow','Green'))
levels(chilli_df$chilli_colour) #Right

##Additional numerical vector 
chilli_seed_count <- c(8,5,9,3,2,7,4,1,10,6)

#Adding vector to existing dataframe
chilli_df<-cbind(chilli_df,chilli_seed_count)
chilli_df








































