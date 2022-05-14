## [46. Permutations](https://leetcode.com/problems/permutations/)

---

> Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

```java
class Solution {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();

        process(nums, 0, res);

        return res;
    }

    void process(int[] nums, int index, List<List<Integer>> res) {
        if(index == nums.length) {
            List<Integer> list = new ArrayList<>();
            for(int num : nums) {
                list.add(num);
            }
            res.add(list);
        } else {
            Set<Integer> seen = new HashSet<>();
            for(int j = index; j < nums.length; j++) {
                if(!seen.contains(nums[j])) {
                    seen.add(nums[j]);
                    swap(nums, index, j);
                    process(nums, index + 1, res);
                    swap(nums, index, j);
                }

            }
        }
    }

    void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }
}
```