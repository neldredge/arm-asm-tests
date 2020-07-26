#ifndef LIST_H
#define LIST_H

struct node {
  struct node *next;
  void *contents;
};

void push(struct node **head, void *contents);
void *pop(struct node **head);
void traverse(struct node **head, void (*op)(void *));
void clear(struct node **head);

#endif
