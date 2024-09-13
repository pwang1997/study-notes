# Longest Subarray With Maximum Bitwise AND
Topic: array
```java
class Solution {
    public int longestSubarray(int[] nums) {
        int max = 0, maxLen = 0, curStreak = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] > max) {
                max = nums[i];
                curStreak = 0;
                maxLen = 0;
            }

            if (max == nums[i]) {
                curStreak++;
            } else {
                curStreak = 0;
            }

            maxLen = Math.max(maxLen, curStreak);
        }

        return maxLen;
    }
}
```