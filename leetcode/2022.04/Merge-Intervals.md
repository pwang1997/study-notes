## [LeetCode 56. Merge Intervals:](https://leetcode.com/problems/merge-intervals/)

---

> Given an array of `intervals` where `intervals[i] = [starti, endi]`, merge all overlapping intervals and 
> return *an array of the non-overlapping intervals that cover all the intervals in the input*.

Solution:

Intuitively, when two intervals are overlapped, their boundaries are crossed, and therefore, we extend the lower boundary to the less value and the upper boundary to the greater value. Notably, the problem array is not explicitly ordered, so we need to sort the array in ascending order.

Time Complexity: O(nlogn + n + n) 

Space Complexity: O(n)

```java
class Solution {
    public int[][] merge(int[][] intervals) {
        if(intervals == null || intervals.length == 0)
            return intervals;
        
        Arrays.sort(intervals, new Comparator<int[]>() {
           public int compare(int[] o1, int[] o2) {
                return o1[0] - o2[0];
            }
        });
        
        int index = 0;
        int[] start = intervals[index];

        for(int i = 1; i < intervals.length; i++) {
            if(intervals[i] == null) continue;
            if(intervals[i][0] <= start[1]) { // merge
                start[0] = Math.min(start[0], intervals[i][0]);
                start[1] = Math.max(start[1], intervals[i][1]);
                intervals[i] = null;
            } else {
                intervals[++index] = intervals[i];
                start = intervals[index];
            }
        }
        
        int[][] result = new int[index+1][2];
        for(int i = 0; i <= index; i++) {
            result[i] = intervals[i];
        }
        return result;
        
    }
}
```

