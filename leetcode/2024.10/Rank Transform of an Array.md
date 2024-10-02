# Rank Transform of an Array
```java
class Solution {
    // public int[] arrayRankTransform(int[] arr) {
    //     if(arr.length == 0) return new int[]{};
    //     PriorityQueue<int[]> heap = new PriorityQueue<>((a,b) -> a[0] - b[0]);

    //     for(int i = 0; i < arr.length; i++) {
    //         heap.add(new int[]{arr[i], i});
    //     }

    //     int[] ans = new int[arr.length];

    //     int prevRank = 0;
    //     int prevVal = Integer.MIN_VALUE;

    //     while(!heap.isEmpty()) {
    //         int[] pair = heap.poll();
    //         if(pair[0] > prevVal) {
    //             prevRank++;
    //             prevVal = pair[0];
    //         }
    //         ans[pair[1]] = prevRank;
    //     }

    //     return ans;
    // }
    public int[] arrayRankTransform(int[] arr) {
        if (arr.length == 0) return new int[]{};

        int[] ans = new int[arr.length];
        for (int i = 0; i < arr.length; i++) {
            ans[i] = arr[i];
        }
        Arrays.sort(arr);
        Map<Integer, Integer> map = new HashMap<>();
        int rank = 1;
        for (int num : arr) {
            if (!map.containsKey(num)) {
                map.put(num, rank++);
            }
        }

        for (int i = 0; i < arr.length; i++) {
            ans[i] = map.get(ans[i]);
        }

        return ans;
    }
}
```