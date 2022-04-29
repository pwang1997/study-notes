## [LeetCode 78. Subsets](https://leetcode.com/problems/subsets/)

---

> Given an integer array nums of unique elements, return all possible subsets (the power set). 
> The solution set must not contain duplicate subsets. Return the solution in any order.

#### Solution

BFS

TC: O(N * 2^N)

SC: O(N * 2^N)

```java
class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        int n = nums.length;

        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < n; i++) map.put(nums[i], i);

        List<List<Integer>> list = new ArrayList<>();
        list.add(new ArrayList<>()); // empty set is always a subset of a set
        Queue<List<Integer>> queue = new LinkedList<>();

        for (int num : nums) {
            List<Integer> lead = new ArrayList<>();
            lead.add(num);
            queue.add(lead);
        }

        while (!queue.isEmpty()) {
            List<Integer> subset = queue.poll();
            Integer lastEle = subset.get(subset.size() - 1);
            for (int i = map.get(lastEle) + 1; i < n; i++) {
                List<Integer> copy = new ArrayList<>(subset);
                copy.add(nums[i]);
                queue.add(copy);
            }

            list.add(subset);
        }

        return list;
    }
}
```

#### Optimal Solution

```java
class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();
        res.add(new ArrayList<>());
        for (int num : nums) {
            List<List<Integer>> newSets = new ArrayList<>();
            for (List<Integer> existing : res) {
                newSets.add(new ArrayList<>(existing) {{
                    add(num);
                }});
            }

            res.addAll(newSets);
        }

        return res;
    }
}
```