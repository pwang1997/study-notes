```java
class Solution {
    public int maxVowels(String s, int k) {
        boolean[] vowelMap = new boolean[26];
        vowelMap['a' - 'a'] = true;
        vowelMap['e' - 'a'] = true;
        vowelMap['i' - 'a'] = true;
        vowelMap['o' - 'a'] = true;
        vowelMap['u' - 'a'] = true;

        char[] chs = s.toCharArray();
        int count = 0, maxCount = 0, n = chs.length;

        for (int i = 0; i < k; i++) {
            if (vowelMap[chs[i] - 'a']) {
                count++;
            }
        }
        maxCount = Math.max(count, maxCount);

        for (int i = k; i < n; i++) {
            if (vowelMap[chs[i] - 'a'] && !vowelMap[chs[i - k] - 'a']) {
                count++;
                count = Math.min(k, count);
            } else if (!vowelMap[chs[i] - 'a'] && vowelMap[chs[i - k] - 'a']) {
                count--;
            }
            maxCount = Math.max(count, maxCount);
        }

        return maxCount;
    }
}
```