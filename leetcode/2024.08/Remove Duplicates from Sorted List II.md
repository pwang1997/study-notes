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
    public ListNode deleteDuplicates(ListNode head) {
        if (head == null || head.next == null) return head;

        ListNode dummy = new ListNode(0);
        ListNode slow = dummy, fast = head;

        slow.next = fast;

        while (fast != null) {
            while (fast.next != null && fast.val == fast.next.val) {
                fast = fast.next;
            }

            if (slow.next != fast) { // duplicates detected, fast is one of the duplicates
                slow.next = fast.next;
                fast = slow.next;
            } else {
                slow = slow.next;
                fast = fast.next;
            }
        }
        return dummy.next;
    }
}
```