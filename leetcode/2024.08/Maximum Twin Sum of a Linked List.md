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
    public int pairSum(ListNode head) {
        ListNode slow = head;
        ListNode fast = head;

        // traverse to the middle of the list
        int len = 1;
        while (fast != null && fast.next != null && fast.next.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            len++;
        }
        slow = slow.next;
        int[] arr = new int[len];
        // calculate twin sum
        int i = 0;
        while (i < len) {
            arr[len - i - 1] += slow.val;
            arr[i] += head.val;
            slow = slow.next;
            head = head.next;
            i++;
        }

        int max = Integer.MIN_VALUE;
        for (int sum : arr) {
            if (sum > max) {
                max = sum;
            }
        }
        return max;
    }
}
```