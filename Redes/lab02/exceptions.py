from constants import *


class ServerExceptions(Exception):
    def __init__(self, code: int, isFatal: bool, msg: str, *args):
        super().__init__(*args)
        self.code = code
        self.err_msg = error_messages[self.code]
        self.isFatal = isFatal

        self.msg = msg

    def get_res_error(self):
        res_err = f'{self.code} {self.err_msg}{EOL}'

        return res_err

    def log(self):
        header_err_print = "FATAL ERROR" if self.isFatal else "CLIENT ERROR"
        print(f'[ {header_err_print} ]:', self.msg)


# 1xx: Errores fatales (no se pueden atender más pedidos)
class BadEOLError(ServerExceptions):
    def __init__(self, msg, *args):
        super().__init__(BAD_EOL, True, msg, *args)


class BadRequestError(ServerExceptions):
    def __init__(self, msg, *args):
        super().__init__(BAD_REQUEST, True, msg, *args)


class InternalError(ServerExceptions):
    def __init__(self, msg, *args):
        super().__init__(INTERNAL_ERROR, True, msg, *args)


# 2xx: Errores no fatales (no se pudo atender este pedido)
class InvalidCommandError(ServerExceptions):
    def __init__(self, msg, *args):
        super().__init__(INVALID_COMMAND, False, msg, *args)


class InvalidArgsError(ServerExceptions):
    def __init__(self, msg, *args):
        super().__init__(INVALID_ARGUMENTS, False, msg, *args)


class FileNotFoundError(ServerExceptions):
    def __init__(self, msg, *args):
        super().__init__(FILE_NOT_FOUND, False, msg, *args)


class BadOffSetError(ServerExceptions):
    def __init__(self, msg, *args):
        super().__init__(BAD_OFFSET, False, msg, *args)
