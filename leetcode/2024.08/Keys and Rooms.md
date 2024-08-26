
```java
class Solution {
    boolean[] unlocked = null;

    public boolean canVisitAllRooms(List<List<Integer>> rooms) {
        int n = rooms.size();

        unlocked = new boolean[n];
        unlocked[0] = true;

        traverse(rooms, 0);

        for (int i = 0; i < n; i++) {
            if (!unlocked[i]) return false;
        }

        return true;
    }

    void traverse(List<List<Integer>> rooms, int room) {
        unlocked[room] = true;

        List<Integer> keys = rooms.get(room);

        for (Integer key : keys) {
            if (!unlocked[key]) {
                traverse(rooms, key);
            }
        }

    }
}
```