# Minimum Number of Seconds to Make Mountain Height Zero
Topic: Heap
````java
class Solution {
    public long minNumberOfSeconds(int h, int[] workerTimes) {
        int n = workerTimes.length;

        PriorityQueue<long[]> heap = new PriorityQueue<>((a, b) -> compare(a, b));

        for (int workerTime : workerTimes) {
            heap.offer(new long[]{workerTime, 0, 0}); // base work time, next workTime, current time it takes
        }

        long longest = 0;
        while (h > 0) {
            long[] w = heap.poll();
            w[1] += w[0];
            w[2] += w[1];
            longest = w[2];
            heap.add(w);
            h--;
        }

        return longest;
    }

    public int compare(long[] a, long[] b) {
        return (a[2] + a[1] + a[0] == b[2] + b[1] + b[0])
                ? (int) (a[0] - b[0]) // cheapest base workTime
                : (int) ((a[2] + a[1] + a[0]) - (b[2] + b[1] + b[0])); // cheapest overall time it will takes
    }
}
````