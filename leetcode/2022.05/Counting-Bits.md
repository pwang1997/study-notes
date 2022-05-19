## [338. Counting Bits](https://leetcode.com/problems/rotate-image/)

---

> Given an integer n, return an array ans of length n + 1 such that 
> for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

#### Solution

```java
public class Solution {
    public int[] countBits(int n) {
        int[] ans = new int[n + 1];
        for (int x = 1; x <= n; ++x) {
            // x / 2 is x >> 1 and x % 2 is x & 1
            ans[x] = ans[x >> 1] + (x & 1); 
        }
        return ans;
    }
}
```