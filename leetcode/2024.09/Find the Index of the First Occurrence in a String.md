# Find the Index of the First Occurrence in a String
Topic: KMP
```java
class Solution {
    public int strStr(String haystack, String needle) {

        char[] chs = needle.toCharArray();
        int[] kmp = new int[chs.length];
        int i = 0, j = 1;
        while (j < chs.length) {
            if (chs[i] == chs[j]) {
                kmp[j] = i + 1;
                j++;
                i++;
            } else if (i == 0) {
                kmp[j] = 0;
                j++;
            } else {
                i = kmp[i - 1];
            }
        }

        char[] chs2 = haystack.toCharArray();
        i = 0;
        j = 0;
        while (j < chs.length && i < chs2.length) {
            if (chs2[i] == chs[j]) {
                i++;
                j++;
            } else {
                if (j == 0) {
                    i++;
                } else {
                    j = kmp[j - 1];
                }
            }
        }

        return j == needle.length() ? i - j : -1;
    }
}
```