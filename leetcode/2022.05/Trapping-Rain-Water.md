## [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

---

> Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

#### Solution

```java
class Solution {
    public int trap(int[] height) {
        if(height.length < 3) return 0;
        
        int N = height.length;
        int L = 1, leftMax = height[0];
        int R = N - 2, rightMax = height[N - 1];
        int water = 0;
        
        while(L <= R) {
            if(leftMax <= rightMax) {
                water += Math.max(0, leftMax - height[L]);
                leftMax = Math.max(leftMax, height[L++]);
            } else {
                water += Math.max(0, rightMax - height[R]);
                rightMax = Math.max(rightMax, height[R--]);
            }
        }
        
        return water;
    }
}
```