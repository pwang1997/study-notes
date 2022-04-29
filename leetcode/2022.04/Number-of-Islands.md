## [LeetCode 200. Number of Islands](https://leetcode.com/problems/number-of-islands/)

---

> Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
> An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. 
> You may assume all four edges of the grid are all surrounded by water.

#### Solution

Breadth-First Search through the grid. Notably, although the overall searching direction is top left to bottom right,
it requires searching in four directions(up, down, left, right) to ensure no piece of island is unvisited.

TC: O(nRow * nCol)

SC: O(Min(nRow, nCol))

```java
class Solution {
    public int numIslands(char[][] grid) {
        int m = grid.length, n = grid[0].length;
        
        int count = 0;
        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {
                // first time visiting the cell and it is a part of island
                if(grid[i][j] == '1') {
                    count++;
                    grid[i][j] = '0';
                    Queue<Integer> queue = new LinkedList<>();
                    queue.add(i * n + j);
                    while(!queue.isEmpty()) {
                        int loc = queue.remove();
                        int row = loc / n, col = loc % n;
                        
                        if(row - 1 >= 0 && grid[row-1][col] == '1') {
                            queue.add((row-1) * n + col);
                            grid[row-1][col] = '0';
                        }
                        
                        if(row + 1 < m && grid[row+1][col] == '1') {
                            queue.add((row+1) * n + col);
                            grid[row+1][col] = '0';
                        }
                        
                        if(col - 1 >= 0 && grid[row][col-1] == '1') {
                            queue.add(row * n + col - 1);
                            grid[row][col-1] = '0';
                        }
                        
                        if(col + 1 < n && grid[row][col+1] == '1') {
                            queue.add(row * n + col + 1);
                            grid[row][col+1] = '0';
                        }
                        
                    }
                }
            }
        }
        return count;
    }
}
```