First Tidy Tuesday
================
Javiera Rudolph
2/18/2020

# Get the Data

``` r
food_consumption <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-18/food_consumption.csv')
```

``` r
# Load the libraries and if you don't have them installed yet
# install.packages('tidyverse')
library(tidyverse)
```

``` r
# Check how the data looks

food_consumption %>%
  ggplot(., aes(x = consumption, y = co2_emmission, color = food_category)) +
  geom_point(size = 3, alpha = 0.6) +
  theme_classic() +
  guides(color = guide_legend(title = "Food"))
```

![](20200218_first_tuesday_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
  #scale_color_viridis_d() +
  #guide_legend(color = "Food") +
```

How many countries do we have? The data shows we have 130 countries and
11 food categories.
