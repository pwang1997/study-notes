# Valid Sudoku
```java
class Solution {
    public boolean isValidSudoku(char[][] board) {
        int n = board.length;
        boolean[] validRows = new boolean[n];
        boolean[] validCols = new boolean[n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (validRows[i] || validCols[j]) continue;

                Set<Character> set = new HashSet<>();
                // validate row
                for (int k = 0; k < n; k++) {
                    if (board[i][k] == '.') continue;
                    if (!set.add(board[i][k])) {
                        return false;
                    }
                }
                validRows[i] = true;
                // validate column
                set = new HashSet<>();
                for (int k = 0; k < n; k++) {
                    if (board[k][j] == '.') continue;
                    if (!set.add(board[k][j])) {
                        return false;
                    }
                }
                validCols[j] = true;
            }
        }

        for (int i = 0; i < n; i += 3) {
            for (int j = 0; j < n; j += 3) {
                Set<Character> set = new HashSet<>();
                for (int k = 0; k < 3; k++) {
                    for (int f = 0; f < 3; f++) {
                        if (board[i + k][j + f] != '.' && !set.add(board[i + k][j + f])) {
                            return false;
                        }
                    }

                }
            }
        }
        return true;

    }
}
```