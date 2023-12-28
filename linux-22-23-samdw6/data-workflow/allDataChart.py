import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import os
import glob
import datetime
  
# use glob to get all the csv files 
# in the folder

path = 'csv-data/'
csv_files = glob.glob(os.path.join(path, "*.csv"))
  

# Create an empy dataframe
df = pd.DataFrame()
# loop over the list of csv files
for f in csv_files:
    # read the csv file
    df_read = pd.read_csv(f)
    # print the location and filename
    head, tail = os.path.split(f)
    cols = len(df_read.axes[0])
    # Extract the date from the filename (day,month,year)
    rawname = tail
    filename = rawname.split(".")[0] #drop the .csv
    name = filename.split("_")[1]    #provided there's no underscore in the name part of the filename
    year = name.split("-")[0]
    month = name.split("-")[1]
    day = name.split("-")[2]
    datestring = (day,month,year) # temp string to store a the tuple in the required order 
    date = "/".join(datestring)   #as shown above
    # Extract the time from the fileame (hour,minut,seconds)
    time1 = name.split("-")[3]
    #hours = time1.split(":")[0]
    #minutes = time1.split(":")[1]
    #seconds = time1.split(":")[2]
    # Add columns for data (day,month,year) and time (hours,minutes,seconds)
    listOfDate = [date for i in range(cols)]
    listOfTime = [time1 for i in range(cols)]
    listOfTimes = [name for i in range(cols)]
    df_read['Date'] = listOfDate
    df_read['Time'] = listOfTime
    df_read['Times'] = listOfTimes
    df = pd.concat([df, df_read], axis=0,ignore_index=True)



df['Times'] = pd.to_datetime( df['Times'] ,format='%Y-%m-%d-%H:%M:%S')
data_labels = df['Times'].unique()
data = pd.DataFrame(df, columns=['name', 'freecapacity','occupation','Times'])
print(data)

# plot for each parking a bar chart of the occupation per Date/Time
data2plot = data[ data['name'] == 'Sint-Michiels']
print(data2plot)
columns2 = data2plot['freecapacity'] 
columns1 = data2plot['occupation']
rows = data2plot['Times']
print(rows)
n_rows = len(rows)
data1= rows.to_numpy()
data2= columns1.to_numpy()
data3= columns2.to_numpy()
x = np.arange(len(data1))
width = 0.4

fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, data2, width, label='free capacity')
rects2 = ax.bar(x + width/2, data3, width, label='occupation')
ax.set_ylabel('capacity')
ax.set_title('Free capacity and Occupation per parking')
ax.set_xlabel('Sint-Michiels parking')
ax.set_xticks(x, data1)
ax.legend()
ax.bar_label(rects1, padding=3)
ax.bar_label(rects2, padding=3)
fig.tight_layout()
plt.savefig('graphs/freecapacity_occupation.png')


## Plotting a horizontal bar chart for occupation and free capacity per parking per date/time
columns2 = data2plot['freecapacity'] 
columns1 = data2plot['occupation']
rows = data2plot['Times']
print(rows)
n_rows = len(rows)
rows.to_list()
y_pos = np.arange(len(rows))
error = np.random.rand(len(rows))
fig, ax = plt.subplots()
hbars = ax.barh(y_pos, columns1, xerr=error, align='center')
ax.set_yticks(y_pos, labels=rows)
ax.invert_yaxis()  # labels read top-to-bottom
ax.set_xlabel('Occupation')
ax.set_title('Occupation per data/time')
# Label with specially formatted floats
ax.bar_label(hbars, fmt='%.2f')
#ax.set_xlim(right=15)  # adjust xlim to fit labels
plt.savefig('graphs/Hor_bars_occupation_Sint-Michiels.png')
