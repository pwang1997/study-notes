## [34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

---

> Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value. 
> If target is not found in the array, return [-1, -1]. 
> You must write an algorithm with O(log n) runtime complexity.

#### Solution

```java
class Solution {
    public int[] searchRange(int[] nums, int target) {
        int last = findLast(nums, target);
        int first = findFirst(nums, target);
        
        return new int[]{first, last};
    }
    
    int findLast(int[] nums, int target) {
        int L = 0, R = nums.length - 1;
        int ans = -1, mid = 0;
        while(L <= R) {
            mid = L + ((R - L) >> 1);
            if(nums[mid] < target) {
                L = mid + 1;
            } else if(nums[mid] > target) {
                R = mid - 1;
            } else {
                ans = mid;
                L = mid + 1;
            }
        }
        return ans;
    }
    
    int findFirst(int[] nums, int target) {
        int L = 0, R = nums.length - 1;
        int ans = -1, mid = 0;
        while(L <= R) {
            mid = L + ((R - L) >> 1);
            if(nums[mid] < target) {
                L = mid + 1;
            } else if(nums[mid] > target) {
                R = mid - 1;
            } else {
                ans = mid;
                R = mid - 1;
            }
        }
        return ans;
    }
}
```