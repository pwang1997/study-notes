```java

class Solution {
    public int equalPairs(int[][] grid) {
        int m = grid.length, n = grid[0].length;

        Map<List<Integer>, Integer> rowMap = new HashMap<>();

        for(int i = 0; i < m; i++) {
            List<Integer> list = new ArrayList<>();
            for(int v : grid[i]) {
                list.add(v);
            }
            rowMap.put(list, rowMap.getOrDefault(list, 0) + 1);
        }

        int count = 0;
        for(int i = 0; i < n; i++) {
            List<Integer> list = new ArrayList<>();
            for(int j = 0; j < m; j++) {
                list.add(grid[j][i]);
            }
            count += rowMap.getOrDefault(list, 0);
        }

        return count;

    }
}
```