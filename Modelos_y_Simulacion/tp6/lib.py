
def prom_update(prom_prev: float, x_new: float, n_prev: int) -> tuple[float, int]:
    if n_prev < 1:
        raise Exception()
    elif n_prev == 1:
        return x_new, n_prev + 1
    else:
        return prom_prev + (x_new - prom_prev) / (n_prev + 1), n_prev + 1


def s_cuad_update(s_cuad_prev: float, prom_prev: float, prom_curr: float, n_prev: int) -> tuple[float, int]:
    if n_prev < 1:
        raise Exception()
    elif n_prev == 1:
        return 0, n_prev + 1
    else:
        return (1 - 1/n_prev) * s_cuad_prev**2 + (n_prev + 1) * (prom_curr - prom_prev)**2
