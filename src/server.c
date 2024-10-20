#include <winsock2.h>
#include <stdio.h>
#include "panic.h"

// start is used to create a new socket server that accepts
// ssh requests and manages users commands.
int start(unsigned short port)
{
    struct sockaddr_in clinet; // clinet information
    struct sockaddr_in server; // server address information

    int ss; // a socket for accepting connections
    int ns; // a socket connected to client

    // get a socket for accepting connections
    if ((ss = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        panic("failed to open server socket");
    }

    // bind the socket for the server address
    server.sin_family = AF_INET;
    server.sin_port = htons(port);
    server.sin_addr.s_addr = INADDR_ANY;

    if (bind(ss, (struct sockaddr *)&server, sizeof(server)) < 0)
    {
        panic("failed to bind the server socket");
    }

    // listen for input connections
    if (listen(ss, 1) != 0)
    {
        panic("failed to listen for input connections");
    }
}
