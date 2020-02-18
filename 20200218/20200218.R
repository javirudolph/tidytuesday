# Get the Data

food_consumption <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-18/food_consumption.csv')


# Load the libraries and if you don't have them installed yet
# install.packages('tidyverse')
library(tidyverse)


# Check how the data looks

food_consumption %>%
  ggplot(., aes(x = consumption, y = co2_emmission)) +
  geom_point()
