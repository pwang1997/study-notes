```java
class Solution {
    public int minOperations(int[] nums) {
        int l = 0, r = 2, n = nums.length;

        int sum = nums[0] + nums[1] + nums[2], count = 0;

        while (r < n) {
            if (nums[l] == 0) {
                count++;
                for (int i = l; i <= r; i++) {
                    nums[i] ^= 1;
                }
            }
            l++;
            r++;
        }

        if (nums[n - 1] == 0 || nums[n - 2] == 0 || nums[n - 3] == 0) return -1;
        return count;
    }
}
```