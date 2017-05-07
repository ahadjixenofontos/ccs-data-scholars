#install.packages(c('rgdal', 'leaflet', 'sp', 'lubridate'))

library(leaflet)  # for generating interactive Javascript maps
library(sp)       # spatial operations library
library(rgdal)    # GDAL bindings for loading GPX-data
library(ggplot2)  # general plotting library

working_directory<-'C:\\Research\\ccs-data-scholars\\geospatial_project\\'

exif_info <- function(path) {
  # read out the location data of a picture using exiftool
  
  #exif_cmd <- 'exiftool(-k) -GPSPosition ' 
  exif_cmd <- 'exiftool(-k) -n -csv '
  cmd <- paste(working_directory,exif_cmd,  path,  sep='')
  exif_gps <- system(cmd, intern = TRUE) # execute exiftool-command
}

#get a list of jpg pictures in the photos folder
files <- list.files(path=paste0(working_directory,"photos"), pattern="*.JPG", full.names=T, recursive=FALSE)

numPic=length(files)
picInfo=list()

#extract every picture's location data and save in picInfo, this takes a few seconds to finish
lapply(files, function(x) {
  picName=strsplit(x,'/')[[1]][2]
  picName=strsplit(picName,'[.]')[[1]][1]
  photo_info <- exif_info(x)
  df <- read.csv(textConnection(photo_info), stringsAsFactors = FALSE)
  if("GPSPosition" %in% colnames(df))
  {
    latAndLong=df['GPSPosition']
    picInfo[[picName]]<<-list(as.numeric(strsplit(latAndLong[[1]],' ')[[1]][1]),as.numeric(strsplit(latAndLong[[1]],' ')[[1]][2]))
  } 
})

#generate name, latitude, and longitude vector from picInfo
numPic=length(picInfo)
picNames=character(numPic)
lati=c(numPic)
longi=c(numPic)
for(i in 1:numPic){
  picName=ls(picInfo)[i]
  picNames[i]=picName
  lati[i]=as.numeric(picInfo[picName][[1]][1])
  longi[i]=as.numeric(picInfo[picName][[1]][2])
}

#plot the map
m <- leaflet() %>%
  addTiles() %>%  
  setView(-80.2711, 25.7192, zoom = 16) %>%
  addMarkers(lng=longi, lat=lati, popup=paste0("<b>",picNames,"</b><br><img height='120px' width='160px' src='http://ghchen.com/photos/",picNames,".JPG' />"))
m 

