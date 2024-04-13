library(ggplot2)
library(sf)
library(rworldmap)

# read in map
blankmap.sf <- read_sf("worldMap-Blank.gpkg")

# make gradient 
gradData.df <- read.csv("scaled_values.csv")
gradData.df <- gradData.df[,2:ncol(gradData.df)]

# overlay on map 


# make buttons
# aggregate study info 
# 