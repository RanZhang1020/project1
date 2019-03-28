#!/usr/bin/env python
import sys
from operator import itemgetter

most_unwanted = {}
for line in sys.stdin :
  line = line.strip()
  closest_defender, shot_result = line.rsplit(' ',1)
  try:
    shot_result = int(shot_result)
    most_unwanted[closest_defender] = most_unwanted.get(closest_defender,0) + shot_result
  except ValueError:
    pass
sorted_unwanted_count = sorted(most_unwanted.items(),key=itemgetter(0))    

most_unwanted_defender={}
for i in range(len(sorted_unwanted_count)):
  player,defender=sorted_unwanted_count[i][0].rsplit(',  ',1)
  defender=":"+defender
  count=sorted_unwanted_count[i][1]
  if player not in most_unwanted_defender:
    most_unwanted_defender[player]=[]
    most_unwanted_defender[player].append((defender,count))
for i, b in most_unwanted_defender.items():
  most_unwanted_defender[i]=sorted(b,key=itemgetter(1),reverse=True)[0:1]
most_unwanted_defenders=sorted(most_unwanted_defender.items(),key=itemgetter(0))


for s,j in most_unwanted_defenders:
  for ss in j:
    print(s,ss[0])
