#!/usr/bin/env python
# encoding: utf-8
# Revisión 2019 (a Python 3 y base64): Pablo Ventura
# Revisión 2014 Carlos Bederián
# Revisión 2011 Nicolás Wolovick
# Copyright 2008-2010 Natalia Bidart y Daniel Moisset
# $Id: server.py 656 2013-03-18 23:49:11Z bc $

import optparse
import socket
import sys
from connection import Connection
from constants import *
from pathlib import Path
import threading


class Server(object):
    """
    El servidor, que crea y atiende el socket en la dirección y puerto
    especificados donde se reciben nuevas conexiones de clientes.
    """

    def __init__(self, addr=DEFAULT_ADDR, port=DEFAULT_PORT,
                 directory=DEFAULT_DIR):
        print("Serving %s on %s:%s." % (directory, addr, port))

        server_path = Path.cwd() / directory
        server_path.mkdir(exist_ok=True)

        self.directory = directory

        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.s.bind((addr, port))
        self.s.listen(5)

        self.active_connections = []  # Conexiones activas para hilos

    def serve(self):
        """
        Loop principal del servidor. Se acepta una conexión a la vez
        y se espera a que concluya antes de seguir.
        """
        exit = 0

        while True:
            try:
                conn_socket, addr_info = self.s.accept()
                thread = threading.Thread(
                    target=self.handle_client,
                    args=(conn_socket, addr_info)
                )
                thread.daemon = True
                thread.start()

                print(
                    "[CONECTION CLIENT] Activas:",
                    threading.active_count() - 1
                )
                print(
                    '[NEW CLIENT] Se abre una nueva conexión con el cliente:',
                    addr_info
                )
            except KeyboardInterrupt:
                print('\n Cerrando el servidor.')
                break
            except (RuntimeError, OSError) as e:
                print(
                    "[ERROR] No se pudo crear un nuevo "
                    f"hilo para {addr_info}: {e}"
                )
                conn_socket.close()
            except Exception as e:
                print('Error:', e)
                exit = 1
                break

        self.s.close()
        sys.exit(exit)

    def handle_client(self, conn_socket, addr_info):
        """
        Maneja la conexión con el cliente.
        :param conn_socket: socket de la conexión
        :param addr_info: información de la dirección del cliente
        """
        conn = Connection(conn_socket, self.directory, addr_info)

        self.active_connections.append(conn)
        conn.handle()
        self.active_connections.remove(conn)


def main():
    """Parsea los argumentos y lanza el server"""

    parser = optparse.OptionParser()
    parser.add_option(
        "-p", "--port",
        help="Número de puerto TCP donde escuchar", default=DEFAULT_PORT)
    parser.add_option(
        "-a", "--address",
        help="Dirección donde escuchar", default=DEFAULT_ADDR)
    parser.add_option(
        "-d", "--datadir",
        help="Directorio compartido", default=DEFAULT_DIR)

    options, args = parser.parse_args()
    if len(args) > 0:
        parser.print_help()
        sys.exit(1)
    try:
        port = int(options.port)
    except ValueError:
        sys.stderr.write(
            "Numero de puerto invalido: %s\n" % repr(options.port))
        parser.print_help()
        sys.exit(1)

    server = Server(options.address, port, options.datadir)
    server.serve()


if __name__ == '__main__':
    main()
