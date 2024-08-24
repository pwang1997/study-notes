```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int longestZigZag(TreeNode root) {
        if (root == null) return 0;
        return Math.max(traverse(root.left, true, 1), traverse(root.right, false, 1));
    }

    int traverse(TreeNode node, boolean isLeft, int level) {
        if (node == null) return level - 1;

        if (isLeft) {
            return Math.max(traverse(node.right, false, level + 1), traverse(node.left, true, 1));
        } else {
            return Math.max(traverse(node.left, true, level + 1), traverse(node.right, false, 1));
        }
    }
}
```