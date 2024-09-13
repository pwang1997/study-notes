# Course Schedule
Topic: Graph, Kahn's Algorithm
```java
class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < numCourses; i++) {
            adj.add(new ArrayList<>());
        }

        for (int[] prerequisite : prerequisites) {
            adj.get(prerequisite[0]).add(prerequisite[1]);
        }

        int[] indegree = new int[numCourses];
        for (int i = 0; i < numCourses; i++) {
            for (int edge : adj.get(i)) {
                indegree[edge]++;
            }
        }

        Queue<Integer> q = new LinkedList<>();
        for (int i = 0; i < numCourses; i++) {
            if (indegree[i] == 0) {
                q.offer(i);
            }
        }

        int count = 0;
        while (!q.isEmpty()) {
            Integer node = q.poll();
            count++;

            for (int connectedNode : adj.get(node)) {
                indegree[connectedNode]--;
                if (indegree[connectedNode] == 0) {
                    q.offer(connectedNode);
                }
            }
        }

        return count == numCourses;
    }
}
```