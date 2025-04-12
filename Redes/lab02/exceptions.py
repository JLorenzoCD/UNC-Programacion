from constants import *


class ServerExceptions(Exception):
    """
    Clase base para excepciones del servidor.
    """

    def __init__(self, code: int, isFatal: bool, msg: str, *args):
        """
        Inicializa la excepción con un código de estado, un flag de fatalidad y un mensaje.

        :param int code: Código del error.
        :param bool isFatal: True si el error es fatal, False si no lo es.
        :param str msg: Mensaje adicional que describe el error.
        :param *args: Argumentos adicionales para la clase base Exception.
        """
        super().__init__(*args)
        self.code = code
        self.err_msg = error_messages[self.code]
        self.isFatal = isFatal

        self.msg = msg

    def get_res_error(self):
        """
        Devuelve el mensaje de error formateado para la respuesta.

        :returns str res_error: Error en formato <codigo> <mensaje>
        """
        res_err = f'{self.code} {self.err_msg}{EOL}'

        return res_err

    def log(self):
        """
        Imprime el mensaje de error en consola con un encabezado indicando si es fatal.
        """
        header_err_print = "FATAL ERROR" if self.isFatal else "CLIENT ERROR"
        print(f'[ {header_err_print} ]:', self.msg)


# 1xx: Errores fatales (no se pueden atender más pedidos)
class BadEOLError(ServerExceptions):
    """
    Excepción lanzada cuando el fin de línea es inválido.
    """

    def __init__(self, msg, *args):
        super().__init__(BAD_EOL, True, msg, *args)


class BadRequestError(ServerExceptions):
    """
    Excepción lanzada cuando la solicitud es inválida o malformada.
    """

    def __init__(self, msg, *args):
        super().__init__(BAD_REQUEST, True, msg, *args)


class InternalError(ServerExceptions):
    """
    Excepción lanzada por errores internos del servidor.
    """

    def __init__(self, msg, *args):
        super().__init__(INTERNAL_ERROR, True, msg, *args)


# 2xx: Errores no fatales (no se pudo atender este pedido)
class InvalidCommandError(ServerExceptions):
    """
    Excepción lanzada cuando se recibe un comando inválido.
    """

    def __init__(self, msg, *args):
        super().__init__(INVALID_COMMAND, False, msg, *args)


class InvalidArgsError(ServerExceptions):
    """
    Excepción lanzada cuando los argumentos de un comando son inválidos.
    """

    def __init__(self, msg, *args):
        super().__init__(INVALID_ARGUMENTS, False, msg, *args)


class FileNotFoundError(ServerExceptions):
    """
    Excepción lanzada cuando un archivo solicitado no se encuentra.
    """

    def __init__(self, msg, *args):
        super().__init__(FILE_NOT_FOUND, False, msg, *args)


class BadOffSetError(ServerExceptions):
    """
    Excepción lanzada cuando el offset especificado es inválido o excede del tamaño del archivo..
    """

    def __init__(self, msg, *args):
        super().__init__(BAD_OFFSET, False, msg, *args)
