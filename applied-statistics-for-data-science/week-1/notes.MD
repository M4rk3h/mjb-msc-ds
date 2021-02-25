## Week-1 Notes

When first exploring the data, it is best to get a summary of the data for a more indepth analysis. This will outline a range of statistics about the data.

This could be:
### Sample size 
- This is the number of observations in the data.

### Mean 
- The mean (arithmetic) is the sum of the response divided by the number of observations (this is commonly referred to as the average).

### Median 
- This is the middle value in the data when ranked in ascending
order.

### Mode 
- The mode is the most common (frequent value), and can be seen
as a peak on a histogram.

### Interquartile range 
- This is the difference between the upper and lower quartiles. If we divide the ascending data into two separate groups (high and low) and calculate the median of both of these groups, we find that Median (high )– Median (low) = Interquartile Range.

### Variance 
- This provides a measure of the dispersion of the data around the mean. It is the average of the sum of the squared distances from
the mean.

### Standard Deviation 
- This is the square root of the variance.

### Coefficient of variation 
-  This is generally expressed as a percentage, it is equal to:
$$ Standard Deviation / Mean (* 100 for \% ) $$
- The use of the coefficient of variation lies partly in the fact that
the mean and standard deviation tend to change together in many
experiments. A knowledge of relative variation is valuable in
evaluating experiments. The smaller this quantity is, the less
variation there is in the data.

### Correlation 
- The correlation coefficient (r) measures the strength of association between two variables. A correlation coefficient near to 1 implies a strong positive relationship, near 0 implies the variables are independent and near –1 implies a negative relationship.
See Figures (a) – (d) below for examples.

### Skewness 
- This is the degree of asymmetry of a distribution. Negative values for the skewness indicate data that are skewed left and positive
values for the skewness indicate data that are skewed right. By skewed left, we mean that the left tail is heavier than the right tail. Similarly, skewed right means that the right tail is heavier than the left tail.

### Kurtosis 
- This represents the degree of peakdness of the data. In SAS a normal distribution has a kurtosis of 0. A distribution with a high peak (value > 0) is called leptokurtic, a flat-topped curve is called (value < 0) platykurtic and the normal distribution (value = 0) mesokurtik.

#### Task 1
- When exploring the summary of the data by cost and mileage against the region, here we can see a few more things which stand out.

- There aren't an equal amount of observations per group, which could be throw off some of this analysis.

Exploring the annual_mileage against the region (region x, mileage y) we can see from this dataset that region 3 has the highest mileage out of the 6 regions, but also has the most outliers and the dataset is skewed.

    With region 0 having the highest mileage mean, mileage min but not the highest mileage max. This could be due to more people commuting for work weekly, and the region is a bit further from work places or industry.
    Region 1 seems to have the third highest mean, 3rd lowest min and the second lowest max.
    Region 2 seems to be a well balanced region with their mean, min and max all being within a middle ground.
    Region 3 has a pretty decent mean, min and has the highest Max. This could mean a few people are driving a lot further for work, or just enjoy driving a lot more.
    Region 4 has the last but one lowest mean, which is pretty good, with a min of an amazing 0 (Outliers again?) and a middle Max value.
    Region 5 has the lowest mean, a decent min of 8111 and the lowest Max at 31310. This could be a region which is a lot closer to industry and work places, or they just don't drive as much.



- Do you have any thoughts on how you could address the outliers in the data? 

Age Outlier

	There are 4 people who put their gender as '2' whilst everyone else is 0 or 1, this could be an other option or prefer not to say.

Annual_mileage

	For BMW there are a few outliers for the mileage, upon further inspection there is 1 person which has put a 0 (24 times) for mileage and has the same hh_id which could assume that he added multiple entries.

- Do you think you could look to aggregate regions with similar profiles?

- Next steps would be to pose some hypothesis for further exploration.