## [LeetCode 33. Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)

---

> There is an integer array nums sorted in ascending order (with distinct values).
> Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) 
> such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). 
> For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
> Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, 
> or -1 if it is not in nums. You must write an algorithm with O(log n) runtime complexity.

#### Solution

Binary Search

TC: O(logN)

SC: O(1)

```java
class Solution {
    public int search(int[] nums, int target) {
        int left = 0, right = nums.length - 1, mid = Integer.MIN_VALUE;
        
        while(left <= right) {
            mid = left + (right - left >>> 1);
            if(nums[mid] == target) {
                break;
            } else if(nums[mid] >= nums[left]) { // left first ele is not rotated, meaning nums[left, mid] are ascendent
                if(target >= nums[left] && target < nums[mid])
                    right = mid - 1;
                else // rotation maybe happens in between mid and right
                    left = mid + 1;
            } else { // pivot is in the rotated subarray
                if(target <= nums[right] && target > nums[mid]) 
                    left = mid + 1;
                else 
                    right = mid - 1;
            }
        }
        
        return nums[mid] == target ? mid : -1;
    }
}
```
