```java
class SmallestInfiniteSet {
    int cur;
    PriorityQueue<Integer> pq = null;

    public SmallestInfiniteSet() {
        pq = new PriorityQueue<>();
        cur = 1;
    }

    public int popSmallest() {
        if (!pq.isEmpty()) {
            return pq.poll();
        }

        cur++;
        return cur - 1;
    }

    public void addBack(int num) {
        if (cur > num && !pq.contains(num)) {
            pq.offer(num);
        }
    }
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * SmallestInfiniteSet obj = new SmallestInfiniteSet();
 * int param_1 = obj.popSmallest();
 * obj.addBack(num);
 */
```