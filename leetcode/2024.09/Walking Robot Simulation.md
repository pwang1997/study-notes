```java
class Solution {
    public int robotSim(int[] commands, int[][] obstacles) {
        Set<String> set = new HashSet<>();
        for (int[] o : obstacles) {
            set.add(o[0] + " " + o[1]);
        }
        int x = 0, y = 0;

        //                   north   east   south   west
        int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};

        int direction = 0, maxDistSquare = 0;
        for (int i = 0; i < commands.length; i++) {
            if (commands[i] == -2) { // turn west
                direction = (direction + 3) % 4;
            } else if (commands[i] == -1) { // turn east
                direction = (direction + 1) % 4;
            } else {
                int step = 0;
                while (step++ < commands[i] && !set.contains((x + directions[direction][0]) + " " + (y + directions[direction][1]))) {
                    x += directions[direction][0];
                    y += directions[direction][1];
                }
            }
            maxDistSquare = Math.max(maxDistSquare, x * x + y * y);
        }

        return maxDistSquare;
    }
}
```