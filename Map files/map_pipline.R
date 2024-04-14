library(readxl)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggplot2)
library(sf)

# read in data
data.df <- read_excel("MajorDepression_Data.xlsx")
# get gradients
data.df$gradients <- scale(data.df$`Total N`)
# get max for each country and corresponding gradient as new df
world.df <- ne_countries(scale = "medium", returnclass = 'sf')
gradients <- matrix(NA, nrow = nrow(data.df), ncol = 2)
gradients[,1] <- data.df$`Sample Collection Location`

for (i in world.df$name){
  for (j in 1:ncol(data.df)){
    holder <- numeric(0)
    if ((i == data.df[j,]$`Sample Collection Location`) & (data.df[j,]$`Total N` > holder)){
      holder <- data.df[j,]$`Total N`
      gradients[j,2] <- data.df$gradients
    }
  }
  
}
# make sheet w/ all countries gradients + empy

# run map maker
