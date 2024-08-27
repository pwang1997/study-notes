```java
class Solution {
    public int numOfSubarrays(int[] arr, int k, int threshold) {
        int l = 0, r = k - 1, n = arr.length;

        int count = 0, sum = 0;
        for (int i = 0; i < k; i++) sum += arr[i];
        while (r < n) {
            int avg = sum / k;
            if (avg >= threshold) {
                count++;
            }
            if (r + 1 >= n) break;
            sum += arr[++r];
            sum -= arr[l++];
        }
        return count;
    }
}
```