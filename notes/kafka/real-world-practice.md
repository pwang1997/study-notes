### Choosing the Partitions Count
- Each partition can handle a throughput of a few MB/s 
- More partitions implies
  - Better parallelism, better throughput
  - Ability to run more consumers in a group to scale
  - Ability to leverage more brokers if having a large cluster
  - More elections to perfrom for Zookeeper
  - More files opened on Kafka
- Guidelines:
  - Partitions per topic
    - Small cluster(<6 brokers): 3 x #brokers
    - Large cluster(>12 brokers): 2 x #brokers
    - Adjust for number of consumers needed to run in parallel at peak throughput
    - Adjust for producer throughput

### Choosing the Replication Factor
- Should be at least 2, usually 3, maximum 4.
- The higher the RF:
  - Better durability of the system
  - Better availability of the system(N-min.insync.replicas if producer acks=all)
  - More replication means higher latency
  - More disk space on the system
- Guidelines:
  - Set it to 3 to get started
  - If replication performance is an issue, get a better broker instead of less RF.

### Cluster Guidelines
- Total number of partitions in the cluster:
  - Kafka with Zookeeper: max 200,000 partitions
  - Kafka with KRaft: potentially millions of partitions

### Topic Naming Conventions
- use snake_case
- <message type>.<dataset name>.<data name>.<data format>
- Message Type:
  - logging: For logging data
  - queuing: For classical queuing use cases
  - tracking: For tracking events such as user clicks, page views, ad views
  - etl/db: For ETL and CDC use cases sucha s database feeds
  - streaming: For intermediate topics created by stream processing pipelines
  - push: For data that's being pushed from offline environment into online environments
  - user: For user-specific data such as scratch and test topics
- data format:
  - .avro
  - .json
  - .text
  - .protobuf
  - .csv
  - .log