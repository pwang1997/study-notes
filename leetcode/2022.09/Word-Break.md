## [139. Word Break](https://leetcode.com/problems/word-break/)

---

> Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated
> sequence of one or more dictionary words. Note that the same word in the dictionary may be reused multiple times in
> the segmentation.
>
> <b>Example:</b> <br>
> Input: s = "leetcode", wordDict = ["leet","code"] <br>
> Output: true <br>
> Explanation: Return true because "leetcode" can be segmented as "leet code".

#### Solution

```java
class Solution {
    public boolean wordBreak(String s, List<String> wordDict) {
        Boolean[] dp = new Boolean[s.length() + 1];
        return solve(s, wordDict, 0, dp);
    }

    boolean solve(String s, List<String> words, int index, Boolean[] dp) {
        if (index >= s.length()) {
            return true;
        }
        if (dp[index] != null) {
            return dp[index];
        }

        for (String word : words) {
            if (s.startsWith(word, index) && solve(s, words, index + word.length(), dp)) {
                dp[index] = true;
                return true;
            }
        }

        dp[index] = false;
        return false;
    }
}   
```