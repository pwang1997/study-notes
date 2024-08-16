```java

class Solution {
    // public int maxOperations(int[] nums, int k) {
    //     Map<Integer, Integer> map = new HashMap<>();
    //     for(int num : nums) {
    //         map.put(num, map.getOrDefault(num, 0) + 1);
    //     }

    //     int count = 0;

    //     for(Integer key : map.keySet()) {
    //         int sub = k - key;
    //         if(sub <= 0) continue;
    //         if(sub == key) {
    //             count += (map.get(key) / 2);
    //         } else if(map.get(sub) != null) {
    //             count += Math.min(map.get(key), map.get(sub));
    //             map.put(sub, 0);
    //         }
    //         map.put(key, 0);
    //     }

    //     return count;
    // }

    public int maxOperations(int[] nums, int k) {
        int count = 0;
        Arrays.sort(nums);
        int i = 0 , j = nums.length - 1;

        while(i < j) {
            int sum = nums[i] + nums[j];
            if(sum == k) {
                count++;
                i++;
                j--;
            } else if(sum < k) {
                i++;
            } else {
                j--;
            }
        }
        return count;
    }
}
```