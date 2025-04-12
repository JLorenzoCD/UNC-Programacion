# 🗂️ Servidor HFTP - Laboratorio 2

Este proyecto consiste en la implementación de un **servidor de archivos** en
Python que responde a un protocolo casero llamado **HFTP (Home-made File
Transfer Protocol)**, creado para el laboratorio de la materia **Redes y
Sistemas Distribuidos**.

💡 HFTP es un protocolo de capa de aplicación que funciona sobre TCP y permite
realizar operaciones básicas de consulta y descarga de archivos desde un
servidor.

## Recursos explicativos del lab
- [Video explicativo del lab](https://drive.google.com/file/d/1yGquO4H4DvW7GK0RlYKCMzUvINRq1Fzp/view?usp=sharing)
- Las filminas se encuentran en la base del repositorio, aun asi, aca hay
un [link en el drive](https://www.canva.com/design/DAGj40Tv6yQ/aesFsMlCKPyrG5FQ8vGuLg/edit)
---

## 🚀 ¿Qué hace este servidor?

El servidor:
- 📄 Lista archivos disponibles.
- ℹ️ Brinda metadatos (tamaño) de un archivo.
- ✂️ Permite pedir *slices* codificados en Base64.
- ❌ Responde adecuadamente a errores y comandos maliciosos.
- 🧵 Soporta múltiples clientes mediante *threads*.

---

## ⚙️ Cómo ejecutarlo

Primero que nada, tener Python3 instalado.

### 2. Ejecutar el servidor

```bash
python server.py -d <directorio_de_archivos> -a <dirección_donde_escuchar> -p <puerto>
```

Los flags no son obligatorios, por defecto el directorio es **testdata**, la
dirección donde escuchar es **0.0.0.0** y el puerto es **19500**.

Ejemplo:

```bash
python server.py
python server.py -d archivos
python server.py -p 8080
```

---

## 🧪 Comprobación básica

Podés probar el servidor usando `telnet`:

```bash
telnet 127.0.0.1 19500
```

Comandos que podes enviar (En telnet no se debe colocar el `\r\n`, se coloca
solo al darle enter):

```
get_file_listing\r\n
get_metadata archivo.txt\r\n
get_slice archivo.txt 0 100\r\n
quit\r\n
```
📝 Todos los comandos deben terminar en `\r\n`.

✅ Ejemplo de respuesta exitosa ante un get_file_listing

```text
0 OK\r\n
archivo1.txt\r\n
archivo2.jpg\r\n
\r\n
```
---

## 📡 Comandos HFTP soportados

| Comando                        | Descripción                                        |
|-------------------------------|----------------------------------------------------|
| `get_file_listing`            | Lista archivos disponibles.                        |
| `get_metadata <FILENAME>`     | Devuelve el tamaño del archivo en bytes.          |
| `get_slice <FILENAME> <OFFSET> <SIZE>` | Devuelve un fragmento del archivo en Base64. |
| `quit`                        | Finaliza la conexión.                             |

---

## ⚠️ Manejo de errores

El servidor responde con un código y mensaje ante errores. Ejemplos:

| Código | Descripción                                    | ¿Cierra conexión? |
|--------|------------------------------------------------|-------------------|
| `0`    | OK                                              | No                |
| `100`  | Carácter `\n` sin `\r` antes                    | ✅ Sí             |
| `101`  | Malformación grave del comando                 | ✅ Sí             |
| `199`  | Error interno del servidor                     | ✅ Sí             |
| `200`  | Comando desconocido                            | No                |
| `201`  | Argumentos incorrectos                         | No                |
| `202`  | Archivo no existe                              | No                |
| `203`  | Offset/Slice inválido                          | No                |

---

## 🧵 Soporte para múltiples clientes

El servidor utiliza **hilos (threads)** para manejar múltiples clientes
simultáneamente. Esto permite que varios clientes puedan realizar pedidos al
mismo tiempo sin bloquearse entre sí.

💡 También puede implementarse usando `poll` para manejo concurrente con IO no
bloqueante (punto estrella 🌟).

---

## 📎 Estructura del proyecto
```bash
.
├── client.py
├── command.py
├── connection.py
├── constants.py
├── exceptions.py
├── parser_commmand.py
├── README.md
├── server.py
└── server-test.py
```

### Explicación de los archivos
- `server.py` - Espera una conexión con algún cliente y crea un objeto de tipo
Connection para manejar la conexión con el cliente.
- `connection.py` - Maneja la conexión, creación de comandos, su ejecución y el
envió de la respuesta (tanto de éxito como de error).
- `parser_command.py` - Se encarga de obtener una linea (hasta el primer `\n\r`)
y pasarlo a un comando valido.
- `command.py` - Maneja la conexión y el parsing de comandos.
- `exceptions.py` - Excepciones creadas para el manejo de errores en el
servidor.
- `constants.py` - Constantes útiles para el protocolo.
- `client.py` - Cliente funcional para probar el servidor.
- `server-test.py` - Script de testing automático.

---

## 👥 Créditos
Trabajo realizado para la materia Redes y Sistemas Distribuidos - FAMAF - UNC 🏛️
