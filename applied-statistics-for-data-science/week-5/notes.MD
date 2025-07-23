# Looking at Correlation Analysis
Variables must be continious.

Simple Linear Regression is plotting a line through the data, when doing this we will want to look at the r-squared and the p-value.

By doing a Multiple Regression, we are adding a slope to the data, this is done by adding additional dimensions (data) which is added to our equation.

R(2) needs to be adjusted to compensate for the additional data.
Then we calculate the F and the p-value,
sums around the fit, 
then the sum around the fit (fit is the parameters in the equation)

After doing so, can compare Multiple regression to the simple regression.

## Tutorial 1
### EX1-Concrete
Using the concrete data discussed in lecture this week, determine if a relationship exists between the measured strength of concrete by operator 1 and operator 2.

H0: There is no significant relationship between the two different strengths.
H1: There is a significant relationship between the two different strengths.

    Start by doing a correlation analysis and analyse, Strength1 & Strength2. 
    Seeing as the scores are ranked, this would be a nonparametric correlation analysis using the Spearman's model.
    Here we are given 2 values:
    Pearson: Prob > |r| under H0: Rho=0
    Rho = 0.9931 with a p-value of <.0001
    If we were to use this model, we would need to check for normality.
    Spearman: Prob > |r| under H0: Rho=0
    Rho = 0.9918 with a p-value of <.0001
    
By looking at the Spearman for Strength, there is a value of 0.99 with a p-valie of <.0001. This shows that there is a relationship and it is really strong.

Therefor we would reject the null hypothesis.
    
### EX2-Aprraisal
A property appraiser wants to model the value on the market (£’s) of a property in a rural area. 
He is of the opinion that this can be modeled efficiently by using three key variables, namely:

- Land Value: appraised land value (£’s);
- Improvement Value: appraised value of improvement made to the property (£’s);
- Property Area: area of the property (square feet).

Do you recommend that the property appraiser would be wise to use such a model?

#### Step 1
For this we need to run a correlation analysis with 3 variables, against the property value. Correlation analysis doesn't show too much so we will carry out a Linear regression.

First we will need to see if the data is normally distributed.

    H0: There is no difference between the distribution of the variable and that of the normal distribution.
    H1: there is a difference between the distribution of the variable and that of the normal distribution.

After carrying out a distibution analysis and checking for normality, the results were as follows:

    PropertyValue:      >0.150
    LandValue:          <0.010
    ImprovementValue:   >0.150
    PropertyValue:      >0.150

From looking at the results from the normality test, we can see that they're not significant (Maybe?) at a 5% level other than LandValue. (Not less than 0.05)

#### Step 2
After carrying on the normality test, the next step is to look at the Correlation analysis. 

    H0: There is no linear relationship between the variables.
    H1: There is a linear relationship between the variables.

After doing a Correlation analysis for LandValue, ImprovementValue, PropertyArea against PropertyValue, we get a p-value as follows:

Pearson
    PropertyValue - LandValue           : 0.789
    PropertyValue - ImprovementValue    : 0.915
    PropertyValue - PropertyArea        : 0.734

Spearman
    PropertyValue - LandValue           : 0.661
    PropertyValue - ImprovementValue    : 0.738
    PropertyValue - PropertyArea        : 0.691

The Pearson & Spearman results show that there is a strong positive assosiation between all 3 of the variables and PropertyValue.

The strongest correlation is PropertyValue and ImprovementValue and the weakest is PropertyValue and PropertyArea.

#### Step 3
After seeing the correlation between all variables with two different types of models (Pearson & Spearman), the next step will be to look at the Linear Regression Analysis to interpret the results.

    To do this in SAS, go to Linear Regression, adding the dependant variable (PropertyValue) and add the other 3 variables within the continuous variable. 

    Next, go to Model and click Edit Model Effect, add all 3 variables and click okay at the bottom.

    Go to options and see the Colinearity and select Tolerance values for estimates. (Try to see if there is correlation between variables.)

Here we get a lot of information around these 4 variables, but the main things to take away is Analysis of Variance. Here we have a p-value of <.0001, this means we would reject the null hypothesis at the 5% level. This shows that we can accept a linear regression for this data, but we need to check all assumptions.

