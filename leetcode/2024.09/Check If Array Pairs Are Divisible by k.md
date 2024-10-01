# Check If Array Pairs Are Divisible by k
```java
class Solution {
    public boolean canArrange(int[] arr, int k) {
        // Map<Integer, Integer> map = new HashMap<>();

        int[] map = new int[k + 1];

        for (int num : arr) {
            // int key = num % k;
            // if(key < 0) {
            //     key = k + key;
            // }
            // map.put(key, map.getOrDefault(key, 0) + 1);

            map[((num % k) + k) % k]++;
        }

        if (map[0] % 2 == 1) return false;
        for (int i = 1; i < (k + 1) / 2; i++) {
            if (map[i] != map[k - i]) return false;
        }


        // for(Integer key : map.keySet()) {
        //     int keyCount = map.get(key);
        //     int targetCount = map.getOrDefault(k - key, -1);
        //     if(key == 0 && keyCount % 2 == 0) continue;
        //     if(targetCount == -1 || keyCount != targetCount) return false;
        // }

        return true;
    }
}
```