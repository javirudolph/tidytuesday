#' tidytuesday by Javiera Rudolph
#' find the data and info [here](https://github.com/rfordatascience/tidytuesday/tree/master/data/2022/2022-07-19)
#'
#'


#' Get the data
technology <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-19/technology.csv')

library(ggplot2)
library(tidyr)
library(dplyr)
library(stringr)


#' explore what kind of data we got here

technology %>%
  group_by(year) %>%
  tally() %>%
  max()

# lots of years...So, historical data of technology adoption
# look at the category distribution

technology %>%
  ggplot(aes(x = year, fill = category)) +
  geom_histogram(bins = length(unique(technology$year))) +
  theme_classic() +
  scale_fill_brewer(palette = "RdYlBu") +
  guides(fill = guide_legend(title = "Tech Categories")) +
  scale_x_continuous(breaks = seq(min(technology$year), max(technology$year), 10)) +
  labs(title = "Technology adoption across the years") +
  # scale_y_continuous(breaks = seq(0, max()))
  theme(legend.position = c(0.2, 0.4),
        axis.text.x = element_text(angle = 30))


ggsave("2022/2022-07-19/technology.png")
