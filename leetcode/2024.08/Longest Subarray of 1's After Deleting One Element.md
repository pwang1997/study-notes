```java

class Solution {
    public int longestSubarray(int[] nums) {
        int i = 0, j = 0, n = nums.length;
        int k = 1;
        while(j < n) {
            if(nums[j] == 0) k--;
            if(k < 0 && nums[i++] == 0) k++;
            j++;
        }
        return j- i - 1;
    }
}
```