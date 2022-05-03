## [LeetCode 279. Perfect Squares](https://leetcode.com/problems/perfect-squares/)

---

> Given an integer n, return the least number of perfect square numbers that sum to n. 
> A perfect square is an integer that is the square of an integer; in other words, it is the product of some 
> integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

#### Solution

Time Complexity: O(N^(height of N-ary tree/2))

Space Complexity: O(sqr(N) ^ height of N-ary tree)

```java
class Solution {
    public int numSquares(int n) {
        List<Integer> squareList = new ArrayList<>();
        for(int i = 1; i * i <= n; i++) {
            squareList.add(i * i);
        }
        
        Set<Integer> remainders = new HashSet<>();
        remainders.add(n);
        int level = 0;
        
        while(remainders.size() > 0) {
            level++;
            Set<Integer> nextLevelRemainders = new HashSet<>();
            
            for(Integer remainder : remainders) {
                for(Integer square : squareList) {
                    if(remainder.equals(square)) return level;
                    else if(remainder < square) break; // trim n-ary tree 
                    else nextLevelRemainders.add(remainder - square);
                }
            }
            remainders = nextLevelRemainders;
        }
        
        return level;
    }
}
```

