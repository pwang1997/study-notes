# Make Sum Divisible by P
```java
class Solution {
    public int minSubarray(int[] nums, int p) {
        int n = nums.length;
        int sum = 0;
        for (int num : nums) {
            sum = (sum + num) % p;
        }

        int target = sum % p;
        if (target == 0) return 0;

        Map<Integer, Integer> map = new HashMap<>();
        map.put(0, -1);

        int curSum = 0;
        int minLen = n;

        for (int i = 0; i < n; i++) {
            curSum = (curSum + nums[i]) % p;
            int needed = (curSum + p - target) % p;

            if (map.containsKey(needed)) {
                minLen = Math.min(minLen, i - map.get(needed));
            }

            map.put(curSum, i);
        }
        return minLen == n ? -1 : minLen;
    }
}
```