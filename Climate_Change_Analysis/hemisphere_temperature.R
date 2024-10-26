library(tidyverse)
n_h_data <- read_csv("data/NH.Ts+dSST.csv", skip = 1, na = "***")%>%
  select(year = Year, north_t_diff = `J-D`) %>%
  drop_na()
s_h_data <- read_csv("data/SH.Ts+dSST.csv", skip = 1, na = "***")%>%
  select(year = Year, south_t_diff = `J-D`) %>%
  drop_na()
ggplot() +
  geom_point(data = n_h_data,mapping = aes(x = year, y = north_t_diff), color = "blue")+
  geom_point(data = s_h_data,mapping = aes(x = year, y = south_t_diff), color = "red")+
  geom_smooth(data = n_h_data, mapping = aes(x = year, y = north_t_diff), method = "lm", se = TRUE, color = "lightblue")+
  geom_smooth(data = s_h_data, mapping = aes(x = year, y = south_t_diff), method = "lm", se = TRUE, color = "pink")+
  labs(title = "Change in Temperature in Northern and Southern Hemisphere \n and Linear Regression", 
       subtitle = "Data from Nasa GISS")+
  xlab("Year")+
  ylab("Temperature Difference")+
  theme_classic()

ggsave("figures/north_and_south_temperature.png", width = 7, height = 4)

#linear regression
northTemperatureLM <- lm(north_t_diff ~ year, data = n_h_data)
summary(northTemperatureLM)


southTemperatureLM <- lm(south_t_diff ~ year, data = s_h_data)
summary(southTemperatureLM)
