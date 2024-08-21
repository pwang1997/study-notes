```java

class Solution {
    public int[] asteroidCollision(int[] asteroids) {
        Stack<Integer> stack = new Stack<>();

        for(int asteroid : asteroids) {
            boolean isAlive = true;
            while(!stack.isEmpty() && asteroid < 0 && stack.peek() > 0) {
                if(stack.peek() < -asteroid) {
                    stack.pop();
                    continue;
                } else if(stack.peek() == -asteroid) {
                    stack.pop();
                }
                isAlive = false;
                break;
            }
            if(isAlive) {
                stack.push(asteroid);
            }
        }

        int[] ans = new int[stack.size()];
        int i = stack.size();
        while(!stack.isEmpty()) {
            ans[--i] = stack.pop();
        }

        return ans;
    }
}
```