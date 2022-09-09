## [1836. Remove Duplicates From an Unsorted Linked List](https://leetcode.com/problems/remove-duplicates-from-an-unsorted-linked-list/)

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
    public ListNode deleteDuplicatesUnsorted(ListNode head) {
        Map<Integer, Integer> seen = new HashMap<>();

        ListNode tmp = head;
        while (tmp != null) {
            seen.put(tmp.val, seen.getOrDefault(tmp.val, 0) + 1);
            tmp = tmp.next;
        }

        ListNode dummy = new ListNode(-1, head);
        ListNode prev = dummy, cur = head;
        while (cur != null) {
            if (seen.get(cur.val) > 1) {
                prev.next = cur.next;
            } else {
                prev = prev.next;
            }
            cur = cur.next;
        }

        return dummy.next;
    }
}
```