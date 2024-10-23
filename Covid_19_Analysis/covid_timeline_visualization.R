library(readr)
library(ggplot2)
library(dplyr)

cases <- read.csv("Covid_19_Analysis/data/confirmed_cases_worldwide.csv")
cases<-ggplot(cases, aes(date, cum_cases, group = 1)) + theme(axis.text.x = element_text(angle = 90))+geom_line()+ ylab("Cumulative confirmed Cases")

events <- read.csv("Covid_19_Analysis/data/who_events.csv")

cases +
  geom_vline(aes(xintercept=date), events, linetype="dashed") + 
  geom_text(aes(x=date, label=event),events,y=1e5)+
  labs(
    title = "Covid 19 Timeline and Confirmed Cass from January 2020 to March 2020"
  )

ggsave("Covid_19_Analysis/covid_19_timeline.png", width = 10, height = 6)
