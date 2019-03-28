#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /nba/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /nba/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /nba/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-python/nba/test1.csv /nba/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../mapreduce-test-python/nba/mapper_1.py -mapper ../../mapreduce-test-python/nba/mapper_1.py \
-file ../../mapreduce-test-python/nba/reducer_1.py -reducer ../../mapreduce-test-python/nba/reducer_1.py \
-input /nba/input/* -output /nba/output/
/usr/local/hadoop/bin/hdfs dfs -cat /nba/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /nba/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /nba/output/
../../stop.sh