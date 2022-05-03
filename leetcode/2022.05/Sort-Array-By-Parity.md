## [LeetCode 905. Sort Array By Parity](https://leetcode.com/problems/sort-array-by-parity/)

---

> Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers. 
> Return any array that satisfies this condition.

#### Solution

Time Complexity: O(N)

Space Complexity: O(1)


```java
class Solution {
    public int[] sortArrayByParity(int[] nums) {
        int left = 0, right = nums.length -1;
        
        while(left < right) {
            if((nums[left] & 1) > (nums[right] & 1)) {
                int tmp = nums[left];
                nums[left] = nums[right];
                nums[right] = tmp;
            }
            
            if((nums[left] & 1) == 0) left++;
            if((nums[right] & 1) == 1) right--;
        }
        return nums;
    }
}
```