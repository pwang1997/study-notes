## [LeetCode 347. Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/)

---

> Given an integer array nums and an integer k, return the k most frequent elements. 
> You may return the answer in any order.

#### Solution

HashMap + MinHeap

Time Complexity: O(N + N * logK)

Space Complexity: O(N + k)
```java
class Solution {
    public int[] topKFrequent(int[] nums, int k) {
        Map<Integer, Integer> map = new HashMap<>();
        
        for(int num : nums) {
            map.put(num, map.getOrDefault(num, 0) + 1);
        }
        // min heap
        Queue<Map.Entry<Integer, Integer>> heap = new PriorityQueue<>((a,b) -> b.getValue() - a.getValue());
        heap.addAll(map.entrySet());
        
        int[] rst = new int[k];
        for(int i = 0; i < k; i++) {
            rst[i] = heap.poll().getKey();
        }
        
        return rst;
    }
}
```