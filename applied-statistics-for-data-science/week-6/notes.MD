# Logistic Regression
    
    Page 21 In Lecture Notes

$ \ell =\log _{b}{\frac {p}{1-p}}=\beta _{0}+\beta _{1}x_{1}+\beta _{2}x_{2} $

With Logistic Regression variables can be categorical or continious.


Assumptions
    
    Predictors are uncorrelated with one another
    Predictors are significantly related to Y
    The observations are also uncorrelated

Go to Binary Logistic Regression
Data

    Select the Dataset (Binary)
    Response Variable (ADMIN)
    Interest: 1
    Classification (RANK)
    Continuous (GRE, GPA)

Options

    Generalized R Square
    Hosmer and Lemeshow Goodness-of-fit

Run

    We can see the number of observations read/used
    Class Level Information shows the different categories 
    (4 is created by SAS which is the important category.)

Model Fit Statistics

    AIC (Smaller is Better)
    -2 Log L (Deviance)
    R-Square (0 - 1) 
    If model is good for prediction, closer to 1.

Testing Global Null Hypothesis: BETA=0

    Reject the null as p-value <0.05 (atleast one variables != 0)

Type 3 Analysis of Effects

    Reject null hypothesis if <0.05
    
Analysis of Maximum Likelihood Estimates
    
    Here we should reject as <0.05
        Rank 3 is not significant
    GRE has a Log Odds which has increased by 0.002
    GPA has a Log Odds which has increated by 0.804
    
    proc logistic data=MS3S30.BINARY plots=(roc);
    class RANK / param=glm;
    model ADMIT(event='1')=RANK GRE GPA / link=logit lackfit rsquare
    technique=fisher;
    contrast 'rank 2 vs 3' rank 0 1 -1/ estimate=parm;
    run;

Look at the contrast results and interpret the values.

    