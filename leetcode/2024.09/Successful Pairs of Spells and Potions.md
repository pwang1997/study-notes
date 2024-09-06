# Successful Pairs of Spells and Potions
topic: Binary search
```java
class Solution {
    public int[] successfulPairs(int[] spells, int[] potions, long success) {
        int n = spells.length, m = potions.length;

        Arrays.sort(potions);

        int[] ans = new int[n];

        for (int i = 0; i < n; i++) {
            int l = 0, r = m - 1;
            int strength = spells[i];
            while (l <= r) {
                int mid = l + (r - l) / 2;
                long product = (long) strength * potions[mid];

                if (product >= success) {
                    r = mid - 1;
                } else {
                    l = mid + 1;
                }
            }
            ans[i] = m - l;
        }
        return ans;
    }
}
```