import re

from constants import *
from command import Command, CommandQuit, CommandGetFileListing, CommandGetMetaData, CommandGetSlice
from exceptions import BadEOLError, BadRequestError, InternalError, InvalidCommandError, InvalidArgsError


class ParserCommand:
    """
    Analiza y valida los comandos recibidos del cliente.
    """

    @classmethod
    def parser(cls, command: str) -> Command:
        """
        Analiza un comando y devuelve el objeto Command correspondiente.

        :param str command: Comando en formato string.
        :returns: Objeto de tipo Command.
        :rtype: Command
        :raises BadEOLError: Si el comando no tiene fin de línea.
        :raises BadRequestError: Sintaxis invalida.
        :raises InternalError: Error desconocido en el parseo.
        :raises InvalidCommandError: El comando no existe.
        :raises InvalidArgsError: Argumento invalido en el comando.
        """

        # Se obtiene la primera parte del string luego de un espacio, el cual
        # es el comando
        command: list[str] = command.split(' ')

        # Se verifica que la sintaxis del comando sea valida
        cls.__command_has_valid_syntax(command)

        cmd = command[0]

        # Se verifica que el primer elemento del comando sea un comando valido
        cls.__command_exists(cmd)

        del command[0]

        # Se cea una subclase que hereda ded Commands según el tipo de comando
        return cls.__create_command_class(cmd, command)

    def __command_has_valid_syntax(command: list[str]):
        """
        Valida la sintaxis del comando. Es decir, si se encuentra \\n en un
        comando, hay espacios vacíos o argumentos vacíos

        :param list[str] command: Lista con los elementos del comando.
        :raises BadEOLError: Si se tiene un \\n fuera de lugar.
        :raises BadRequestError: Si se encontró un espacio de mas o si el
            comando o arg es vacio.
        """

        for string in command:
            if '\n' in string:
                raise BadEOLError(
                    'Se encontró un carácter \\n fuera de un'
                    'terminador de pedido \\r\\n.'
                )
            elif ' ' in string:
                # La consigna dice que el comando y los argumentos tienen solo
                # un espacio de separación

                raise BadRequestError(
                    'Se encontró un espacio de mas en el comando.'
                )
            elif len(string) == 0:
                raise BadRequestError('El comando o argumento esta vació.')

    def __command_exists(cmd: str):
        """
        Se revisa si el comando existe en la lista de comandos del servidor.

        :params str cmd: Comando a validar.
        """

        if not cmd in VALID_COMMAND:
            raise InvalidCommandError(
                'El comando no está en la lista de comandos aceptados.'
            )

    @classmethod
    def __create_command_class(cls, cmd: str, command: list[str]):
        """
        Crea una instancia de la clase de comando correspondiente.

        :param str cmd: Nombre del comando.
        :param list[str] command: Lista con los elementos del comando.
        :returns: Instancia de una subclase de Command.
        :rtype: Command
        :raises InternalError: Error al tratar de parsear.
        """

        if cmd == COMMAND_QUIT:
            cls.__check_has_zero_args(command)

            return CommandQuit(cmd)
        elif cmd == COMMAND_GET_FILE_LISTING:
            cls.__check_has_zero_args(command)

            return CommandGetFileListing(cmd)
        elif cmd == COMMAND_GET_METADATA:
            cls.__check_has_one_args(command)

            file_name = command[0]

            return CommandGetMetaData(cmd, file_name)
        elif cmd == COMMAND_GET_SLICE:
            file_name, offset, size = cls.__check_args_command_get_slice(
                command)

            return CommandGetSlice(cmd, file_name, offset, size)
        else:
            raise InternalError(
                'El servidor tuvo algún fallo interno al intentar procesar'
                ' el pedido.'
            )

    def __check_has_zero_args(command: list[str]):
        """
        Verifica que el comando no tenga argumentos.

        :param list[str] command: Lista con los elementos del comando.
        :raises InvalidArgsError: Si el comando tiene argumentos.
        """

        if len(command) != 0:
            raise InvalidArgsError('La cantidad de argumentos no corresponde')

    @classmethod
    def __check_has_one_args(cls, command: list[str]):
        """
        Verifica que el comando tenga un solo argumento.

        :param list[str] command: Lista con los elementos del comando.
        :raises InvalidArgsError: Si el número de argumentos es incorrecto.
        """

        if len(command) != 1:
            raise InvalidArgsError('La cantidad de argumentos no corresponde')

        if not cls.__is_valid_filename(command[0]):
            raise BadRequestError(
                f"Se envió un archivo no valido: '{command[0]}'."
            )

    @classmethod
    def __check_args_command_get_slice(cls, command: list[str]) -> tuple[str, int, int]:
        """
        Verifica y obtiene los argumentos del comando GET_SLICE.

        :param list[str] command: Lista con los elementos del comando.
        :returns: Nombre del archivo, desplazamiento y tamaño.
        :rtype: tuple[str, int, int]
        :raises InvalidArgsError: Si los argumentos no son válidos.
        """

        if len(command) != 3:
            raise InvalidArgsError('La cantidad de argumentos no corresponde')
        file_name, offset, size = command

        if not cls.__is_valid_filename(file_name):
            raise BadRequestError(
                f"Se envió un archivo no valido: '{file_name}'."
            )

        try:
            offset = int(offset)
            size = int(size)

            if offset < 0 or size <= 0:
                # Ambos argumentos tienen que ser enteros positivos y el
                # size tiene que ser mayor a cero
                raise ValueError()
        except ValueError:
            raise InvalidArgsError(
                'Los argumentos no tienen la forma correcta.'
            )

        return file_name, offset, size

    def __is_valid_filename(filename: str) -> bool:
        """
        Verifica si el nombre del archivo es válido:
        - No contiene `/` ni `\\`
        - No contiene `..`
        - Puede tener múltiples extensiones (`archivo.config.json`, `backup.tar.gz`)
        - Solo permite letras, números, guiones y guiones bajos

        :param filename: Nombre del archivo recibido.
        :return: True si es válido, False si no.
        """
        pattern = r"^(?!.*\.\.)[a-zA-Z0-9_\-]+(?:\.[a-zA-Z0-9]+)*$"

        return bool(re.fullmatch(pattern, filename))
