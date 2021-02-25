# Week-2 Notes.
## Hypothesis Testing
### $ Z = \frac{X - U} {(\frac {SD} {√n})} $
#### Drug Test Ex:
100 rats were tested for a drug to see how it effects the response time:
- Without the drug the response was 1.2 (x)
- With the drug, the response was 1.02 (μ)
- The standard deviantion was 0.5. ($\sigma$)

H0: The drug has no effect | $\mu = 1.2$
H1: The drug has an effect | $\mu \not = 1.2$

Assume H0 and find P value.
(mean of sample distribution is (Mx) will be the same as the $\mu = 1.2s$)

SD = $\sigma = \sqrt {\mu _2 }$
Standard Deviation of Sample Distribution = $\sigma \over \sqrt{100} $
$0.5 \over 10$ $= 0.5$
SD ($ \hat \sigma \bar{x}$ ) = 0.05


Next we will need to find out the Z score:
(How far away are we from the mean)
#### $Z=$ $(x – μ) \over \sigma $

##### $ Z=$ $1.2 - 1.05 \over 0.05$ $= 3$

Meaning the data is 3 positive standard deviations from the mean (middle of the bell) the critical region would be .003 (3%).

Therefor we would reject the null hypothesis at a 5% level, as the Z score is lower than <.005.

### Steps
#### 1 
State the hypotheses. This involves stating the null and alternative hypotheses. The hypotheses are stated in such a way that they are mutually exclusive. That is, if one is true, the other must be false.
#### 2
Formulate an analysis plan. The analysis plan describes how to use sample data to evaluate the null hypothesis. The evaluation often focuses around a single test statistic.
#### 3
Analyze sample data. Find the value of the test statistic (mean score, proportion, t statistic, z-score, etc.) described in the analysis plan.
#### 4
Interpret results. Apply the decision rule described in the analysis plan. If the value of the test statistic is unlikely, based on the null hypothesis, reject the null hypothesis. 

#### Tests
##### SPORT SHOES
###### 1
H0: There is no significant difference between the durabilitiy of the two shoes companies.
H1: There is a significant difference between the durabilitiy of the two shoes companies.
###### 2
Start with a distribution analysis to see how the data is, added histograms, with curves, and checked for normality.
###### 3
Then went to do a Paired T Test, with group 1 variable as A and group 2 variable as B, for the options I added tested for normality with nonparametric tests (Even tho the data is pretty normal) and added all of the plots. When looking at the Shapiro-Wilk results between group-a and group-b there was a P value of 0.0259.

Used Summary Statistics, which showed the mean, std dev, min, max, median, skewness and kurtosis.

This analysis seemed to show a lot about the dataset, with brand-a having a range from 16 to 69 with the meean being 44 and median 45. Boxplot shows possible outliers

With brand-b being higher in all areas of the summary analysis, which is shown with the boxplots (outliers towards the lower end and possibly higher end).
###### 4
From the Paired T test (Shapiro-Wilk) there was a p value of 0.0259 (<0.05) which shows there is a positive significant difference. This means we reject the null hypothesis at a 5% level of significance. 


#####  PAIN EXPERIMENT
###### 1
H0: There is no significant difference between the pain experienced from the two groups.
H1: There is a significant difference between the pain experienced from the two groups.
###### 2
Summary Statistics, this shows a lot of information around the data which is group by Drug & Placebo. First of all this shows the number of observations isn't equal (16 - 12) which means the data is Non Normal.
###### 3
The distribution is left skewed which shows it increased with the drugs, means it has a higher number of responses of it working (With a Mu of 1.125 and Sigma of 2.029).

When looking at the Placebo drug, it shows it is evenly distributed (roughly) and there was a small leway for working and not working, with more people claiming the placebo helped. This has a Mu of 0.0833 and a sigma of 1.9752, and can't do a correlation analysis due to the different data types.
###### 4
After looking at the One-Sample test with the Response (Two-tailed test) the Shapiro-Wilk P value is a 0.0077 (<0.05) which shows there is a positive significance between the two eye drop tests. This means we reject the null hypothesis at a 5% level of significance. 

##### 3 EYE EXPERIMENT
###### 1
H0: There is no significant difference between the visibility of the two eye drops.
H1: There is a significant difference between the visibility of the two eye drops.
###### 2
Started with Summary Statistic to get a better understanding of the data, the higher the number the worse their vision. Couldn't get much from the summary statistic analysis just had the numbers for each eye, for each patient.
###### 3
Looked to use a Paired T Test between LeftEye and RightEye, the tests for normality have a P values of 0.03 at Shapiro-Wilk and Kolmogorov-Smirnov at 0.01 which shows there is a statistical significant difference. 
###### 4
With the signed rank P value of 0.04 (<0.05) this would suggest there is a significant difference. This means we reject the null hypothesis at a 5% level of significance. 

##### 4 CARBON MONOXIDE
###### 1
H0: There is no significant difference between the two cigarette brands.
H1: There is a significant difference between the two cigarette brands.
###### 2
Started with the data exploration to get a better understanding of the data, first of all the data has the same sample size meaning it is normal.
From looking at the boxplots we can see there is a big difference with the distribution of the two cigarette brands with Browns having a mean of 2.11 and Witters having a mean of 4.95.
###### 3
With the data being normally distributed, the next step was to perform a 1 Sample T Test, with the test for normality showing first, this displays that the p value for normality is <0.0001. Not sure if this Test gives the correct information, so will do a Two-sample test.
###### 4
After looking at a Two-sample T test, here we can see the p value assosiated with the t-test (equal variances) pooled has an alpha value of <0.0001 (<0.05), so this would suggest there is a significant difference between the two cigarette brands, and we would reject the null hypothesis at a 5% level of significance. 

##### 5 CONCRETE
###### 1
H0: There is no significant relationship between the two concrete strengths.
H1: There is a significant relationship between the two concrete strengths.
###### 2
Started by exploring the data with a Summary Statistics, looked at Strength1, 2 and difference. Strength 1 & 2 has the same sample size which would show normality for data. Distribution of the data for Strength 1 & 2 is fairly close together with a skewness of (Strength 1) 0.001 and (Strength 2) -0.023 and a kurtosis of (Strength 1) -0.823 and (Strength 2) -0.890.
###### 3
Did a correlation analysis with all available variables, which gave a Spearman Correlation score for the two strengths. 
###### 4
Whilst looking at this correlation we can see that Strength1 and Strength2 have a correlation of 0.991 which is a strong correlation and are significant at the 5% level. which shows is a strong positive association.

##### 6 SALARY
###### 1
H0: There is no significant difference between the GCSE's and Salary.
H1: There is a significant difference between the GCSE's and Salary.
###### 2
Imported the data as a CSV and this dataset was found under my WORK.IMPORT.
###### 3
I carried out a correlation test to see if there was enough evidence to see a correlation between Salary & Points (GCSE). When exploring this data there was a Pearson Correlation Coefficients of -0.547. 
###### 4
With a P value -0.547 this would make this a weak negative association, which would suggest that we would reject the null hypothesis at a 5% level of significance. 