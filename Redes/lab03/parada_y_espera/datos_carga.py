import os
import re

iteration_data = []


def guardar_en_csv(file_name_output: str, iteration_data: list[tuple[int, int, int, float]]):
    """"Crea un archivo csv con los datos (separados por ,)

    :params str file_name_output: Nombre del archivo y su ruta relativa
    :params (list[tuple[int, int, int, float]]) iteration_data: Datos de la iteración
    """
    with open(file_name_output, 'w') as file:
        header = "iteration,pkt_send,pkt_recv,delay_avg,carga_ofrecida,carga_util\n"
        file.write(header)

        for fila in iteration_data:
            t_simulacion = 200
            carga_ofrecida = float(fila[1] / t_simulacion)
            carga_util = float(fila[2] / t_simulacion)

            line = f"{fila[0]},{fila[1]},{fila[2]},{fila[3]},{carga_ofrecida},{carga_util}\n"
            file.write(line)


def add_iteration_data(iteration: int, pkt_send_cont: int, pkt_recv_count: int, delay_avg: float):
    """Recibe los datos a almacenar en el arr iteration_data en forma ded tupla

    :params int iteration: Iteración actual
    :params int pkt_send_cont: Cantidad de paquetes enviados por transmisor
    :params int pkt_recv_count: Cantidad de paquetes recibidos en receptor
    :params float delay_avg: Promedio de delay
    """
    iteration_data.append(
        (iteration, pkt_send_cont, pkt_recv_count, delay_avg))


def procesar_vci(path: str):
    """Obtiene la ruta a un archivo .vci y extrae la cantidad de paquetes
    enviados desde el transmisor, la cantidad de paquetes recibidos por el
    receptor y el delay de los paquetes

    :params int path: Ruta de archivo .vci
    """
    iteration = int(os.path.basename(path).split('.')[0])
    packet_send_count = 0
    packet_recv_count = 0
    delay_avg = 0.0

    with open(path, 'r') as f:
        lines = f.readlines()

    id_vector_packet_send = -1
    id_vector_delay = -1

    regex_vector = r'vector (\d+) ([^ ]+) ([^ ]+) ETV'
    for line in lines:
        line = line.strip().replace('\t', ' ')

        if re.match(regex_vector, line):
            line_split = line.split(' ')
            vector_id = int(line_split[1])
            vector_name = line_split[3]

            if vector_name == 'PacketSend':
                id_vector_packet_send = vector_id
            elif vector_name == 'Delay':
                id_vector_delay = vector_id
        elif id_vector_packet_send != -1 and id_vector_delay != -1 and (not line.startswith('vector ')) and line != '':
            line_split = line.split(' ')
            vector_id = int(line_split[0])

            if vector_id == id_vector_packet_send:
                packet_send_count = int(line_split[-5])
            elif vector_id == id_vector_delay:
                packet_recv_count = int(line_split[-5])
                delay_avg = float(line_split[-2]) / \
                    float(packet_recv_count)

    add_iteration_data(iteration, packet_send_count,
                       packet_recv_count, delay_avg)


def leer_archivos_en_carpeta(dir_path: str):
    """Lee todos los archivos de la carpeta 'dir_path' y si es un .vci lo manda
    a la fun procesar_vci

    :params str dir_path: Carpeta donde se encuentra los archivos .vci
    """
    for file in os.listdir(dir_path):
        if not file.endswith(".vci"):
            continue

        file_path = os.path.join(dir_path, file)
        procesar_vci(file_path)


if __name__ == "__main__":
    data_folder = 'results/'
    file_name_result = 'data.csv'

    leer_archivos_en_carpeta(data_folder)
    iteration_data.sort()

    # print(iteration_data)

    guardar_en_csv(file_name_result, iteration_data)
