
def prom_update(prom_prev: float, x_new: float, n_curr: int):
    if n_curr < 1:
        raise Exception()
    elif n_curr == 1:
        return x_new
    else:
        return prom_prev + (x_new - prom_prev) / n_curr


def s_cuad_update(s_cuad_prev: float, prom_prev: float, prom_curr: float, n_curr: int):
    if n_curr < 1:
        raise Exception()
    elif n_curr == 1:
        return 0.0
    else:
        return (1 - (1/(n_curr - 1))) * s_cuad_prev + n_curr * ((prom_curr - prom_prev)**2)
