```java
class Solution {
    public int[][] merge(int[][] intervals) {
        Arrays.sort(intervals, (a,b) -> a[0] - b[0]);

        int n = intervals.length;
        int[][] merge = new int[n][2];
        merge[0] = intervals[0];
        int j = 0;

        for(int i = 1; i < n; i++) {
            if(merge[j][1] >= intervals[i][0]) { // merge interval
                merge[j][0] = Math.min(merge[j][0], intervals[i][0]);
                merge[j][1] = Math.max(merge[j][1], intervals[i][1]);
            } else {
                merge[++j] = intervals[i];
            }
        }
        int[][] ans = new int[j+1][2];

        for(int i = 0; i <= j; i++) {
            ans[i] = merge[i];
        }
        return ans;
    }
}
```