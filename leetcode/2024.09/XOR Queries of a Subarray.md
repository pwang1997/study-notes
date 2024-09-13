# XOR Queries of a Subarray
Topic: bitwise operation, DP

```java
class Solution {
    public int[] xorQueries(int[] arr, int[][] queries) {
        int n = arr.length, m = queries.length;

        int[] dp = new int[n + 1];
        dp[0] = 0;
        for (int i = 0; i < n; i++) {
            dp[i + 1] = dp[i] ^ arr[i];
            // dp[1] = arr[0] = 1
            // dp[2] = arr[0] ^ arr[1] = 1 ^ 3
            // dp[3] = 1 ^ 3 ^ 4
            // dp[4] = 1 ^ 3 ^ 4 ^ 8
        }

        int[] results = new int[m];
        for (int i = 0; i < m; i++) {
            if (queries[i][0] == queries[i][1]) {
                results[i] = arr[queries[i][0]];
            } else {
                results[i] = dp[queries[i][1] + 1] ^ dp[queries[i][0]];
            }
        }
        return results;
    }
}
```