#### Step 4
We will need to check a few assumptions, these can be done by looking at the tolerance, the Durbin-Watson d-value and the residuals.

##### Tolerance

    First lets look at the Tolerance between all variables, if the tolereance is greater than 0.2 then the variables are independent. Our tolerance between all variables are:

    LandValue:          0.457
    ImprovementValue:   0.354
    PropertyArea:       0.495

    All of these variables are > 0.2 which we means we can assume they are independent. 

##### Durbin-Watson 
Next will be to check the independence of error for the dataset.

    This can be done by going back to our Code/Results, editing the code and adding a 'dw' after 'tol'. After running the code again we will get the same results but with a Model 1 Durbin-Watson.

    The rule of thumb for Durbin-Watson is: if 1 < D < 3 with our DW d-value being 1.417. This allows us to move on to looking at the plots/residuals and trying to interpret them.

    Look for the RStudent to see if the dots are around 0 and between 2 and -2 (with randomness.) Which looks to be fine with 2 falling above 2 and below -2.

    Check the Quantiles to make sure most of the entries are close to the line, and check to see if the residuals are around the line and are random too.

#### Step 5
Create an output dataset in work, to see the residuals, this can be done by going back to the Settings and clicking OUTPUT.
Here we want to select the output folder/file (This can be output) and enable Residuals - Studentized Residuals.

Run this to get a new worksheet under work, and here there will be 5 new columns, LCLM, UCLM, Student etc.

Now with this new worksheet, we will need to check the new columns for normality again.

    PropertyValue:      >0.150
    LandValue:          <0.010
    ImprovementValue:   >0.150
    PropertyValue:      >0.150
    Student:            0.107

With all of these variables being greater than 0.05 (except for LandValue) we can say that the rest of these variables are normally distributed. 

Now that we know our residuals are normally distrbuted, we can check the rest of the outputs from the linear regression.  

Looking at the R-Square this value is 0.880 (we want it close to 1), with Adj R-Sq having a value of 0.858 (we want it close to R-Square). Both of these numbers are pretty close, so we can assume this is fine.

    H0: a + B1x1 + B2X2 + B3X3+ … + Bkxk + E
    H1: At least one of the B parameters in H0 is nonzero

Parameter Estimates shows the different Beta values (B), here the results are as follows:

    Intercept:          5938.22
    LandValue:          1.001
    ImprovementValue:   0.944
    PropertyValue:      6.098
    
With the Beta p-values ( Pr > |t| ):

    Intercept:          0.289
    LandValue:          0.080
    ImprovementValue:   0.0004
    PropertyValue:      0.251

Here we can see that the highest is the intercept, followed by the PropertyValue, with ImprovementValue having a very small p-value. With all of them being greater than 0.05 (except ImprovementValue again), we don't have enough evidence to reject the null hypothesis.

This looks like the only significant variable here is the ImprovementValue, at a high 1% level. 

##### ImprovementValue
Now we can remove the non-significant variables and see if the model and it's assumptions have improved.

    ods noproctitle;
    ods graphics / imagemap=on;

    proc reg data=DATA.'APPRAISAL(2)'n alpha=0.05 plots(only)=(diagnostics 
            residuals observedbypredicted);
        model PropertyValue=ImprovementValue / tol dw;
        output out=MARK1.'2.5.5Normal'n student=student_;
        run;
    quit;

After getting the results, we can look at the residuals again in the many plots. The RStudent residuals are looking pretty much the same, with most values being within -2 to 2.

Alot of the residual Quantiles look normal along the blue line, which is good. 

The DW has a value of 2.060 (which needs to be between 1 & 3) so this looks fine really.

The Parameter Estimates has a tolerance of 1 which seems good.

Analysis of Variance p-value again, this value is <0.0001. With this single variable having such a low p-value (Less than 0.05) we must reject the null hypothesis.
    (H0: Beta is equal to 0)
    
The R-Square has decreased, which is expected, with a R-Square value of 0.838 and an Adj R-Sq of 0.829.

