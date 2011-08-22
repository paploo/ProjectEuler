#include <stdlib.h>
#include <assert.h>

#include "cons.h"

/*
 This is meant to act a lot like an Erlang list.  Each list's structure is
 immutable once created, but new head elements can be prepended onto an existing
 structure.  This allows sharing of a tail between multiple lists.  This also
 means that it is bad form to change a value in list.

 Note that, internally, we use a NULL value, NULL next Cons as the sentinal.
 All new lists are created with this, but the list length is zero.
*/


Cons *cons_init_with_value(Cons *c, void *value);

Cons *cons_new() {
	return cons_init( cons_alloc() );
}

Cons *cons_alloc() {
	return malloc( sizeof(Cons) );
}

Cons *cons_init(Cons *c) {
	c->value = NULL;
	c->next = NULL;
	return c;
}

void cons_delete(Cons *c) {
	if(c->next)
		cons_delete(c->next);
	free(c->value);
	free(c);
}

void *cons_head(Cons *c) {
	return c->value;
}

Cons *cons_rest(Cons *c) {
	return c->next;
}

UInteger cons_length(Cons *c) {
	UInteger l = 0;
	while( (c=c->next) ) 
		l++;
	return l;
}

void *cons_get(Cons *c, UInteger index) {
	UInteger i = 0;
	while(c->next) {
		if(i==index)
			return c->value;
		c = c->next;
		i++;
	}
	assert(false); //A hack to make sure we don't return a NULL.
	return NULL;
}

Cons *cons_join(Cons *c, void *value) {
	Cons *cNew = cons_new();
	cNew->value = value;
	cNew->next = c;
	return cNew;
}

Cons *cons_reverse(Cons *c) {
	Cons *cNew = cons_new();
	while( c->next ) {
		cNew = cons_join(cNew, c->value);
		c = c->next;
	}
	return cNew;
}


// #include <stdio.h>
// 
// int main(void) {
// 	Cons *c = cons_new();
// 	UInteger i = 3;
// 	UInteger j = 5;
// 	c = cons_join(c, &i);
// 	c = cons_join(c, &j);
// 
// 	printf("%llu\n", cons_length(c));
// 	
// 	UInteger *valuePtr = NULL;
// 	
// 	valuePtr = cons_get(c, 0);
// 	printf("%llu\n", *valuePtr );
// 	
// 	printf("%llu\n", *((UInteger *)cons_get(c,1)) );
// 
// 	printf("%llu\n", *((UInteger *)cons_get(c,2)) );
// }
