# Best Time to Buy and Sell Stock with Transaction Fee
Topic: DP

```java
class Solution {
    public int maxProfit(int[] prices, int fee) {
        int position = -prices[0];
        int profit = 0;

        for (int i = 1; i < prices.length; i++) {
            position = Math.max(position, profit - prices[i]);
            profit = Math.max(profit, position + prices[i] - fee); // sell on prices[i]
        }

        return profit;
    }
}
```