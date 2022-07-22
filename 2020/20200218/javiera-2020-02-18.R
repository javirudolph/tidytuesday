
#Read in the data

food_consumption <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-18/food_consumption.csv')

# libraries
library(tidyverse)

# Figure
# How does CO2 relate to consumption?
food_consumption %>%
  ggplot(., aes(x = consumption, y = co2_emmission, color = food_category)) +
  geom_point(size = 3, alpha = 0.6) +
  theme_classic() +
  guides(color = guide_legend(title = "Food")) +
  labs(x = "Per capita consumption",
       y = "CO2 emmission") +
  theme(legend.position = "bottom")

ggsave("20200218/tidytues-javi-2020-02-18.png", height = 3, width = 5)
