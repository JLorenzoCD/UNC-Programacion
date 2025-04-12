import os
from base64 import b64encode

from constants import CODE_OK, EOL, error_messages, COMMAND_GET_METADATA
from exceptions import FileNotFoundError, InternalError, BadOffSetError


class Command:
    """
    Clase base para manejar comandos.

    :param str cmd: El comando en formato string.
    """

    def __init__(self, cmd: str):
        self.cmd = cmd

    def response_ok(self) -> bytes:
        """
        Retorna un mensaje de respuesta de éxito.

        :returns: Mensaje formateado de éxito.
        :rtype: bytes
        """

        return f'{CODE_OK} {error_messages[CODE_OK]}{EOL}'.encode('ascii')

    def response_format(self, *args, **kwargs) -> bytes:
        """
        Metodo que debe ser sobrescrito en comandos específicos.

        :raises NotImplementedError: Si es sobrescrito en una subclase.
        """
        raise NotImplementedError(
            'No se debe utilizar el metodo "response_format" en '
            f'la clase "{type(self).__name__}"'
        )

    def execute(self, **kwargs) -> tuple[bytes, bool]:
        """
        Método que debe ser sobrescrito en comandos específicos.

        :raises NotImplementedError: Si no es sobrescrito en una subclase.
        """

        raise NotImplementedError(
            'No se debe utilizar el método "execute" en '
            f'la clase "{type(self).__name__}"'
        )

    def log(self, addr_info: tuple[str, int]):
        """
        Registra la acción del cliente al ejecutar un comando.  En caso de que
        el comando reciba argumentos, se debe sobrescribir el método.

        :param tuple[str, int] addr_info: Dirección y puerto del cliente.
        """

        print(
            f'[CLIENT ACTION]: El cliente {addr_info} utilizó el comando '
            f'"{self.cmd}".'
        )


class CommandQuit(Command):
    """
    Comando que representa la acción de cerrar la conexión.
    """

    def execute(self, **kwargs) -> tuple[bytes, bool]:
        """
        Cierra la conexión con el cliente.
        """

        res = self.response_ok()
        connected = False

        return res, connected

    def log(self, addr_info: tuple[str, int]):
        print(
            '[CLOSE CLIENT] Se cerro la conexión'
            f'con el cliente: {addr_info}'
        )


class CommandGetFileListing(Command):
    """
    Comando para obtener una lista de archivos.
    """

    def response_format(self, file_names: list[str]) -> bytes:
        """
        Da formato a la respuesta con los nombres de los archivos.

        :param list[str] file_names: Lista de nombres de archivos.
        :returns msg (bytes): Código OK + Lista de archivos que están
            disponibles.
        """
        msg = self.response_ok()

        # Agrego al final de cada elemento un \r\n
        for file in file_names:
            msg += f"{file}{EOL}".encode('ascii')

        # Sin esta línea el mensaje sólo tendría \r\n hasta el último en la
        # lista
        msg += EOL.encode('ascii')

        return msg

    def get_filenames(self, dir: str) -> list[str]:
        """
        Obtiene los nombres de los archivos en un directorio.

        :param str dir: Ruta del directorio.
        :returns list[str] file_names: Lista de nombres de archivos.
        """
        file_names: list[str] = []

        # Lista de nombres del contenido del directorio
        content_in_dir = os.listdir(dir)

        for file in content_in_dir:
            if self.__is_file(dir, file):
                file_names.append(file)

        return file_names

    def __is_file(self, dir: str, file: str) -> bool:
        """
        Decide si un archivo es un archivo o no.

        :param str dir: Ruta del archivo
        :param str file: Nombre del archivo
        :returns bool: True si es un archivo, False si no lo es.
        """
        file_path = os.path.join(dir, file)

        return os.path.isfile(file_path)

    def execute(self, **kwargs) -> tuple[bytes, bool]:
        """
        Busca obtener la lista de archivos que están actualmente
        disponibles en el directorio.
        """
        dir = kwargs.get('dir')
        if dir is None:
            raise InternalError(
                "No se paso el nombre del directorio al "
                "comando get_file_listing."
            )

        file_names: list[str] = self.get_filenames(dir)

        res = self.response_format(file_names)
        connected = True

        return res, connected


