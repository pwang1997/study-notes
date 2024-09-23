# Count Sub Islands
Topic: DFS/BFS
````java
class Solution {

    int[][] directions = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};

    public int countSubIslands(int[][] grid1, int[][] grid2) {
        int count = 0;

        int n = grid1.length, m = grid1[0].length;
        boolean[][] visited = new boolean[n][m];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (!visited[i][j] && grid2[i][j] == 1 && bfs(grid1, grid2, i, j, visited)) {
                    count++;
                }
            }
        }

        return count;
    }

    boolean bfs(int[][] grid1, int[][] grid2, int i, int j, boolean[][] visited) {
        boolean isSubIsland = true;
        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{i, j});
        visited[i][j] = true;

        while (!q.isEmpty()) {
            int[] pos = q.poll();
            if (grid1[pos[0]][pos[1]] == 0) {
                isSubIsland = false;
            }
            for (int[] direction : directions) {
                int newX = pos[0] + direction[0];
                int newY = pos[1] + direction[1];
                if (newX < 0 || newY < 0 || newX >= grid1.length || newY >= grid1[0].length)
                    continue;

                if (!visited[newX][newY] && grid2[newX][newY] == 1) {
                    q.offer(new int[]{newX, newY});
                    visited[newX][newY] = true;
                }
            }
        }
        return isSubIsland;
    }
}
````