# Game of Life
````java
class Solution {

    int[][] directions = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}, {1, 1}, {-1, -1}, {-1, 1}, {1, -1}};

    public void gameOfLife(int[][] board) {
        int m = board.length, n = board[0].length;

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                board[i][j] = willLive(i, j, board);
            }
        }
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (board[i][j] == 2) board[i][j] = 0;
                else if (board[i][j] == 3) board[i][j] = 1;
                else if (board[i][j] == 4) board[i][j] = 1;
            }
        }
    }
    // 0 dead
    // 1 live
    // 2 live -> dead next turn
    // 3 live -> live next turn
    // 4 dead -> live next turn

    int willLive(int i, int j, int[][] board) {
        int m = board.length, n = board[0].length;
        int liveNeigh = 0;
        int deadNeigh = 0;
        for (int[] dir : directions) {
            int newX = i + dir[0];
            int newY = j + dir[1];
            if (newX < 0 || newY < 0 || newX >= m || newY >= n)
                continue;
            if (board[newX][newY] == 1 || board[newX][newY] == 2 || board[newX][newY] == 3)
                liveNeigh++;
            else if (board[newX][newY] == 0 || board[newX][newY] == 4)
                deadNeigh++;
        }
        if (board[i][j] == 1) {
            return (liveNeigh == 2 || liveNeigh == 3) ? 3 : 2;
        } else {
            return liveNeigh == 3 ? 4 : 0;
        }
    }
}
````