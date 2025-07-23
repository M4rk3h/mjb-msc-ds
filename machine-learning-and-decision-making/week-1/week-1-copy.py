#!/usr/bin/env python
# coding: utf-8
#   START OF CODE
#import pandas
import pandas as pd
#read the housing dataset
housing = pd.read_csv (r'data/house.csv')
#get a look and feel of the dataframe, head?
housing.head()
#get a look and feel of the dataframe, info?
housing.info()

# total rows in the dataframe - 20640
# partially filled - total_bedrooms has missing values
# let's see what 'ocean_proximity' the object data type looks like 

# If editing data, always make changes to a copy.
housingCopy = housing.copy()
# look at ocean proximity
housingCopy['ocean_proximity'].value_counts()
#use the method describe() to see what some statistical summary about your dataframe
housingCopy.describe()

# **Count** - # of filled indices in the columns 
# **mean, max, min** - self explantory 
# **std** - standard deviation 
# **25%, 50%, 75%** - $1^{st}$ quartile, median and $3^{rd}$ quartile  

# another way to get an idea of what your data looks like is plotting 
# histograms for each column. This may not be feasible when you have high 
# dimensional data (too many columns) 

#import sys
#!{sys.executable} -m pip install matplotlib
import matplotlib as mpl
# get_ipython().run_line_magic('matplotlib', 'inline')

#draw histograms
housingCopy.hist(bins = 50, figsize=(20,15))
mpl.pyplot.show()

# What do you observe from the plots?
# **median_income** - cout it be $12? 
# the numbers roughly represent tens of thousands of dollars  
# **median_age** - is it possible that the maximum age be just around 50-55?
# **median_house_value** - can the prices be not higher than $500,000 
# both the values have been capped. This could seriously affect your learning 
# algorithm's training in real life prediction. 
# However, for now this is ok for the purpose of this lecture 
# **latitude &amp longitude** 
# they will not be fed as predictor to learning algorithm but could possibly 
# help us see the data density from geogrphic point of view
# **general observations**
# 1. there are different types of features (let's not forget ocean_proximity - 
# the categorical predictor)
# 2. numerical features have different scales which may affect the learning process 
# of the algorithm: either adversely, could be crucial for learning or may have no 
# impact at all.
# 3. these histograms are generally tail skewed, more values further to the left 
# of the median as compared to the right. Again, may or may not impact the learning 
# process for some algorithms

#plot the latitude and longitudes from the original dataframe
#play around with parameter alpha
housingCopy.plot(kind='scatter', x='longitude', y='latitude', alpha =0.2)
mpl.pyplot.show()
#try other parameters of method plot
housingCopy.plot(kind='scatter',x='longitude',y='latitude',alpha=0.4,
              s = housingCopy['population']/100, label='population',
              figsize=(20,15), 
              c = 'median_house_value',
              cmap = mpl.pyplot.get_cmap('jet'), colorbar=True)
mpl.pyplot.legend()
mpl.pyplot.show()

# any observations?
# 1. higher prices near the edges probably facing the ocean ?
# The houses closer to the ocean are more expensive.
# Missing values - bedrooms 
# let's move back to lecture and build some concepts!
# now that we are back let's check how many NA/missing values in 'total_bedrooms' are there

#count the total number of missing values in total_bedrooms columns
housingCopy['total_bedrooms'].isna().value_counts()

# Try : replace the missing values to some value (zero, mean, median, etc.) 
# note: make sure you try this on a copy of actual dataframe, rather than loosing the information from actual dataframe.
# hint for mean and median, use python's mean and median methods
housingCopy['total_bedrooms'].fillna(0,inplace = True)
housingCopy['total_bedrooms'].isna().value_counts()
housingCopy.info()

#now try imputing with median, mean
# dataCopy['total_bedrooms'].fillna(dataCopy['total_bedrooms'].mean(),inplace = True)
# print(dataCopy['total_bedrooms'])
median_tb = housing['total_bedrooms'].median()
mean_tb = housing['total_bedrooms'].mean()
print(median_tb)
print(mean_tb)

