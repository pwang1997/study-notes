```java
class Solution {
    public int findCircleNum(int[][] isConnected) {
        int n = isConnected.length;
        int count = 0;

        boolean[] visited = new boolean[n];
        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                count++;
                dfs(isConnected, i, visited);
            }
        }

        return count;
    }

    void dfs(int[][] isConnected, int pos, boolean[] visited) {
        for (int i = 0; i < isConnected.length; i++) {
            if (!visited[i] && isConnected[pos][i] != 0) {
                visited[i] = true;
                dfs(isConnected, i, visited);
            }
        }
    }
}
```