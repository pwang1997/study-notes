# Find Peak Element
Topic: binary search
```java
class Solution {
    public int findPeakElement(int[] nums) {
        int n = nums.length;
        if (n == 1) return 0;
        if (nums[0] > nums[1]) return 0;
        if (nums[n - 1] > nums[n - 2]) return n - 1;

        int l = 1, r = n - 2;
        while (l <= r) {
            int m = (l + r) / 2;

            int left = m > 0 ? nums[m - 1] : Integer.MAX_VALUE;
            int right = m < n - 1 ? nums[m + 1] : Integer.MAX_VALUE;

            if (left < nums[m] && nums[m] > right) {
                return m;
            } else if (left > nums[m]) {
                r = m - 1;
            } else if (nums[m] < right) {
                l = m + 1;
            }
        }
        return -1;
    }
}
```