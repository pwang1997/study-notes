## [456. 132 Pattern](https://leetcode.com/problems/132-pattern/)

---

> Given an array of n integers nums, a 132 pattern is a subsequence ofthree 
> integers nums[i], nums[j] and nums[k] such that i < j < k and nums[i] < nums[k] < nums[j].
> Return true if there is a 132 pattern in nums, otherwise, return false.

#### Solution

Monotonic stack. min array represents the leftmost element nums[i], and by traversing backward with check of nums[j] < min[i], it automatically satifies the condition of nums[i] < nums[k] < nums[j]. When stack.peek() <= min[j], it violates nums[i] < nums[j]. For most of the monotonic stack problem, it can be optimized with array.

Time Complexity: O(N)

Space Complexity: O(N)

```java
public class Solution {
    public boolean find132pattern(int[] nums) {
        if (nums.length < 3)
            return false;
        Stack < Integer > stack = new Stack < > ();
        int[] min = new int[nums.length];
        min[0] = nums[0];
        for (int i = 1; i < nums.length; i++)
            min[i] = Math.min(min[i - 1], nums[i]);
        for (int j = nums.length - 1; j >= 0; j--) {
            if (nums[j] > min[j]) {
                while (!stack.isEmpty() && stack.peek() <= min[j])
                    stack.pop();
                if (!stack.isEmpty() && stack.peek() < nums[j])
                    return true;
                stack.push(nums[j]);
            }
        }
        return false;
    }
}
```

#### Optimal Solution with array

```java
public class Solution {
    public boolean find132pattern(int[] nums) {
        if (nums.length < 3)
            return false;
        int[] min = new int[nums.length];
        min[0] = nums[0];
        for (int i = 1; i < nums.length; i++)
            min[i] = Math.min(min[i - 1], nums[i]);
        for (int j = nums.length - 1, k = nums.length; j >= 0; j--) {
            if (nums[j] > min[j]) {
                while (k < nums.length && nums[k] <= min[j])
                    k++;
                if (k < nums.length && nums[k] < nums[j])
                    return true;
                nums[--k] = nums[j];
            }
        }
        return false;
    }
}
```