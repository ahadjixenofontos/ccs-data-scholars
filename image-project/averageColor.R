#install.packages('imager')
library('imager')

#load the picture
im <- load.image('C:\\Research\\ccs-data-scholars\\image_project\\1.jpg')

#preview the picture loaded
plot(im)

#calculate the average values of the RGB channels
averageRGB=imsplit(im,"c") %>% laply(mean)*255
averageRGB

#draw a shade with the average RGB
imfill(20,20,val=c(averageRGB,0,255)) %>% plot

