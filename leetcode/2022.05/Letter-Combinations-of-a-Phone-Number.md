## [17. Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)

---

> Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could 
> represent. Return the answer in any order. A mapping of digit to letters (just like on the telephone buttons) is 
> given below. Note that 1 does not map to any letters.

#### Solution

DFS

Time Complexity: O(N)

Space Complexity: O(N)


```java
class Solution {
    public static char[][] phone = {
        {'a','b','c'},
        {'d','e','f'},
        {'g','h','i'},
        {'j','k','l'},
        {'m','n','o'},
        {'p','q','r','s'},
        {'t','u','v'},
        {'w','x','y','z'}
    };
    public List<String> letterCombinations(String digits) {
        List<String> res = new ArrayList<>();
        if(digits == null || digits.length() == 0) return res;
        
        char[] chs = digits.toCharArray();
        char[] path = new char[chs.length];
        process(chs, 0, path, res);
        
        return res;
    }
    
    static void process(char[] digits, int index, char[] path, List<String> list) {
        if(index == path.length) {
            list.add(String.valueOf(path));
        } else {
            char[] cands = phone[digits[index] - '2'];
            for(char cur : cands) {
                path[index] = cur;
                process(digits, index + 1, path, list);
            }
        }
    }
}
```