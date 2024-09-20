# Integer to Roman

```java
class Solution {
    public String intToRoman(int num) {
        int[] vals = {1000,900,500,400,100,90,50,40,10,9,5,4,1};
        String[] symbols = {"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"};

        StringBuffer sb = new StringBuffer();
        int i = 0;
        while(num > 0) {
            if(num < vals[i]) {
                i++;
            } else {
                sb.append(symbols[i]);
                num -= vals[i];
            }
        }

        return sb.toString();
    }
}
```
