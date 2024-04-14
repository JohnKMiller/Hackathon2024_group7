library(readxl)
library(ggplot2)
data.df <- read_excel("MajorDepression_Data_original.xlsx")

pie_data <- table(data.df$Ancestry)
pie(pie_data)

Countries_data <- cbind(data.df[,c(1,4:6)])
b <- rep(Countries_data$`Cohort Name`, 3)
c <- c(Countries_data$`Total N`, Countries_data$Cases, Countries_data$Controls)
country_data_new <- cbind(b, c)

ggplot(country_data_new, aes(fill=rep(c("violet","pink","yellow"), nrow(Countries_data)), y=c, x=b)) + 
  geom_bar(position="dodge", stat="identity")
