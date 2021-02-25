import pandas as pd
import matplotlib.pyplot as plt
import folium
from folium import plugins
crime=pd.read_csv("Sep2020.csv")
crime.head()
crime.info()

crime1 = crime.iloc[:,[1,4,5,9]] # 4 & 5 are long lat
crime1.info()
crime1.head()
# remove NA's
crime1 = crime1[crime1['Longitude'].notna()] #remove na's
crime1 = crime1[crime1['Latitude'].notna()] # remove na's

count1 = dict(crime1["Crime type"].value_counts())
print(count1)

x = list(count1.keys())
y = list(count1.values())
plt.figure(figsize = (8, 6))
plt.barh(x,y)
plt.title(label = 'South Wales Crime September 2020')
plt.ylabel('Crime')
plt.xlabel('Frequency')
plt.show()

crime_area = list(zip(crime1.Latitude, crime1.Longitude))

def generateBaseMap(default_location=[51.8, -3.5], default_zoom_start=9):
    base_map = folium.Map(location=default_location, control_scale=True, zoom_start=default_zoom_start)
    heatmap = plugins.HeatMap(crime_area, radius=5, blur=2)
    base_map.add_child(heatmap)
    return base_map
    print('heck')

generateBaseMap()