## Rebalancing

### Eager Rebalancing
- All consumers stop, give up their memberships to the partitions
- They rejoin the consumer group and get a new partition assignment
- During the short period of time, the entire consumer group stops processing
- Consumers don't necessary get back the same partitions as they used to

### Cooperative Rebalancing(Incremental Rebalancing)
- Reassign a small subset of the partitions from one consumer to another
- Other consuemrs don't receive reassignments proceed without interruptions
- Can go through several iterations to find a "stable" assignment
- Avoids "stop-the-world" events 

#### Kafka Consumer: partition.assignment.strategy
- Eager strategy: 
  - RangeAssignor: assign partitions on a per-topic basis
  - RoundRobin: assign partitions across all topics
  - StickyAssignor: balanced like RoundRobin, and minimizes partition movements when consumer join/leave the group.

- Cooperative strategy
  - CooperativeStickyAssignor: rebalance strategy is identical to StickyAssignor but supports cooperative rebalancing.
- The default assignor is [RangeAssignor, CooperatriveStickyAssignor]

#### Kafka Connect: already implemented and enabled by default
#### Kafka Streams: turned on by default using StreamPartitionAssignor

### Static Group Membership
- By default, when a consumer leaves a group, its partitions are revoked and re-assigned
- If it joins back later, it will have a new "member ID" and new partitions assigned
- If group.instance.id was specified, it makes the consumer a **static member**
- Upon leaving for **session.timeout.ms**, the consumer re-joins and can get its partitions back. Otherwise, it will trigger a rebalancing.
- Helpful when consumers maintain local state and cache(to avoid re-buildin the cache)