# another useful python supported imputation method is interpolate. You can try it in your own time.
# [url to documentation](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.interpolate.html#pandas.DataFrame.interpolate) 
# [url to examples](https://pandas.pydata.org/pandas-docs/stable/user_guide/missing_data.html)
# now let's use K-NN for missing value imputation 

# import KNN from fancyimpute
from fancyimpute import KNN
# make a copy of the original data frame, to try KNN imputation on it.
housing_imp = housing.copy()
#name it housing_imp
housing_imp.info()
# Create training dataset
# only get target variables
# x_housing_imp_train = housing_imp[housing_imp['total_bedrooms'].notnull()].drop(columns = ['total_bedrooms'])
# y_housing_imp_train = housing_imp[housing_imp['total_bedrooms'].notnull()]['total_bedrooms']

# Create testing dataset
#x_housing_imp_test = housing_imp[housing_imp['total_bedrooms'].null()].drop(columns = ['total_bedrooms'])
#y_housing_imp_test = housing_imp['total_bedrooms'].notnull()

# housing_imp = KNN(k=3).fit_transform(housing_imp)
# will have an error (need to convert string to float)
housing_imp['ocean_proximity'].unique()
# create a dictionary for each unique ocean proximity to a number (float)
proximity_mapping = {'ocean_proximity': {'INLAND' : 1, 'NEAR OCEAN': 2, 'NEAR BAY': 3, 'ISLAND':4, '<1H OCEAN':5}}
proximity_mapping.items()
# Use the new numbers instead of the strings
housing_imp.replace(proximity_mapping, inplace = True)
housing_imp.head()

#try with 3 neighbours first
#   This is where the kernel dies.
# housing_imp = KNN(k=3).fit_transform(housing_imp)

# perhaps this implementation of KNN does not take in to account string values. 
# look at the last line of error  could not convert string to float: **NEAR BAY** 
# We need to come up with a strategy! Let's see how many columns are string. Remember Strings are called object in native python.    
# If we scroll back in our notebook we can see that there is only one object type column, a spointed out by the error as well, i.e.  **ocean_proximity** 

# 1. let's see how many distinct categories this variable has:
housing_imp['ocean_proximity'].unique()

# 2. We need to come up with a mapping from  categorical to numerical value
proximity_mapping = {'ocean_proximity': {'INLAND': 1, 'NEAR OCEAN': 2, 'NEAR BAY': 3, 'ISLAND': 4, '<1H OCEAN':5}}
proximity_mapping.items()


# There is another way of handling categorical data in pandas
# converting the categorical datatype from object to pandas **_categorical_** data type.
# now that you have developed an understanding on why do we need to convert categorical variables to numbers and how to do it. It would be good to have a look and go through the following webpage which describes pandas's categorical data type and what goes on in the backend. The following webpage also shows some usecases and you may be able to infer that why doesn't it make any difference thatw e are not using pandas categorical dataype, instead simply mapping the categories to numbers. [url to pandas categorical datatype documentation](https://pandas.pydata.org/pandas-docs/stable/user_guide/categorical.html) 
# Note: if we were to change the datatype, the action is of changing datatype of a variable is called typecasting. It is performed by using .astype() method on the variable
# Example: `housing_imp['ocean_proximity'].astype('category')`

# housing_imp.replace(proximity_mapping, inplace = True)
# housing_imp.head()

# compare with actual dataframe . just by using the head method . also helps make sure nothing is overwritten


# Since we made some changes to a copy of the original dataset while demonstrating other methods , let's just make sure that we haven't over written the original dataset.

# check housing_imp with info method before calling KNN to make sure everything is as it is meant to be

# housing_imp = KNN(k=3).fit_transform(housing_imp)

# housing_imp.info()


# the fancy_impute package, returns an n-dimesional numpy array after imputing 
# we need to convert the nd array to pandas dataframe
# housing_imp = pd.DataFrame(housing_imp, index = myData.index, columns = myData.columns)
housing_imp.info()


