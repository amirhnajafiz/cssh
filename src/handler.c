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
void client_handler(int ns, int namelen, struct sockaddr *client) {
    char client_ip[INET_ADDRSTRLEN];
    int client_port;

    struct sockaddr_in client_info;
    int client_info_len = sizeof(client_info);

    // get peer data
    int result;
    if ((result = getpeername(client, (struct sockaddr*)&client_info, &client_info_len)) == SOCKET_ERROR) {
        fprintf(stderr, "failed to fetch client's data");
        return;
    }
    
    // fetch client ip and port data
    inet_ntop(AF_INET, &(client_info.sin_addr), client_ip, INET_ADDRSTRLEN);
    client_port = ntohs(client_info.sin_port);

    fprintf(stdout, "IP address is: %s\n", client_ip);
    fprintf(stdout, "port is: %d\n", client_port);
}
