from typing import Literal, Optional
import requests
from datetime import date

def get_url(year):
    return f"https://nolaborables.com.ar/api/v2/feriados/{year}"

months = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
days = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']
tipos = ['inamovible', 'trasladable', 'nolaborable', 'puente']

class ErrorTipoInvalido(Exception):
    pass

def day_of_week(day, month, year):
    return days[date(year, month, day).weekday()]

class NextHoliday:
    def __init__(self):
        self.loading = True
        self.year = date.today().year
        self.holiday = None

    def set_next(self, holidays):
        now = date.today()
        today = {
            'day': now.day,
            'month': now.month
        }

        holiday = next(
            (h for h in holidays if h['mes'] == today['month'] and h['dia'] > today['day'] or h['mes'] > today['month']),
            holidays[0]
        )

        self.loading = False
        self.holiday = holiday

    def fetch_holidays(self, tipo : Optional[Literal['inamovible', 'trasladable', 'nolaborable', 'puente']] = None):
        if (not tipo is None) and (not tipo in tipos):
            raise ErrorTipoInvalido("El tipo dado no es valido.")

        response = requests.get(get_url(self.year))
        data = response.json()

        if not tipo is None:
            data = list(filter(lambda x : x["tipo"] == tipo, data))

        if len(data) > 0:
            self.set_next(data)
        else:
            self.loading = False
            self.holiday = None

    def render(self):
        if self.loading:
            print("Buscando...")
        elif not self.holiday is None:
            print("Próximo feriado")
            print(self.holiday['motivo'])
            print("Fecha:")
            print(day_of_week(self.holiday['dia'], self.holiday['mes'] - 1, self.year))
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