# Now that all rows have been imputed, let's see what the data looks like now, and compare it to when there were missing values
# myData.describe()
# housing_imp.describe()


# Note: compare the values **Count**, **mean**, and **std** 
# The overall look and feel of the dataset remained the same 
# unfortunately we do not have a copy of the original dataset, where no values where was deliberately taken off to create missing values. Otherwise we could have compared KNN imputer's accuracy by comparing the actual values and imputed values

# Data Transformation 
# Handling Skewness 

housing_imp['population'].hist(bins=50, figsize=(20,15))
mpl.pyplot.show()

housing_imp['population'].describe()

import numpy as np
(np.log10(housing_imp['population'])).describe()

(np.log10(myData['population'])).hist(bins=50, figsize=(20,15))

# Transforming using base 10 log has pretty much resolved the skew. But this may not be the case every time. So let's learn applying advanced transformation methods as discussed earlier. 

# let's go back to lecture to see what other methods can be applied
# copy column population as population_tf from the latest imputed dataframe

# now import stats from scipy

# population_tf, lambda_ = stats.boxcox(population_tf)

# print(lambda_)

# compare the boxcox transformed with original from the lates imputed dataframe
# population_tf = pd.Series(population_tf)
# population_tf.describe()

# housing_imp['population'].describe()

# now plot the transformed population column with a histogram

# fig, axes = mpl.pyplot.subplots(nrows = 2, ncols = 2, figsize = (10,10))

# ax0,ax1,ax2,ax3 = axes.flatten()

# ax0.hist (housing_imp['population'], bins=50)
# ax0.set_title('population')
# ax1.hist (np.log10(housing_imp['population']), bins = 50)
# ax1.set_title('log10 population')
# ax2.hist(population_tf, bins = 50)
# ax2.set_title('BoxCox population')
# ax3.set_visible(False)

# mpl.pyplot.show()
# Scaling  

# from sklearn.preprocessing import StandardScaler as ss
# housing.columns

# # ex = housing_imp[['housing_median_age', 'total_rooms',
#        'total_bedrooms', 'population', 'households', 'median_income',
#        'median_house_value']].copy()
# ex.head()
# ex = ss().fit_transform(ex)

# #ex = pd.DataFrame(ex, index = housing.index, 
#                       columns = ['housing_median_age', 'total_rooms',
#                                 'total_bedrooms', 'population', 
#                                 'households', 'median_income',
#                                 'median_house_value'])
# ex.head()

# Feature Engineering  
# Categorical Variables and One Hot Encoding  

#use the method called dummy, before using it you can search python manual online, 
#or use python function called help

#help(name of the method)
#compare the newly created columns with original dataframe's categories for ocean proximity

#you can use value_counts() method

# ###  Feature Reduction 
#  Now let's try PCA in python to reduce features 

# import pca from sklearn.decomposition

# # make an instance of the model
# pca = PCA(n_components = .95)

#  0.95 means that scikit-learn choose the minimum number of principal components such that 95% of the variance is retained 
# You can instead tell PCA how many PCs you want as follows 
# `pca = PCA(n_components = 2)`

# ex_pca = pca.fit_transform(ex)
# ex_pca

# pca.n_components_

# now convert the PCA array to pandas data frame
# ex_pca = pd.DataFrame(ex_pca, columns = ['PC1','PC2','PC3','PC4'])
# ex_pca.head()

# pca.explained_variance_ratio_

# corr = ex.loc[: , ex.columns != 'median_house_value'].corr()
# corr

# import seaborn as sns

# cor_mat = sns.heatmap(
#     corr,
#   center = 0,
#     cmap = sns.diverging_palette(20,220, n = 10),
#     square = True,
#     linewidths = 0.5
# )

#  Some predictors are strongly correlated. Wonder what the reason could be? 
#  
#     1. total_rooms & total_bedrooms, 
#     2. total_rooms & population,
#     3. total_rooms & households
