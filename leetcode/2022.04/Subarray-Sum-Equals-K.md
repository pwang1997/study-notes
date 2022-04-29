## [LeetCode 560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)

---

> Given an array of integers nums and an integer k, return the total number of subarrays 
> whose sum equals to k.

#### Solution:

With the brute force method, it will iterate n more times as it sums up all the possibilities.
However, 'sum' has this property **sum[i] - sum[j] = sum of elements between i and j**. Firstly, I thought to 
construct a hashmap of lists to store all the sum and its index, and count all the elements satisfies the condition
yet prior to current index; but it is redundant as iterating through the
array, I do not have to worry about having elements exceeding the current index.

Time Complexity: O(n)

Space Complexity: O(n)

```java
class Solution {
    public int subarraySum(int[] nums, int k) {
        int n = nums.length;
        int count = 0, sum = 0;
        
        Map<Integer, Integer> map = new HashMap<>();
        map.put(0, 1);
        
        for(int i = 0; i < n; i++) {
            sum += nums[i];
            if(map.containsKey(sum - k)) {
                count += map.get(sum - k);
            }
            map.put(sum, map.getOrDefault(sum, 0) + 1);
        }
        
        return count;
    }
}
```