class CommandGetMetaData(Command):
    """
    Comando para obtener el tamaño en bytes de un archivo específico.
    """

    def __init__(self, cmd: str, file_name: str):
        """
        Inicializa el comando con el nombre del archivo.

        :param str cmd: El comando en formato string.
        :param str file_name: Nombre del archivo.
        """

        super().__init__(cmd)
        self.file_name = file_name

    def response_format(self, file_size: int) -> str:
        """
        Da formato a la respuesta con el tamaño del archivo.

        :param int file_size: Tamaño del archivo en bytes.
        """
        msg = self.response_ok()

        msg += f"{file_size}{EOL}".encode('ascii')

        return msg

    def get_size_file(self, dir: str) -> str:
        """
        Obtiene el tamaño del archivo.

        :param str dir: Ruta del directorio.
        :returns size (str): Tamaño del archivo correspondiente.
        :raises FileNotFoundError: Si el archivo solicitado no se encuentra en
            el directorio.
        :raises InternalError: Si ocurre un error accediendo al tamaño del
            archivo.
        """
        archives = os.listdir(dir)

        if not self.file_name in archives:
            raise FileNotFoundError("No se encontró el archivo.")

        try:
            ruta = f"{dir}/{self.file_name}"
            size = str(os.path.getsize(ruta))
            return size
        except Exception:
            raise InternalError(
                "Ha ocurrido un error intentando acceder al tamaño del archivo."
            )

    def execute(self, **kwargs) -> tuple[bytes, bool]:
        """
        Devuelve el tamaño de un archivo dado.

        :param CommandGetMetaData command: Comando a ejecutar.
        """
        dir = kwargs.get('dir')
        if dir is None:
            raise InternalError(
                "No se paso el nombre del directorio al "
                "comando get_file_listing."
            )

        size = self.get_size_file(dir)

        res = self.response_format(size)
        connected = True

        return res, connected


class CommandGetSlice(Command):
    """
    Comando para obtener una porción específica de un archivo.
    """

    def __init__(self, cmd: str, file_name: str, offset: int, size: int):
        """
        Inicializa el comando con el nombre del archivo y parámetros del
        fragmento.

        :param str cmd: El comando en formato string.
        :param str file_name: Nombre del archivo.
        :param int offset: Desplazamiento en bytes.
        :param int size: Tamaño del fragmento en bytes.
        """

        super().__init__(cmd)
        self.file_name = file_name
        self.offset = offset
        self.size = size

    def response_format(self, data: str) -> str:
        """
        Da formato a la respuesta con los datos del fragmento del archivo.

        :param str data: Datos del fragmento del archivo.
        :param str code: Nombre del código de error que hay que utilizar en el
            mensaje.
        :returns msg (str): Respuesta según la solicitud dada.
        """
        msg = self.response_ok()
        msg += data
        msg += EOL.encode('ascii')

        return msg

    def get_file_data(self, dir) -> str:
        """
        Obtiene la porción o slice pedida del archivo.

        :returns data (str): Slice del archivo codificado en base64.
        :raises BadOffSetError: Si la suma entre el offset y el tamaño del
            fragmento es mayor que el tamaño total del archivo.
        :raises InternalError: Si ocurrió un error leyendo el archivo.
        """
        size_filename = CommandGetMetaData(
            cmd=COMMAND_GET_METADATA,
            file_name=self.file_name
        ).get_size_file(dir)

        if (self.offset + self.size) > int(size_filename):
            raise BadOffSetError(
                "La suma entre el offset y el tamaño del fragmento es mayor "
                "al tamaño total del archivo."
            )

        try:
            with open(f"{dir}/{self.file_name}", 'rb') as file:
                file.seek(self.offset)
                data = file.read(self.size)
        except Exception:
            raise InternalError(
                "Ocurrió un error leyendo el contenido del archivo."
            )

        return (b64encode(data))

    def execute(self, **kwargs) -> tuple[bytes, bool]:
        """
        Devuelve la parte solicitada del archivo dado, codificada en base64.

        :param CommandGetSlice command: Comando a ejecutar.
        """
        dir = kwargs.get('dir')
        if dir is None:
            raise InternalError(
                "No se paso el nombre del directorio al "
                "comando get_file_listing."
            )

        data = self.get_file_data(dir)

        res = self.response_format(data)
        connected = True

        return res, connected
