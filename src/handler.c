// get the input type from user
// if it is by password, send your public key
// client sends a random string and password using public key encryption
// use that key to communicate.

// if it is by key
// get user key and look for matching in authorized_leys
// if matched, server sends a key using public key encryption
// client uses that to communicate
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
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
    // create two pipes
    int in_pipe[2], out_pipe[2];
    pid_t pid;

    if (pipe(in_pipe) == -1 || pipe(out_pipe) == -1)
    {
        fprintf(stderr, "failed to create pipes");
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
        // redirect stdin to in_pipe[0]
        dup2(in_pipe[0], STDIN_FILENO);
        // redirect stdout and stderr to out_pipe[1]
        dup2(out_pipe[1], STDOUT_FILENO);
        dup2(out_pipe[2], STDERR_FILENO);

        // close unused pipe ends
        close(in_pipe[1]);
        close(out_pipe[0]);

        // execute the shell
        execlp("sh", "sh", NULL);
    } else {
        char buffer[1024];
        ssize_t nbytes;

        // close unused pipe ends
        close(in_pipe[0]);
        close(out_pipe[1]);

        // read user inputs and write it to in_pipe[1]
        while((nbytes = read(ns, buffer, sizeof(buffer))) > 0) {
            write(in_pipe[1], buffer, nbytes);
        }

        // read from out_pipe[0] in to user socket
        while((nbytes = read(out_pipe[0], buffer, sizeof(buffer) - 1)) > 0) {
            write(ns, buffer, nbytes);
        }
    }
}
