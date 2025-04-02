from constants import CODE_OK, EOL, FILE_NOT_FOUND, INVALID_ARGUMENTS, INTERNAL_ERROR, error_messages
import os
from base64 import b64encode
class Command:
    """
    Clase base para manejar comandos.

    :param str cmd: El comando en formato string.
    """

    def __init__(self, cmd: str):
        self.cmd = cmd

    def response_ok(self):
        """
        Retorna un mensaje de respuesta de éxito.

        :returns: Mensaje formateado de éxito.
        :rtype: str
        """

        return f'{CODE_OK} {error_messages[CODE_OK]}{EOL}'

    def response_format(self, *args, **kwargs) -> str:
        """
        Método que debe ser sobrescrito en comandos específicos.

        :raises NotImplementedError: Si no es sobrescrito en una subclase.
        """

        raise NotImplementedError(
            'No se debe utilizar el método "response_format" en '
            f'la clase "{type(self).__name__}"'
        )

    def log(self, addr_info: tuple[str, int]):
        """
        Registra la acción del cliente al ejecutar un comando.  En caso de que
        el comando reciba argumentos, se debe sobrescribir el método.

        :param tuple[str, int] addr_info: Dirección y puerto del cliente.
        """

        print(
            f'[CLIENT ACTION]: El cliente {addr_info} utilizo el comando'
            f'"{self.cmd}".'
        )


class CommandQuit(Command):
    """
    Comando que representa la acción de cerrar la conexión.
    """
    def log(self, addr_info: tuple[str, int]):
        print(
            '[CLOSE CLIENT] Se cerro la conexión'
            f'con el cliente: {addr_info}'
        )


class CommandGetFileListing(Command):
    """
    Comando para obtener una lista de archivos.
    """

    class DirectoryEmptyError(Exception):
        """
        Excepción lanzada cuando el directorio no contenga archivos.
        """
        pass

    @classmethod
    def response_format(self, file_names: list[str]) -> str:
        """
        Da formato a la respuesta con los nombres de los archivos.

        :param list[str] file_names: Lista de nombres de archivos.

        :returns str msg: Código OK + Lista de archivos que están disponibles.
        """
        msg:str = ""

        # Genero la parte del código de error
        error_code = f"{CODE_OK} {error_messages[CODE_OK]}{EOL}"

        msg = f"{error_code}"

        # Agrego al final de cada elemento un \r\n
        for file in file_names:
            msg = f"{msg}{file}{EOL}"
        
        # Sin esta línea el mensaje sólo tendría \r\n hasta el último en la lista
        msg = f"{msg}{EOL}"

        return msg

    @classmethod
    def get_filenames(cls, dir: str) -> list[str]:
        """
        Obtiene los nombres de los archivos en un directorio.

        :param str dir: Ruta del directorio.

        :returns list[str] file_names: Lista de nombres de archivos.

        :raises DirectoryEmptyError: Se lanza una excepción en caso de que el directorio
        no contenga archivos.
        """
        file_names:list[str] = []

        #Lista de nombres del contenido del directorio
        content_in_dir = os.listdir(dir)

        for file in content_in_dir:
            if CommandGetFileListing.is_file(dir, file):
                file_names.append(file)

        #Si la lista es vacía levanto una excepción
        if not file_names:
            raise cls.DirectoryEmptyError("El directorio no contiene archivos.")

        return file_names    

    @classmethod
    def is_file(cls, dir:str, file:str) -> bool:
        """
        Decide si un archivo es un archivo o no.

        :param str dir: Ruta del archivo

        :param str file: Nombre del archivo

        :returns bool: True si es un archivo, False si no lo es.
        """
        file_path = os.path.join(dir, file)
        return os.path.isfile(file_path)

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
        msg = (f"{CODE_OK} {error_messages[CODE_OK]}{EOL}"
               f"{file_size}{EOL}")
        
        return msg


    def get_size_file(self, dir: str) -> str:
        """
        Obtiene el tamaño del archivo.

        :param str dir: Ruta del directorio.
        
        :returns size (int): Tamaño del archivo correspondiente.
        
        :raises Exception: Si el archivo solicitado no se encuentra en el directorio.
        :raises Exception: Si ocurre un error accediendo al tamaño del archivo.
        """
        archives = os.listdir(dir)
        
        if not self.file_name in archives:
            raise Exception("archivo no encontrado")                        
        
        try:
            ruta = f"{dir}/{self.file_name}"
            size = str(os.path.getsize(ruta))
            return size 
        except Exception as e:    
            raise Exception("Hubo un problema interno intentando acceder al tamaño del archivo")

    def log(self, addr_info: tuple[str, int]):
        """
        Registra la acción del cliente al obtener metadatos.

        :param tuple[str, int] addr_info: Dirección y puerto del cliente.
        """
        super().log(addr_info)


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
        :param str code: Nombre del código de error que hay que utilizar en el mensaje.
        
        :returns msg (str): Respuesta según la solicitud dada. 
        """
        msg = (f"{CODE_OK} {error_messages[CODE_OK]}{EOL}"
               f"{data}{EOL}")
        
        return msg
        

    def get_file_data(self) -> str:
        """
        Obtiene la porción o slice pedida del archivo.
        
        :returns data (str): Slice del archivo codificado en base64.
        
        :raises Exception: Si la suma entre el offset y el tamaño del fragmento es mayor que el tamaño total del archivo.
        :raises Exception: Si ocurrió un error leyendo el archivo.
        """
        #tam = CommandGetMetaData.get_size_file()
        
        if (self.offset + self.size) > os.path.getsize(self.file_name):
            raise Exception("La suma entre el offset y el tamaño del fragmento no puede ser mayor al tamaño total del archivo.")
        
        try:
            with open(self.file_name, 'rb') as file:
                file.seek(self.offset)
                data = file.read(self.size)
        except Exception as e:
            print("Error: ", e)
            raise Exception("Ocurrio un error leyendo el contenido del archivo.")    
                
        return (b64encode(data))
        

    def log(self, addr_info: tuple[str, int]):
        """
        Registra la acción del cliente al obtener un fragmento del archivo.

        :param tuple[str, int] addr_info: Dirección y puerto del cliente.
        """
        super().log(addr_info)
