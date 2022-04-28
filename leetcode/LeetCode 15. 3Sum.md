## LeetCode 15. 3Sum

https://leetcode.com/problems/3sum/

------

> Given an integer array nums, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.
>
> Notice that the solution set must not contain duplicate triplets.

Solution:

Unlike the TwoSum problem, the problem requires a sorted array. Because the array is ascending, we can trim a lot of redundant operations, such as starting with a positive number(three positive numbers cannot add up to zero), and ignoring adjacent identical starting points (at most it will yield duplicates).

Time Complexity: O(nlogn + n * n)

Space Complexity: O(nlogn)

```java
class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        List<List<Integer>> list = new ArrayList<>();
        
        Arrays.sort(nums);
        
        for(int i = 0; i < nums.length && nums[i] <= 0; i++) {
            if(i == 0 || nums[i-1] != nums[i]) {
                twoSum(nums, i, list);
            }
        }
        
        return list;
    }
    
    void twoSum(int[] nums, int i, List<List<Integer>> list) {
        int low = i + 1, high = nums.length -1;
        while(low < high) {
            int sum = nums[i] + nums[low] + nums[high];
            if(sum < 0) low++;
            else if(sum > 0) high--;
            else {
                list.add(Arrays.asList(nums[i], nums[low++], nums[high--]));
                while(low < high && nums[low] == nums[low-1]) {
                    low++;
                }
            }
        }
    }
}
```

