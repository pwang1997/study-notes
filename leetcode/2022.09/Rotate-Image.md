## [48.Rotate Image](https://leetcode.com/problems/rotate-image/)

---

> You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
> You have to rotate the image in-place, which means you have to modify the input 2D matrix directly.
> DO NOT allocate another 2D matrix and do the rotation.

#### Solution

```java
class Solution {
    int n = -1;
    boolean[][] visited = null;

    public void rotate(int[][] matrix) {
        n = matrix.length - 1;
        visited = new boolean[n + 1][n + 1];

        for (int i = 0; i <= n; i++) {
            for (int j = 0; j <= n / 2; j++) {
                if (!visited[i][j]) {
                    rotate(matrix, i, j);
                }
            }
        }
    }

    void rotate(int[][] matrix, int i, int j) {
        int p1 = matrix[i][j];
        int p2 = matrix[j][n - i];
        int p3 = matrix[n - i][n - j];
        int p4 = matrix[n - j][i];

        matrix[j][n - i] = p1;
        matrix[n - i][n - j] = p2;
        matrix[n - j][i] = p3;
        matrix[i][j] = p4;

        visited[i][j] = true;
        visited[j][n - i] = true;
        visited[n - i][n - j] = true;
        visited[n - j][i] = true;
    }


}
```

#### Programmatic Solution

```java

class Solution {
    public void rotate(int[][] matrix) {
        transpose(matrix);
        reflect(matrix);
    }

    public void transpose(int[][] matrix) {
        int n = matrix.length;
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                int tmp = matrix[j][i];
                matrix[j][i] = matrix[i][j];
                matrix[i][j] = tmp;
            }
        }
    }

    public void reflect(int[][] matrix) {
        int n = matrix.length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n / 2; j++) {
                int tmp = matrix[i][j];
                matrix[i][j] = matrix[i][n - j - 1];
                matrix[i][n - j - 1] = tmp;
            }
        }
    }
}
```