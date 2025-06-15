# 🌐 Laboratorio 4 - Enrutamiento en Redes con OMNeT++

Proyecto correspondiente al **Laboratorio 4** de la materia **Redes y Sistemas
Distribuidos** (FAMAF - UNC).
Se desarrollan simulaciones en **OMNeT++** para analizar y diseñar estrategias de
enrutamiento en diferentes topologías de red, comenzando con una red en anillo.

[Informe del proyecto](https://drive.google.com/drive/folders/1kAqBbG3mvOZe__RLB1jk3fRomXtTzo1Q?usp=sharing)

---

## 🎯 Objetivos del laboratorio
- Leer, comprender y generar modelos de red en OMNeT++.
- Analizar tráfico de red bajo diferentes estrategias de enrutamiento.
- Diseñar y proponer soluciones de enrutamiento bajo diferentes topologías.
- Evaluar métricas de rendimiento como demora, saltos y utilización de recursos.
---

## 🏗️ Modelo de Red en Anillo
El modelo base consiste en una **red en anillo de 8 nodos**, cada uno con:
- **2 interfaces full-duplex** de comunicación con vecinos
- **3 capas**: aplicación (app), red (net) y enlace (lnk)
- La capa de **red** decide por qué interfaz enviar los paquetes (enrutamiento)
- El kickstarter implementa enrutamiento simple: siempre por interfaz 0 (sentido horario)

---

## 🌱 Ramas del repositorio
- `master`:
  Contiene el modelo base de red en anillo con enrutamiento básico.
  ➕ Scripts de análisis y generación de gráficas para métricas de rendimiento.

- `alg_enrutamiento`:
  Implementa una estrategia de enrutamiento optimizada que supera al algoritmo básico.
  ➕ Scripts de análisis y generación de gráficas para métricas de rendimiento.
  🔄 Incluye nuevos algoritmos de decisión de ruta y métricas adicionales.

---

## 🗂️ Estructura del proyecto
### Archivos de la rama master
```bash
.
├── App.cc
├── data
│   └── omnet-logs
│       ├── Parte 1
│       │   ├── p1_c1.vec
│       │   ├── p1_c2-1_25.vec
│       │   ├── p1_c2-1_5.vec
│       │   ├── p1_c2-1.vec
│       │   ├── p1_c2-2.vec
│       │   ├── p1_c2-3.vec
│       │   └── p1_c2-4.vec
│       └── Parte 2
│           ├── p2_c1.vec
│           ├── p2_c2-1_25.vec
│           ├── p2_c2-1_5.vec
│           ├── p2_c2-1.vec
│           ├── p2_c2-2.vec
│           ├── p2_c2-3.vec
│           └── p2_c2-4.vec
├── graficas.ipynb
├── Lnk.cc
├── Makefile
├── Net.cc
├── network.ned
├── omnetpp.ini
├── packet_m.cc
├── packet_m.h
├── packet.msg
├── README.md
└── requirements.txt

```

### Archivos de la rama alg_enrutamiento

```bash
.
# Nombres de archivos similares a la rama master ...
├── constants.cc
├── constants.h
├── feedbackPkt_m.cc
├── feedbackPkt_m.h
├── feedbackPkt.msg
├── NetTable.cc
└── NetTable.h

```

---

## ⚙️ Cómo correr las simulaciones

### Tarea de Análisis
1. Clonar el repositorio y ejecutar casos base:
   ```bash
   git clone git@bitbucket.org:redes-famaf/redes25lab4g03.git
   cd redes25lab4g03/
   ```

2. **Caso 1**: Ejecutar simulación con nodos 0 y 2 enviando a nodo 5
   ```cpp
   # Configurar en omnetpp.ini: caso1
   ```

3. **Caso 2**: Todos los nodos (0,1,2,3,4,6,7) enviando a nodo 5
   ```cpp
   # Configurar en omnetpp.ini: caso2
   # Experimentar con diferentes valores de interArrivalTime
   ```

### Tarea de Diseño
4. Cambiar a rama con enrutamiento mejorado:
   ```bash
   git switch alg_enrutamiento
   ```
5. Generar gráficos y análisis:
   Ejecutar en Google Colab o Jupyter Notebooks el archivo *graficas.ipynb* con los
   datos de la carpeta *data/*.

📌 Requiere: Python 3 y las librerías detalladas en `requirements.txt`.
   Se recomienda el uso de un virtualenv de python.

---

## 📊 Métricas analizadas

- **Máximo tamaño del búfer por nodo y enlaces**: Indica el tamaño máximo alcanzado por el
búfer de un link específico a lo largo de toda la simulación.
- **Uso de enlaces por nodo**: Refleja el tráfico total, considerando tanto el envío como 
la recepción de paquetes a través de un determinado enlace.
- **Cantidad de paquetes vs Delay**: Mostrará la distribución de paquetes según el delay experimentado.
- **Tamaño de los búferes de los links a lo largo del tiempo**: Indica la evolución del tamaño de los 
búferes de los enlaces durante la simulación.

---

## 🧠 Reflexión final
Este laboratorio permite comprender los desafíos del enrutamiento en redes,
desde algoritmos simples hasta soluciones adaptativas que optimizan el uso
de recursos y minimizan la congestión en una topología de anillo.

---

## 🌟 Tareas realizadas

- ✅ **Tarea Análisis**: Casos 1 y 2 con métricas de rendimiento
- ✅ **Tarea Diseño**: Algoritmo de enrutamiento mejorado  

---

## 🙌 Créditos
Trabajo realizado por el grupo `03` para la cátedra de Redes y Sistemas
Distribuidos - FAMAF - UNC 🏛️
