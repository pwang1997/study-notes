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
    public ListNode oddEvenList(ListNode head) {
        if (head == null || head.next == null || head.next.next == null) return head;
        ListNode evenHead = new ListNode(0), oddHead = new ListNode(0);
        ListNode odd = head;
        ListNode even = head.next;

        evenHead.next = even;
        oddHead.next = odd;

        int count = 1;

        head = head.next.next;

        while (head != null) {
            if (count % 2 == 1) {
                odd.next = head;
                odd = odd.next;
            } else {
                even.next = head;
                even = even.next;
            }
            count++;
            head = head.next;
        }
        even.next = null;
        odd.next = evenHead.next;

        return oddHead.next;
    }
}
```