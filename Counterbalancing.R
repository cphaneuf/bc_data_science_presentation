# Counterbalancing for sample data set

# Before running this script, delete 'Remaining_Master.csv' from your datascienceworkflow directory

# Set working directory
# HOW TO: open terminal > change to your local datascienceworkflow directory > type 'pwd' > copy and paste output setwd("<here>")
setwd("/Users/camillephaneuf/Desktop/L3@BC/datascienceworkflow")

# Install and load necessary packages
# HOW TO: uncomment the line below if you do not have dplyr installed (you will get an error if you try running this code without it)
# install.packages("dplyr")
library(dplyr)

# Load data
data <- read.csv("data.csv")

# Clean up data
# Remove excluded individuals (== 1; == NA)
data <- data[data$Rejected == 0,]
# Remove individuals outside of age range
data <- data[data$Age < 84 & data$Age >= 36,]

# Reformat data
data$Age_Category <- (data$Age)/12
data$Age_Category <- floor(data$Age_Category)

# ---CREATE REMAINING_MASTER---

# Calculate frequency values
Age_Condition_Table_Master <- table(data$List, data$Age_Category) 
# Inspect table
Age_Condition_Table_Master
Remaining_Master <- as.data.frame(Age_Condition_Table_Master)

# Rename columns of Remaining
colnames(Remaining_Master) <- c("Condition_Num","Age","Frequency")
Remaining_Master$Remaining_to_Test <- 10 - Remaining_Master$Frequency

# Write to new CSV file (in other words, create a permanent file for the Remaining data frame)
write.csv(Remaining_Master, file = "Remaining_Master.csv", row.names = FALSE)
