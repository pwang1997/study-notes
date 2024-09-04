```java
class Solution {
    public int minCostClimbingStairs(int[] cost) {
        int n = cost.length;
        int[] dp = new int[n];
        dp[0] = cost[0];
        dp[1] = cost[1];

        for (int i = 1; i < n - 1; i++) {
            dp[i + 1] = Math.min(dp[i], dp[i - 1]) + cost[i + 1];
        }

        return Math.min(dp[n - 2], dp[n - 1]);
    }
}
```