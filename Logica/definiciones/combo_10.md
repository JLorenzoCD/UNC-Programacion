# Combo 10
### (1) Defina "tesis del bloque $\left\langle i,j\right\rangle$ en $(\bm{\varphi}, \mathbf{J})$"

Dada $\mathbf{J}\in Just^{+}$ definamos
$$
\mathcal{B}^{\mathbf{J}}=\{\left\langle i,j\right\rangle :1\leq i\leq j\leq n(\mathbf{J}) \; \land \; \exists k\ \mathbf{J}_{i}=\text{HIPOTESIS}\bar{k} \; \land \; \mathbf{J}_{j}=\text{TESIS}\bar{k}\alpha\text{ para algún }\alpha\in
JustBas\}
$$

Sea $(\boldsymbol{\varphi},\mathbf{J})$ un par adecuado de tipo $\tau$. Si $\left\langle i,j\right\rangle \in\mathcal{B}^{\mathbf{J}}$, entonces $\boldsymbol{\varphi}_{i}$ será la hipótesis del bloque $\left\langle i,j\right\rangle$ en $(\boldsymbol{\varphi},\mathbf{J})$ y $\boldsymbol{\varphi}_{j}$ será **la tesis del bloque $\left\langle i,j\right\rangle$ en $(\boldsymbol{\varphi},\mathbf{J})$**.

### (2) Defina cuando una teoría de primer orden $(\Sigma, \tau)$ es consistente
Una teoría $(\Sigma,\tau)$ será inconsistente cuando haya una sentencia $\varphi$ tal que $(\Sigma,\tau)\vdash(\varphi\wedge\lnot\varphi)$. Una teoría $(\Sigma,\tau)$ será **consistente** cuando no sea inconsistente.

### (3) Dada una teoría elemental $(\Sigma, \tau)$ y una sentencia elemental pura $\varphi$ de tipo $\tau$, defina "prueba elemental de $\varphi$ en $(\Sigma, \tau)$"
Una prueba elemental de $\varphi$ en $(\Sigma,\tau)$ será una prueba de $\varphi$ que posea las siguientes características:
1. En la prueba se parte de una estructura de tipo $\tau$, fija pero arbitraria en el sentido que lo único que sabemos es que ella es una estructura que satisface los axiomas de $\Sigma$ (o sea esta es la única información particular que podemos usar).
2. Las deducciones en la prueba son muy simples y obvias de justificar con mínimas frases en castellano.
3. En la escritura de la prueba lo concerniente a la matemática misma se expresa usando solo sentencias elementales de tipo $\tau$.

> Esta definición no es matemáticamente precisa.
