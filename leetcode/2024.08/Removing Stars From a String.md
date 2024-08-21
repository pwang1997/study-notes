```java

class Solution {
    public String removeStars(String s) {
        StringBuffer sb = new StringBuffer();
        
        for(char c : s.toCharArray()) {
            if(c == '*') {
                sb.deleteCharAt(sb.length() - 1);
            } else {
                sb.append(c);
            }
        }

        return sb.toString();
    }
}
```