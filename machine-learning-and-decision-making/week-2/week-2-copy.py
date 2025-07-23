# Start with importing pandas
import pandas as pd
# linear regression from sklear.linear_model
from sklearn.linear_model import LinearRegression
# get the housing data again
housing = pd.read_csv (r'data/house.csv')
# make a copy
housingC = housing[['housing_median_age', 'total_rooms', 'total_bedrooms', 
    'population', 'households', 'median_income',
    'median_house_value','ocean_proximity']].copy()
# print head to check
print(housingC.head())
housingC.info()
# fill misisng values with median
# check for missing values
print(housingC['total_bedrooms'].isna().value_counts())
# get the median of that col
median_tb = housing['total_bedrooms'].median()
# fill the na's with median
housingC['total_bedrooms'].fillna(median_tb,inplace = True)
# count na values again
print(housingC['total_bedrooms'].isna().value_counts())
print(housingC.info())

# create the mapping similar to last lecture
proximity_mapping = {'ocean_proximity': {'INLAND' : 1, 'NEAR OCEAN': 2, 'NEAR BAY': 3, 'ISLAND':4, '<1H OCEAN':5}}
# check the mapping dictionary
print(proximity_mapping.items())
# if it worked replace the strings with floats
housingC.replace(proximity_mapping, inplace = True)
# double check it worked. 
print(housingC.head())


from sklearn.preprocessing import StandardScaler as ss
temp = housingC[['housing_median_age', 'total_rooms',
       'total_bedrooms', 'population', 'households', 'median_income',
        'median_house_value']].copy()
# now fit the scaler.
temp = ss().fit_transform(temp)
# replace original features with scaled features
housingC[['housing_median_age', 'total_rooms',
       'total_bedrooms', 'population', 'households', 'median_income',
        'median_house_value']] = temp
# print t ocheck
print(housingC.info())

# houseC.summary()
# houseC.describe()
#create predictor variable dataframe
housing_pred = housingC.iloc[:,[0,1,2,3,4,5,7]]
housing_pred.head()
# create a target temp
housing_targ = housing_df.iloc[:[6]]


#Split the data set into training and test examples
# training data
# x_housing_imp_train = housing_imp[housing_imp['total_bedrooms'].notnull()].drop(columns = ['total_bedrooms'])
# y_housing_imp_train = housing_imp[housing_imp['total_bedrooms'].notnull()]['total_bedrooms']

# testing data
#x_housing_imp_test = housing_imp[housing_imp['total_bedrooms'].null()].drop(columns = ['total_bedrooms'])
#y_housing_imp_test = housing_imp['total_bedrooms'].notnull()


#Linear Regression
#Logistic regression - Binary classification
# import titatanic dataset as pandas dataframe
# .info()?

#The variable cabin has quite a high ratio of missing values
#whereas Variable Emabrked has only 2 missing values
#Age has around 20% values missing

#drop rows where Embarked has missing values
#see distribution of survival
#See who survived and did not w.r.t to their cabin class

#drop the column Cabin
#Impute the age column with mean age
 
#select the predictor + target variables
#you may not need some of the features as predictor
 
#map the character features to numeric

#create predictor dataframe and target array
#split data into train and test

#measure the performance of the classification model
#confusion matrix

# TP | FN
#_______
# FP | TN

#Accuracy = (TP+TN)/(TP+FP+FP+FN)

#Precision is the ratio of correctly predicted positive observations to the total predicted positive observations

#precision = TP/(TP+FP) 

#Recall is the ratio of correctly predicted positive observations to all the actual positive observations

#recall = TP/(TP+FN)

#Score is the weighted average of Precision and Recall. Therefore, this score takes both false positives and false negatives into account.
#accuracy can be largely contributed by a large number of True Negatives which in most business circumstances, we do not focus on much whereas False Negative and False Positive usually has business costs
#f1 = 2((precision * recall)/(precision + recall))
# from sklearn.metrics import confusion_matrix, accuracy_score, precision_score, recall_score, f1_score

#Decision Trees
#as expected it has overfit on training set
#the freedom of Decison tree needs to be restricted to overcome overfitting
#let's use the hyperpaprameters of the model to do that.
#max_depth - restricts the depth of the tree (only these many consecutive questions can be asked to assign class)
#let's see feature importance