## [LeetCode 238. Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/)

---

> Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the 
> elements of nums except nums[i]. The product of any prefix or suffix of nums is guaranteed to 
> fit in a 32-bit integer. You must write an algorithm that runs in O(n) time and 
> without using the division operation.

#### Solution:

Product of Array Except Self = AccumulativeSumFromLeft * AccumulativeSumFromRight

Time Complexity: O(N)

Space Complexity: O(1)

```java
class Solution {
    public int[] productExceptSelf(int[] nums) {
        int n = nums.length;
        int[] ans = new int[n];
        ans[0] = 1;
        
        for(int i = 1; i < n; i++) {
            ans[i] = ans[i-1] * nums[i-1];
        }
        
        int right = 1;
        for(int i = n -1; i >= 0; i--) {
            ans[i] = ans[i] * right;
            right = right * nums[i];
        }
        
        return ans;
    }
}
```