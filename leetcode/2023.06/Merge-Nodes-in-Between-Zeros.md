## [2181. Merge Nodes in Between Zeros](https://leetcode.com/problems/merge-nodes-in-between-zeros/)

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
    public ListNode mergeNodes(ListNode head) {
        ListNode dummy = new ListNode();
        dummy.next = head;

        while(head != null) {
            ListNode cur = head.next;
            while(cur != null && cur.val != 0) {
                head.val += cur.val;
                cur = cur.next;
            }
            if(cur != null) {
                head.next = cur.next;
            }

            head = head.next;
        }
        return dummy.next;
    }
}

```