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
    public ListNode rotateRight(ListNode head, int k) {
        if(head == null || head.next == null || k == 0) return head;
        ListNode prevHead = head, prevTail = null;
        int count = 1;

        while(head.next != null) {
            head = head.next;
            count++;
        }
        prevTail = head;

        k = k % count; // remove extra loops
        k = count - k; // k + k' = count
        if(k == count) { // rotate to origin pos
            return prevHead;
        }

        ListNode newHead = prevHead, tmpHead = prevHead;
        while(--k > 0) {
            tmpHead = tmpHead.next;
        }
        newHead = tmpHead.next;
        tmpHead.next = null;

        prevTail.next = prevHead;
        return newHead;
    }
}
```