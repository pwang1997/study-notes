## Kafka Brokers
- A Kafka cluster is composed of multiple brokers(servers)
- Each broker is identified with its ID(integer)
- Each broker contains certain topic partitions
- After connecting to any broker(also called boostrap broker), you will be connected to the entire cluster(Kafka clietns have smart mechanics for that)
- A good number to get started is 3 brokers, but some big clusters have over 100 brokers.

### Kafka Broker Discovery
- Every Kafka broker is also called a "boostrap server"
- That means you lonly need to connect to one broker, and the Kafka clients will know how to be connected to the entire cluster(smart clients)
- Each broker knowns about all brokers, topics and partitions(metadata).