## [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

---

> You are given an array of k linked-lists lists, each linked-list is sorted in ascending order. 
> Merge all the linked-lists into one sorted linked-list and return it.

#### Solution

Min Heap

Time Complexity: O(N log k)

Space Complexity: O(log k)

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
    public ListNode mergeKLists(ListNode[] lists) {
        PriorityQueue<ListNode> minHeap = new PriorityQueue<>((n1, n2) -> n1.val - n2.val);
        for(ListNode node : lists) {
            if(node != null) {
                minHeap.add(node);
            }
        }

        if(minHeap.isEmpty()) {
            return null;
        }

        ListNode head = minHeap.poll();
        ListNode pre = head;

        if(pre.next != null) {
            minHeap.add(head.next);
        }

        while(!minHeap.isEmpty()) {
            ListNode cur = minHeap.poll();
            pre.next = cur;
            pre = pre.next;

            if(cur.next != null) {
                minHeap.add(cur.next);
            }
        }

        return head;
    }

}
```