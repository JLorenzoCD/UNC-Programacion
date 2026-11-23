# Combo 9
### (1) Defina "término elemental de tipo $\tau$"
Dado un tipo $\tau=(\mathcal{C},\mathcal{F},\mathcal{R},a)$ los términos elementales de tipo $\tau$ se definen con las siguientes clausulas:
1. Cada palabra de $\mathcal{C}$ es un término elemental de tipo $\tau$
2. Las variables $x,y,z,w,...$ son términos elementales de tipo $\tau$
3. Los nombres de elementos fijos $a,b,c,d,...$ son términos elementales de tipo $\tau$
4. Si $f\in\mathcal{F}_{n}$, con $n\geq1$ y $t_{1},...,t_{n}$ son términos elementales de tipo $\tau$, entonces la palabra $f(t_{1},...,t_{n})$ es un término elemental de tipo $\tau$
5. Una palabra es un término elemental de tipo $\tau$ si y solo si se puede construir usando las clausulas anteriores
> Duda: Esta es la definición matemáticamente imprecisa

Sea $\tau=(\mathcal{C},\mathcal{F},\mathcal{R},a)$ un tipo. Los terminos de tipo $\tau^{\prime}$, con $\tau^{\prime}$ alguna extension de $\tau$ por nombres de constante, modelizan matematicamente a los terminos elementales de tipo $\tau$.
> Duda: Esta es la definición matemáticamente precisa

### (2) Defina $\dashv\vdash_T$
Sea $T=(\Sigma,\tau)$ una teoría. Podemos definir la siguiente relación binaria sobre $S^{\tau}$ (conjunto de las sentencias de tipo $\tau$):
$$
\varphi\dashv\vdash_{T}\psi \Longleftrightarrow T\vdash\left(\varphi\leftrightarrow\psi\right)
$$
Es decir
$$
\dashv\vdash_{T}=\{(\varphi,\psi)\in
S^{\tau}\times
S^{\tau}:T\vdash\left(\varphi\leftrightarrow\psi\right)\}
$$

> Nota: $\dashv\vdash_{T}$ es una relación de equivalencia.

### (3) Defina $s^T$ (explique por qué la definición es inambigua)
> TODO


### (4) Defina $\mathcal{A}_T$
> TODO

### (5) Defina "$S$ es un subuniverso del reticulado complementado $(L, s, i, ^c, 0, 1)$"
Un conjunto $S\subseteq L$ es llamado subuniverso de $(L,\mathsf{s},\mathsf{i},^{c},0,1)$ si $0,1\in S$ y además $S$ es cerrado bajo las operaciones $\mathsf{s}$, $\mathsf{i}$ y $^{c}$
