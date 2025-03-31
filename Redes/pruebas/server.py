import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind and listen in port 8080
s.bind(("localhost", 8080))
s.listen(5)

while True:
    conn,a = s.accept()

    print(conn, a)
    print (f"Connection from {a[0]}\n")

    peticion = conn.recv(1024)
    print(peticion.decode("ascii"))

    res = f"Respondiendo a {a[0]}\n"
    conn.send(res.encode("ascii"))
    conn.close()