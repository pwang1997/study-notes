## [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/)

> Given two strings s and t, return true if t is an anagram of s, and false otherwise.
> An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
> typically using all the original letters exactly once.
>
> <b>Examples:</b><br>
> Input: s = "anagram", t = "nagaram" <br>
> Output: true
>
> Input: s = "rat", t = "car"<br>
> Output: false

#### Solution

```java
class Solution {
    public boolean isAnagram(String s, String t) {
        if (s.length() != t.length())
            return false;
        int[] map = new int[26];
        char[] chS = s.toCharArray();
        for (char c : chS) {
            map[c - 'a']++;
        }
        char[] chT = t.toCharArray();
        for (char c : chT) {
            map[c - 'a']--;
        }
        for (int v : map) {
            if (v != 0)
                return false;
        }
        return true;
    }
}
```