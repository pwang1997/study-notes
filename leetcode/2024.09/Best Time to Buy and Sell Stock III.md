# Best Time to Buy and Sell Stock III
Topic: DP
```java
class Solution {
    public int maxProfit(int[] prices) {
        int n = prices.length;
        int[][] dp = new int[5][n];
        dp[1][0] = -prices[0];
        dp[3][0] = -prices[0];

        for (int i = 1; i < n; i++) {
            dp[1][i] = Math.max(dp[1][i - 1], dp[0][i - 1] - prices[i]);
            dp[2][i] = Math.max(dp[2][i - 1], dp[1][i - 1] + prices[i]);

            dp[3][i] = Math.max(dp[3][i - 1], dp[2][i - 1] - prices[i]);
            dp[4][i] = Math.max(dp[4][i - 1], dp[3][i - 1] + prices[i]);
        }

        return dp[4][n - 1];
    }
}

/**
 dp states:
 dp[0]: no buy, no sell
 dp[1][i]: first buy/ hold
 dp[2][i]: first sell
 dp[3][i]: second buy/ hold
 dp[4][i]: second sell(includes first sell, e.g. buy+sell on the same day)

 */
```