```java
class Solution {
    public int evalRPN(String[] tokens) {
        int ans = 0;
        Stack<String> stack = new Stack<>();
        for(String token : tokens) {
            if(isOperator(token)) {
                int b = Integer.parseInt(stack.pop());
                int a = Integer.parseInt(stack.pop());
                int rsl = doOperator(a,b,token);
                stack.push(String.valueOf(rsl));
            } else {
                stack.push(token);
            }
        }

        return Integer.parseInt(stack.peek());
    }

    boolean isOperator(String str) {
        return str.equals("+") || str.equals("-") || str.equals("*") || str.equals("/");
    }

    int doOperator(int a, int b, String operator) {
        return switch(operator) {
            case "+" -> a+b;
            case "-" -> a-b;
            case "*" -> a*b;
            case "/" -> a/b;
            default -> 0;
        };
    }
}
```