## REMEMBER TO INSTALL PACKAGES AND RUN PACKAGES
library("tidyverse") # Used for coding style
library("afex")      # Perform stats (ANOVAs)
library("emmeans")   # Calculates estimated marginal means
library("writexl")   # Produces Excel files from R data
library("readxl")    # Load Excel files into R
library("ggridges")  # Add ridge plots.

## TRANSFER DATA FROM XLSX
data <- read_xlsx("Jorgenson.xlsx") # import data from xlsx

# Stacked Box Plot
ggplot(data, aes(x = Year, y = Count, fill = factor(Class, levels=c("Sulfur", "Carbon", "Both", "Other")))) + #Forces manual ordering rather than alphabetical of legend 
  geom_bar(stat = "identity") + #removes y axis of class
  labs(fill = "Class") # Adds a legend header

# Pie Chart. Pie charts are boring maybe we can do a gridplot or something?
ggplot(data, aes(x = "", y = Count, fill = factor(Class, levels=c("Sulfur", "Carbon", "Both", "Other")))) +
  geom_col() +
  coord_polar(theta = "y") +
  labs(fill = "Class") # Adds a legend header.

# Density Plot
ggplot(data, aes(x=Year, y=factor(Class, levels=c("Both", "Other", "Sulfur", "Carbon")), height = Count, fill = Class))+
  geom_density_ridges(stat = "identity", scale = 20) +
  theme(legend.position = "none") +
  labs(y = "Class") # Renames-the Y axis.

# Why is it so WIDE! Also why are all of the data the SAMEEEEEE. Violin plot would look really cool though.
ggplot(data, aes(x=Year, y=factor(Class, levels=c("Both", "Other", "Sulfur", "Carbon")), height = Count, fill = Class))+
  geom_violin() +
  theme(legend.position = "none") +
  labs(fill = "Class") # Adds a legend header.
