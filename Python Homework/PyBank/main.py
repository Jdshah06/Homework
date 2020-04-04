import os

import csv
data_csv= os.path.join('Resources','budget_data.csv')


with open(data_csv) as csvfile:
    csvreader= csv.reader(csvfile, delimiter= ",")
    next(csvreader)

    # lines= csvfile.readlines()
    # lines = [[row[0], int(row[1])]for lines in csvreader]
    rows= [[row[0], int(row[1])]for row in csvreader]

    # print(rows)

    # print(lines)

months = []

for row in rows:
    months.append(row[0])

    
Added_months= len(months)

# print(Added_months)

# print("___________________________________")
        
net_profit= []
for row in rows:
    net_profit.append(row[1])

Net_profit= sum(net_profit)

# print(Net_profit)

# print("___________________________________")



for row in rows:
    net_profit.append(row[1])

avg= sum(net_profit)/len(net_profit)

# print(avg)

# print("___________________________________")

for row in rows:
    net_profit.append(row[1])

largest_increase= max(net_profit)

# print(largest_increase)

# print("___________________________________")

for row in rows:
    net_profit.append(row[1])

largest_decrease= min(net_profit)

print(largest_decrease)

print("___________________________________")

print ("Financial Analysis")
print("-----------------------------------")
print("Total Months: " + str(Added_months))
print("Total $" + str(Net_profit))
print("Average Change $" + str(avg))
print ("Greatest Increase in Profits: $" + str(largest_increase))
print ("Greatest Decrease in Profits: $" + str(largest_decrease))