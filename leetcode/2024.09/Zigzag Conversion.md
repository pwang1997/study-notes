# Zigzag Conversion

```java
class Solution {
    public String convert(String s, int numRows) {
        char[] chs = s.toCharArray();
        int n = chs.length;

        StringBuffer[] sb = new StringBuffer[numRows];
        for(int i = 0; i < numRows; i++) {
            sb[i] = new StringBuffer();
        }

        int i = 0;
        while(i < n) {
            for(int idx = 0; idx < numRows && i < n; idx++) {
                sb[idx].append(chs[i++]);
            }
            for(int idx = numRows - 2; idx >= 1 && i < n; idx--) {
                sb[idx].append(chs[i++]);
            }
        }
        for(i = 1; i < numRows; i++) {
            sb[0].append(sb[i]);
        }

        return sb[0].toString();
    }
}

```
