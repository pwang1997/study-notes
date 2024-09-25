# Reverse Linked List II
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
    int r = 0;
    ListNode rightNode = null;

    public ListNode reverseBetween(ListNode head, int left, int right) {
        r = right;
        ListNode dummy = new ListNode();
        dummy.next = head;

        ListNode prev = dummy;
        for (int i = 0; i < left - 1; i++) {
            prev = prev.next;
            r--;
        }

        ListNode cur = prev.next, temp = prev.next;

        ListNode newNext = reverse(cur);
        temp.next = rightNode;
        prev.next = newNext;

        return dummy.next;
    }

    ListNode reverse(ListNode head) {
        ListNode cur = head, prev = null;
        while (cur != null) {
            ListNode next = cur.next;
            cur.next = prev;
            prev = cur;
            cur = next;
            r--;
            if (next != null && r == 0) {
                rightNode = next;
                break;
            }
        }
        return prev;
    }
}
```