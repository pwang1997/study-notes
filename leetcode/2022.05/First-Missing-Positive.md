## [LeetCode 41.First Missing Positive](https://leetcode.com/problems/first-missing-positive/)

---

> Given an unsorted integer array nums, return the smallest missing positive integer. 
> You must implement an algorithm that runs in O(n) time and uses constant extra space.

#### Solution

Accepted but not using constant extra space.

```java
class Solution {
    public int firstMissingPositive(int[] nums) {
        int[] bucket = new int[nums.length + 1];
        for (int num : nums) {
            if (num <= nums.length && num > 0)
                bucket[num] = 1;
        }

        for (int i = 1; i < bucket.length; i++) {
            if (bucket[i] == 0) return i;
        }

        return bucket[nums.length] == 0 ? nums.length : nums.length + 1;
    }
}
```

Constant space solution

```java
class Solution {
    public int firstMissingPositive(int[] nums) {
        int L = 0, R = nums.length;

        while(L < R) {
            if(nums[L] == L + 1) {
                L++;
            } else if(nums[L] <= L || nums[L] > R || nums[nums[L] - 1] == nums[L]) {
                swap(nums, L, --R);
            } else {
                swap(nums, L, nums[L] - 1);
            }
        }

        return L + 1;

    }

    void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
```