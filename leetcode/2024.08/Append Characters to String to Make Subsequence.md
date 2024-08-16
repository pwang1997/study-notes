```java
class Solution {
    public int appendCharacters(String s, String t) {
        char[] chs = s.toCharArray(), cht = t.toCharArray();

        int j = 0;
        for(int i = 0; i < chs.length; i++) {
            if(j < cht.length && chs[i] == cht[j]) {
                j++;
            }
        }

        return cht.length - j;
    }
}
```