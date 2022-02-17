library(ggplot2) 
library(tidyverse) 
midwest
# 1) Explore the Midwest data frame.   
?midwest
# a) How many rows, columns, and variables are in the Midwest data frame? 
dim(midwest)
# b) Name three categorical variables in the data frame. 
#county, category, state
# c) Give a description for the variable percollege. 
#The variable percollege is quantitative and pertains to the percent of the sampled population that is has completed a college education. 

# 2) Write R code to produce a histogram for the variable poptotal.
ggplot(data = midwest) +
  geom_histogram(mapping = aes(x=poptotal))

# 3) Write r code to produce a boxplot for the variable area, and then use your box plot to find Q1, Q2, and Q3 
ggplot(data =midwest) +
  geom_boxplot(mapping = aes(y= area))+ 
  coord_flip()
#Q1-.02
#Q2-.03
#Q3-.04

# 4) Write r code to produce side by side boxplots 
#for the quantitative variable area with respect to the categorical variable state.
ggplot(data = midwest) +
  geom_boxplot(mapping = aes(x=area, y=state)) 

# 5) Write r code to produce a scatter plot for the variables popdensity and popwhite. 
#Let popdensity be the independent variable x and popwhite be dependent variable y.
ggplot(data=midwest) +
  geom_point(mapping = aes(x = popdensity, y=popwhite)) 

# 6) Write r code that will produce smooth lines plots and scatter plots 
#on the same axis system for popwhite and popdensity with respect to the categorical variable state. 
ggplot(data = midwest) +
  geom_point(mapping = aes(x=popdensity, y=popwhite, color=state)) +
  geom_smooth(mapping = aes(x=popdensity, y=popwhite, color=state))

#7) Again,  using the variables popdensity and popwhite, write r code that will produce the same basic scatter plot, but also make the following changes: 
#a) Your scatter plot should have purple data points. 
#b) The label of the dependent variable should be changed to Population  Density and the label of the independent variable should be changed to White Population
#c) Add a linear regression line to your graph. 
#d) Add the following title to your graph; White vs Density Scatter Plot 
ggplot(data = midwest) +
  geom_point(mapping = aes(x=popdensity, y=popwhite, color=state), 
             color="purple") +
  geom_smooth(mapping = aes(x=popdensity, y=popwhite), method = lm) +
  stat_smooth(mapping = aes(x=popdensity, y=popwhite, color=state)) +
  xlab("Population Density") +
  ylab("White Population") +
  ggtitle("White vs. Density Scatter Plot")

# 8) Write R code that will generate the following graph (use the mpg data frame) 
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, color=drv)) +
  geom_smooth(mapping=aes(x=displ,y=hwy)) +
  stat_smooth(mapping = aes(x=displ,y=hwy, color=drv))

#9 Write R code that will produce the following facet plot using the midwest data frame
ggplot(data=midwest) +
  geom_boxplot(mapping = aes(y=popdensity)) +
  facet_wrap(~state)

#10   Write R code that will produce the following facet plot using the mpg data frame
ggplot(data=mpg) +
  geom_histogram(mapping = aes(x=cty), fill = "green") +
  facet_grid(drv ~ cyl)




