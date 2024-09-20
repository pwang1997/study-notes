# Different Ways to Add Parentheses

```java
class Solution {
    Map<Character, BiFunction<Integer, Integer, Integer>> operatorMap = Map.of('+', (a, b) -> a + b,
            '-', (a, b) -> a - b,
            '*', (a, b) -> a * b);
    List<Integer> list = new ArrayList<>();

    public List<Integer> diffWaysToCompute(String expression) {

        return backtrack(expression);
    }

    List<Integer> backtrack(String expression) {
        List<Integer> tmp = new ArrayList<>();

        for(int i = 0; i < expression.length(); i++) {
            char op = expression.charAt(i);

            if(operatorMap.containsKey(op)) {
                List<Integer> left = backtrack(expression.substring(0, i));
                List<Integer> right = backtrack(expression.substring(i+1));

                for(int leftNum : left) {
                    for(int rightNum : right) {
                        tmp.add(operatorMap.get(op).apply(leftNum, rightNum));
                    }
                }
            }
        }
        if(tmp.isEmpty()) {
            tmp.add(Integer.valueOf(expression));
        }
        return tmp;
    }
}
```
