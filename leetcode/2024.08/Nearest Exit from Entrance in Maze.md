```java
class Solution {
    public int nearestExit(char[][] maze, int[] entrance) {
        int rows = maze.length, cols = maze[0].length;

        int originX = entrance[0], originY = entrance[1];

        Queue<int[]> q = new LinkedList<>();
        q.offer(entrance);
        maze[entrance[0]][entrance[1]] = '+';

        int steps = 0;
        int[][] directions = new int[][]{{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
        while (!q.isEmpty()) {
            int size = q.size();
            steps++;

            for (int i = 0; i < size; i++) {
                int[] pos = q.poll();
                for (int[] direction : directions) {
                    int x = pos[0] + direction[0];
                    int y = pos[1] + direction[1];
                    if (x < 0 || y < 0 || x >= rows || y >= cols) continue;
                    if (maze[x][y] == '+') continue;
                    if (x == 0 || x + 1 == rows || y == 0 || y + 1 == cols) return steps;

                    maze[x][y] = '+';
                    q.offer(new int[]{x, y});
                }
            }

        }

        return -1;
    }
}
```