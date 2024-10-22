import socket

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect(('127.0.0.1', 2241))

# Send a command to the server
client_socket.send(b'ls -l\n')

# Receive the output from the server
response = client_socket.recv(4096)
print(response.decode())

client_socket.close()
