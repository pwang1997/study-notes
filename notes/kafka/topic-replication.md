## Topic Replication Factor
- Topics should have a replication factor > 1(usually between 2 and 3)
- If a broker is down, another broker can serve the data

### Concept of Leader for a Partition
- At any time, only one broker can be a leader for a given partition.
- Producers can only send data to the broker that is the leader of a partition.
- The other brokers will replicate the data.
- Therefore, each partition has one leader and multiple ISR(in-sync replica)

#### Default Producer & Consumer Behaviour with Leaders
- Kafka producers can only write to the leader broker for a partition.
- Kafka consumers by default will read from the leader broker for a partition.
  
#### Kafka Consumers Replica Fetching(Kafka v2.4+)
- Since Kafka 2.4, it's possible to configure consumers to read from the closest replica.
- This may help improve latency, and also decrease network costs if using the cloud.
