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
    public int maxLevelSum(TreeNode root) {
        Queue<TreeNode> q = new LinkedList<>();
        q.offer(root);

        int level = 0, maxLevel = 0, maxSum = Integer.MIN_VALUE;
        while (q.peek() != null) {
            final int levelSize = q.size();
            level++;
            int levelSum = 0;
            for (int i = 0; i < levelSize; i++) {
                TreeNode node = q.poll();
                levelSum += node.val;
                if (node.left != null) q.offer(node.left);
                if (node.right != null) q.offer(node.right);
            }
            if (maxSum < levelSum) {
                maxSum = levelSum;
                maxLevel = level;
            }
        }

        return maxLevel;
    }
}
```