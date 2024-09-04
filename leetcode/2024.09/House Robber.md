```java
class Solution {
    public int rob(int[] nums) {
        int n = nums.length;
        if (n == 1) return nums[0];

        int[] dp = new int[n + 1];
        dp[0] = 0;
        dp[1] = nums[0];

        for (int i = 1; i < n; i++) {
            dp[i + 1] = Math.max(nums[i] + dp[i - 1], dp[i]);
        }

        return dp[n];
    }
}
```