# Guess Number Higher or Lower
topic: Integer overflow, binary search
```java
/**
 * Forward declaration of guess API.
 * @param  num   your guess
 * @return         -1 if num is higher than the picked number
 *			      1 if num is lower than the picked number
 *               otherwise return 0
 * int guess(int num);
 */

public class Solution extends GuessGame {
    public int guessNumber(int n) {
        int ans = -1;

        int l = 1, r = n;
        while (l <= r) {
            int m = l + (r - l) / 2;
            int guess = super.guess(m);
            if (guess == 0) return m;
            if (guess == -1) {
                r = m - 1;
            } else {
                l = m + 1;
            }
        }

        return ans;
    }
}
```