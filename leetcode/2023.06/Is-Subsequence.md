## [392. Is Subsequence](https://leetcode.com/problems/is-subsequence/description/)

#### Solution with Stack

```java

class Solution {
    public boolean isSubsequence(String s, String t) {
        char[] chs = s.toCharArray();
        char[] cht = t.toCharArray();

        Queue<Character> q = new LinkedList<>();
        for(char ch : chs) {
            q.add(ch);
        }

        for(char ch : cht) {
            if(q.peek() != null && ch == q.peek()) {
                q.poll();
            }
        }

        return q.peek() == null;
    }
}

```

#### Solution with two pointers

```java

class Solution {
    public boolean isSubsequence(String s, String t) {
        int s_i = 0;
        int t_i = 0;
        char[] s1 = s.toCharArray();
        char[] t1 = t.toCharArray();
        while(s_i < s1.length && t_i < t1.length) {
            if(t1[t_i++] == s1[s_i]) {
                s_i++;
            }
        }
        return s_i == s1.length;
    }
}

```