# Minimum Time Difference
Topic: Bucket Sort
```java
class Solution {
    public int findMinDifference(List<String> timePoints) {
        List<Integer> list = new ArrayList<>();
        int mod = 24 * 60;

        timePoints.stream().forEach(a -> {
            String[] tmp = a.split(":");

            int hour = Integer.parseInt(tmp[0]);
            int minute = Integer.parseInt(tmp[1]);
            int diff = 60 * hour + minute;
            list.add(diff);
        });

        Collections.sort(list);

        int ans = Integer.MAX_VALUE;

        for (int i = 1; i < list.size(); i++) {
            ans = Math.min(ans, list.get(i) - list.get(i - 1));
        }
        return Math.min(ans, 24 * 60 - list.get(list.size() - 1) + list.get(0));
    }
}
```