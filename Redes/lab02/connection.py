# encoding: utf-8
# Revisión 2019 (a Python 3 y base64): Pablo Ventura
# Copyright 2014 Carlos Bederián
# $Id: connection.py 455 2011-05-01 00:32:09Z carlos $

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

        # Propiedad para saber si se debe recibir mas datos/comandos del cliente
        self.connected = True

    def handle(self):
        """
        Atiende eventos de la conexión hasta que termina.
        """

        while self.connected:
            try:
                command = self.conn.recv(4096).decode('ascii')
                cmd = ParserCommand.parser(command)
                self.execute_commands(cmd)

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

    def execute_commands(self, command: Command):
        """
        Recibe un comando valido y lo ejecuta

        :params str command: Comando a ejecutar para el cliente
        """
        try:
            if isinstance(command, CommandQuit):
                self.run_command_quit(command)

            elif isinstance(command, CommandGetFileListing):
                self.run_command_get_file_listing(command, self.directory)

            elif isinstance(command, CommandGetMetaData):
                self.run_command_get_metadata(command)

            elif  isinstance(command, CommandGetSlice):
                self.run_command_get_slice(command)
            else:
                #! Este caso nunca debería de suceder ya que antes se ejecuta el
                #! método is_command_valid con el parser
                #! Chequear yy luego quitar
                print('Error desconocido.')
                self.connected = False
        # Revisar! En este apartado deberían encontrarse todas las excepciones
        except CommandGetFileListing.DirectoryEmptyError as e:
            print(f"[WARNING] {e}")
        

    def run_command_quit(self, command: CommandQuit):
        """
        Cierra la conexión con el cliente.
        """

        command.log(self.addr_info)

        self.conn.send(command.response_ok().encode('ascii'))

        self.connected = False



    def run_command_get_file_listing(self, command: CommandGetFileListing, directory: str):
        """
        Busca obtener la lista de archivos que están actualmente
        disponibles en el directorio.
        """
        command.log(self.addr_info)

        file_names: list[str] = command.get_filenames(directory)

        msg = command.response_format(file_names)

        self.conn.send(msg.encode('ascii'))



    def run_command_get_metadata(self, command: CommandGetMetaData):
        """
        Devuelve el tamaño de un archivo dado.

        :param CommandGetMetaData command: Comando a ejecutar.
        """
        command.log(self.addr_info)

        size = command.get_size_file(self.directory)

        self.conn.send(command.response_format(size).encode('ascii'))
        
        
        
    def run_command_get_slice(self, command: CommandGetSlice):
        """
        Devuelve la parte solicitada del archivo dado, codificada en base64.
        
        :param CommandGetSlice command: Comando a ejecutar.
        """
        command.log(self.addr_info)
        
        data = command.get_file_data()
        
        self.conn.send(command.response_format(data).encode('ascii'))
