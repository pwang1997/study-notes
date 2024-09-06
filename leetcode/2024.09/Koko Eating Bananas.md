# Koko Eating Bananas
Topic: Binary search, Integer overflow
```java
class Solution {
    public int minEatingSpeed(int[] piles, int h) {
        long l = 1, r = 1_000_000_000;
        while (l <= r) {
            long mid = l + (r - l) / 2;
            if (canFinish(piles, mid, h)) r = mid - 1;
            else l = mid + 1;
        }
        return (int) l;
    }

    boolean canFinish(int[] piles, long k, int h) {
        int count = 0;
        for (int pile : piles) {
            long div = (long) pile / k;
            count += div;
            if (pile % k != 0) count++;
            if (count > h) return false;
        }
        return count <= h;
    }
}
```