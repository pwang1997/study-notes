## [445. Add Two Numbers II](https://leetcode.com/problems/add-two-numbers-ii/description/)

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
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        Stack<ListNode> s1 = new Stack<>();
        Stack<ListNode> s2 = new Stack<>();

        while(l1 != null) {
            s1.push(l1);
            l1 = l1.next;
        }
        
        while(l2 != null) {
            s2.push(l2);
            l2 = l2.next;
        }

        int carry = 0, sum = 0;
        ListNode cur = new ListNode();
        while(!s1.empty() || !s2.empty()) {
            if(!s1.empty()) sum += s1.pop().val;
            if(!s2.empty()) sum += s2.pop().val;

            carry = sum / 10;
            cur.val = sum % 10;
            ListNode head = new ListNode(carry);
            head.next = cur;
            cur = head;
            sum = carry;
        }

        return carry == 0 ? cur.next : cur;
    }
}

```