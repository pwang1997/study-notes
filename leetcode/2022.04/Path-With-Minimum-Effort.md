## [LeetCode 1631. Path With Minimum Effort](https://leetcode.com/problems/path-with-minimum-effort/)

---

> You are a hiker preparing for an upcoming hike. You are given heights, a 2D array of size rows x columns, 
> where heights[row][col] represents the height of cell (row, col). You are situated in the top-left cell, (0, 0), 
> and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed). You can move up, down, 
> left, or right, and you wish to find a route that requires the minimum effort. 
> A route's effort is the maximum absolute difference in heights between two consecutive cells of the route. 
> Return the minimum effort required to travel from the top-left cell to the bottom-right cell.

#### Solution

Dijkstra's Algorithm. 

TC: O(nRow * nCol log(nRow * nCol))

SC: O(nRow * nCol)

```java
class Solution {
    public int minimumEffortPath(int[][] heights) {
        int[][] directions = {{0,1}, {1,0}, {0,-1}, {-1,0}};

        // initialization
        int nRow = heights.length, nCol = heights[0].length;
        int[][] absDiff = new int[nRow][nCol];
        for(int[] row  : absDiff) {
            Arrays.fill(row, Integer.MAX_VALUE);
        }
        absDiff[0][0] = 0;
        // Min heap
        PriorityQueue<Cell> queue = new PriorityQueue<>((a,b) -> (a.difference - b.difference));
        boolean[][] visited = new boolean[nRow][nCol];
        queue.add(new Cell(0, 0, absDiff[0][0]));

        while(!queue.isEmpty()) {
            Cell cur = queue.poll();
            visited[cur.x][cur.y] = true;
            if(cur.x == nRow - 1 && cur.y == nCol - 1) { // destination
                break;
            }

            for(int[] direction : directions) {
                int newX = cur.x + direction[0];
                int newY = cur.y + direction[1];
                // If valid yet not visited, update absDiff if found a new max
                if(isValidCell(newX,newY, nRow, nCol) && !visited[newX][newY]) {
                    int curDiff = Math.abs(heights[newX][newY] - heights[cur.x][cur.y]);
                    int maxDiff = Math.max(curDiff, absDiff[cur.x][cur.y]);
                    if(absDiff[newX][newY] > maxDiff) {
                        absDiff[newX][newY] = maxDiff;
                        queue.add(new Cell(newX, newY, maxDiff));
                    }
                }
            }
        }

        return absDiff[nRow-1][nCol-1];
    }

    boolean isValidCell(int x, int y, int row, int col) {
        return x >= 0 && x <= row - 1 && y >= 0 && y <= col - 1;
    }

    class Cell {
        int x, y, difference;
        Cell(int x, int y, int difference) {
            this.x = x;
            this.y = y;
            this.difference = difference;
        }
    }
}
```
