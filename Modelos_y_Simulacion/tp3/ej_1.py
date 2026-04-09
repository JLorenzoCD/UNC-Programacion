def generador_psda_x(x_seed=1):
    x = x_seed

    while True:
        # xi+1 = (axi) mód 31
        x = (3 * x) % 31
        yield x


def generador_psda_y(y_seed=1):
    y = y_seed

    while True:
        # yi+1 = (5yi + c) mód 32
        y = (5 * y + 5) % 32
        yield y


def generador_psda_z(x_seed=1, y_seed=1):
    gen_x = generador_psda_x(x_seed)
    gen_y = generador_psda_y(y_seed)

    while True:
        x = next(gen_x)
        y = next(gen_y)

        z = (y + x) % 32
        yield z


# generador = generador_psda_z()
# for _ in range(50):
#     z = next(generador)
#     print(z)
