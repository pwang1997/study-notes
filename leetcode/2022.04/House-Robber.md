## [LeetCode 198. House Robber](https://leetcode.com/problems/house-robber/)

---

> You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, 
> the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected 
> and it will automatically contact the police if two adjacent houses were broken into on the same night. 
> Given an integer array nums representing the amount of money of each house, return the maximum amount of money 
> you can rob tonight without alerting the police.

#### Solution:

Dynamic Programming.

TC: O(n)

SC: O(1)

```java
class Solution {
    public int rob(int[] nums) {
        int n = nums.length;
        if(n == 1) return nums[0];
        else if(n == 2) return Math.max(nums[0], nums[1]);
        
        int[] dp = new int[n];
        dp[0] = nums[0]; // rob first house first
        dp[1] = Math.max(dp[0], nums[1]); // rob second house first if stashed money is large enough
        for(int i = 2; i < n; i++) {
            dp[i] = Math.max(dp[i-2] + nums[i], dp[i-1]);
        }
        
        return dp[n-1];
    }
}
```