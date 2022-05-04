[LeetCode 1679. Max Number of K-Sum Pairs](https://leetcode.com/problems/max-number-of-k-sum-pairs/)

---

> You are given an integer array nums and an integer k. 
> In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array. 
> Return the maximum number of operations you can perform on the array.

#### Solution

The problem is equivalent to [TwoSum](https://leetcode.com/problems/two-sum/). As a trade of for time complexity,
it requires N space to store all the elements to a hashmap. The other solution is to sort the array and perform
two-pointer pass, which has time complexity of O(NlogN) with no extra allocated space.

Time Complexity: O(N)

Space Complexity: O(N)

```java
class Solution {
    public int maxOperations(int[] nums, int k) {
        Map<Integer, Integer> map = new HashMap<>();
        int count = 0;
        for(int num : nums) {
            map.put(num, map.getOrDefault(num, 0) + 1);
        }
        
        for(int num : nums) {
            int complement = k - num;
            
            if(map.containsKey(complement) && map.containsKey(num)) {
                int compLeft = map.getOrDefault(complement, -1);

                if(num == complement && compLeft >= 2) {
                    count += (int) compLeft / 2;
                } else {
                    if(num != complement && compLeft > 0) {
                        count += Math.min(compLeft, map.get(num));
                    }
                    map.remove(complement);
                }
                map.remove(num);
            }
        }
        
        return count;
    }
}
```