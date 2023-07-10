## Producer Acknowledgements
- Producers can choose to receive acks of data writes:
  - acks=0: Producers won't wait for acknowledgements(possible data loss)
  - acks=1: Producers will wait for **leader** acknowledgement(limited data loss)
  - acks=all: Leader + replicas acknowledgement(no data loss)

### Topic Durability
- For a topic replication factor of 3, topic data durability can withstand 2 brokers loss.
- As a rule, for a replication factor of N, you can permanently lose up to N-1 brokers and still recover your data.

### Kafka Topic Availability
- acks=all, min.insync.replicas=2 is the most popular options for data durability and availability to withstand at most the loss of one Kafka broker(RF=3).