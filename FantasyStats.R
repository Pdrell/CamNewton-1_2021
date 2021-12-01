library(ggplot2)
library(readxl)
library(scales)
library(plotly)
library(magrittr)
FantasyFB_Stats <- read_excel("C:/Users/peter/Desktop/FantasyFB_Stats.xlsx")
FantasyFB_Stats_df <- as.data.frame(FantasyFB_Stats)
highlightdf <- as.data.frame(FantasyFB_Stats_df[FantasyFB_Stats_df$Player == "PD",])
pfmean <- mean(FantasyFB_Stats_df$PF) 

fig_allgames_pd<- ggplot(FantasyFB_Stats, aes(PA, PF, colour = Player)) + 
  geom_point() +
  geom_point(data=highlightdf, 
                        aes(x=PA,y=PF), 
                        color='blue',
                        size=3) +
  geom_abline(slope = 1) +
  ggtitle("All Games")

fig_pDiff_pd<- ggplot(FantasyFB_Stats, aes(Week, pDiff, colour = Player)) + 
  geom_point()+
  geom_point(data=highlightdf, 
             aes(x=Week,y=pDiff), 
             color='Blue',
             size=3) + 
  geom_hline(yintercept= 0) +
  ylab("Point Difference") +
  scale_x_continuous(breaks= pretty_breaks())+
  ggtitle("Point Difference") 

fig_PF_pd<- ggplot(FantasyFB_Stats, aes(Week, PF, colour = Player)) + 
  geom_point()+
  geom_point(data=highlightdf, 
             aes(x=Week,y=PF), 
             color='Blue',
             size=3) +  
  geom_hline(yintercept= pfmean) +
  ylab("Point Scored") +
  scale_x_continuous(breaks= pretty_breaks())+
  ggtitle("Points For")

fig_PA_pd<- ggplot(FantasyFB_Stats, aes(Week, PA, colour = Player)) + 
  geom_point()+
  geom_point(data=highlightdf, 
             aes(x=Week,y=PA), 
             color='Blue',
             size=3) +  
  geom_hline(yintercept= pfmean) +
  ylab("Point Allowed") +
  scale_x_continuous(breaks= pretty_breaks())+
  ggtitle("Points Against")

ggplotly(fig_allgames_pd)
ggplotly(fig_pDiff_pd)
ggplotly(fig_PF_pd)
ggplotly(fig_PA_pd)

