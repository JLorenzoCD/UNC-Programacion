import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind and listen in port 8080
s.bind(("localhost", 8080))
s.listen(5)

while True:
    c,a = s.accept()

    print(c, a)

    print (f"Connection from {a[0]}\n")

    res = f"Respondiendo a {a[0]}\n"
    c.send(res.encode("ascii"))
    c.close()