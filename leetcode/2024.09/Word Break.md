# Word Break
Topic: Trie
```java
class Solution {
    class TrieNode {
        TrieNode[] children = new TrieNode[26];
        boolean isEnd = false;
    }

    class Trie {
        TrieNode root = new TrieNode();
        boolean[] memo = new boolean[301];

        void insert(String word) {
            TrieNode node = root;
            char[] chs = word.toCharArray();
            for (int i = 0; i < chs.length; i++) {
                char ch = chs[i];
                if (node.children[ch - 'a'] == null) {
                    node.children[ch - 'a'] = new TrieNode();
                }
                node = node.children[ch - 'a'];
            }
            node.isEnd = true;
        }

        boolean isExists(String word, int cur) {
            TrieNode node = root;
            char[] chs = word.toCharArray();
            if (cur == chs.length) return true;
            if (memo[cur]) return false;

            for (int i = cur; i < chs.length; i++) {
                char ch = chs[i];
                if (node.children[ch - 'a'] != null) {
                    node = node.children[ch - 'a'];
                    if (node.isEnd && isExists(word, i + 1)) {
                        return true;
                    }
                } else {
                    break;
                }
            }
            memo[cur] = true;

            return false;
        }
    }


    public boolean wordBreak(String s, List<String> wordDict) {
        Trie trie = new Trie();
        for (String word : wordDict) {
            trie.insert(word);
        }

        return trie.isExists(s, 0);

    }
}
```