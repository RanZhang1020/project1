#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /project1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /project1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /project1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/test1.csv /project1/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../mapreduce-test-python/project1/mapper.py -mapper ../../mapreduce-test-python/project1/mapper.py \
-file ../../mapreduce-test-python/project1/reducer.py -reducer ../../mapreduce-test-python/project1/reducer.py \
-input /project1/input/* -output /project1/output/
/usr/local/hadoop/bin/hdfs dfs -cat /project1/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /project1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /project1/output/
../../stop.sh
