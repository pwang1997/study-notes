# Design a Stack With Increment Operation
```java
class CustomStack {
    int capacity = -1;
    int peekIdx = -1;
    int[] stack = null;
    public CustomStack(int maxSize) {
        this.capacity = maxSize;
        this.stack = new int[maxSize];
        Arrays.fill(stack, -1);
    }
    
    public void push(int x) {
        if(peekIdx >= capacity - 1) {
            return;
        }

        stack[++peekIdx] = x;
    }
    
    public int pop() {
        if(peekIdx < 0) return -1;

        int item = stack[peekIdx];
        stack[peekIdx] = -1;
        peekIdx--;
        return item;
    }
    
    public void increment(int k, int val) {
        if(peekIdx < k) {
            for(int i = 0; i <= peekIdx; i++) {
                stack[i]+=val;
            }
        } else {
            for(int i = 0 ; i < k; i++) {
                stack[i] += val;
            }
        }
    }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * CustomStack obj = new CustomStack(maxSize);
 * obj.push(x);
 * int param_2 = obj.pop();
 * obj.increment(k,val);
 */
```