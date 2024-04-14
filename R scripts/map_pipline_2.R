# https://r-spatial.org/r/2018/10/25/ggplot2-sf.html

library(readxl)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggplot2)
library(sf)

# read in data
data.df <- read_excel("MajorDepression_Data.xlsx")
# get gradients
data.df$gradients <- scale(data.df$`Total N`)
data.df_new <- data.frame(cbind(data.df$`Sample Collection Location`, data.df$`Total N`, data.df$gradients))
colnames(data.df_new) <- colnames(data.df[,c(2,4,9)])
# get max for each country and corresponding gradient as new df
world.df <- ne_countries(scale = "medium", returnclass = 'sf')
world_data_requisite <- data.frame(world.df$name_long)
gradients <- data.frame(cbind(world.df$name_long, numeric(length = nrow(world.df))))
colnames(gradients) <- c("country", "gradient")

for(i in 1:nrow(world.df)) {
  for(j in 1:nrow(data.df_new)) {
    if(world_data_requisite[i, 'world.df.name_long'] == data.df_new[j, 'Sample Collection Location']) {
      holder <- 0
      if (data.df_new[j, 'Total N'] > holder) {
        holder <- data.df_new[j, 'Total N']
        a <- world_data_requisite[i,]
        gradients[i, 2] <- abs(data.df[j, 'gradients'])
      }
      else {
        a <- world_data_requisite[i,]
        gradients[i, 2] <- 0
      }
    }
  }
}

N_studies <- c(gradients$gradient)
ggplot(data = world.df) +
  geom_sf(aes(fill = N_studies))
