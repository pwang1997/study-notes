## [216. Combination Sum III](https://leetcode.com/problems/combination-sum-iii/)

---

> Find all valid combinations of k numbers that sum up to n such that the following conditions are true:
> Only numbers 1 through 9 are used. Each number is used at most once. Return a list of all possible valid combinations.
> The list must not contain the same combination twice, and the combinations may be returned in any order.

#### Solution
DFS


```java
class Solution {
    public List<List<Integer>> combinationSum3(int k, int n) {
        List<List<Integer>> res = new ArrayList<>();
        LinkedList<Integer> comb = new LinkedList<>();
        
        process(n, k, comb, 0, res);
        
        return res;
    }
    
    void process(int remain, int k, LinkedList<Integer> comb, int index, List<List<Integer>> res) {
        if(remain == 0 && comb.size() == k) {
            res.add(new ArrayList<>(comb));
            return;
        } else if(remain < 0 || comb.size() == k) {
            return;
        }
        
        for(int i = index; i < 9; i++) {
            if(i + 1 <= remain) {
                comb.add(i + 1);
                process(remain - i -1, k, comb, i + 1, res);
                comb.removeLast();
            }

        }
    }
}
```