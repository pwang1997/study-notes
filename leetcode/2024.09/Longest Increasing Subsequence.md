# Longest Increasing Subsequence
```java
class Solution {
    public int lengthOfLIS(int[] nums) {
        // int max = 1;
        // int n = nums.length;

        // int[] dp = new int[n];
        // Arrays.fill(dp, 1);
        // for(int i = n-1; i >= 0; i--) {
        //     for(int j = i+1; j < n; j++) {
        //         if(nums[i] < nums[j]) {
        //             dp[i] = Math.max(dp[i], dp[j] + 1);
        //         }
        //     }
        //     max = Math.max(max, dp[i]);
        // }

        // return max;


        // nlogn solution with binary search 
        int n = nums.length;
        List<Integer> dp = new ArrayList<>();
        for (int num : nums) {
            int idxToUpsert = Collections.binarySearch(dp, num);
            if (idxToUpsert < 0) {
                idxToUpsert = -(idxToUpsert + 1);
            }

            if (idxToUpsert == dp.size()) {
                dp.add(num);
            } else {
                dp.set(idxToUpsert, num);
            }
        }

        return dp.size();
    }
}
```