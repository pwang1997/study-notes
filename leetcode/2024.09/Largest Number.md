# Largest Number
```java
class Solution {
    public String largestNumber(int[] nums) {
        int n = nums.length;
        String[] arr = new String[n];

        int countZeros = 0;
        for (int i = 0; i < n; i++) {
            arr[i] = Integer.toString(nums[i]);
            if (nums[i] == 0) countZeros++;
        }

        if (countZeros == n) return "0";

        Arrays.sort(arr, (a, b) -> {
            String newA = a + b;
            String newB = b + a;
            for (int i = 0; i < newA.length(); i++) {
                if (newA.charAt(i) > newB.charAt(i)) return -1;
                else if (newA.charAt(i) < newB.charAt(i)) return 1;
            }

            return a.length() - b.length();
        });

        StringBuffer sb = new StringBuffer();
        for (String str : arr) {
            sb.append(str);
        }

        return sb.toString();
    }
}
```