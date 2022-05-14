## [45. Jump Game II](https://leetcode.com/problems/jump-game-ii/)

---

> Given an array of non-negative integers nums, you are initially positioned at the first index of the array.
Each element in the array represents your maximum jump length at that position.
Your goal is to reach the last index in the minimum number of jumps.
You can assume that you can always reach the last index.


#### Solution

```java
class Solution {
    public int jump(int[] nums) {
        if(nums.length <= 1) return 0;
        
        int jump = 0;
        int curMax = 0;
        int nextMax = nums[0];
        
        for(int i = 0; i < nums.length; i++) {
            if(nextMax >= nums.length - 1) {
                return jump + 1;
            }
            if(curMax < i) {
                jump++;
                curMax = nextMax;
            }
            nextMax = Math.max(nextMax, i + nums[i]);
        }
        
        return jump;
    }
}
```

#### Follow-up: given starting point and endpoint, jump can only be startpont - num[i] and startpoint + num[i]. Return minimum jumps or -1

```java
class Solution {
    public int jumpMinTime(int N, int start, int end, int[] arr) {
        if(start < 1 || start > N || end < 1 || end > N) {
            return -1;
        }
    
        Queue<Integer> queue = new LinkedList<>();
        Map<Integer, Integer> levelMap = new HashMap<>();
        queue.add(start);
        levelMap.put(start, 0);
        
        while(!queue.isEmpty()) {
            int cur = queue.poll();
            int levle = levelMap.get(cur);
            if(cur == end) {
                return level;
            } else {
                int left = cur - arr[cur - 1];
                int right = cur + arr[cur -1];
                if(left > 0 && !levelMap.containsKey(left)) {
                    queue.add(left);
                    levelMap.put(left, level + 1);
                }
                if(right <= N && !levelMap.containsKey(right)) {
                    queue.add(right);
                    levelMap.put(right, level + 1);
                }
            }
        }
        return -1;
    }
}

```