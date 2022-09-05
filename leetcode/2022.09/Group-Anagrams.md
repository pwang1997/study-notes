## [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/)

---

> Given an array of strings strs, group the anagrams together. You can return the answer in any order.
> An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
> typically using all the original letters exactly once.
>
> <b>Example:</b><br>
> Input: strs = ["eat","tea","tan","ate","nat","bat"] <br>
> Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

#### Solution

```java
class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        if (strs.length == 0) return new ArrayList<>();
        Map<String, List> res = new HashMap<>();
        for (String s : strs) {
            char[] chs = s.toCharArray();
            Arrays.sort(chs);
            String key = String.valueOf(chs);
            if (!res.containsKey(key)) res.put(key, new ArrayList());
            res.get(key).add(s);
        }
        return new ArrayList(res.values());
    }
}
```