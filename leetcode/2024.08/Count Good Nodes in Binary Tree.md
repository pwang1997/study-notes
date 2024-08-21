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
    int count = 0;

    public int goodNodes(TreeNode root) {
        goodNodes(root, root.val);
        return count;
    }

    void goodNodes(TreeNode node, int x) {
        if (node == null) return;
        int max = Math.max(x, node.val);

        if (node.val >= x) {
            count++;
        }
        goodNodes(node.left, max);
        goodNodes(node.right, max);
    }
}
```