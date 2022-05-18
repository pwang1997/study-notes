## [146. LRU Cache](https://leetcode.com/problems/lru-cache/)

---

> Design a data structure that follows the constraints of a Least Recently Used (LRU) cache. 
> Implement the LRUCache class:
>
> LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
> 
> int get(int key) Return the value of the key if the key exists, otherwise return -1.
>
> void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
> 
> The functions get and put must each run in O(1) average time complexity.

#### Solution

```java
class LRUCache {

    class Node {
        Node prev;
        Node next;
        int key, val;

        Node() {
        }

        Node(int key, int val) {
            this.key = key;
            this.val = val;
        }

    }

    void move2head(Node node) {
        removenode(node);
        addnode(node);
    }

    void addNode(Node node) {
        node.prev = head;
        node.next = head.next;
        head.next.prev = node;
        head.next = node;
    }

    void removeNode(Node node) {
        Node prev = node.prev;
        Node next = node.next;
        prev.next = next;
        next.prev = prev;
    }

    Node popTail() {
        Node res = tail.prev;
        removenode(res);
        return res;
    }

    HashMap<Integer, Node> cache = new HashMap<>();
    Node head;
    Node tail;
    int cap;
    int size;

    public LRUCache(int capacity) {
        this.cap = capacity;
        this.size = 0;
        head = new Node();
        tail = new Node();
        head.next = tail;
        tail.prev = head;
    }

    public int get(int key) {
        Node node = cache.get(key);
        if (node == null) return -1;
        movetohead(node);
        return node.val;
    }

    public void put(int key, int val) {
        Node node = cache.get(key);
        if (node == null) {
            Node newNode = new Node(key, val);

            cache.put(key, newNode);
            addnode(newNode);
            size++;
            if (size > cap) {
                Node tail = poptail();
                cache.remove(tail.key);
                size--;
            }
        } else {
            node.val = val;
            movetohead(node);
        }
    }
}
```

