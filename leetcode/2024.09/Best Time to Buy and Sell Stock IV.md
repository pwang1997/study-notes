# Best Time to Buy and Sell Stock IV
Topic: DP
```java
class Solution {
    public int maxProfit(int k, int[] prices) {
        int n = prices.length;

        int m = 1 + 2 * k;
        int[][] dp = new int[m][n];

        // initialization
        for (int i = 1; i < m; i += 2) {
            dp[i][0] = -prices[0];
        }

        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                if (j % 2 == 1) { // buying state
                    dp[j][i] = Math.max(dp[j][i - 1], dp[j - 1][i - 1] - prices[i]);
                } else { // selling state
                    dp[j][i] = Math.max(dp[j][i - 1], dp[j - 1][i - 1] + prices[i]);
                }
            }
        }

        return dp[m - 1][n - 1];
    }
}
```