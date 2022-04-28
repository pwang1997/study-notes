## LeetCode 739. Daily Temperatures

https://leetcode.com/problems/daily-temperatures/

---

> Given an array of integers `temperatures` represents the daily temperatures, return *an array* `answer` *such that* `answer[i]` *is the number of days you have to wait after the* `ith` *day to get a warmer temperature*. If there is no future day for which this is possible, keep `answer[i] == 0` instead.

Solution:

Monotonic Stack.

Time Complexity: O(n)

Space Complexity: O(n)

```java
class Solution {
    public int[] dailyTemperatures(int[] temperatures) {
        int[] res = new int[temperatures.length];
        Deque<Integer> stack = new ArrayDeque<>();
        
        for(int cur = 0; cur < temperatures.length; cur++) {
            int curTemperature = temperatures[cur];
            
            while(!stack.isEmpty() && temperatures[stack.peek()] < curTemperature) {
                int prevDay = stack.pop();
                res[prevDay] = cur - prevDay;
            }
            stack.push(cur);
        }
        return res;
    }
}
```

