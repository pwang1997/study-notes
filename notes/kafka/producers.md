## Kafka Producers

- Producers write data to topics(which are made of partitions).
- Producers know to which partition to write to and which Kafka broker has it.
- In case of Kafka broker failures, producers will automatically recover.
- Each partition can receive messages from one or many producers.

### Message Keys

+ Producers can choose to send a key with the message(string, number, binary,etc)
+ if key = null, data is sent round robin.
+ if key != null, then all messags for that key will always go to the same partition(hashing)
+ A key is typically sent if message ordering for a specific field is required.

### Kafka Messages Anatomy
+ Key: binary, nullable
+ Value: binary, nullable
+ Compression Type: none, gzip, snappy, lz4, zstd
+ Header(optional):
  + Key-Value Pair
+ Partition + Offset
+ Timestamp(system or user set)

## Kafka Message Serializer
+ Only accepts bytes as an input from produers, and send bytes out as output to consumers.
+ **Message Serialization** means transforming objects/ data into bytes
+ Used on the value and key
+ Common Serializers
  + String(incl. JSON)
  + Int, Float
  + [Avro](https://avro.apache.org/docs/#schemas)
  + [Protobuf](https://protobuf.dev/)

## Kafka Message Key Hashing
A Kafka partitioner is a code logic that takes a record and determines which partition to send it into.

`
Record -> .send() -> Producer Partitioner logic -> Assign partition 1 -> Partition 1
`

Key Hashing is the process of determining the mapping of a key to a partition.(Default using **murmur2 algorithm**)