#set up working directory
working_directory<-'C:\\Research\\ccs-data-scholars\\geospatial_project\\'

#the function to extract all photo info
exif_info <- function(path) {
  # read out the location data of a picture using exiftool
  
  #exif_cmd <- 'exiftool(-k) -GPSPosition ' 
  exif_cmd <- 'exiftool(-k) -n -csv '
  cmd <- paste(working_directory,exif_cmd,  path,  sep='')
  exif_gps <- system(cmd, intern = TRUE) # execute exiftool-command
}

#call the function above and save the extracted photo info
photo_info=exif_info(paste0(working_directory,"photos\\p1.jpg"))

#get coordinates data from photo_info and output
photo_coordinates=read.csv(textConnection(photo_info), stringsAsFactors = FALSE)['GPSPosition']
print(photo_coordinates)
