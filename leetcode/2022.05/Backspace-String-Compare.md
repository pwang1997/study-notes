## [LeetCode 844. Backspace String Compare](https://leetcode.com/problems/backspace-string-compare/)

---

> Given two strings s and t, return true if they are equal when both are typed into empty text editors. 
> '#' means a backspace character. Note that after backspacing an empty text, the text will continue empty.

#### Solution

Time Complexity: O(s.length + t.length)

Space Complexity: O(s.length + t.length)

```java
class Solution {
    public boolean backspaceCompare(String s, String t) {
        String s1 = process(s);
        String t1 = process(t);
        
        return s1.equals(t1);
    }
    
    String process(String str) {
        Stack<Character> stack = new Stack<>();
        char[] chs = str.toCharArray();
        
        for(char c : chs) {
            if(c == '#') {
                if(!stack.isEmpty()) {
                    stack.pop();
                }
            } else {
                stack.push(c);
            }
        }
        
        StringBuilder sb = new StringBuilder();
        while(!stack.isEmpty()) {
            sb.append(stack.pop());
        }
        
        return sb.toString();
    }
}
```