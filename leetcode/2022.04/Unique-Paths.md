## [LeetCode 62. Unique Paths](https://leetcode.com/problems/unique-paths/)

---

> There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). 
> The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either 
> down or right at any point in time. Given the two integers m and n, return the number of possible unique 
> paths that the robot can take to reach the bottom-right corner. The test cases are generated so that the 
> answer will be less than or equal to 2 * 109.

#### Solution

Due to the fact the robot can only move to rightward or downward, each cell the robot traverses must come from
top or left side. Therefore, number of paths the robot can reach the cell must depend on number of paths the robot
can reach from the cell's left and top neighbours.

Time Complexity: O(M * N)

Space Complexity: O(M * N)
```java
class Solution {
    public int uniquePaths(int m, int n) {
        int[][] dp = new int[m][n];
        Arrays.fill(dp[0], 1);
        for(int i = 0; i < m; i++) {
            dp[i][0] = 1;
        }
        
        for(int i = 1; i < m; i++) {
            for(int j = 1; j < n; j++) {
                dp[i][j] = dp[i-1][j] + dp[i][j-1];
            }
        }
        
        return dp[m-1][n-1];
    }
}
```