import sys
import pandas

test = pd.read_csv('test1.csv')
a = test.replace('made',0)
b = a.replace('missed',1)