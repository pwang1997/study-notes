```java
class Solution {
    public long maxScore(int[] nums1, int[] nums2, int k) {
        int[][] combined = new int[nums1.length][2];
        for (int i = 0; i < nums1.length; i++) {
            combined[i] = new int[]{nums1[i], nums2[i]};
        }

        Arrays.sort(combined, (a, b) -> b[1] - a[1]);
        PriorityQueue<Integer> heap = new PriorityQueue<>(k + 1);

        long sum = 0, res = 0;
        for (int[] arr : combined) {
            heap.offer(arr[0]);
            sum += arr[0];
            if (heap.size() > k) { // remove the prev min of (i,j,k) from nums1
                sum -= heap.poll();
            }
            if (heap.size() == k) {
                res = Math.max(res, arr[1] * sum);
            }
        }
        return res;
    }
}
```