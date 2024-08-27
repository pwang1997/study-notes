```java
class Solution {
    public int maxConsecutiveAnswers(String answerKey, int k) {
        char[] chs = answerKey.toCharArray();
        int maxF = 0, res = 0, count[] = new int[128];

        for (int i = 0; i < chs.length; i++) {
            maxF = Math.max(maxF, ++count[chs[i]]);
            if (res - maxF < k) {
                res++;
            } else {
                count[chs[i - res]]--;
            }
        }

        return res;
    }
}
```