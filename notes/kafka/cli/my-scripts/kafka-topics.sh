# creat topic
kafka-topics --bootstrap-server localhost:9092 --topic first_topic --create 

# create topic with 5 partitions
kafka-topics --bootstrap-server localhost:9092 --topic first_topic --create --partitions 5

# list topics
kafka-topics --bootstrap-server localhost:9092 --list

# 