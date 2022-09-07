## [189. Rotate Array](https://leetcode.com/problems/rotate-array/)

---

> Given an array, rotate the array to the right by k steps, where k is non-negative.

#### Solution

```java
class Solution {
    public void rotate(int[] nums, int k) {
        int n = nums.length;
        k = k % n;

        int count = 0;
        for (int i = 0; count < n; i++) {
            int cur = i;
            int prev = nums[i];
            do {
                int next = (cur + k) % n;
                int tmp = nums[next];
                nums[next] = prev;
                prev = tmp;
                cur = next;
                count++;
            } while (i != cur);
        }
    }
}
```