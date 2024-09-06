# Delete Nodes From Linked List Present in Array
Topic: LinkedList, HashSet
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
    public ListNode modifiedList(int[] nums, ListNode head) {
        ListNode dummy = new ListNode();
        dummy.next = head;
        ListNode prev = dummy;
        Set<Integer> set = new HashSet<>();
        for (int num : nums) {
            set.add(num);
        }

        while (head != null) {
            while (head != null && set.contains(head.val)) {
                head = head.next;
            }
            prev.next = head;
            prev = prev.next;
            if (head != null) {
                head = head.next;
            }
        }
        return dummy.next;
    }
}
```