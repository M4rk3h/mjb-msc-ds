# Week-3 Notes.
## One - Way Analysis of Variance (ANOVA)
The ANOVA procedure evaluates the differences amongst the means of the groups relative to the dispersion in the sampling distributions.

ANOVA is the same as linear regression but under a different name - "Field, A. - 2017" and with a bigger data set will give a more accurate estimate of the b-value.

Andy Field used puppy theraphy,
Happiness(i) = b0 + b1Long(i) + b2Short(i) ) E(i)v

The null hypothesis of interest is that the m populations' means are the same, that is: 

𝐻0: $\mu1 = \mu2 = \mu3 = \mu𝑚 $
𝐻1: $\mu𝑖 \not = \mu𝑚 $ 

If the data is scores-ranked, need to use Kruskal-Wallis (Non-Parametric ANOVA).

1- Independent Assumption
    
    Make sure the groups are independant of one another.

2- Check for Normality
    
    Distribution testing to look for a 'Bell' shape.
    If both are good, move to

3- Looking at Variances
    
    Levene's test or Bartlett's

4- Anova Test

    F statistic for parametric or 
    Kruskal Wallis for non-parametric
5- Post-Hoc

    Tukey, Bonferroni or Non-parametric alternative.

### Steps
#### 1  - State the hypotheses. 
    This involves stating the null and alternative hypotheses. 
    The hypotheses are stated in such a way that they are mutually exclusive. 
    That is, if one is true, the other must be false.
#### 2 - Formulate an analysis plan.
    The analysis plan describes how to use sample data to evaluate the null hypothesis.
    The evaluation often focuses around a single test statistic.
#### 3- Analyze sample data
    Find the value of the test statistic (mean, proportion, t statistic, z-score, etc) 
    described in the analysis plan.
#### 4- Interpret results
    Apply the decision rule described in the analysis plan. 
    If the value of the test statistic is unlikely, 
    based on the null hypothesis, reject the null hypothesis. 

#### Tests
#### EX-1-primary-school
For this question we were asked to compare the height differences between 25 students from 4 countries, and to see if there are any statistical significances.
##### 1
    H0: There is no significant difference between the students height from 4 different countries.
    H1: There is A significant difference between the students height from 4 different countries.
##### 2
First assumptions to check:
    
    Independent Assumption
    which have been picked at random, so this is fine.
    
Checking for Normality
    
    H0: samples came from a normallity distributed population.
    H1: at least one sample did not come from a normally distributed population.

Carried out a distribution analysis on the data to see how the goodness-of-fit tests to check the normal distribution.
    
    England had a P-value of >0.150
    N Ireland had a P-value of >0.150
    Scotland had a P-value of >0.150
    Wales had a P-value of >0.150

Seeing as the P-values are greater than 0.05, there is no significant differences between the data. Therefore we do not reject the null hypothesis, as there is not enough evidence to suggest the data isn't normally distributed.


##### 3
##### Anova Test
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

#### EX-2-counselling-theraphy
For this question, we were asking to investigate if there is a difference between the pre-theraphy effectiveness and to identify the best and worst approach. Due to this dataset being a score, we would use the non-parametric ANOVA to explore this dataset.
##### 1
    H0: There is no significant difference between the 4 different approaches of pre-theraphy training methods.
    H1: There is no significant difference between the 4 different approaches of pre-theraphy training methods.
##### 2
##### Data Exploration
    Seeing as the dataset is scores, 
    we would jump straight to a nonparametric one-way ANOVA test.

###### 3
##### Anova Test
    H0: The m distributions are identical.
    H1: Not all of the m distributions are identical.

    Carried out a Nonparametric One-Way ANOVA on the data, 
    which will check for the Wilcoxon Score and Kruskal-Wallis. 
    By doing a Nonparametric One-Way ANOVA, 
    we need to check that the p values for this dataset.

    First chart that is shown is a Wilcoxon Rank, 
    which at the bottom says "Average scores were used for ties", 
    which means the third assumption for Kruskal Wallis is satisfied.

    Next is a Kruskal-Wallis Test which has a P-value of <.0001, 
    therefore we would reject the null hypothesis at the 5% level (and even at a 0.1% level). 

    This means that at least one of the three groups differs 
    significantly from the others. To get a better understanding of this, 
    there needs to be a post-hoc comparison along with the scores per group.

###### 4
##### Results
    When looking at the post-hoc (pairwise two-sided multiple comparison analysis) 
    we can see the p-values for each of the datasets, seeing as all by two of these 
    comparisons have <0.02 (omitting RII vs. TR & TR vs. VTP).

    We can't see which has the highest score from this table, but by looking at 
    the other plots which have been explored (especially the boxplots) we 
    can see that VTP has the highest mean with 1 outlier.


##### EX-3-mercury-pollution
For this question we were asked to compare the mercury measurements from a bunch of fish, caught at different rivers.
##### 1
    H0: There is no significant difference between the mercury measurements.
    H1: There is A significant difference between the mercury measurements.
##### 2
When first exploring the data (summary), not all of the data has the same sample size.

First assumptions to check:
    
    Independent Assumption
    These fish were caught at random from a river, so lets assume it was independent.
    
Checking for Normality
    
    H0: samples came from a normally distributed population.
    H1: at least one sample did not come from a normally distributed population.

Carried out a distribution analysis on the data to see how the goodness-of-fit tests to check the normal distribution.
    
    Kelee had a P-value of >0.150
    Porthead had a P-value of >0.150
    Reasbury had a P-value of >0.150
    Swinford had a P-value of >0.150
    Whiethorpe had a P-value of >0.150

Seeing as the P-values are greater than 0.05, there is no significant differences between the data. Therefore we do not reject the null hypothesis, as there is not enough evidence to suggest the data isn't normally distributed.

##### 3
##### One-Way ANOVA Test
Next would be to check for Homogeneity, the hypothesis for this would be:
    
    H0: There is no significant difference between the variances of the groups.
    H1: There is A significant difference between the variances of the groups.

    Before stating the results from the Levene test, firstly I'd like to bring to attention the fact that out of the 150 observations, only 147 were used.

    For this we will use the Levene's test results.
    The P-value here was 0.5063, at this level we can not reject
    the null hypothesis at a 5% level.

##### Welch
    The next chart shows the Welch's ANOVA for the mercury readings.
    The results from the ANOVA shows a significance at the 5% level, with a P-value of <.0001.

    The next step would be to look at a post-hoc analysis and see where the significant differences are.

    After looking at the post-hoc table, the results are as follows:
    All of the rivers had a significant difference except for
    Reasbury (3) and Swindford (4) (0.0811)
    & Kelee (1) and Whitethorpe (5) (0.7268).

##### 4
To conclude, there is significant difference between the rivers, with a few exceptions which can be seen from the scores above and within the Distribution of Mercury Reading Boxplot.