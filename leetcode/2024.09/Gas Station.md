# Gas Station
```java
class Solution {
    // public int canCompleteCircuit(int[] gas, int[] cost) {
    //     int n = gas.length;
    //     PriorityQueue<int[]> heap = new PriorityQueue<>((a, b) -> {
    //         if (a[0] == b[0])
    //             return a[1] - b[1];
    //         return b[0] - a[0];
    //     });

    //     int totalGas = 0, totalCost = 0;
    //     for (int i = 0; i < n; i++) {
    //         totalGas += gas[i];
    //         totalCost += cost[i];
    //         if (gas[i] < cost[i])
    //             continue;
    //         heap.offer(new int[] { gas[i], cost[i], i });
    //     }
    //     if (totalGas < totalCost)
    //         return -1;

    //     while (!heap.isEmpty()) {
    //         int[] start = heap.poll();
    //         int idx = start[2];
    //         int tank = start[0];

    //         do {
    //             idx = idx % n;

    //             tank -= cost[idx];
    //             if (tank < 0)
    //                 break;
    //             tank += gas[(idx + 1) % n];
    //             idx++;
    //             idx = idx % n;

    //         } while (idx != start[2]);

    //         if (idx == start[2])
    //             return idx;
    //     }

    //     return -1;
    // }

    public int canCompleteCircuit(int[] gas, int[] cost) {
        int n = gas.length;
        int totalSurplus = 0, surplus = 0, start = 0;

        for (int i = 0; i < n; i++) {
            totalSurplus += gas[i] - cost[i];
            surplus += gas[i] - cost[i];
            if (surplus < 0) {
                surplus = 0;
                start = i + 1;
            }
        }
        return totalSurplus >= 0 ? start : -1;
    }

}
```