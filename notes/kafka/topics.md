## Kafka Topics

Topics are particular stream of data.
+ Each topic is identified by its name
+ Message format is vary
  
The sequence of messages is called a **data stream**

Kafka topics cannot be queried. Use Kafka Producers to send data and Kafka Consumers to read the data.

### Partitions and offsets

Topics are split in partitions.
+ Messages with each partition are ordered.
+ Each message within a partition gets an incremental id, called **offset**.

Notes:
+ Kafka topics are **immutable**. Once data is written to a partition, it cannot be changed.
+ Data is kept only for a limited time(default is one week - configurable)
+ Offset only have a meaning for a specific partition.
  + E.g. offset 3 in partition 0 does not represent the same data as offset 3 in partition 1
  + Offsets are not re-used even if previous messages have been deleted.
+ Order is guaranteed only within a partition(not across partitions)
+ Data is assigned randomly to a partition unless a key is provided.
+ Can have as many partitions per topic.
