#include <iostream>
#include <cctype>
using namespace std;
 
class trie
{
    private:
        struct node
        {
            char  character;       // character of the node
            bool  eow;             // indicates a complete word
            int   prefixes;        // indicates how many words have the prefix
            node* edge[26];        // references to all possible sons
        }*root;                        // trie root node
 
        void preorder_display(node *); // preorder display
        void truncate_node(node *);    // Deletes node and sub-nodes
        void delete_node(node *);      // Deletes node if prefixes is 1
 
    public:
        trie();                        // constructor
        ~trie();                       // destructor
 
        void insert_word(char *);      // to insert a word
        void delete_word(char *);      // to delete a word
        bool search_word(char *);      // to search a word
 
        void display();                // display complete trie
};