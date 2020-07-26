#include <stdio.h>
#include <stdlib.h>
#include "list.h"

void print(void *p) {
    puts((const char *)p);
}

int main(int argc, char *argv[]) {
    struct node *list = NULL;
    for (int i = 1; i < argc; i++) {
	push(&list, argv[i]);
    }
    push(&list, "not this one");
    printf("Popped %s\n", (const char *)pop(&list));
    traverse(&list, print);
    clear(&list);
    if (list)
	abort(); // check it was nulled out
    return 0;
}
