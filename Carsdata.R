library(pacman)
require(pacman)
library(datasets)
library(ggplot2)
library(plotrix)
library(treemap)
library(tidyverse) 
library(GGally)
library(ggcorrplot)
library(reshape2)
library(corrplot)

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, 
               ggvis, httr, lubridate, plotly, rio, rmarkdown, shiny, 
               stringr, tidyr)


#carsdata <- read.csv("USA_cars_datasets.csv" , header = TRUE , sep = ",")
carsdata<-read.csv("USA_cars_datasets - Copy.csv")
attach(carsdata)
     
carsdata 
head(carsdata,n=10)

str(carsdata)

#Provides a summary of the data allowing one to view tge Median, Mean, and ect.
summary(carsdata)
#Provides boxplots
ggplot(carsdata, aes(x=title_status, y=price)) + geom_boxplot() +
  ggtitle("Status and Price Relationship")

ggplot(carsdata, aes(x=title_status, y=mileage)) + geom_boxplot() +
  ggtitle("Status and Mileage Relationship")

ggplot(carsdata, aes(x=title_status, y=year)) + geom_boxplot() +
  ggtitle("Status and Years Relationship")
#Distrubution boxplot of brands and prices
ggplot(carsdata, aes(price,fct_reorder(brand,price)))+
  geom_boxplot(fill="white")+
  ggtitle("Brand Price Distribution")
#Distrubution boxplot of brands and prices
ggplot(carsdata, aes(price,fct_reorder(state,price)))+
  geom_boxplot(fill="white")+
  ggtitle("State Price Distribution")
#Price and Salvage distribution
ggplot(carsdata,aes(x=title_status,y=price,fill=title_status))+geom_violin(scale="area")
#Car prices frequency bar chart
ggplot(carsdata,aes(price))+
  geom_histogram(colour="black",fill="orange")+ylab("Frequency")+xlab("Price")+
  ggtitle("Car Prices")
#Car models out on sale depending on release years
ggplot(carsdata,aes(year))+
  geom_histogram(colour="white",fill="blue")+
  ylab("Frequency")+
  xlab("Years")+
  ggtitle("Car Model Years")
#Histogram of prices vs years.
ggplot(carssdata, aes(x=year, y=price)) + geom_bar(stat='summary')
#Most popular colors of car brands.
carsdata %>% filter(color!="no_color") %>% count(color) %>%  arrange(-n) %>% head(10) %>% 
  ggplot(aes(reorder(color,n), n)) + geom_col(aes(fill=color)) + coord_flip() +
  theme_light() +
  ggtitle("Most Popular Colors (Top 10)") + xlab("Colors") + ylab("Count") +
  theme(legend.position="none")
#Most popular colors by brand,
carsdata %>% filter(color=="white" | color=="black" | color=="grey" | color=="silver" | color=="red" | color=="blue" | color=="green" | color=="orange" | color=="gold" | color=="charcoal") -> CARSDATA
ggplot(carsdata, aes(x=brand)) + geom_bar(aes(fill=color), position="fill") +  coord_flip() + 
ggtitle("Most Popular Colors by Brand") + ylab("Percentage") + xlab("Brand")
#Scatter plot for mileage and price
ggplot(carsdata, aes(x=price, y=mileage)) + geom_point()
#Scatter plot for price and years
ggplot(carsdata, aes(x=year, y=price)) + geom_point()


#Data overall
#Scater plot of mileage and price displaying a linear relationship
ggplot(carsdata, aes(x=mileage, y=price)) + geom_point()

#Scatter plot of mileage and price displaying a linear regression 
ggplot(carsdata, aes(x=mileage, y=price)) + geom_point() + geom_line(size=0.1) +  geom_smooth(method=lm) +
  ggtitle("Price and Mileage Relationship")
#Scatter plot of mileage and price displaying a linear regression with LOESS method
ggplot(carsdata, aes(x=mileage, y=price)) + geom_point() + geom_line(size=0.1) +  geom_smooth() +
  ggtitle("Price and Mileage Relationship")
#Heatmap of numeric data.
cormat <- subset(carsdata, select=c(price,mileage,year))
ggcorrplot(cor(cormat)) + geom_tile(aes(fill = value)) + 
  geom_text(aes(label = round(value, 1))) +
  scale_fill_gradient(low = "white", high = "red")

#Test Data 1 Training
test1 <- read.csv("Test data 1.csv" , header = TRUE , sep = ",")
#Scatter plot of mileage and price displaying a linear regression 
ggplot(test1, aes(x=mileage, y=price)) + geom_point() + geom_line(size=0.1) +  geom_smooth(method=lm) +
  ggtitle("Price and Mileage Relationship")
#Scatter plot of mileage and price displaying a linear regression with LOESS method
ggplot(test2, aes(x=mileage, y=price)) + geom_point() + geom_line(size=0.1) +  geom_smooth() +
  ggtitle("Price and Mileage Relationship")


#Test Data 2 Testing
test2 <- read.csv("Test data 2.csv" , header = TRUE , sep = ",")
#Scatter plot of mileage and price displaying a linear regression 
ggplot(test2, aes(x=mileage, y=price)) + geom_point() + geom_line(size=0.1) +  geom_smooth(method=lm) +
  ggtitle("Price and Mileage Relationship")
#Scatter plot of mileage and price displaying a linear regression with LOESS method
ggplot(test2, aes(x=mileage, y=price)) + geom_point() + geom_line(size=0.1) +  geom_smooth() +
  ggtitle("Price and Mileage Relationship")



