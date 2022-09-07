## [74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)

---

> Write an efficient algorithm that searches for a value target in an m x n integer matrix. This matrix has the
> following properties:
> Integers in each row are sorted from left to right.
> The first integer of each row is greater than the last integer of the previous row.

#### Solution

```java
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int m = matrix.length;
        int n = matrix[0].length;

        int row = -1;
        for (int i = 0; i < m; i++) {
            if (matrix[i][0] <= target && matrix[i][n - 1] >= target) {
                row = i;
                break;
            }
        }
        if (row == -1)
            return false;

        int found = Arrays.binarySearch(matrix[row], target);
        return found >= 0;
    }
}
```