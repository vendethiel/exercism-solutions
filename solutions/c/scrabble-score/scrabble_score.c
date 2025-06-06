#include "scrabble_score.h"
#include <stdio.h>

unsigned int points[] = {
    1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1,1, 4, 4, 8, 4, 10
};

unsigned int score(const char *word) {
    unsigned int total = 0;
    for (; *word; ++word) {
        if (*word >= 'A' && *word <= 'Z')
            total += points[*word - 'A'];
        if (*word >= 'a' && *word <= 'z')
            total += points[*word - 'a'];
    }
    return total;
}