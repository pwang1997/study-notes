# Find the Longest Substring Containing Vowels in Even Counts
Topic: bitmask

The idea is to use bitmask as prefix of a string starting from 0 to i, where prefix needs to be removed to get even counts vowels.
i.e. "accc" => mask: 00001(has seen at pos=0), i = 4, res = 4 - 0 = 4;
```java
class Solution {
    // public int findTheLongestSubstring(String s) {
    //     int res = 0, mask = 0;
    //     Map<Integer, Integer> maskIdxMap = new HashMap<>(); // store the mask's occurance/index
    //     maskIdxMap.put(0, -1); // empty prefix of bitmask, so keep building non-vowels to the result. i.e. "dfgh"

    //     char[] chs = s.toCharArray();
    //     for(int i = 0; i < chs.length; i++) {
    //         if(isVowel(chs[i])) {
    //             mask = mask ^ (chs[i] - 'a' + 1);
    //         }

    //         if(maskIdxMap.containsKey(mask)) {
    //             res = Math.max(res, i -  maskIdxMap.get(mask));
    //         } else {
    //             maskIdxMap.put(mask, i);
    //         }
    //     }
    //     return res;
    // }
    // Optimized
    public int findTheLongestSubstring(String s) {
        int res = 0, mask = 0;
        int[] charMap = new int[26];
        charMap['a' - 'a'] = 1;
        charMap['e' - 'a'] = 2;
        charMap['i' - 'a'] = 4;
        charMap['o' - 'a'] = 8;
        charMap['u' - 'a'] = 16;

        int[] maskMap = new int[32];
        Arrays.fill(maskMap, -1); // default empty prefix of bitmask


        char[] chs = s.toCharArray();
        for (int i = 0; i < chs.length; i++) {
            mask = mask ^ charMap[chs[i] - 'a'];
            if (maskMap[mask] != -1 || mask == 0) {
                res = Math.max(res, i - maskMap[mask]);
            } else {
                maskMap[mask] = i;
            }
        }
        return res;
    }

    boolean isVowel(char c) {
        return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
    }
}


        
```