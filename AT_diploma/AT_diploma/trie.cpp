#include "trie.h"

trie::trie()
{
    root = new node();
    root->character = '\0';
    root->prefixes = 0;
    root->eow = false;
    for(int i=0;i<26;i++)
    {
        root->edge[i] = NULL;
    }
}
 
trie::~trie()
{
    truncate_node(root);
}
 
void trie::truncate_node(node* n)
{
    for(int i=0;i<26;i++)
    {
        if(n->edge[i] != NULL)
        {
            truncate_node(n->edge[i]);
        }
    }
    delete n;
}
 
void trie::insert_word(char* s)
{
    node *t = root;
    while(*s != '\0')
    {
        int c = toupper(*s) - 'A';
        if(t->edge[c] == NULL)
        {
            node* n = new node();
            n->character = *s;
            n->eow = false;
            n->prefixes = 1;
            for(int i=0;i<26;i++)
            {
                n->edge[i] = NULL;
            }
            t->edge[c] = n;
            t = n;
        }
        else
        {
            t = t->edge[c];
            t->prefixes++;
        }
        *s++;
    }
    t->eow = true;
}
 
bool trie::search_word(char* s)
{
    node *t = root;
    while(*s != '\0')
    {
        int c = toupper(*s) - 'A';
        if(t->edge[c] == NULL)
        {
            return false;
        }
        else
        {
            t = t->edge[c];
        }
        *s++;
    }
    if(t->eow == true)
        return true;
    else
        return false;
}
 
void trie::delete_word(char* s)
{
    node* t = root;
    while(*s != '\0')
    {
        int c = toupper(*s) - 'A';
        if(t->edge[c] == NULL)
        {
            return;
        }
        else if(t->edge[c]->prefixes == 1)
        {
            truncate_node(t->edge[c]);
            t->edge[c] = NULL;
            return;
        }
        else
        {
            t = t->edge[c];
        }
        *s++;
    }
}
 
void trie::display()
{
    preorder_display(root);
}
 
void trie::preorder_display(node* t)
{
    if(t == NULL)
        return;
 
    cout << "iterating :: " << t->character << " :: " << t->eow << " :: " << t->prefixes << endl;
 
    for(int i=0;i<26;i++)
    {
        if(t->edge[i] != NULL)
            preorder_display(t->edge[i]);
    }
}