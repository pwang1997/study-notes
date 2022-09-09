## [1472. Design Browser History](https://leetcode.com/problems/design-browser-history/)

#### Solution

```java
class BrowserHistory {
    private class Node {
        Node prev;
        Node next;
        String val;

        public Node(String val) {
            this.val = val;
        }
    }

    private Node head;
    private Node curr;
    private Node tail;

    public BrowserHistory(String homepage) {
        head = new Node(homepage);
        curr = head;
        tail = curr;
    }

    public void visit(String url) {
        Node prev = curr;
        curr.next = new Node(url);
        curr = curr.next;
        curr.prev = prev;
        tail = curr;
    }

    public String back(int steps) {
        int stepsTaken = 0;
        while (stepsTaken < steps && curr != head) {
            curr = curr.prev;
            stepsTaken++;
        }
        return curr.val;
    }

    public String forward(int steps) {
        int stepsTaken = 0;
        while (stepsTaken < steps && curr != tail) {
            curr = curr.next;
            stepsTaken++;
        }
        return curr.val;
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * BrowserHistory obj = new BrowserHistory(homepage);
 * obj.visit(url);
 * String param_2 = obj.back(steps);
 * String param_3 = obj.forward(steps);
 */
```