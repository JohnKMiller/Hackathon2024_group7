library(readxl)
# Load data
Depression.df <- read_excel("MajorDepression_Data.xlsx")

# Z - scale data
ScaledDepression.df <- scale(Depression.df$`Total N`, center = F, scale = T)

Depression.df$gradientValues <- ScaledDepression.df
   
# C / T (do both)

# mean 


#export

write.csv(Depression.df, file = "scaled_values.csv")
