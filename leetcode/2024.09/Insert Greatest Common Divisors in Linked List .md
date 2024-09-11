# Insert Greatest Common Divisors in Linked List
Topic: LinedList
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
    public ListNode insertGreatestCommonDivisors(ListNode head) {
        if (head.next == null) return head;

        ListNode prev = head, cur = head.next;

        while (cur != null) {
            ListNode insert = new ListNode(gcd(prev.val, cur.val));
            prev.next = insert;
            insert.next = cur;
            prev = cur;
            cur = cur.next;
        }

        return head;
    }

    int gcd(int a, int b) {
        if (a == 0) {
            return b;
        }

        return gcd(b % a, a);
    }
}
```