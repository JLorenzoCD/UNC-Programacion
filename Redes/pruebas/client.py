import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to host at port 8080 (http)
s.connect(("localhost",8080))

# Send byte stream
s.send(b"Hola\n")

# Receive byte data
data = s.recv(1024).decode("ascii")
print(data)

s.close()