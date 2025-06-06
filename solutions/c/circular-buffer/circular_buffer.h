#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

#include <stdlib.h>
#include <stdbool.h>
#include <errno.h>

typedef int buffer_value_t;

typedef struct circular_buffer_s {
    size_t capacity;
    size_t length;
    size_t offset;
    buffer_value_t data[];
} circular_buffer_t;

circular_buffer_t* new_circular_buffer(size_t);
int read(circular_buffer_t*, buffer_value_t*);
int write(circular_buffer_t*, int);
int overwrite(circular_buffer_t*, int);
void clear_buffer(circular_buffer_t*);
void delete_buffer(circular_buffer_t*);

#endif
