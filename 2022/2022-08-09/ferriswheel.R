# Get the Data

# Or read in the data manually

wheels <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-08-09/wheels.csv')


# Explore the thing
library(dplyr)
library(tidyr)

head(wheels)
unique(wheels$country)

# Look at the tallest wheels

wheels %>%
  arrange(., desc(height)) %>%
  # and focus on the ones currently operating
  filter(status == "Operating") %>%
  drop_na(diameter, ride_duration_minutes)-> openwheels

# What I want to explore:
# Relationship between diameter and height which should be correlated
# And I expect smaller diameter wheels to have shorter duration of rides

library(ggplot2)
# TOP 20
openwheels %>%
  slice_head(n=20) %>%
  ggplot(., aes(y = diameter, x = height)) +
  geom_point(aes(color = ride_duration_minutes)) +
  geom_smooth(method = "lm")

# Things to do:
#   1. Change the theme
#   2. write the formula in the figure
#   3. move the legend inside the plotting area
#   4. make points bigger and more obvious
#   5. Change color

mycols <- c("#003844", "#005256", "#006C67",
            "#79808E", "#F194B4", "#F59C87",
            "#F8A35A", "#FFB100", "#FFCE63")
scales::show_col(mycols)

# "#FFEBC6"
library(ggpubr)
library(ggrepel)

openwheels %>%
  # slice_head(n=20) %>%
  ggplot(., aes(y = diameter, x = height)) +
  geom_smooth(method = "lm", color = "black") +
  # geom_label(data = openwheels %>% slice_head(n=5), aes(label = country)) +
  geom_label_repel(data = openwheels %>% slice_head(n=28), aes(label = country), alpha = 0.9, size = 3) +
  geom_point(aes(color = ride_duration_minutes), size = 5, alpha = 0.9) +
  scale_color_gradient(low = mycols[3], high =  mycols[8]) +
  guides(color = guide_colorbar(title = "Ride duration in minutes", direction = "horizontal",
                                barwidth = 10, barheight = 0.5, title.position = "top")) +
  labs(x = "Height", y = "Diameter") +
  stat_cor(label.y = 490, aes(label =  ..rr.label..), size = 3) +
  stat_regline_equation(label.y = 460, size = 3) +
  theme_bw() +
  theme(legend.position = c(0.8, 0.1),
        legend.box.background = element_rect(color = "grey"),
        panel.border = element_blank())

ggsave("2022/2022-08-09/wheels.png")