The p-value for the Parameter Estimates ( Pr > |t| )is <.0001 which is significant at the 5% level.

Now we need to remove the intercept.
##### Normal-No-Int

    ods noproctitle;
    ods graphics / imagemap=on;

    proc reg data=DATA.'APPRAISAL(2)'n alpha=0.05 plots(only)=(diagnostics 
            residuals fitplot observedbypredicted);
        model PropertyValue=ImprovementValue / noint tol dw;
        output out=MARK1.'2.5.5NoINT'n student=student_;
        run;
    quit;

Now that we have a new model, we need to go through all the assumptions again: 
    Check residuals look normal 
    Check Tolerance
    Check DW
    Check for normality

The residuals look pretty much the same, maybe a slight difference but nothing wildly different.

The Tolerance is at 1.000 again which is fine.

The Analysis of Variance has a low p-value again <.0001.
    We reject the null hypothesis of beta = 0

Durbin-Watson has a D-value of 2.064 which is fine.

The p-value for the Parameter Estimates ( Pr > |t| )is <.0001 which is significant at the 5% level.

With the Goodness of Fit having a p-value of 0.150 which shows that it is normally distributed. 

The R-Squared has increased but it is still fine and are close together. 
    R-Square 	0.9753
    Adj R-Sq 	0.9740

This would be my final model, which shows that the ImprovementValue has a beta of 1.565 with a SE of 0.057.

### EX3-Aprraisal
The weight of lumber is to be estimated from external measurements of a sample of pine trees. The variables used in the analysis were as follows:
    
    Weight: Weight of lumber from a tree (kg);
    Height: Height of the tree (in feet);
    Age: Age of the tree (in years).

Construct a linear model for Weight using the Height and Age variables. Is this model appropriate, is a transformation necessary?

#### Step 1
To look at this model, this would need to be explored with Multivariate Regression.

First we will need to see if the data is normally distributed.

    H0: There is no difference between the distribution of the variable and that of the normal distribution.
    H1: there is a difference between the distribution of the variable and that of the normal distribution.

After carrying out a distibution analysis and checking for normality, the results were as follows:

    Weight: <0.010
    Height: <0.010
    Age:    >0.150

From looking at the results from the normality test, we can see that two of them are significant at a 5% level, except for age.

#### Step 2
After carrying on the normality test, the next step is to look at the Correlation analysis. 

    H0: There is no linear relationship between the variables.
    H1: There is a linear relationship between the variables.

After doing a Correlation analysis for Weight against Height & Age, we get the following p-values:

Pearson
    Weight - Height:    0.977    
    Weight - Age:       0.451

Spearman
    Weight - Height:    0.979
    Weight - Age:       0.368

The Pearson & Spearman results show that there is a strong positive assosiation between Weight and Height, with weight and age having a weak positive association. 

#### Step 3
After seeing the correlation between all variables with two different types of models (Pearson & Spearman), the next step will be to look at the Linear Regression Analysis to interpret the results.

##### Analysis of Variance.
Here we have a p-value of <.0001, this means we would reject the null hypothesis at the 5% level. This shows that we can accept a linear regression for this data, but we need to check all assumptions.

#### Step 4
We will need to check a few assumptions, these can be done by looking at the tolerance, the Durbin-Watson d-value and the residuals.

##### Tolerance

    First lets look at the Tolerance between all variables, if the tolereance is greater than 0.2 then the variables are independent. Our tolerance between all variables are:

    Height: 0.858
    Age:    0.858

    All of these variables are > 0.2 which we means we can assume they are independent. 

##### Durbin-Watson 
Next will be to check the independence of error for the dataset.

    Our Durbin-Watson score is 1.765, seeing as this is between 1 and 3 this allows us to move onto the rest step.
    
    Look for the RStudent to see if the dots are around 0 and between 2 and -2 (with randomness.) Which looks to be fine with 1 above 2.

    Check the Quantiles to make sure most of the entries are close to the line, and check to see if the residuals are around the line and are random too.

#### Step 5 *heck*
Create an output dataset in work, to see the residuals, this can be done by going back to the Settings and clicking OUTPUT.
Here we want to select the output folder/file (This can be output) and enable Residuals - Studentized Residuals.

