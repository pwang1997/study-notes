# Russian Doll Envelopes
```java
class Solution {
    public int maxEnvelopes(int[][] envelopes) {
        Arrays.sort(envelopes, (a, b) -> {
            if (a[0] == b[0]) return Integer.compare(b[1], a[1]);
            return Integer.compare(a[0], b[0]);
        });
        int n = envelopes.length;
        int[] dp = new int[n];
        int len = 0;
        for (int[] env : envelopes) {
            int idx = Arrays.binarySearch(dp, 0, len, env[1]);

            if (idx < 0) {
                idx = -(idx + 1);
            }
            dp[idx] = env[1];
            if (idx == len) {
                len++;
            }
        }
        return len;
    }
}
```