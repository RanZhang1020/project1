#!/usr/bin/env python
import sys
import string
import pandas as pd

##df = pd.read_csv(sys.stdin)
##nba = df.replace(['made','missed'],[0,1])
for line in sys.stdin:
    data = line.strip().split(',')
    if data[3] == 'missed':
      data[3] = '1'
      print(line[4]+',  '+line[5]+' '+line[6])
    elif data[3] == 'made':
      data[3] = '0'
      print(line[4]+',  '+line[5]+' '+line[6])
