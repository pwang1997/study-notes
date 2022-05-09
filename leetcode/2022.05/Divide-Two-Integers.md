## [29. Divide Two Integers](https://leetcode.com/problems/divide-two-integers/)

---

> Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator. 
> The integer division should truncate toward zero, which means losing its fractional part. 
> For example, 8.345 would be truncated to 8, and -2.7335 would be truncated to -2. 
> Return the quotient after dividing dividend by divisor. 
> Note: Assume we are dealing with an environment that could only store integers within the 32-bit signed integer 
> range: [−231, 231 − 1]. For this problem, if the quotient is strictly greater than 231 - 1, then return 231 - 1, 
> and if the quotient is strictly less than -231, then return -231.

#### Solution

```java
class Solution {
    public int divide(int dividend, int divisor) {
        if(divisor == Integer.MIN_VALUE) {
            return dividend == Integer.MIN_VALUE ? 1 : 0;
        }
        
        if(dividend == Integer.MIN_VALUE) {
            if(divisor == negNum(1)) {
                return Integer.MAX_VALUE;
            }
            int res = div(add(dividend, 1), divisor);
            return add(res, div(minus(dividend, multi(res, divisor)), divisor));
        }
        return div(dividend, divisor);
    }
    
    public int add(int a, int b) {
        int sum = a;
        while(b != 0) {
            sum = a ^ b; // non-carry bits
            b = (a & b) << 1; // carry bits
            a = sum;
        }
        return sum;
    }
    
    public int negNum(int n) {
        return add(~n, 1);
    }
    
    public int minus(int a, int b) {
        // a - b = a + (-b) = a + (~b+1)
        return add(a, negNum(b));
    }
    
    public int multi(int a, int b) {
        int res = 0;
        while(b != 0) {
            if((b & 1) == 1) {
                res = add(res, a);
            }
            a <<= 1;
            b >>>= 1;
        }
        return res;
    }
    
    public boolean isNeg(int n) {
        return n < 0;
    }
    
    public int div(int a, int b) {
        int x = isNeg(a) ? negNum(a) : a;
        int y = isNeg(b) ? negNum(b) : b;
        int res = 0;
        for(int i = 31; i > negNum(1); i = minus(i, 1)) {
            if((x >> i) >= y) {
                res |= (1 << i);
                x = minus(x, y << i);
            }
        }
        return isNeg(a) ^ isNeg(b) ? negNum(res) : res;
    }
}
```