# Design Add and Search Words Data Structure
Topic: Trie
```java
class WordDictionary {
    class Node {
        Node[] children = new Node[26];
        boolean isEnd;
    }

    Node head;

    public WordDictionary() {
        head = new Node();
    }

    public void addWord(String word) {
        Node node = head;
        for (char ch : word.toCharArray()) {
            if (node.children[ch - 'a'] == null) {
                node.children[ch - 'a'] = new Node();
            }
            node = node.children[ch - 'a'];
        }
        node.isEnd = true;
    }

    public boolean search(String word) {
        Node node = head;

        return dfs(node, word.toCharArray(), 0);
    }

    boolean dfs(Node node, char[] chs, int start) {
        for(int i = start; i < chs.length; i++) {
            char ch = chs[i];
            if(ch == '.') {
                for(int j = 0; j < 26; j++) {
                    if(node.children[j] == null) continue;

                    if(dfs(node.children[j], chs, i + 1)) return true;
                }
                return false;
            } else {
                if(node.children[ch - 'a'] == null) return false;
                node = node.children[ch - 'a'];
            }
        }
        return node.isEnd;
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * WordDictionary obj = new WordDictionary();
 * obj.addWord(word);
 * boolean param_2 = obj.search(word);
 */
```