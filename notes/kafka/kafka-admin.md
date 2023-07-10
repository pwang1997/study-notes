## Kafka Monitoring and Operations
- Kafka exposes metrics through JMX.
- Common places to host the Kafka metrics:
  - ELK
  - Datadog
  - NewRelic
  - Confluent Control Centre
  - Promotheus
- Importance metrics:
  - Under Replicated Partitions: Number of partitions are have problems with the ISR. May indicate a high load on the system.
  - Request Handlers: Utilization of threads for IO, network, etc..
  - Request timing

- Kafka Operations team must be able to perform the following tasks:
  - Rolling Restart of Brokers
  - Updating Config
  - Rebalancing Partitions
  - Increasing RF
  - Adding/ removing/ replacing a Broker
  - Upgrading a Kafka Cluster with zero downtime