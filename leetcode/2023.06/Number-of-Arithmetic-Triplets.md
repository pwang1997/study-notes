## [2367. Number of Arithmetic Triplets](https://leetcode.com/problems/number-of-arithmetic-triplets/description/)

#### Solution
```java

class Solution {
    public int arithmeticTriplets(int[] nums, int diff) {
        int ans = 0;

        Set<Integer> set = new HashSet<>();

        for(int num : nums) {
            set.add(num);
            if(set.contains(num-diff) && set.contains(num-2*diff)) ans++;
        }
        return ans;
    }
}

```