## [LeetCode 581. Shortest Unsorted Continuous Subarray](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/)

---

> Given an integer array nums, you need to find one continuous subarray that if you only sort this subarray in 
> ascending order, then the whole array will be sorted in ascending order. Return the shortest such subarray 
> and output its length.

#### Solution

Time Complexity: O(N)

Space Complexity: O(1)

```java
public class Solution {
    public int findUnsortedSubarray(int[] nums) {
        int min = Integer.MAX_VALUE, max = Integer.MIN_VALUE;
        boolean sorted = true;
        // find the local minimum of unsorted subarray
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] < nums[i - 1])
                sorted = false;
            if (!sorted)
                min = Math.min(min, nums[i]);
        }
        sorted = true;
        // find the local maximum of unsorted subarray
        for (int i = nums.length - 2; i >= 0; i--) {
            if (nums[i] > nums[i + 1])
                sorted = false;
            if (!sorted)
                max = Math.max(max, nums[i]);
        }
        int l, r;
        for (l = 0; l < nums.length; l++) {
            if (min < nums[l])
                break;
        }
        for (r = nums.length - 1; r >= 0; r--) {
            if (max > nums[r])
                break;
        }
        return r - l < 0 ? 0 : r - l + 1;
    }
}
```