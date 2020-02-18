# Tidy Tuesday
# Feb 18th

library(tidyverse)

food_consumption <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-18/food_consumption.csv')

ggplot(food_consumption, aes(x = food_category, y = co2_emmission))+
  geom_boxplot()+
  theme(axis.text.x=element_text(angle=90,hjust=1))+
  xlab("Food category") + ylab("CO2 emissions per capita")

ggplot(food_consumption, aes(x = food_category, y = consumption))+
  geom_boxplot()+
  theme(axis.text.x=element_text(angle=90,hjust=1))+
  xlab("Food category") + ylab("Consumption per capita")

ggplot(food_consumption, aes(x = country, y = co2_emmission))+
  geom_boxplot()+
  theme(axis.text.x=element_text(angle=90,hjust=1))+
  xlab("Country") + ylab("CO2 emissions per capita")

# sum emissions per country
sum_emissions <- food_consumption %>% 
  group_by(country) %>% 
  summarize(all_emission = sum(co2_emmission))

# Find the top 10
sum_emissions_order <- arrange(sum_emissions, desc(all_emission)) 

select_countries_data <- food_consumption %>% 
  filter(country %in% sum_emissions_order$country[1:10])
sum_emissions_order$country[1:10]

# to order, make factors
select_countries_data$country <- factor(select_countries_data$country,
                                           levels = c("Argentina", "Australia",
                                           "Albania", "New Zealand", "Iceland", "USA",
                                           "Uruguay", "Brazil", "Luxembourg",
                                           "Kazakhstan"))

ggplot(select_countries_data, aes(x = country, y = co2_emmission))+
  geom_boxplot()+
  theme(axis.text.x=element_text(angle=90,hjust=1))+
  facet_wrap(.~food_category)
  xlab("Country") + ylab("CO2 emissions per capita")


