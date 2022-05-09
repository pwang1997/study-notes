## [26. Remove Duplicates from Sorted Array](https://leetcode.com/problems/remove-duplicates-from-sorted-array/submissions/)

---

> Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique 
> element appears only once. The relative order of the elements should be kept the same.

#### Solution

```java
class Solution {
    public int removeDuplicates(int[] nums) {
        int index = 0;
        
        if(nums.length < 2) return nums.length;
        
        for(int i = 0; i < nums.length; i++) {
            if(i == 0 || nums[i] != nums[i-1]) {
                nums[index++] = nums[i];
            }
        }
        
        return index;
    }
}
```