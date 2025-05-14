# 🛰️ Laboratorio 3 - Simulación de Redes en OMNeT++

Proyecto correspondiente al **Laboratorio 3** de la materia **Redes y Sistemas
Distribuidos** (FAMAF - UNC).
Se desarrollan simulaciones en **OMNeT++** para analizar y diseñar mecanismos de
control de congestión y flujo en una red de nodos con colas y buffers limitados.

[Informe del proyecto](docs/INFORME_redes25lab3g03.pdf)

---

## 🎯 Objetivos del laboratorio
- Analizar el comportamiento de una red ante restricciones de capacidad y
memoria.
- Observar el impacto de distintas tasas de transmisión y tamaño de buffers.
- Diseñar un mecanismo de retroalimentación (feedback) que evite pérdidas por
saturación.
- Comparar escenarios **con** y **sin** un algoritmo de control de flujo y
congestion.

---

## 🌱 Ramas del repositorio
- `master`:
  Contiene el modelo base de red con colas simples. Se evalúan dos **casos de
  estudio** modificando `datarates` en el archivo `network.ned`.
  ➕ Scripts de análisis y generación de gráficas, escritos en python.

- `parada_y_espera`:
  Se extiende el modelo incorporando el algoritmo de control de flujo y
  congestion seleccionado por el grupo, el cual es el de **parada y espera (sin
  timeout)** entre el receptor y el transmisor.
  🔁 Se agrega un canal de feedback y nuevos tipos de paquetes.

---

## 🗂️ Estructura del proyecto (rama `master`)
```bash
.
├── Generator.cc
├── Queue.cc
├── Sink.cc
├── network.ned
├── omnetpp.ini
├── lab_constants.{cc,h}
├── datos_carga.py
├── graficas.py
├── Makefile
├── data/
│   ├── Caso-1/       # Resultados .vec y .vci
│   ├── Caso-2/
│   └── Carga/        # Gráficas .csv y .png
└── redes25lab3g03/   # Workspace de OMNeT++
````

### Archivos clave en `parada_y_espera`

```bash
├── TransportTx.cc / TransportRx.cc    # Módulos con control de flujo y congestion
├── FeedbackPkt.msg                    # Definición del mensaje de control
├── FeedbackPkt_m.{cc,h}               # Generados automáticamente por OMNeT++
```

---

## ⚙️ Cómo correr las simulaciones
1. Clonar el repositorio y moverse a la rama deseada:

   ```bash
   git switch master
   # o
   git switch parada_y_espera
   ```

2. Ejecutar la/s simulación/es en Omnet++.

3. Generar gráficos con los scripts:

   ```bash
   python3 datos_carga.py
   python3 graficas.py          # Se debe pasar la ruta de los archivos
   ```

📌 Requiere: Python 3, `matplotlib`, `pandas` (ver `requirements.txt`)

---

## 📊 Resultados y análisis
* Gráficas de **carga ofrecida vs carga útil**.
* Evolución del **delay promedio** en condiciones de congestión.
* Análisis comparativo entre **caso 1 y caso 2**.
* Evaluación del protocolo diseñado (con feedback) y su desempeño ante pérdida
de paquetes.

---

## 🧠 Reflexión final
Este trabajo apunta a entender como problemas de control de congestion y de
flujo afectan el funcionamiento de una red y como se puede mitigar mediante
ciertos algoritmos.

---

## 📝 Informe
El repositorio contiene además un informe en `Latex` con:

* Resumen
* Introducción al problema.
* Posibles soluciones.
* Explicaciones del diseño y lógica de implementación.
* Gráficas generadas a partir de los `.vec` y `.vci`.
* Análisis de los gráficos obtenidos.
* Una conclusion y discusión del grupo.

---

## 🙌 Créditos
Trabajo realizado por el grupo `03` para la cátedra de Redes y Sistemas
Distribuidos - FAMAF - UNC 🏛️

