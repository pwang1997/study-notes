# Surrounded Regions
Topic: Graph, BFS
```java
class Solution {
    final int[][] directions = {{-1, 0}, {0, -1}, {0, 1}, {1, 0}};
    final char CAPTURED = '#';

    public void solve(char[][] board) {
        int m = board.length, n = board[0].length;

        for (int i = 0; i < m; i++) {
            if (board[i][0] == 'O') {
                bfs(i, 0, board);
            }
            if (board[i][n - 1] == 'O') {
                bfs(i, n - 1, board);
            }
        }

        for (int i = 0; i < n; i++) {
            if (board[0][i] == 'O') {
                bfs(0, i, board);
            }
            if (board[m - 1][i] == 'O') {
                bfs(m - 1, i, board);
            }
        }

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                board[i][j] = board[i][j] == CAPTURED ? 'O' : 'X';
            }
        }


    }

    void bfs(int x, int y, char[][] board) {
        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{x, y});
        board[x][y] = CAPTURED;
        while (!q.isEmpty()) {
            int[] pos = q.poll();
            for (int[] direction : directions) {
                int i = pos[0] + direction[0];
                int j = pos[1] + direction[1];
                if (i < 0 || j < 0 || i == board.length || j == board[0].length || board[i][j] != 'O') {
                    continue;
                }

                q.offer(new int[]{i, j});
                board[i][j] = CAPTURED;
            }
        }
    }
}
```