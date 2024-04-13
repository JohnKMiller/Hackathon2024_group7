library(ggplot2)
library(sf)
library(rworldmap)
library(readxl)
library(writexl)

# read in map
blankmap.sf <- read_sf("worldMap-Blank.gpkg")



# make gradient 
gradData.df <- read_excel("scaled_values.xlsx")

sPDF <- joinCountryData2Map(gradDataAll.df, joinCode = "NAME", nameJoinColumn)

#
