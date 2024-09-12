# Evaluate Division
Topic: Graph, Union-Find, Depth-First Search
```java
class Solution {
    Map<String, Map<String, Double>> map = new HashMap<>();

    public double[] calcEquation(List<List<String>> equations, double[] values, List<List<String>> queries) {
        for (int i = 0; i < equations.size(); i++) {
            String s1 = equations.get(i).get(0);
            String s2 = equations.get(i).get(1);
            if (!map.containsKey(s1)) {
                map.put(s1, new HashMap<>());
            }
            map.get(s1).put(s2, values[i]);

            if (!map.containsKey(s2)) {
                map.put(s2, new HashMap<>());
            }
            map.get(s2).put(s1, 1 / values[i]);
        }

        int n = queries.size();
        double[] results = new double[n];
        for (int i = 0; i < n; i++) {
            String s1 = queries.get(i).get(0);
            String s2 = queries.get(i).get(1);

            if (!map.containsKey(s1) || !map.containsKey(s2)) {
                results[i] = -1;
                continue;
            }

            results[i] = dfs(s1, s2, 1, new HashSet<>());
        }

        return results;
    }

    double dfs(String s1, String s2, double val, Set<String> visited) {
        if (!map.containsKey(s1)) {
            return -1;
        }

        if (visited.contains(s1)) { // exit loop with a->b->a
            return -1;
        }

        if (s1.equals(s2)) {
            return val;
        }

        visited.add(s1);

        for (String key : map.get(s1).keySet()) {
            double div = dfs(key, s2, val * map.get(s1).get(key), visited);
            if (div != -1) {
                return div;
            }
        }

        return -1;
    }
}
```