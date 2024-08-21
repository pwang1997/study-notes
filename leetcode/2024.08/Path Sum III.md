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
    // int count = 0;
    // public int pathSum(TreeNode root, int targetSum) {
    //     if(root == null) return 0;

    //     pathSum(root, 0, targetSum);
    //     pathSum(root.left, targetSum);
    //     pathSum(root.right, targetSum);

    //     return count;
    // }

    // void pathSum(TreeNode node, long curSum, int targetSum) {
    //     if(node == null) return;

    //     curSum += node.val;
    //     if(curSum == targetSum) {
    //         count++;
    //     }

    //     pathSum(node.left, curSum, targetSum);
    //     pathSum(node.right, curSum, targetSum);
    // }

    int count = 0;
    Map<Long, Integer> map = new HashMap<>();

    public int pathSum(TreeNode root, int targetSum) {
        if (root == null) return 0;

        dfs(root, 0, targetSum);

        return count;
    }

    void dfs(TreeNode node, long prefixSum, int targetSum) {
        if (node == null) return;
        prefixSum += node.val;
        System.out.println(prefixSum);
        if (map.containsKey(prefixSum - targetSum)) {
            count += map.get(prefixSum - targetSum);
        }
        if (prefixSum == targetSum) {
            count++;
        }

        map.put(prefixSum, map.getOrDefault(prefixSum, 0) + 1);

        dfs(node.left, prefixSum, targetSum);
        dfs(node.right, prefixSum, targetSum);

        map.put(prefixSum, map.get(prefixSum) - 1);
    }
}
```