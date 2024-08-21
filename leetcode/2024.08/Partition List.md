```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode partition(ListNode head, int x) {
        if (head == null || head.next == null) return head;

        ListNode lessHead = null, lessTail = null;
        ListNode largerHead = null, largerTail = null;

        if (head.val < x) {
            lessHead = head;
            lessTail = lessHead;
        } else {
            largerHead = head;
            largerTail = largerHead;
        }
        head = head.next;

        while (head != null) {
            if (head.val < x) {
                if (lessHead == null) {
                    lessHead = head;
                    lessTail = lessHead;
                } else {
                    lessTail.next = head;
                    lessTail = lessTail.next;
                }
            } else {
                if (largerHead == null) {
                    largerHead = head;
                    largerTail = largerHead;
                } else {
                    largerTail.next = head;
                    largerTail = largerTail.next;
                }
            }
            head = head.next;
        }

        if (lessHead == null) return largerHead;
        if (largerHead == null) return lessHead;

        largerTail.next = null;
        lessTail.next = largerHead;
        return lessHead;
    }
}
```