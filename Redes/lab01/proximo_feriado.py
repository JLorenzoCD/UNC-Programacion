from typing import Literal, Optional
import requests
from datetime import date

TipoFeriado = Literal['inamovible', 'trasladable', 'nolaborable', 'puente']


def get_url(year: int) -> str:
    """
    Da la URL de una API de feriados de Argentina en un cierto año.

    :params int year: Almacena el año en el cual se va a buscar los feriados.
    :return url (str): URL de la API de feriados para el año `year`.
    """
    return f"https://nolaborables.com.ar/api/v2/feriados/{year}"


months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
          'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
days = ['Domingo', 'Lunes', 'Martes',
        'Miércoles', 'Jueves', 'Viernes', 'Sábado']
tipos: TipoFeriado = ['inamovible', 'trasladable', 'nolaborable', 'puente']


class TipoFeriadoInvalido(Exception):
    """
    Creada para notificar que el tipo de feriado dado es invalido.
    """
    pass


def day_of_week(day: int, month: int, year: int) -> str:
    """
    La función retorna el dia de la semana (Domingo, Lunes, ..., Sabado) de
    una fecha dada

    :params int day: Almacena un dia
    :params int month: Almacena un (mes - 1)
    :params int month: Almacena el año actual

    :return day_of_week (str): Puede ser alguno de los siguientes strings
    `['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']`

    """
    return days[date(year, month, day).weekday()]


class NextHoliday:
    """
    Representa el próximo feriado basado en una lista de feriados.

    :var loading: Indica si se está buscando el próximo feriado.
    :var year: Año actual basado en la fecha del sistema.
    :var holiday: Diccionario con la información del próximo feriado o None si
        no hay feriados disponibles.
    """

    def __init__(self):
        """
        Inicializa la instancia de NextHoliday con valores por defecto.
        """

        self.loading = True
        self.year = date.today().year
        self.holiday = None

    def set_next(self, holidays: list[dict[str, str | int]]):
        """
        Determina el próximo feriado a partir de una lista de feriados.

        :param holidays: Lista de diccionarios con la información de los
            feriados.
        """

        now = date.today()
        today = {
            'day': now.day,
            'month': now.month
        }

        holiday = next(
            (h for h in holidays if h['mes'] == today['month']
             and h['dia'] > today['day'] or h['mes'] > today['month']),
            holidays[0]
        )

        self.loading = False
        self.holiday = holiday

    def fetch_holidays(self, tipo: Optional[TipoFeriado] = None):
        """
        Obtiene la lista de feriados desde una fuente externa y actualiza el
        próximo feriado.

        :params Optional[TipoFeriado] tipo: Tipo de feriado a filtrar
            (opcional).
        :raises TipoFeriadoInvalido: Si el tipo de feriado proporcionado no es
            válido.
        """

        if (not tipo is None) and (not tipo in tipos):
            raise TipoFeriadoInvalido("El tipo dado no es valido.")

        response = requests.get(get_url(self.year))
        data = response.json()

        if not tipo is None:
            data = list(filter(lambda x: x["tipo"] == tipo, data))

        if len(data) > 0:
            self.set_next(data)
        else:
            self.loading = False
            self.holiday = None

    def render(self):
        """
        Muestra en la consola el próximo feriado o un mensaje indicando que no
        se encontró uno.
        """

        if self.loading:
            print("Buscando...")
        elif not self.holiday is None:
            print("Próximo feriado")
            print(self.holiday['motivo'])
            print("Fecha:")
            print(day_of_week(self.holiday['dia'],
                  self.holiday['mes'] - 1, self.year))
            print(self.holiday['dia'])
            print(months[self.holiday['mes'] - 1])
            print("Tipo:")
            print(self.holiday['tipo'])
        else:
            print("No se encontró un proximo feriado.")


if __name__ == '__main__':
    next_holiday = NextHoliday()
    next_holiday.fetch_holidays()
    next_holiday.render()
