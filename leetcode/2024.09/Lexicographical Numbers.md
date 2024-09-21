# Lexicographical Numbers
```java
class Solution {
    public List<Integer> lexicalOrder(int n) {
        List<Integer> ans = new ArrayList<>();

        helper(n, 0, ans);

        return ans;
    }

    void helper(int n, int curVal, List<Integer> list) {
        for(int i = 0; i <= 9; i++) {
            int nextVal = curVal * 10 + i;
            if(nextVal == 0) continue;
            if(nextVal > n) break;
            list.add(nextVal);
            helper(n, nextVal, list);
        }
    }
}
```