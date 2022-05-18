## [73. Set Matrix Zeroes](https://leetcode.com/problems/set-matrix-zeroes/)

---

> Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.

#### Solution

memorizing the index of set-to-zeros with matrix[i][0] and matrix[0][j]

Time Complexity: O(N)

Space Complexity: O(1)

```java
class Solution {

    public void setZeroes(int[][] matrix) {
        int m = matrix.length;
        int n = matrix[0].length;
        boolean isCol = false;
        
        for(int i = 0; i < m; i++) {
            if (matrix[i][0] == 0) {
                isCol = true;
            }
            for(int j = 1; j < n; j++) {
                if(matrix[i][j] == 0) {
                    matrix[0][j] = 0;
                    matrix[i][0] = 0;
                }
            }
        }
        
        for(int i = 1; i < m; i++) {
            for(int j = 1; j < n; j++) {
                if(matrix[i][0] == 0 || matrix[0][j] == 0) {
                    matrix[i][j] = 0;
                }
            }
        }
        
        if(matrix[0][0] == 0) {
            Arrays.fill(matrix[0], 0);
        }
        
        if(isCol) {
            for(int i = 0; i < m; i++) {
                matrix[i][0] = 0;
            }
        }
        
    }
}
```