// get the input type from user
// if it is by password, send your public key
// client sends a random string and password using public key encryption
// use that key to communicate.

// if it is by key
// get user key and look for matching in authorized_leys
// if matched, server sends a key using public key encryption
// client uses that to communicate
#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

// client handler accepts a user socket and begins the SSH logic.
void client_handler(int ns, socklen_t namelen, struct sockaddr *client)
{
    char address[INET_ADDRSTRLEN];

    // cast client to sockaddr_in to access the IPv4 address and port
    struct sockaddr_in *client_in = (struct sockaddr_in *)client;

    // convert IP address to human-readable form
    inet_ntop(AF_INET, &client_in->sin_addr, address, sizeof(address));

    fprintf(stdout, "IP address is: %s\n", address);
    fprintf(stdout, "port is: %d\n", ntohs(client_in->sin_port));

    // operations needed to open a shell
    int master_fd;
    pid_t pid;

    // create a pseudo-terminal
    if (forkpty(&master_fd, NULL, NULL, NULL) < 0)
    {
        fprintf(stderr, "failed to create pseduo-terminal");
        return;
    }

    // fork a child process to run shell
    pid = fork();
    if (pid < 0)
    {
        fprintf(stderr, "failed to create pseduo-terminal");
        return;
    }
    else if (pid == 0)
    {
        // child process: replace the current process with the shell
        execl("/bin/bash", "bash", (char *)NULL);
        fprintf(stderr, "failed to create pseduo-terminal");
        return;
    }

    // parent process handles communication between client and shell
    char buffer[256];
    ssize_t n;

    while (1)
    {
        // read from client and forward to the shell
        while ((n = read(ns, buffer, sizeof(buffer))) > 0)
        {
            write(master_fd, buffer, n);
        }

        // read from shell and forward to client
        while ((n = read(master_fd, buffer, sizeof(buffer))) > 0)
        {
            write(ns, buffer, n);
        }
    }
}
