## [2130. Maximum Twin Sum of a Linked List](https://leetcode.com/problems/maximum-twin-sum-of-a-linked-list/description/)

#### Solution with stack

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
        ListNode slow = head, fast = head;

        while(fast.next != null && fast.next.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }

        Stack<ListNode> stack = new Stack<>();
        while(slow != null) {
            stack.push(slow);
            slow = slow.next;
        }

        int max = Integer.MIN_VALUE;

        while(!stack.isEmpty()) {
            ListNode tail = stack.pop();
            max = head.val + tail.val > max ? head.val + tail.val : max;
            head = head.next;
        }

        return max;
    }
}

```

#### Solution with node reversion

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
        while(fast != null && fast.next != null && fast.next.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            len++;
        }
        slow = slow.next;
        int[] arr = new int[len];
        // calculate twin sum
        int i = 0;
        while(i < len) {
            arr[len-i-1] += slow.val;
            arr[i] += head.val;
            slow = slow.next;
            head = head.next;
            i++;
        }
        
        int max = Integer.MIN_VALUE;
        for(int sum : arr) {
            if(sum > max) {
                max = sum;
            }
        }
        return max;
    }
}

```