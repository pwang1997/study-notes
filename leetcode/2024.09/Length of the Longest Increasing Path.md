# Length of the Longest Increasing Path
Topic: Longest Increasing Subsequence
````java
class Solution {
    public int maxPathLength(int[][] arr, int k) {
        int[] itemK = arr[k];

        Arrays.sort(arr, (a, b) -> {
            if (a[0] == b[0]) return b[1] - a[1];
            return a[0] - b[0];
        });

        List<Integer> c1 = new ArrayList<>();
        List<Integer> c2 = new ArrayList<>();
        int n = arr.length;

        for (int i = 0; i < n; i++) {
            int x = arr[i][0], y = arr[i][1];
            if (x < itemK[0] && y < itemK[1]) {
                c1.add(y);
            }
            if (x > itemK[0] && y > itemK[1]) {
                c2.add(y);
            }
        }

        int[] dp = new int[n];
        int low = lis(c1, dp);
        int high = lis(c2, dp);
        return low + high + 1;
    }

    int lis(List<Integer> list, int[] dp) {
        int len = 0;
        for (int y : list) {
            int idxToUpsert = Arrays.binarySearch(dp, 0, len, y);
            if (idxToUpsert < 0) {
                idxToUpsert = -(idxToUpsert + 1);
            }

            dp[idxToUpsert] = y;
            if (idxToUpsert == len) {
                len++;
            }
        }
        return len;
    }
}
````