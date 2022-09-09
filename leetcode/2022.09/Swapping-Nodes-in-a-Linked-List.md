## [1721. Swapping Nodes in a Linked List](https://leetcode.com/problems/swapping-nodes-in-a-linked-list/)

#### Solution

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
    public ListNode swapNodes(ListNode head, int k) {
        ListNode slow = head, fast = head;

        for (int i = 1; i < k; i++) {
            fast = fast.next;
        }
        ListNode end = fast;

        while (fast.next != null) {
            fast = fast.next;
            slow = slow.next;
        }

        int temp = slow.val;
        slow.val = end.val;
        end.val = temp;
        return head;
    }
}
```