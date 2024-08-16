```java

class Solution {
    public String simplifyPath(String path) {
        StringBuffer sb = new StringBuffer();
        sb.append("/");

        String[] p = path.split("\\/+");

        Deque<String> dq = new LinkedList<>();

        for (String str : p) {
            if (str.equals(".")) {
                continue;
            } else if (str.equals("..")) {
                dq.pollLast();
            } else if (!str.isBlank()) {
                dq.addLast(str);
            }
        }

        while (dq.peek() != null) {
            sb.append(dq.removeFirst());
            if (dq.peek() != null) {
                sb.append("/");
            }
        }

        return sb.toString();
    }
}

```