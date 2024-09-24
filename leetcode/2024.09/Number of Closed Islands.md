# Number of Closed Islands
```java
class Solution {
    int n = -1, m = -1;

    public int closedIsland(int[][] grid) {
        n = grid.length;
        m = grid[0].length;

        int count = 0;
        boolean[][] visited = new boolean[n][m];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (!visited[i][j] && grid[i][j] == 0 &&
                        isClosedIsland(grid, i, j, visited)) {
                    count++;
                }
            }
        }
        return count;
    }

    int[][] directions = {{0, 1}, {1, 0}, {-1, 0}, {0, -1}};

    boolean isClosedIsland(int[][] grid, int i, int j, boolean[][] visited) {
        boolean isSurrounded = true;
        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{i, j});
        visited[i][j] = true;

        while (!q.isEmpty()) {
            int[] pos = q.poll();
            int x = pos[0], y = pos[1];
            visited[x][y] = true;

            for (int[] direction : directions) {
                int newX = x + direction[0];
                int newY = y + direction[1];
                if (newX < 0 || newY < 0 || newX >= n || newY >= m) {
                    isSurrounded = false;
                } else if (grid[newX][newY] == 0 && !visited[newX][newY]) {
                    q.offer(new int[]{newX, newY});
                }
            }
        }

        return isSurrounded;
    }
}
```