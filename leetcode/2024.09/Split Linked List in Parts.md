# Split Linked List in Parts
Topic: LinkedList
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
    public ListNode[] splitListToParts(ListNode head, int k) {
        ListNode[] ans = new ListNode[k];

        ListNode node = head;

        int count = 0;
        while(head != null) {
            head = head.next;
            count++;
        }
        
        ListNode prev = null;
        int div = count / k, mod = count % k;
        for(int i = 0; node != null && i < k; i++, mod--) {
            ans[i] = node;
            for(int j = 0; j < (div + (mod > 0 ? 1 : 0)); j++) {
                prev = node;
                node = node.next;
            }
            if(prev != null) {
                prev.next = null;
            }
        }

        return ans;

    }
}
```