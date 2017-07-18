
# Read in the data file
emotions <- read.csv("../datasets/emotion-likes-dataset.csv")

# Print the structure of the data frame to the screen
str(emotions)

# Get the possible values of the emotion 
# variable as well as the counts for each value
emfreq <- table(emotions$emotion)

# Get some descriptive statistics of the
# distribution of the number of likes
mean(emotions$likes)
sd(emotions$likes)
max(emotions$likes)
min(emotions$likes)

# Plot the distribution of the 
# number of likes
hist(emotions$likes)

# Plot the distribution of the
# number of photos with each emotion
barplot(emfreq)

