library(dplyr)
library(readr)
library(ggplot2)
library(ggpubr)
library(tidyr)
library(GGally)



file1_data <- read_excel("~/group assignment rstudio/US Median Household Income.xlsx")
file2_data <- read_excel("~/group assignment rstudio/Median Home Sale Price.xls")
file3_data <- read_excel("~/group assignment rstudio/Avg Month Rent Yearly.xlsx")



#summary of the data

summary(file1_data)
summary(file2_data)
summary(file3_data)


#cleaning data 


file1_cleaned <- file1_data %>%
  na.omit()
file2_cleaned <- file2_data %>%
  na.omit()
file3_cleaned <- file3_data %>%
  na.omit()


summary(file1_cleaned)
summary(file2_cleaned)
summary(file3_cleaned)




file1_cleaned = cbind("id"=rownames(file1_cleaned),file1_cleaned)
file2_cleaned = cbind("id"=rownames(file2_cleaned),file1_cleaned)
file3_cleaned = cbind("id"=rownames(file3_cleaned),file1_cleaned)




merged_data_1 <- merge(file1_cleaned,file2_cleaned,all = T)
merged_data_2 <- merge(file2_cleaned,file3_cleaned,all = T)
merged_data_3 <- merge(file3_cleaned,file1_cleaned,all = T)




file1.plot <- ggplot(merged_data_1, aes(merged_data_1$Med_Sale_Price, merged_data_1$Income))+
  geom_point()
file2.plot <- ggplot(merged_data_2, aes(merged_data_2$Income, merged_data_2$MonthlyRent))+
  geom_point()
file3.plot <- ggplot(merged_data_3, aes(merged_data_3$Med_Sale_Price, merged_data_3MonthlyRent))+
  geom_point()



ggarrange(file1.plot, file2.plot, file3.plot, ncol = 3, nrow = 1)






ggplot(file3_cleaned, aes(x = `RegionName`, y = `MonthlyRent`))+
  geom_point()+
  labs(title = "Montly Rent Throughout the Year")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

ggplot(file1_cleaned, aes(x = `Date`, y = `Med_Sale_Price`))+
  geom_point()+
  labs(title = "House Price Throughout the Year")


  



