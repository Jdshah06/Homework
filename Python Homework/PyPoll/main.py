from collections import Counter

import os
import csv
election_csv= os.path.join('Resources', 'election_data.csv')


with open(election_csv) as csvfile:
    csvreader= csv.reader(csvfile, delimiter= ",")
    next(csvreader)
    rows= [[row[0], row[1], row[2]] for row in csvreader]
    print(csvreader)

# print(rows)

Voters= []

for row in rows:
    Voters.append(row[0])

voter_count= len(Voters)

# print(voter_count)

# print("___________________________________")

# candidate_list=[]
# for row in rows:
#     candidate_list.append(row[2])

# candidate_votes= {}
unique_list= []
for row in rows:

    if row[2] not in unique_list:
        unique_list.append(row[2])

#     candidate_votes[candidate_list]=0

# candidate_votes[candidate_list]= candidate_votes[candidate_list] +1
# print(unique_list)

# print("___________________________________")

candidate_count=[row[2] for row in rows]
candidate_count= Counter(candidate_count)
# print(candidate_count)

khan_count =candidate_count['Khan']
correy_count= candidate_count['Correy']
li_count= candidate_count['Li']
tooley_count= candidate_count["O'Tooley"]
winner_count= [khan_count,correy_count,li_count,tooley_count,]

# print(khan_count)
# print(correy_count)
# print(li_count)
# print(tooley_count)

# print("___________________________________")

khan_average= khan_count/voter_count * 100
# print("Khan Averages: "+ str(khan_average))

li_averages= li_count/voter_count * 100
# print("li averages: " + str(li_averages))

correy_averages= correy_count/voter_count * 100
# print("Correy averages: " + str(correy_averages))

tooley_averages= tooley_count/voter_count * 100
# print("tooley averages: " + str(tooley_averages))

# print("------------------------------------------")



print("Election Results")
print("------------------------------------------")
print("Total Votes: " + str(voter_count))
print("------------------------------------------")
print("Khan: " + str(format(khan_average, '.2f')) + "% (" +str(khan_count) + ")")
print("Correy: " + str(format(correy_averages, '.2f')) + "% (" +str(correy_count) + ")")
print("Li: " + str(format(li_averages, '.2f')) + "% (" +str(li_count) + ")")
print("O'Tooley: " + str(format(tooley_averages, '.2f')) + "% (" +str(tooley_count) + ")")
print("------------------------------------------")
print("Winner: Khan")
print("------------------------------------------")