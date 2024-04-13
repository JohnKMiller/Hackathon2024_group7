library(readxl)
library(writexl)
# Load data
Depression.df <- read_excel("MajorDepression_Data.xlsx")
fixedCountries.df <- read_excel("fixedCountries.xlsx")

# Z - scale data
ScaledDepression.df <- scale(Depression.df$`Total N`, center = F, scale = T)

scaledfixedCountries.df <- scale(fixedCountries.df$`Total N`, center = F, scale = T)

Depression.df$gradientValues <- ScaledDepression.df

fixedCountries.df$gradientValues <- scaledfixedCountries.df

for (i in 1:nrow(Depression.df)){
  
}


# C / T (do both)

# mean 


#export

write.csv(Depression.df, file = "scaled_values.csv")
write_xlsx(Depression.df, "scaled_values.xlsx")
write_xlsx(onlyDepression.df, "fixedCountries.xlsx")
write_xlsx(fixedCountries.df, "fixedCountriesScaled.xlsx")
