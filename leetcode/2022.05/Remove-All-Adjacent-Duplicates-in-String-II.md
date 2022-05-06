## [1209. Remove All Adjacent Duplicates in String II](https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/)

---

> You are given a string s and an integer k, a k duplicate removal consists of choosing k adjacent and equal letters 
> from s and removing them, causing the left and the right side of the deleted substring to concatenate together. 
> We repeatedly make k duplicate removals on s until we no longer can. 
> Return the final string after all such duplicate removals have been made. It is guaranteed that the answer is unique.

#### Solution

Although it iterates N time, the function StringBuilder.delete() also takes linear complexity to complete.

Time Complexity: O(N^2)

Space Complexity: O(N)

```java
class Solution {
    public String removeDuplicates(String s, int k) {
        StringBuilder sb = new StringBuilder(s);
        int[] counts = new int[s.length()]; 
        
        for(int i = 0; i < sb.length(); i++) {
            if(i == 0 || sb.charAt(i) != sb.charAt(i-1)) {
                counts[i] = 1;
            } else {
                counts[i] = counts[i-1] + 1;
                if(counts[i] == k) {
                    sb.delete(i - k + 1, i + 1);
                    i = i - k;
                }
            }
        }
        
        return sb.toString();
    }
}
```

#### Optimal Solution

Instead of deleting substrings from String s, this method memorizes the starting point of duplications, and operating on
char array.

Time Complexity: O(N)

Space Complexity: O(N)

```java
class Solution {
    public String removeDuplicates(String s, int k) {
        int n = s.length(), index = 0;
        int[] counts = new int[n];
        char[] chs = s.toCharArray();
        
        for(int i = 0; i < n; i++) {
            chs[index] = chs[i]; // memorize the starting point of duplication
            if(index == 0 || chs[index-1] != chs[index]) { // having a new starting character
                counts[index] = 1;
            } else { // having duplicates
                counts[index] = counts[index-1] + 1;
                if(counts[index] == k) {
                    index = index - k;
                }
            }
            index++;
        }
        
        return new String(chs, 0 , index);
    }
}

```