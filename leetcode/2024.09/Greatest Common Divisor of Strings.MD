```java
class Solution {
    public String gcdOfStrings(String s, String t) {
        if (!(s + t).equals(t + s)) {
            return "";
        }

        int gcdLength = gcd(s.length(), t.length());
        return s.substring(0, gcdLength);
    }

    int gcd(int x, int y) {
        if (y == 0) return x;
        return gcd(y, x % y);
    }
}
```