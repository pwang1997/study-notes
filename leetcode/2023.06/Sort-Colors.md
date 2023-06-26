## [75. Sort Colors](https://leetcode.com/problems/sort-colors/description/)

#### Solution

```java
class Solution {
    public void sortColors(int[] nums) {
        int[] buckets = new int[3];
        for(int num : nums) {
            buckets[num]++;
        }

        int index = 0;
        for(int i= 0 ; i < buckets.length; i++) {
            while(buckets[i] > 0 && index < nums.length) {
                nums[index++] = i;
                buckets[i]--;
            }
        }
    }
}
```