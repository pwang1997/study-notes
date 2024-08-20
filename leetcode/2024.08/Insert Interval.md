```java
class Solution {
    public int[][] insert(int[][] intervals, int[] newInterval) {
        List<Integer[]> list = new ArrayList<>();

        boolean merged = false;
        for(int[] interval : intervals) {
            if(merged || interval[1] < newInterval[0]) {
                list.add(new Integer[]{interval[0], interval[1]});
            } else if(interval[0] > newInterval[1]) {
                list.add(new Integer[]{newInterval[0], newInterval[1]});
                list.add(new Integer[]{interval[0], interval[1]});
                merged = true;
            } else {
                newInterval[0] = Math.min(newInterval[0], interval[0]);
                newInterval[1] = Math.max(newInterval[1], interval[1]);
            }
        }

        if(!merged) {
            list.add(new Integer[]{newInterval[0], newInterval[1]});
        }

        int[][] ans = new int[list.size()][2];

        for(int i = 0; i < list.size(); i++) {
            ans[i][0] = list.get(i)[0];
            ans[i][1] = list.get(i)[1];
        }

        return ans;        
    }
}
```