Run this to get a new worksheet under work, and here there will be 5 new columns, LCLM, UCLM, Student etc.

Now with this new worksheet, we will need to check the new columns for normality again.

    PropertyValue:      >0.150
    LandValue:          <0.010
    ImprovementValue:   >0.150
    PropertyValue:      >0.150
    Student:            0.107

With all of these variables being greater than 0.05 (except for LandValue) we can say that the rest of these variables are normally distributed. 

Now that we know our residuals are normally distrbuted, we can check the rest of the outputs from the linear regression.  

Looking at the R-Square this value is 0.880 (we want it close to 1), with Adj R-Sq having a value of 0.858 (we want it close to R-Square). Both of these numbers are pretty close, so we can assume this is fine.

    H0: a + B1x1 + B2X2 + B3X3+ … + Bkxk + E
    H1: At least one of the B parameters in H0 is nonzero

Parameter Estimates shows the different Beta values (B), here the results are as follows:

    Intercept:          5938.22
    LandValue:          1.001
    ImprovementValue:   0.944
    PropertyValue:      6.098
    
With the Beta p-values ( Pr > |t| ):

    Intercept:          0.289
    LandValue:          0.080
    ImprovementValue:   0.0004
    PropertyValue:      0.251

Here we can see that the highest is the intercept, followed by the PropertyValue, with ImprovementValue having a very small p-value. With all of them being greater than 0.05 (except ImprovementValue again), we don't have enough evidence to reject the null hypothesis.

This looks like the only significant variable here is the ImprovementValue, at a high 1% level. 

##### ImprovementValue
Now we can remove the non-significant variables and see if the model and it's assumptions have improved.

    ods noproctitle;
    ods graphics / imagemap=on;

    proc reg data=DATA.'APPRAISAL(2)'n alpha=0.05 plots(only)=(diagnostics 
            residuals observedbypredicted);
        model PropertyValue=ImprovementValue / tol dw;
        output out=MARK1.'2.5.5Normal'n student=student_;
        run;
    quit;

After getting the results, we can look at the residuals again in the many plots. The RStudent residuals are looking pretty much the same, with most values being within -2 to 2.

Alot of the residual Quantiles look normal along the blue line, which is good. 

The DW has a value of 2.060 (which needs to be between 1 & 3) so this looks fine really.

The Parameter Estimates has a tolerance of 1 which seems good.

Analysis of Variance p-value again, this value is <0.0001. With this single variable having such a low p-value (Less than 0.05) we must reject the null hypothesis.
    (H0: Beta is equal to 0)
    
The R-Square has decreased, which is expected, with a R-Square value of 0.838 and an Adj R-Sq of 0.829.

The p-value for the Parameter Estimates ( Pr > |t| )is <.0001 which is significant at the 5% level.

Now we need to remove the intercept.
##### Normal-No-Int

    ods noproctitle;
    ods graphics / imagemap=on;

    proc reg data=DATA.'APPRAISAL(2)'n alpha=0.05 plots(only)=(diagnostics 
            residuals fitplot observedbypredicted);
        model PropertyValue=ImprovementValue / noint tol dw;
        output out=MARK1.'2.5.5NoINT'n student=student_;
        run;
    quit;

Now that we have a new model, we need to go through all the assumptions again: 
    Check residuals look normal 
    Check Tolerance
    Check DW
    Check for normality

The residuals look pretty much the same, maybe a slight difference but nothing wildly different.

The Tolerance is at 1.000 again which is fine.

The Analysis of Variance has a low p-value again <.0001.
    We reject the null hypothesis of beta = 0

Durbin-Watson has a D-value of 2.064 which is fine.

The p-value for the Parameter Estimates ( Pr > |t| )is <.0001 which is significant at the 5% level.

With the Goodness of Fit having a p-value of 0.150 which shows that it is normally distributed. 

The R-Squared has increased but it is still fine and are close together. 
    R-Square 	0.9753
    Adj R-Sq 	0.9740

This would be my final model, which shows that the ImprovementValue has a beta of 1.565 with a SE of 0.057.