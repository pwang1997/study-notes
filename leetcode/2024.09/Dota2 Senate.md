# Dota2 Senate
```java
class Solution {
    public String predictPartyVictory(String senate) {
        Queue<Integer> radiant = new LinkedList<>();
        Queue<Integer> dire = new LinkedList<>();

        char[] chs = senate.toCharArray();
        for (int i = 0; i < chs.length; i++) {
            if (chs[i] == 'R') {
                radiant.offer(i);
            } else {
                dire.offer(i);
            }
        }

        int n = chs.length;
        while (!radiant.isEmpty() && !dire.isEmpty()) {
            if (radiant.peek() < dire.peek()) {
                radiant.offer(n++);
            } else {
                dire.offer(n++);
            }

            radiant.poll();
            dire.poll();
        }

        return radiant.isEmpty() ? "Dire" : "Radiant";
    }
}
```