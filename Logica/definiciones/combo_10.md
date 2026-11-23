# Combo 10
### (1) Defina "tesis del bloque $\left\langle i,j\right\rangle$ en $(\bm{\varphi}, \mathbf{J})$"
Sea $(\boldsymbol{\varphi},\mathbf{J})$ un par adecuado de tipo $\tau$. Si $\left\langle i,j\right\rangle \in\mathcal{B}^{\mathbf{J}}$, entonces $\boldsymbol{\varphi}_{i}$ será la hipótesis del bloque $\left\langle i,j\right\rangle$ en $(\boldsymbol{\varphi},\mathbf{J})$ y $\boldsymbol{\varphi}_{j}$ será **la tesis del bloque $\left\langle i,j\right\rangle$ en $(\boldsymbol{\varphi},\mathbf{J})$**.

### (2) Defina cuando una teoría de primer orden $(\Sigma, \tau)$ es consistente
Una teoría $(\Sigma,\tau)$ será inconsistente cuando haya una sentencia $\varphi$ tal que $(\Sigma,\tau)\vdash(\varphi\wedge\lnot\varphi)$. Una teoría $(\Sigma,\tau)$ será **consistente** cuando no sea inconsistente.

### (3) Dada una teoría elemental $(\Sigma, \tau)$ y una sentencia elemental pura $\varphi$ de tipo $\tau$, defina "prueba elemental de $\varphi$ en $(\Sigma, \tau)$"
> "Como objeto matemático una prueba resultara ser un par ordenado de palabras cuya primera coordenada codificara en forma natural la sucesión de sentencias y su segunda coordenada codificará la sucesión de justificaciones."

Sea $\tau$ un tipo. Dada una teoría elemental $(\Sigma, \tau)$ y una sentencia elemental pura $\varphi$ de tipo $\tau$, una **prueba elemental** de $\varphi$ en $(\Sigma, \tau)$ es un par adecuado $(\bm{\psi}, \mathbf{J})$ de tipo $\tau$, con $\bm{\psi} = (\psi_1, \dots, \psi_n)$ y $\mathbf{J} = (J_1, \dots, J_n)$, tal que:

1. $\psi_n = \varphi$
2. Cada paso $k \in \{1, \dots, n\}$ está correctamente justificado por $J_k$ según las reglas de deducción natural (es una hipótesis, un axioma de $\Sigma$, un axioma lógico/de igualdad, o se obtiene aplicando una regla de inferencia a pasos anteriores disponibles en $(\bm{\psi}, \mathbf{J})$).
3. El paso final $n$ no se encuentra bajo ninguna hipótesis activa (es decir, no existe ningún bloque $\left\langle i,j\right\rangle \in \mathcal{B}^J$ tal que $i \le n \le j$).
