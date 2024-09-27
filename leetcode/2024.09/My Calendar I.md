# My Calendar I
```java
//TreeMap/Segment Tree Solution
class MyCalendar {
    TreeMap<Integer, Integer> treeMap;

    public MyCalendar() {
        treeMap = new TreeMap<>();
    }

    public boolean book(int start, int end) {
        Integer prev = treeMap.floorKey(start),
                next = treeMap.ceilingKey(start);

        if ((prev == null || treeMap.get(prev) <= start) && (next == null || end <= next)) {
            treeMap.put(start, end);
            return true;
        }

        return false;
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * MyCalendar obj = new MyCalendar();
 * boolean param_1 = obj.book(start,end);
 */

```

```java
// Binary Tree Solution
class MyCalendar {
    class Node {
        int start;
        int end;
        Node prev, next;
        Node(int start, int end) {
            this.start = start;
            this.end = end;
        }
    }

    Node root;
    public MyCalendar() {
        
    }
    
    public boolean book(int start, int end) {
        if(root == null) {
            root = new Node(start, end);
            return true;
        }

        Node node = root;
        while(node != null) {
            if(end <= node.start) {
                if(node.prev == null) {
                    node.prev = new Node(start, end);
                    return true;
                }
                node = node.prev;
            } else if(start >= node.end) {
                if(node.next == null) {
                    node.next = new Node(start, end);
                    return true;
                }
                node = node.next;
            } else {
                return false;
            }
        }
        return false;
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * MyCalendar obj = new MyCalendar();
 * boolean param_1 = obj.book(start,end);
 */
```