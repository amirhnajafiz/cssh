// get the input type from user
// if it is by password, send your public key
// client sends a random string and password using public key encryption
// use that key to communicate.

// if it is by key
// get user key and look for matching in authorized_leys
// if matched, server sends a key using public key encryption
// client uses that to communicate
#include <winsock2.h>

// client handler accepts a user socket and begins the SSH logic.
void client_handler(int ns, int namelen, struct sockaddr *client) {

}
