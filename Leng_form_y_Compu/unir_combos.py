import os
import re

# Para pasar de md a pdf utilice la exención de VScode llamada "Markdown PDF"
# de yzane (https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf)

# ------------------- Definiciones -------------------
# DIR_PATH = "Leng_form_y_Compu/definiciones"
# FILE_OUTPUT = "definiciones.md"
# HEADER = "Definiciones"

# ------------------- Teoremas -------------------
DIR_PATH = "Leng_form_y_Compu/teoremas"
FILE_OUTPUT = "teoremas.md"
HEADER = "Teoremas"


def fusionar_combos(dir_path, file_output, header):
    # Verificar si la carpeta realmente existe
    if not os.path.exists(dir_path):
        print(f"Error: La ruta '{dir_path}' no existe.")
        return

    patron = re.compile(r'^combo_(\d+)\.md$')
    archivos_validos = []

    # Buscar y filtrar los archivos que cumplan con el formato
    for archivo in os.listdir(dir_path):
        match = patron.match(archivo)
        if match:
            # Guardamos la tupla (número_as_int, nombre_archivo) para ordenar correctamente
            numero = int(match.group(1))
            # Guardamos la ruta completa del archivo de entrada
            ruta_completa = os.path.join(dir_path, archivo)
            archivos_validos.append((numero, ruta_completa))

    # Ordenar los archivos por su número natural de forma ascendente
    archivos_validos.sort(key=lambda x: x[0])

    if not archivos_validos:
        print(
            "Error: No se encontraron archivos que coincidan con 'combo_{n}.md' en la carpeta ",
            dir_path
        )
        return

    # Crear el archivo fusionado y escribir el contenido con el formato requerido
    archivo_salida = os.path.join(dir_path, file_output)

    with open(archivo_salida, 'w', encoding='utf-8') as f_salida:
        # Cabecera inicial
        f_salida.write(f"# {header}\n---\n")

        for i, (numero, nombre_archivo) in enumerate(archivos_validos):
            try:
                with open(nombre_archivo, 'r', encoding='utf-8') as f_entrada:
                    contenido = f_entrada.read().strip()

                    # Escribimos el contenido del archivo actual
                    f_salida.write(contenido + "\n")

                    # Agregamos los separadores de cierre.
                    # Si es el último archivo, lleva solo tres guiones. Si no, lleva doble separador.
                    if i < len(archivos_validos) - 1:
                        f_salida.write("\n\n---\n---\n")
                    else:
                        f_salida.write("\n\n---\n")

            except Exception as e:
                print(f"Error al leer el archivo {nombre_archivo}: {e}")

    print(f"Se fusionaron los combos, archivo generado: {archivo_salida}")


if __name__ == "__main__":
    fusionar_combos(DIR_PATH, FILE_OUTPUT, HEADER)
