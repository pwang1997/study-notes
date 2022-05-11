## [38. Count and Say](https://leetcode.com/problems/count-and-say/)

---

> The count-and-say sequence is a sequence of digit strings defined by the recursive formula:
> countAndSay(1) = "1 countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1), which is then converted into a different digit string.
To determine how you "say" a digit string, split it into the minimal number of groups so that each group is a contiguous section all of the same character. Then for each group, say the number of characters, then say the character. To convert the saying into a digit string, replace the counts with a number and concatenate every saying. 
> For example, the saying and conversion for digit string "3322251":


#### Solution

```java
class Solution {
    public String countAndSay(int n) {
         if(n < 1) return "";
        if(n == 1) return "1";
        
        char[] last = countAndSay(n -1).toCharArray();
        StringBuilder ans = new StringBuilder();
        int time = 1;
        for(int i = 1; i < last.length; i++) {
            if(last[i-1] ==last[i]) {
                time++;
            } else {
                ans.append(String.valueOf(time));
                ans.append(String.valueOf(last[i-1]));
                time = 1;
            }
        }
        ans.append(String.valueOf(time));
        ans.append(String.valueOf(last[last.length - 1]));
        return ans.toString();
    }
}
```