## [LeetCode 102. Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)

---

> Given the root of a binary tree, return the level order traversal of its nodes' values. 
> (i.e., from left to right, level by level).

#### Solution

BFS

Time Complexity: O(N)

Space Complexity: O(N)

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
    public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>> list = new ArrayList<>();
        if(root == null) return list;
        
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        
        while(!queue.isEmpty()) {
            int size2Poll = queue.size();            
            List<Integer> res = new ArrayList<>();

            for(int i = 0; i < size2Poll; i++) {
                TreeNode node = queue.poll();
                res.add(node.val);
                
                if(node.left != null) queue.add(node.left);
    
                if(node.right != null) queue.add(node.right);
            }

            list.add(res);
        }
        
        return list;
    }
}
```