#include "definitions.h"

typedef struct ConsStruct {
	void *value;
	struct ConsStruct *next;
} Cons;

Cons *cons_new();
Cons *cons_alloc();
Cons *cons_init();
void cons_delete(Cons *c);

void *head(Cons *c);
Cons *rest(Cons *c);

UInteger cons_length(Cons *c);
void *cons_get(Cons *c, UInteger index);
Cons *cons_join(Cons *c, void *value);

Cons *cons_reverse(Cons *c);
