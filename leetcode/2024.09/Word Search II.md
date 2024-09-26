# Word Search II
```java
class Solution {
    class TrieNode {
        final int N = 26;
        TrieNode[] children = new TrieNode[N];
        String word;
    }

    class Trie {
        TrieNode head = new TrieNode();

        void insert(String word) {
            TrieNode node = head;
            for (char ch : word.toCharArray()) {
                if (node.children[ch - 'a'] == null) {
                    node.children[ch - 'a'] = new TrieNode();
                }
                node = node.children[ch - 'a'];
            }
            node.word = word;
        }
    }

    List<String> list = new ArrayList<>();

    public List<String> findWords(char[][] board, String[] words) {
        Trie trie = new Trie();
        for (String word : words) {
            trie.insert(word);
        }

        int m = board.length, n = board[0].length;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                TrieNode temp = trie.head;
                if (temp.children[board[i][j] - 'a'] != null) {
                    dfs(board, i, j, temp);
                }
            }
        }

        return list;
    }

    int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};

    void dfs(char[][] board, int i, int j, TrieNode node) {
        char ch = board[i][j];
        if (ch == '#' || node.children[ch - 'a'] == null) return;
        node = node.children[ch - 'a'];
        if (node.word != null) {
            list.add(node.word);
            node.word = null;
        }

        board[i][j] = '#';
        for (int[] dir : directions) {
            int x = i + dir[0];
            int y = j + dir[1];
            if (x >= board.length || y >= board[0].length || x < 0 || y < 0) continue;
            dfs(board, x, y, node);
        }

        board[i][j] = ch;

    }
}
```