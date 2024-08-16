```java
class Solution {
    public int compress(char[] chars) {
        if (chars.length == 1) {
            return 1;
        }

        int n = chars.length, idx = 1, count = 1;

        for (int i = 1; i < n; i++) {
            if (chars[i] == chars[i - 1]) {
                count++;
            } else {
                if (count > 1) {
                    String str = String.valueOf(count);
                    for (char c : str.toCharArray()) {
                        chars[idx++] = c;
                    }
                }
                chars[idx++] = chars[i];
                count = 1;
            }
        }

        if (count > 1) {
            String str = String.valueOf(count);
            for (char c : str.toCharArray()) {
                chars[idx++] = c;
            }
        }

        return idx;

    }
}
```