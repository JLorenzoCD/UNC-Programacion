# API de Películas 🎬
Este proyecto es una API RESTful desarrollada con Flask en Python para gestionar
una colección de películas. Forma parte del curso de Redes y Sistemas
Distribuidos de la UNC.

## Recursos explicativos del lab
- [Video explicativo del lab](https://drive.google.com/file/d/1qs7A1tFJGBcGG9Wh78uTPstc9xohEKXq/view?usp=sharing)
- Las filminas se encuentran en la base del repositorio, aun asi, aca hay un [link en el drive](https://drive.google.com/file/d/1HK3R_-Ryy2YimbONTjyIZ2rH4TUwFTaN/view?usp=sharing)

## 🚀 Características
- 📜 Listado de películas con búsqueda por título.
- 🔍 Consulta de películas por ID.
- ➕ Agregar nuevas películas.
- ✏️ Modificar información de una película.
- ❌ Eliminar películas.
- 🎭 Filtrar películas por género.
- 🎲 Obtener una película aleatoria de un género.
- 🎉 Sugerencias de películas aleatorias.
- 📅 Recomendaciones según el próximo feriado.


## 🚀 Instalación
1. Clonar el repositorio:
   ```sh
   git clone git clone https://JLorenzoCD@bitbucket.org/redes-famaf/redes25lab1g03.git
   cd redes25lab1g03
   ```
2. Crear un entorno virtual y activarlo:
   ```sh
   python -m venv .venv
   source .venv/bin/activate  # En Windows: .venv\\Scripts\\activate
   ```
3. Instalar las dependencias:
   ```sh
   pip install -r requirements.txt
   ```
4. Ejecutar la aplicación:
   ```sh
   python3 main.py
   ```

## 🔍 Endpoints principales
- `GET /peliculas` → Lista todas las películas.
- `GET /peliculas/<id>` → Obtiene una película por ID.
- `POST /peliculas` → Agrega una nueva película.
- `PUT /peliculas/<id>` → Actualiza una película.
- `DELETE /peliculas/<id>` → Elimina una película.
- `GET /peliculas/random/<genero>` → Obtiene una película aleatoria de un género
específico.
- `GET /peliculas/sugerencia_feriado` → Recomienda una película según el próximo
feriado.

## 🧪 Pruebas
- `cURL.sh` : **cURL** para pruebas manuales de los endpoints.
- `test.py`: **Requests** en scripts de prueba con peticiones automatizadas.
- `test_pytest.py`: **pytest con mocks** para simular respuestas y aislar
dependencias.
- `test_pytest_main.py`: **pytest utilizando la API de Flask en modo testing**
para evaluar el comportamiento real de la API.
- `API_Redes_lab1.postman_collection.json` : Postman Collection

