# Introduction
This analysis attempts to predict the 2026 NBA champion using multiple linear regression analysis and multiple logistic regression analysis. This analysis provides a basic understanding of the effect regular season habits can have on championship success. The analysis was limited to 4 independent variables for simplicity. Both SQL and R were used for the various tasks outlined below.   

# Data
The data was scraped directly from [publicly available stats on NBA.com ](https://www.nba.com/stats/teams/traditional). It includes 10 years of statistics from the 2015-2025 regular season and roughly the first 25% of the 2026 regular season. 

# Process
1. Extract all of the data from NBA.com into CSV (Excel) format to create individual tables for each regular season.
2. Merge the tables together to create one large dataset using SQL in Microsoft SQL Server 21.
3. Clean and transform the data for simplicity, readability, and a clearer understanding of what the statistics are and what they are used for.
   #### • The code used to cleanup the data is found in the file NBA Data CLeanup SQL Query All.sql
   #### • The results of the cleaned data are found in the file NBA 16 25 Team Stats Cleaned.csv
4. Add the column YR to the database with SQL to identify when each of the teams listed played for clarification.
   #### • The code for this is found in the file NBA Data Add Year.sql
5. Add the column CHAMP to the database with SQL to calculate the probability of winning the championship with multiple logistic regression analysis.
   #### • The code for this is found in the file NBA Add Champ Data.sql
6. Run a multiple linear regression analysis using the database to determine the impact statistical categories (independent variables) BLK, STL, TOV, and FGM have on W (dependent variable).
   #### • The code for this is found in the file R NBA code MLR.R
7. Add the available 2026 team stats as of 11/30/2025 to the original database. This was extracted from NBA.com and manually entered into the existing database.
   #### • The result for the new combined data is found in the file NBA 16 25 Team Stats Cleaned and 26
8. Run a multiple logistic regression analysis using the new combined database with the same independent variables to predict CHAMP (new dependent variable with value of 0 or 1) for the upcoming 2026 NBA championship.  
   #### • The code for this is found in the file R NBA code Logit3.R
9. Add a new column in R showing the probability of winning the 2026 NBA championship for each team.
   #### • The new dataset is found in the file Predicted 2026 NBA champ.csv
10. Open the new dataset in Microsoft SQL Server 2021 and filtered to see which team has the greatest probability of winning the 2026 NBA championship.
    #### • The code for this is found in the file NBA Champ Query.sql 
   

# Conclusion
The data shows that through the first 25% of the 2026 NBA regular season, the Detroit Pistons have the best chance of winning the 2026 NBA championship. There are further details about the process that are documented in the code for R. This project is more for proof-of-concept and practice than true analysis. The analysis is basic in nature and could be tuned much further.
