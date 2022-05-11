## [44. Wildcard Matching](https://leetcode.com/problems/wildcard-matching/)

---

> Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*' where:
> '?' Matches any single character.
> '*' Matches any sequence of characters (including the empty sequence).
> The matching should cover the entire input string (not partial).

#### Solution

```java
class Solution {
    public boolean isMatch(String s, String p) {
        char[] chs = s.toCharArray();
        char[] chp = p.toCharArray();

        int N = s.length();
        int M = p.length();
        boolean[][] dp = new boolean[N + 1][M + 1];

        dp[N][M] = true;

        for (int i = M - 1; i >= 0; i--) {
            dp[N][i] = chp[i] == '*' && dp[N][i + 1];
        }

        for (int si = N - 1; si >= 0; si--) {
            for (int pi = M - 1; pi >= 0; pi--) {
                if (chp[pi] != '?' && chp[pi] != '*') {
                    dp[si][pi] = chs[si] == chp[pi] && dp[si + 1][pi + 1];
                    continue;
                }
                if (chp[pi] == '?') {
                    dp[si][pi] = dp[si + 1][pi + 1];
                    continue;
                }

                for (int len = 0; len <= N - si; len++) {
                    if (dp[si + len][pi + 1]) {
                        dp[si][pi] = true;
                        break;
                    }
                }
            }
        }


        return dp[0][0];
    }

    boolean isMatch(char[] s, char[] p, int si, int pi) {
        if (si == s.length) {
            if (pi == p.length) {
                return true;
            } else {
                return p[pi] == '*' && isMatch(s, p, si, pi + 1);
            }
        }

        if (pi == p.length) {
            return false;
        }

        if (p[pi] != '?' && p[pi] != '*') {
            return s[si] == p[pi] && isMatch(s, p, si + 1, pi + 1);
        }

        if (p[pi] == '?') {
            return isMatch(s, p, si + 1, pi + 1);
        }

        for (int len = 0; len <= s.length - si; len++) {
            if ((isMatch(s, p, si + len, pi + 1))) {
                return true;
            }
        }

        return false;
    }
}
```

#### Optimal Solution
```java
class Solution {
    public boolean isMatch(String s, String p) {
        char[] chs = s.toCharArray();
        char[] chp = p.toCharArray();
        
        int N = s.length();
        int M = p.length();
        boolean[][] dp = new boolean[N+1][M+1];
        
        dp[N][M] = true;
        
        for(int i = M-1; i >= 0; i--) {
            dp[N][i] = chp[i] == '*' && dp[N][i+1];
        }
        
        for(int si = N -1; si >= 0; si--) {
            for(int pi = M - 1; pi >= 0; pi--) {
                if(chp[pi] != '?' && chp[pi] != '*') {
                    dp[si][pi] =  chs[si] == chp[pi] && dp[si + 1][pi + 1];
                    continue;
                } 
                if(chp[pi] == '?') {
                    dp[si][pi] = dp[si+1][pi+1];
                    continue;
                }
                
                dp[si][pi] = dp[si+1][pi] || dp[si][pi+1];
            }
        }
        
        
        return dp[0][0];
    }
}
```