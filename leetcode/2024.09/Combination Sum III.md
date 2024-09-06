# Combination Sum III
Topic: Backtracking
```java
class Solution {
    List<List<Integer>> ans = new ArrayList<>();

    public List<List<Integer>> combinationSum3(int k, int n) {
        backtracking(new ArrayList<>(), 1, k, n);
        return ans;
    }

    void backtracking(List<Integer> list, int start, int k, int n) {
        if (list.size() == k && n == 0) {
            ans.add(new ArrayList<>(list));
            return;
        }

        for (int i = start; i <= 9; i++) {
            list.add(i);
            backtracking(list, i + 1, k, n - i);
            list.remove(list.size() - 1);
        }
    }
}

```