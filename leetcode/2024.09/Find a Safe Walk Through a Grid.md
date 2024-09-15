# Find a Safe Walk Through a Grid
Topic: BFS
```java
class Solution {
    int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};
    int m = 0, n = 0;
    boolean[][][] visited = null;

    public boolean findSafeWalk(List<List<Integer>> grid, int health) {
        m = grid.size();
        n = grid.get(0).size();
        visited = new boolean[m][n][health + 1];
        if (grid.get(0).get(0) == 1) {
            health--;
        }

        visited[0][0][health] = true;

        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{0, 0, health});

        while (!q.isEmpty()) {
            int size = q.size();

            for (int i = 0; i < size; i++) {
                int[] node = q.poll();
                int x = node[0], y = node[1], hp = node[2];

                if (x == m - 1 && y == n - 1 && hp > 0) return true;

                for (int[] direction : directions) {
                    int newX = x + direction[0];
                    int newY = y + direction[1];
                    if (isValidPos(newX, newY)) {
                        int newHp = hp - grid.get(newX).get(newY);

                        if (newHp >= 0 && !visited[newX][newY][newHp]) {
                            visited[newX][newY][newHp] = true;
                            q.offer(new int[]{newX, newY, newHp});
                        }
                    }
                }
            }
        }
        return false;
    }

    boolean isValidPos(int x, int y) {
        return x >= 0 && x < m && y >= 0 && y < n;
    }
}
```