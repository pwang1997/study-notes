# Minimum Flips to Make a OR b Equal to c
Topic: bitwise operation
```java
class Solution {
    public int minFlips(int a, int b, int c) {
        int count = 0;

        while (a > 0 || b > 0 || c > 0) {
            if ((a | b) == c) return count;

            int a1 = a & 1;
            int b1 = b & 1;
            int c1 = c & 1;

            if (c1 == 0) {
                if (a1 == 1) count++;
                if (b1 == 1) count++;
            } else {
                if (a1 == b1 && a1 == 0) count++;
            }
            a >>>= 1;
            b >>>= 1;
            c >>>= 1;
        }

        return count;
    }
}
```