import pandas as pd

c = b.groupby(['player_name','CLOSEST_DEFENDER'])
e = c['SHOT_RESULT'].sum()
aa = e.reset_index().groupby(['player_name']).max()
print(aa)