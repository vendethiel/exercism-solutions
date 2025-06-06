#include "circular_buffer.h"

circular_buffer_t * new_circular_buffer(size_t capacity) {
    circular_buffer_t * buffer = malloc((sizeof *buffer) + (capacity * sizeof(buffer_value_t)));
    if (!buffer) return NULL;
    buffer->capacity = capacity;
    buffer->length = 0;
    buffer->offset = 0;
    return buffer;
}
int read(circular_buffer_t * buffer, buffer_value_t * value) {
    if (buffer->length <= 0) {
        errno = ENODATA;
        return EXIT_FAILURE;
    }
    *value = buffer->data[buffer->offset];
    buffer->offset = (buffer->offset + 1) % buffer->capacity;
    buffer->length--;
    return EXIT_SUCCESS;
}
int write(circular_buffer_t* buffer, buffer_value_t value) {
    if (buffer->length >= buffer->capacity) {
        errno = ENOBUFS;
        return EXIT_FAILURE;
    }
    size_t fst = (buffer->offset + buffer->length) % buffer->capacity;
    buffer->data[fst] = value;
    buffer->length++;
    return EXIT_SUCCESS;
}
int overwrite(circular_buffer_t* buffer, buffer_value_t value) {
    if (buffer->length < buffer->capacity)
        return write(buffer, value);
    size_t fst = (buffer->offset + buffer->length) % buffer->capacity;
    buffer->data[fst] = value;
    buffer->length = buffer->length >= buffer->capacity ? buffer->capacity : buffer->length + 1;
    buffer->offset = (buffer->offset + 1) % buffer->capacity;
    return EXIT_SUCCESS;
}
void clear_buffer(circular_buffer_t* buffer) {
    buffer->offset = 0;
    buffer->length = 0;
}
void delete_buffer(circular_buffer_t* buffer) {
    free(buffer);
}