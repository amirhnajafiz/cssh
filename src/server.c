#include <stdbool.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include "handler.h"
#include "panic.h"

// server port
#define PORT 2241

int main()
{
    struct sockaddr_in server; // server address information

    int ss;              // a socket for accepting connections
    int cs;              // a socket connected to client
    socklen_t clientlen; // length of client name

    // get a socket for accepting connections
    if ((ss = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        panic("failed to open server socket");
    }

    // bind the socket for the server address
    memset(&server, 0, sizeof(server));
    server.sin_family = AF_INET;
    server.sin_port = htons(PORT);
    server.sin_addr.s_addr = INADDR_ANY;

    if (bind(ss, (struct sockaddr *)&server, sizeof(server)) < 0)
    {
        panic("failed to bind the server socket");
    }

    // listen for input connections
    if (listen(ss, 5) != 0) {
        panic("failed to listen for connections");
    }

    fprintf(stdout, "cssh server is running on port %d ...\n", PORT);

    // server while loop
    while (true)
    {
        // accept a connection
        struct sockaddr_in client; // clinet information
        clientlen = sizeof(client);

        if ((cs = accept(ss, (struct sockaddr *)&client, &clientlen)) == -1)
        {
            // close socket server before panicing
            close(ss);
            panic("failed to accept a client socket");
        }
        else
        {
            int pid = fork(); // create a new sub-process for each user
            if (pid == 0)
            {
                // in the child process, run the client handler function
                client_handler(cs, clientlen, &client);
                // close user socket after it is done
                close(cs);
            }
            else
            {
                fprintf(stdout, "client accepted\n");
            }
        }
    }

    return 0;
}
