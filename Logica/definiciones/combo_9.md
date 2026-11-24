# Combo 9
### (1) Defina "término elemental de tipo $\tau$"
Sea $\tau=(\mathcal{C},\mathcal{F},\mathcal{R},a)$ un tipo. Los terminos de tipo $\tau^{\prime}$, con $\tau^{\prime}$ alguna extension de $\tau$ por nombres de constante, modelizan matematicamente a los terminos elementales de tipo $\tau$.

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

Dada una teoría $T=(\Sigma,\tau)$ y $\varphi\in S^{\tau}, [\varphi]_{T}$ denotará la clase de $\varphi$ con respecto a la relación de equivalencia $\dashv\vdash_{T}$.

Defino sobre el conjunto $S^\tau / \dashv\vdash_T$ la siguiente operación binaria $s^T$:

$$[\varphi]_T \, s^T \, [\psi]_T = [\varphi \lor \psi]_T$$

Para demostrar que es **inambigüa** tenemos que ver que el resultado de las operaciones no depende de los representantes elegidos en cada clase.
- Supongamos $\varphi,\varphi',\psi,\psi'\in S^{\tau}$ tal que $[\varphi]_T = [\varphi']_T$ y $[\psi]_T = [\psi']_T$.
- Por definición, esto significa que $\varphi \dashv\vdash_T \varphi'$ y $\psi \dashv\vdash_T \psi'$, lo cual implica $T \vdash (\varphi \leftrightarrow \varphi')$ y $T \vdash (\psi \leftrightarrow \psi')$.
- Como $\dashv\vdash_T$ es reflexiva, entonces $T\vdash((\varphi\vee\psi)\leftrightarrow(\varphi\vee\psi))$
- Por la siguiente prueba formal:
$$
\begin{array}{llll}
1.\; & \left(\varphi\leftrightarrow\varphi^{\prime}\right)
&  & \text{AXIOMAPROPIO}\\
2.\; & \left(\psi\leftrightarrow\psi^{\prime}\right) &  &
\text{AXIOMAPROPIO}\\
3.\; & ((\varphi\vee\psi)\leftrightarrow(\varphi\vee\psi))
&  & \text{AXIOMALOGICO}\\
4.\; & ((\varphi\vee\psi)\leftrightarrow(\varphi^{\prime}\vee\psi))
&  & \text{REEMPLAZO}(1,3)\\
5.\; &
((\varphi\vee\psi)\leftrightarrow(\varphi^{\prime}\vee\psi^{\prime}))
&  & \text{REEMPLAZO}(2,4)
\end{array}
$$
- Obtenemos que $T\vdash((\varphi\vee\psi)\leftrightarrow(\varphi^{\prime}\vee\psi^{\prime}))$.
- Por definición de $\dashv\vdash_T$ tenemos que $(\varphi\vee\psi) \dashv\vdash_T (\varphi^{\prime}\vee\psi^{\prime})$.
- Lo cual implica que $[(\varphi\vee\psi)]_{T}=[(\varphi^{\prime}\vee\psi^{\prime})]_{T}$.

Como el resultado de las operaciones no depende de los representantes elegidos en cada clase, entonces es **inambigüa**.

### (4) Defina $\mathcal{A}_T$
Dada una teoría $T=(\Sigma,\tau)$, denotaremos con $\mathcal{A}_{T}$ al álgebra de Boole $(S^{\tau}/\mathrm{\dashv\vdash}_{T},\mathsf{s}^{T},\mathsf{i}^{T},^{\mathsf{c}^{T}},0^{T},1^{T})$. El álgebra $\mathcal{A}_{T}$ será llamada el álgebra de Lindenbaum de $T$.

### (5) Defina "$S$ es un subuniverso del reticulado complementado $(L, s, i, ^c, 0, 1)$"
Un conjunto $S\subseteq L$ es llamado subuniverso de $(L,\mathsf{s},\mathsf{i},^{c},0,1)$ si $0,1\in S$ y además $S$ es cerrado bajo las operaciones $\mathsf{s}$, $\mathsf{i}$ y $^{c}$.
