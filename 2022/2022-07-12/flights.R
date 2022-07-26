# TidyTuesday by javirudolph
# data and info here: https://github.com/rfordatascience/tidytuesday/tree/master/data/2022/2022-07-12



# Get the data
flights <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-07-12/flights.csv')


library(ggplot2)
library(tidyr)
library(dplyr)
library(stringr)


# Top 10 countries with flights in 2021

flights %>%
  filter(., YEAR == 2021) %>%
  group_by(STATE_NAME) %>%
  summarise(total = sum(FLT_TOT_1)) %>%
  arrange(desc(total)) %>%
  slice_head(., n = 10) -> top10

flights %>%
  filter(., YEAR %in% c("2019", "2020", "2021") & STATE_NAME %in% top10$STATE_NAME) %>%
  group_by(., YEAR, MONTH_NUM, STATE_NAME) %>%
  summarise(T_FLT = sum(FLT_TOT_1)) %>%
  ungroup() %>%
  ggplot(., aes(x = MONTH_NUM, y = T_FLT, color = STATE_NAME, group = STATE_NAME)) +
  facet_wrap(~YEAR, ncol = 1) +
  # geom_point() +
  geom_line(size = 1) +
  theme_bw() +
  labs(x = 'Month', y = 'Total flights') +
  scale_color_viridis_d() +
  theme(legend.title = element_blank())

ggsave("2022/2022-07-12/flights.png", width = 6, height = 8, units = "in")
