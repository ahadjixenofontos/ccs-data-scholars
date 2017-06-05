library(leaflet)
library(ggplot2) 

mydata <- read.csv("bird_tracking.csv", header=TRUE, sep=",")
head(mydata)

#extract every 5 row of the data frame
simdata=mydata[seq(1, nrow(mydata), 5), ]

#extract different bird's info
Eric=subset(simdata,simdata$bird_name=='Eric')
Nico=subset(simdata,simdata$bird_name=='Nico')
Sanne=subset(simdata,simdata$bird_name=='Sanne')

#plot the map
m <- leaflet() %>%
  addTiles() %>%  
  setView(2, 49, zoom = 3) %>%
  addCircleMarkers(lng=Eric$longitude, lat=Eric$latitude, popup=paste0("<b>Eric</b><br>"), radius=2, color='red') %>%
  addCircleMarkers(lng=Nico$longitude, lat=Nico$latitude, popup=paste0("<b>Nico</b><br>"),radius=2, color='blue') %>%
  addCircleMarkers(lng=Sanne$longitude, lat=Sanne$latitude, popup=paste0("<b>Sanne</b><br>"),radius=2, color='green')
m 



