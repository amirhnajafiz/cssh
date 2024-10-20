#include <stdio.h>
#include <strings.h>
#include "include/panic.h"
#include "server.h"

#define SCMD 1 // server command key
#define CCMD 2 // client command key
#define NCMD 3 // none command key

// create a new command type to store available commands
typedef struct
{
    char *key;
    int value;
} command;

// a map of commands and input strings
static command commands[] = {
    {"server", SCMD},
    {"client", CCMD}};

// number of command
#define NKEYS (sizeof(commands) / sizeof(command))

// key from map gets an input command and returns the key number
int key_from_map(char *key)
{
    for (int i = 0; i < NKEYS; i++)
    {
        command *cmd = &commands[i];
        if (strcmp(cmd->key, key) == 0)
            return cmd->value;
    }

    return NCMD;
}

// cmd function takes a running command and executes
// a callback function based on the input command.
void cmd(char **argv)
{
    switch (key_from_map(argv[1])) // command will be the first cli argument
    {
    case SCMD: // run a server socket instance on server command
        start(0);
        break;
    case CCMD:
        // run client
    default:
        panic("input command is not valid");
    }
}

int main(int argc, char **argv)
{
    // command line arguments should be at least 2
    if (argc < 2)
    {
        panic("too few input arguments");
    }

    // parse the user input command
    cmd(argv);
}
