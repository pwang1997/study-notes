```java
class Solution {
    public long totalCost(int[] costs, int k, int candidates) {
        long cost = 0;
        PriorityQueue<Integer> left = new PriorityQueue<>(candidates);
        PriorityQueue<Integer> right = new PriorityQueue<>(candidates);

        for (int i = 0; i < candidates; i++) {
            left.offer(costs[i]);
        }

        for (int i = Math.max(candidates, costs.length - candidates); i < costs.length; i++) {
            right.offer(costs[i]);
        }

        int leftIdx = candidates, rightIdx = costs.length - 1 - candidates;

        while (k-- > 0) {
            if (right.isEmpty() || !left.isEmpty() && left.peek() <= right.peek()) {
                cost += left.poll();
                if (leftIdx <= rightIdx) {
                    left.offer(costs[leftIdx++]);
                }
            } else {
                cost += right.poll();
                if (leftIdx <= rightIdx) {
                    right.offer(costs[rightIdx--]);
                }
            }
        }
        return cost;
    }
}
```