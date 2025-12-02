# A common theme in the NBA is that you can get a good picture of who a team 
# truly is after 20 games. Even though the NBA season is 82 games long, there
# is still substantial data available to make insights. With this in mind, which
# teams have shown championship potential through the first quarter of the 
# season? Do regular season habits build NBA champions? This analysis attempts 
# to explain the chances each team in the NBA has to win the championship for 
# 2026 using the previous 10 years of NBA team regular season data and data from 
# the first quarter of the regular season from 2026 using a logistic regression
# model.

# The dependent variable is CHAMP.
# Value 0 = did not win a championship
# value 1 = did win a championship

# The dependent variables are TOV, STL, BLK, and FGM. These are all numerical
# data and were chosen based off of the linear regression model that I ran to 
# determine the impact the variables had on regular season wins. Wins is 
# specified as W in the table.

# The data was extracted from NBA.com to excel, cleaned and transformed in 
# MS SQL Server, and then loaded to RStudio.

library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
library(car)
install.packages("caret")
library(caret)

# loading the necessary packages for the logistic regression model

NBAchamp <-glm(CHAMP ~ TOV +STL + BLK + FGM,
                    data = NBA_16_25_Team_Stats_Cleaned_and_26,
                    family = binomial)

# This is the basic multiple logistic regression model. Champ is defined as
# the dependent variable and TOV, STL, BLK, and FGM are defined as the 
# independent variables. The data used is the 2016-2025 NBA regular season data
# and the first quarter of the 2026 NBA team stats. The argument family is 
# classified as binomial to ensure that a logistic regression is being used. I
# named the model "NBAChamp".

summary(NBAchamp)

# A quick view of the model "NBAChamp."

# The estimate shows the regression coefficients. Positive values
# increase the probability and negative values decrease the probability.

# Pr(>|z|) or p-value tells us if the independent variables are
# significant. If it is less than <0.05, the variable is significant.

# the numbers show that BLK and FGM are the most significant regular 
# season statistic for predicting the NBA champ.

exp(coef(NBAchamp))

# Showing odds ratios for better explanation of the independent 
# variables.

round(exp(coef(NBAchamp)), digits = 2)

# Showing the odds ratios with two decimal points so that for even
# better clarity. 

# Anything > 1 increases the probability of being a champion and 
# anything < 1 decreases the probability

predicted <- ifelse(predict(NBAchamp, type = "response") >
                      0.5, 1, 0)
confusionMatrix(factor(predicted), factor
                (NBA_16_25_Team_Stats_Cleaned_and_26$CHAMP))

# I don't know yet?!?!

chances <- predict(NBAchamp, type = "response")

summary(chances)

NBA_16_25_Team_Stats_Cleaned_and_26$New_Champ <- round(chances *100, 
                                                  digit = 1) 

# Adding a column to the original data set that shows the chances
# of each team winning the championship in 2026. I multiplied by 100 and 
# rounded to 1 decimal place for easier reading.

write.csv(NBA_16_25_Team_Stats_Cleaned_and_26, file = "NewTable.csv",
          row.names = FALSE)

# Exporting the altered table as a csv to use in SQL.

