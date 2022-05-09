## [22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)

---

> Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

#### Solution

DFS


```java
class Solution {
    public List<String> generateParenthesis(int n) {
        char[] path = new char[n << 1];
        
        List<String> ans = new ArrayList<>();
        process(path, 0, 0, n, ans);
        
        return ans;
    }
    
    void process(char[] path, int index, int leftMinusRight, int leftRest, List<String> ans) {
        if(index == path.length) {
            ans.add(String.valueOf(path));
        } else {
            if(leftRest > 0) {
                path[index] = '(';
                process(path, index + 1, leftMinusRight + 1, leftRest - 1, ans);
            }
            
            if(leftMinusRight > 0) {
                path[index] = ')';
                process(path, index + 1, leftMinusRight - 1, leftRest, ans);
            }
        }
    }
}
```