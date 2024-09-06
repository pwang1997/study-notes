```java
class Solution {
    public int[] missingRolls(int[] rolls, int mean, int n) {
        int m = rolls.length;
        int sum = (m + n) * mean;

        int rollSum = 0;

        for (int roll : rolls) {
            rollSum += roll;
        }
        if (rollSum + 6 * n < sum || rollSum + n > sum) return new int[]{};

        int[] ans = new int[n];
        int distributeMean = (sum - rollSum) / n;
        int mod = (sum - rollSum) % n;
        Arrays.fill(ans, distributeMean);
        for (int i = 0; i < mod; i++) {
            ans[i]++;
        }

        return ans;
    }
}
```