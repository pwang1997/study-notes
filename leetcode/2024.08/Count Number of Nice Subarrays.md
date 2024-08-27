```java
class Solution {
    public int numberOfSubarrays(int[] nums, int k) {
        int n = nums.length, count = 0, numOdd = 0;
        int l = 0, m = 0;

        for (int r = 0; r < n; r++) {
            if ((nums[r] & 1) == 1) {
                numOdd++;
            }
            while (numOdd > k) { // case: getting extra ones at [l, r], shift l to the right
                if ((nums[l] & 1) == 1) {
                    numOdd--;
                }
                l++;
                m = l;
            }

            if (k == numOdd) {
                while ((nums[m] & 1) == 0) { // remove the heading even numbers till l
                    m++;
                }
                count += (m - l) + 1;
            }
        }
        return count;
    }
}
```