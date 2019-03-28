#!/usr/bin/env python
import sys
for line in sys.stdin:
    data = line.strip().split(',')
    if data[3] == 'missed':
      data[3] = '1'
      print(line[4]+',  '+line[5]+' '+line[6])
    elif data[3] == 'made':
      data[3] = '0'
      print(line[4]+',  '+line[5]+' '+line[6])
