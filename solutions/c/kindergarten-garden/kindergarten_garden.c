#include "kindergarten_garden.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

const char* STUDENTS[] = {
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eve",
    "Fred",
    "Ginny",
    "Harriet",
    "Ileana",
    "Joseph",
    "Kincaid",
    "Larry",
    0
};

const char* PLANTS = "CGRV";

static int student_index(const char *student)
{
    for (int i = 0; STUDENTS[i]; ++i) {
        if (!strcmp(student, STUDENTS[i])) {
            return i;
        }
    }
    return -1;
}

static plant_t plant(const char c) {
    for (int i = 0; PLANTS[i]; ++i) {
        if (PLANTS[i] == c)
            return i;
    }
    exit(3);
}

plants_t plants(const char *diagram, const char *student)
{
    plants_t plants;
    int idx = student_index(student);
    if (idx == -1) {
        exit(1);
    }
    plants.plants[0] = plant(diagram[idx * 2]);
    plants.plants[1] = plant(diagram[idx * 2 + 1]);
    char* snd = strstr(diagram, "\n");
    if (!snd) {
        exit(2);
    }
    plants.plants[2] = plant(snd[idx * 2 + 1]);
    plants.plants[3] = plant(snd[idx * 2 + 2]);
    return plants;
}