#include <stdio.h>
#include <stdlib.h>

// panic micor is called to terminate the program with an error message.
void panic(const char *message) {
    fprintf(stderr, "Panic: %s\n", message);
    exit(1);
}
