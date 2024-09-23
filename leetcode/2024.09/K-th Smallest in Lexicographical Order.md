# K-th Smallest in Lexicographical Order
Topic: Trie
```java
class Solution {
    public int findKthNumber(int n, int k) {
        long curVal = 1;
        int count = 1;

        while (count < k) {
            int steps = count(curVal, n);
            if (count + steps <= k) {
                count += steps;
                curVal++; // move to the neighbour node
            } else {
                curVal *= 10; // move deeper to the subtree starting "curVal..."
                count++;
            }
        }
        return (int) curVal;
    }

    int count(long curVal, int n) {
        int res = 0;
        long neighbourVal = curVal + 1;
        while (curVal <= n) {
            res += Math.min(n + 1, neighbourVal) - curVal;
            curVal *= 10;
            neighbourVal *= 10;
        }

        return res;
    }
}
```