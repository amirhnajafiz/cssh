#include <stdio.h>

#include "panic.h"

int main(int argc, char **argv) {
    // command line arguments should be at least 2
    if (argc < 2) {
        panic("too few input arguments");
    }

    // parse the user input command
}