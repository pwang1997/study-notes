## [14. Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)

---

> Write a function to find the longest common prefix string amongst an array of strings. 
> If there is no common prefix, return an empty string "".

#### Solution

Time Complexity: O(N)

Space Complexity: O(N)
```java
class Solution {
    public String longestCommonPrefix(String[] strs) {
        char[] chs = strs[0].toCharArray();
        int min = Integer.MAX_VALUE;

        for(String str : strs) {
            char[] temp = str.toCharArray();
            int index = 0;
            while(index < chs.length && index < temp.length) {
                if(chs[index] != temp[index]) {
                    break;
                }
                index++;
            }
            min = Math.min(min, index);
            if(min == 0) return "";
        }

        return new String(chs, 0, min);
    }
}
```