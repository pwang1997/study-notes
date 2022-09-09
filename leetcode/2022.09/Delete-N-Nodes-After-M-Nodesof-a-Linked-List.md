## [1474. Delete N Nodes After M Nodes of a Linked List](https://leetcode.com/problems/delete-n-nodes-after-m-nodes-of-a-linked-list/)

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
    public ListNode deleteNodes(ListNode head, int m, int n) {
        ListNode dummy = new ListNode(-1, head);

        int mCount = m, nCount = n;
        while (head != null) {
            ListNode node = head;

            while (head != null && mCount != 0) {
                node = head;
                head = head.next;
                mCount--;
            }

            while (head != null && nCount != 0) {
                head = head.next;
                nCount--;
            }

            node.next = head;

            mCount = m;
            nCount = n;

        }

        return dummy.next;
    }
}
```