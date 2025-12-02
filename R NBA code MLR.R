library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

# loading the necessary packages for the regression analysis

summary(NBA_16_25_Team_Stats_Cleaned)

# Viewing the numeric summary of the data which produces the mean, median, and 
# maximum values of the independent variables.

cor(NBA_16_25_Team_Stats_Cleaned$BLK, NBA_16_25_Team_Stats_Cleaned$TOV)
cor(NBA_16_25_Team_Stats_Cleaned$BLK, NBA_16_25_Team_Stats_Cleaned$FGM)
cor(NBA_16_25_Team_Stats_Cleaned$BLK, NBA_16_25_Team_Stats_Cleaned$STL)

cor(NBA_16_25_Team_Stats_Cleaned$TOV, NBA_16_25_Team_Stats_Cleaned$FGM)
cor(NBA_16_25_Team_Stats_Cleaned$TOV, NBA_16_25_Team_Stats_Cleaned$STL)

cor(NBA_16_25_Team_Stats_Cleaned$FGM, NBA_16_25_Team_Stats_Cleaned$STL)

# Checking for high correlation between the 4 chosen independent variables
# (BLK, STL, TOV, FGM) to reduce redundancy. The highest correlation was a 
# positive relationship between BLK and FGM at 24.11%. This means that the more 
# blocks a team has the more likely it is that they will score.  

hist(NBA_16_25_Team_Stats_Cleaned$W)

# Checking if the dependent variable has a normal distribution. The chart shows
# a clear bell curve.

plot(W ~ BLK, data = NBA_16_25_Team_Stats_Cleaned)
plot(W ~ TOV, data = NBA_16_25_Team_Stats_Cleaned)
plot(W ~ FGM, data = NBA_16_25_Team_Stats_Cleaned)
plot(W ~ STL, data = NBA_16_25_Team_Stats_Cleaned)

# checking to see the linearity between the independent variables and dependent 
#variable. The linearity is not abundantly clear, but can be plotted.

W.lm<-lm(W ~ BLK + TOV + FGM + STL, data = NBA_16_25_Team_Stats_Cleaned)

summary(W.lm)

# Running the multiple linear regression model. Based on this model,we have the 
# following data:

# - The estimated effect of steals on winning is 1.75.
# - The estimated effect of blocks on winning is 1.58.
# - The estimated effect of turnovers on winning is -5.55.
# - The estimated effect of field goals made on winning is 3.16.

# - For every 1% increase in steals, there is a 1.75% increase in winning.
# - For every 1% increase in blocks, there is a 1.58% increase in winning.
# - For every 1% increase in turnovers, there is a 5.55% decrease in winning.
# - For every 1% increase in shots made, there is a 3.16% increase in winning.

# However, the standard errors appear to be large and the t-values appear to be
# small. This shows that there is a strong probability that the effects could be
# due to chance. Ultimately, winning in the NBA is not an exact science but
# valuable insights can be taken from the data.

