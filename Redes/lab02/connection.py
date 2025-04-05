# encoding: utf-8
# Revisión 2019 (a Python 3 y base64): Pablo Ventura
# Copyright 2014 Carlos Bederián
# $Id: connection.py 455 2011-05-01 00:32:09Z carlos $
import time
import socket
from constants import *
from base64 import b64encode

from parser_commmand import ParserCommand
from command import Command, CommandQuit, CommandGetFileListing,  CommandGetMetaData, CommandGetSlice
from exceptions import BadEOLError, BadRequestError, InternalError, InvalidCommandError, InvalidArgsError, FileNotFoundError, BadOffSetError


class Connection(object):
    """
    Conexión punto a punto entre el servidor y un cliente.
    Se encarga de satisfacer los pedidos del cliente hasta
    que termina la conexión.
    """

    def __init__(self, socket: socket.socket, directory: str, addr_info: tuple[str, int]):
        self.conn = socket
        self.directory = directory
        self.addr_info = addr_info

        self.buffer = ""

        # Propiedad para saber si se debe recibir mas datos/comandos del cliente
        self.connected = True

    def _recv(self, timeout=None):
        """
        Recibe datos y acumula en el buffer interno.

        Para uso privado del cliente.
        """
        self.conn.settimeout(timeout)
        data = self.conn.recv(4096).decode("ascii")
        self.buffer += data

        if len(data) == 0:
            self.connected = False

    def read_line(self, timeout=None):
        """
        Espera datos hasta obtener una línea completa delimitada por el
        terminador del protocolo.

        Devuelve la línea, eliminando el terminador y los espacios en blanco
        al principio y al final.

        :raises BadRequestError: Se saturo el buffer
        """
        while not EOL in self.buffer and self.connected:
            if len(self.buffer) >= MAX_BUFFER_SIZE:
                raise BadRequestError("Buffer overflow")

            if timeout is not None:
                t1 = time.monotonic()
            self._recv(timeout)
            if timeout is not None:
                t2 = time.monotonic()
                timeout -= t2 - t1
                t1 = t2
        if EOL in self.buffer:
            response, self.buffer = self.buffer.split(EOL, 1)
            return response.strip()
        else:
            self.connected = False
            return ""

    def handle(self):
        """
        Atiende eventos de la conexión hasta que termina.
        """

        while self.connected:
            try:
                command = self.read_line(1500)

                if not self.connected or command == "":
                    break

                cmd = ParserCommand.parser(command)
                res, self.connected = cmd.execute(dir=self.directory)

                cmd.log(self.addr_info)

                self.conn.send(res)

            except (BadEOLError, BadRequestError, InternalError) as e:
                # Es un error fatal, por lo que se corta la conexión con el
                # cliente
                e.log()
                self.conn.send(e.get_res_error().encode('ascii'))

                self.connected = False

            except (InvalidCommandError, InvalidArgsError, FileNotFoundError, BadOffSetError) as e:
                # No es un error fatal, por lo que se sigue recibiendo comandos
                # del cliente

                e.log()
                self.conn.send(e.get_res_error().encode('ascii'))

            except Exception as e:
                # Algo desconocido sucedió, por lo que se corta la conexión
                # con el cliente
                print(e)

                self.connected = False

        self.conn.close()
