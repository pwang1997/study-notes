## [19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

---

> Given the head of a linked list, remove the nth node from the end of the list and return its head.

#### Solution

Two Pointer

Time Complexity: O(N)

Space Complexity: O(1)

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
    public ListNode removeNthFromEnd(ListNode head, int n) {

        ListNode pre = null, cur = head;

        while(cur != null) {
            n--;
            if(n == -1) {
                pre = head;
            } else if(n < -1) {
                pre = pre.next;
            }
            cur = cur.next;
        }

        if(n > 0) { // not enough node in the list
            return head;
        }

        if(pre == null) { // n == length
            return head.next;
        }

        pre.next = pre.next.next;

        return head;
    }
}
```