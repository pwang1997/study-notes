# Implement Trie (Prefix Tree)
Topic: Trie
```java
class Trie {
    class Node {
        Node[] children = new Node[26];
        boolean isEnd;
    }

    Node head;
    public Trie() {
        head = new Node();
    }
    
    public void insert(String word) {
        Node node = head;
        for(char ch : word.toCharArray()) {
            if(node.children[ch - 'a'] == null) {
                node.children[ch - 'a'] = new Node();
            }
            node = node.children[ch - 'a'];
        }
        node.isEnd = true;
    }
    
    public boolean search(String word) {
        Node node = head;
        for(char ch : word.toCharArray()) {
            if(node.children[ch - 'a'] == null) return false;
            node = node.children[ch - 'a'];
        }
        return node.isEnd;
    }
    
    public boolean startsWith(String prefix) {
        Node node = head;
        for(char ch : prefix.toCharArray()) {
            if(node.children[ch - 'a'] == null) return false;
            node = node.children[ch - 'a'];
        }
        return true;
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = new Trie();
 * obj.insert(word);
 * boolean param_2 = obj.search(word);
 * boolean param_3 = obj.startsWith(prefix);
 */
```