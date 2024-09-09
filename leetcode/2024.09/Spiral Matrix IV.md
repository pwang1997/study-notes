# Spiral Matrix IV
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
    public int[][] spiralMatrix(int m, int n, ListNode head) {
        int[][] ans = new int[m][n];

        for (int[] arr : ans) {
            Arrays.fill(arr, -1);
        }

        int topRow = 0, bottomRow = m - 1, leftCol = 0, rightCol = n - 1;
        while (head != null) {
            for (int j = leftCol; j <= rightCol && head != null; j++) {
                ans[topRow][j] = head.val;
                head = head.next;
            }
            topRow++;

            for (int i = topRow; i <= bottomRow && head != null; i++) {
                ans[i][rightCol] = head.val;
                head = head.next;
            }
            rightCol--;

            for (int j = rightCol; j >= leftCol && head != null; j--) {
                ans[bottomRow][j] = head.val;
                head = head.next;
            }
            bottomRow--;

            for (int i = bottomRow; i >= topRow && head != null; i--) {
                ans[i][leftCol] = head.val;
                head = head.next;
            }
            leftCol++;
        }
        return ans;
    }
}
```