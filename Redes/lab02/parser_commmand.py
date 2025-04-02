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

        # Se verifica que tenga fin de linea EOL
        cls.__has_end_of_line(command)

        # Se obtiene la primera parte del string luego de un espacio, el cual
        # es el comando
        command: list[str] = command.split(EOL)[0].split(' ')

        # Se verifica que la sintaxis del comando sea valida
        cls.__command_has_valid_syntax(command)

        cmd = command[0]

        # Se verifica que el primer elemento del comando sea un comando valido
        cls.__command_exists(cmd)

        # Se cea una subclase que hereda ded Commands según el tipo de comando
        return cls.__create_command_class(cmd, command)

    def __has_end_of_line(command: str):
        """
        Verifica si el comando tiene un fin de línea válido.

        :param str command: Comando en formato string.
        :raises BadEOLError: Si el comando no tiene fin de línea.
        """

        if not EOL in command:
            raise BadEOLError('El comando no tiene fin de linea')

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
                    'Se encontró un carácter \n fuera de un'
                    'terminador de pedido \r\n.'
                )
            elif ' ' in string:
                # La consigna dice que el comando y los argumentos tienen solo
                # un espacio de separación

                raise BadRequestError(
                    'Se encontró un espacio de mas en el comando.'
                )
            elif len(string) == 0:
                raise BadRequestError('El comando o argumento esta vació.')

    #! Este método debería ser estático y usarse en el Connection al obtener el comando
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

        del command[0]

        if len(command) != 0:
            raise InvalidArgsError('La cantidad de argumentos no corresponde')

    def __check_has_one_args(command: list[str]):
        """
        Verifica que el comando tenga un solo argumento.

        :param list[str] command: Lista con los elementos del comando.
        :raises InvalidArgsError: Si el número de argumentos es incorrecto.
        """

        del command[0]

        if len(command) != 1:
            raise InvalidArgsError('La cantidad de argumentos no corresponde')

    def __check_args_command_get_slice(command: list[str]) -> tuple[str, int, int]:
        """
        Verifica y obtiene los argumentos del comando GET_SLICE.

        :param list[str] command: Lista con los elementos del comando.
        :returns: Nombre del archivo, desplazamiento y tamaño.
        :rtype: tuple[str, int, int]
        :raises InvalidArgsError: Si los argumentos no son válidos.
        """

        del command[0]

        if len(command) != 3:
            raise InvalidArgsError('La cantidad de argumentos no corresponde')
        file_name, offset, size = command

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
