

#Step 1: Load libraries
library(interactions)
library(ggplot2)

#Step 2: Load Data (Make sure ordinal data is converted to factors)
data = read.csv("data.csv") 
summary(data) #Check how variables were processed in R
data$Electrode = as.factor(data$Electrode) #convert to factor
data$power = as.numeric(data$power) #convert to numeric (continuous variables)

#Step 3: Produce Interaction Plots

#A. Spaguetti Plot
interaction.plot(x.factor = data$Measure,    # variable to plot on x-axis
                 trace.factor = data$Group, # variable to specify "traces"; here, lines
                 response = data$power,    # variable to plot on y-axis
                 fun = mean,  # summary statistic to be plotted for response variable (can be median as well)
                 type = "l",     # type of plot, here "l" for lines
                 ylab = "Power",
                 xlab = "Measure",
                 col = 1:7,
                 lty = 1,  # line type
                 lwd = 2,  # line width
                 trace.label = "Transmission",  # label for legend
                 xpd = FALSE) #,  # 'clip' legend at border

#B. Boxplot
ggplot(aes(y = power, # variable to plot on y-axis
           x = Measure, # variable to plot on x-axis
           fill = Group), #variable to specify for boxes
       data = data) + geom_boxplot()








