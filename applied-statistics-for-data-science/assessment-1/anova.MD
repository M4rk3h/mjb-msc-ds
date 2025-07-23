# Anova
With this dataset having total types of cars being registered, we could use an ANOVA analysis to see if there is a difference between the type of different energy for the cars.

1 
    H0: There is no significant difference between the car fuel types.
    H1: There is a significant difference between the car fuel types.
2
First assumptions to check:
    Independent Assumption
    which have been picked at random, so this is fine.
    
Checking for Normality
    H0: samples came from a normallity distributed population.
    H1: at least one sample did not come from a normally distributed population.

Carried out a distribution analysis on the data to see how the goodness-of-fit tests to check the normal distribution.
    
    Petrol had a p-value of >0.150
    Diesel had a p-value of >0.150
    Other had a p-value of <0.010

Seeing as 2 of the variables have a p-value greater than 0.05, this would suggest there is no significant differences between the data. But seeing as the last variable was less than 0.05 we would therefore we would accept the null hypothesis. There may not be enough evidence to suggest the data is normally distributed.

##### 3
##### Non-Parametric Anova Test
Next would be to check for Homogeneity, the hypothesis for this would be:
    H0: There is no significant difference between the variances of the groups.
    H1: There is A significant difference between the variances of the groups.

    For this we will use the Levene's test results. 
    The P-value here was 0.1261, at this level we can not reject 
    the null hypothesis at a 5% level.

##### Welch
    The next chart shows the Welch's ANOVA for height.
    The results from the ANOVA show no significant difference at 5% as the P-value 
    was 0.459 which is very close to the 5% level.
    As the result isn't at a 5% level, we no longer need to explore the Tukey scores.
##### 4
To conclude the results, there was no significant difference between the heights of children from the different countries. This can be seen easier within the distribution of height boxplot, which differs a bit, but shows how similar the means are.