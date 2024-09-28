# Find Players With Zero or One Losses
```java
class Solution {
    public List<List<Integer>> findWinners(int[][] matches) {
        Map<Integer, Integer> map = new HashMap<>();

        for (int[] match : matches) {
            map.putIfAbsent(match[0], 0);
            map.put(match[1], map.getOrDefault(match[1], 0) + 1);
        }
        List<Integer> zeroLoss = new ArrayList<>();
        List<Integer> oneLoss = new ArrayList<>();

        map.forEach((k, v) -> {
            if (v == 0) zeroLoss.add(k);
            if (v == 1) oneLoss.add(k);
        });
        Collections.sort(zeroLoss);
        Collections.sort(oneLoss);
        return List.of(zeroLoss, oneLoss);
    }
}
```