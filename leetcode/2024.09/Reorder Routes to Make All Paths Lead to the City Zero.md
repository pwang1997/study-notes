# Reorder Routes to Make All Paths Lead to the City Zero
Topic: Graph, Depth-First Search/ Breadth-First Search
```java
class Solution {
    class Dest {
        int v;
        boolean path;

        Dest(int v, boolean path) {
            this.v = v;
            this.path = path;
        }
    }


    public int minReorder(int n, int[][] connections) {
        Map<Integer, List<Dest>> map = new HashMap<>();

        for (int[] connection : connections) {
            int start = connection[0];
            int end = connection[1];
            if (!map.containsKey(start)) {
                map.put(start, new ArrayList<>());
            }
            map.get(start).add(new Dest(end, true)); // origin

            if (!map.containsKey(end)) {
                map.put(end, new ArrayList<>());
            }
            map.get(end).add(new Dest(start, false)); // reversed
        }

        int count = 0;
        Set<Integer> visited = new HashSet<>();
        Queue<Integer> q = new LinkedList<>();
        q.add(0);

        while (!q.isEmpty()) {
            Integer start = q.poll();
            visited.add(start);

            for (Dest dest : map.get(start)) {
                if (visited.contains(dest.v)) continue;

                if (dest.path) {
                    count++;
                }
                q.add(dest.v);
            }
        }

        return count;
    }
}
```