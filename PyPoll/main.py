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

print(voter_count)

print("___________________________________")

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
print(unique_list)

print("___________________________________")