## [1641. Count Sorted Vowel Strings](https://leetcode.com/problems/count-sorted-vowel-strings/)

---

> Given an integer n, return the number of strings of length n that consist only of vowels (a, e, i, o, u) and are lexicographically sorted. 
> A string s is lexicographically sorted if for all valid i, s[i] is the same as or comes before s[i+1] in the alphabet.

#### Solution

```java
class Solution {
    public int countVowelStrings(int n) {
        if(n == 1) return 5;
        
        int[][] dp = new int[n+1][6];
        for(int i = 1; i <= 5; i++) 
            dp[1][i] = i;
        
        
        for(int i = 2; i <= n; i++) {
            dp[i][1] = 1;
            for(int j = 2; j <= 5; j++) {
                dp[i][j] = dp[i][j-1] + dp[i-1][j];
            }
        }
        
        return dp[n][5];
    }
}
```