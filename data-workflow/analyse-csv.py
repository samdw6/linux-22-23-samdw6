import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import glob


list_of_files = glob.glob('csv-data/*.csv')
latest_file = max(list_of_files, key=os.path.getctime)

# Read the CSV file
cwd = os.getcwd()
print(cwd)
#file='csv-data/${ls csv-data -rt | tail -n1}'
data= pd.read_csv(latest_file)
print(data)
  
df = pd.DataFrame(data, columns=['name', 'freecapacity','totalcapacity','occupation','categorie'])
print(df)



x=df['name']
y=df['freecapacity']
z=df['totalcapacity']
a=df['occupation']
b=df['categorie']

# plot bar chart for free capacity per parking
""" plt.title("Free capacity per parking")
plt.xlabel('free capacity')
plt.ylabel('parking')
data1= x.to_numpy()
data2= y.to_numpy()
plt.xticks(range(len(data2)), data2)
plt.bar(range(len(data2)), data1)
plt.show() """

plt.rcdefaults()
fig, ax = plt.subplots()
data1= x.to_numpy()
data2= y.to_numpy()
y_pos = np.arange(len(data1))

error = np.random.rand(len(data1))

ax.barh(y_pos, data2, xerr=error, align='center')
ax.set_yticks(y_pos, labels=data1)
ax.invert_yaxis()  # labels read top-to-bottom
ax.set_xlabel('free capacity')
ax.set_title('Free capacity per parking')
plt.savefig('graphs/free_capacity_per_parking.png')








# plot bar chart for total capacity divided by free capacity per parking
data1= x.to_numpy()
data2= y.to_numpy()
data3= z.to_numpy()

x=np.arange(len(data1))
width=0.4

fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, data2, width, label='free capacity')
rects2 = ax.bar(x + width/2, data3, width, label='total capacity')

ax.set_ylabel('capacity')
ax.set_title('Free capacity and total capacity per parking')
ax.set_xlabel('parking name')
ax.set_xticks(x, data1)
ax.legend()

ax.bar_label(rects1, padding=3)
ax.bar_label(rects2, padding=3)

fig.tight_layout()

plt.savefig('graphs/total_and_free_capacity_per_parking.png')

# plot pie chart for categorie
sizes = [70,30]
labels= ['in lez', 'buiten lez']

fig1, ax1 = plt.subplots()
ax1.pie(sizes, labels=labels, autopct='%1.1f%%',
        shadow=True, startangle=90)
ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

plt.savefig('graphs/categorie_piechart.png')



