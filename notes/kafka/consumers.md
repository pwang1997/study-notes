## Kafka Consumers

- Consumers read data from a topic(identified by name) - **pull model**
- Consumers automatically know which broker to read from.
- In case of broker failures, consumers know how to recover.
- Data is read in order from low to high offset **within each partitions**.

### Consumer Deserializer

- Deserialize binary key/value to Object.
- Common Deserializers
  + String(incl. JSON)
  + Int, Float
  + [Avro](https://avro.apache.org/docs/#schemas)
  + [Protobuf](https://protobuf.dev/)
- The serialization/ deserialization type must not change during a topic lifecycle.

## Kafka Consumer Groups

- All the consumers in an application read data as a consumer group.
- Each consumer within a group read from exclusive partitions.

### Multiple Consumers on one topic
- In Apache Kafka, it's acceptable to have multiple consumer groups on the same topic.
- To create distinct consumer groups, use the consumer property **group.id**

### Consumer Offsets
- Kafka stores the offsets at which a consumer group has been reading.
- The offsets commited are in Kafka topic named **__consumer_offsets**.
- When a consumer in a group has processed dat recevied from Kafka, it should be **periodically** committing the offsets(the Kafka broker will write to __consumer_offsets, not the group itsetlf)
- If a consumer dies, it will be able to read back from where it left off based on the last committed consumer offsets.

### Delivery semantics for consumers
- By default, Java Consumers will automatically commit offsets(at least once).
- There are 3 delivery semantics if you choose to commit manually.
- At least once(usually preferred)
  - Offsets are commited after the message if processed.
  - If the processing goes wrong, the message will be read again.
  - This can result in duplicate processing of messages. Make sure processing is idempotent.
- At most once
  - Offsets are commited as soon as messages are recevied.
  - If the processing goes wrong, some messages will be lost.
- Exactly once
  - For Kafka => Kafka workflow: use the Transcational API(easy with Kafka Streams API)
  - For Kafka => External System workflows: use an idempotent consumer