# Combo 6.
### Lema ($\Sigma$-efectivamente computable implica $\Sigma$-efectivamente enumerable).
Si $S \subseteq \omega^n \times \Sigma^{∗m}$ es $\Sigma$-efectivamente computable entonces $S$ es $\Sigma$-efectivamente enumerable.

Proof
- Si $S = \emptyset$, entonces claramente es $\Sigma$-efectivamente computable y $\Sigma$-efectivamente enumerable.
- Supongamos que $S \neq \emptyset$.

Como $S \neq \emptyset$ entonces fijo $(\vec{z}, \gamma) \in S$.

Como $S$ es $\Sigma$-efectivamente computable, entonces tenemos que $\mathbb{P}_{1}$ es el procedimiento efectivo que computa a $\chi^{\omega^n \times \Sigma^{∗m}}_S$.

Como $\omega^n \times \Sigma^{∗m}$ es claramente $\Sigma$-efectivamente enumerable, entonces tenemos que $\mathbb{P}_2$ es el procedimiento efectivo que enumera a $\omega^n \times \Sigma^{∗m}$.

Sea $\mathbb{P}_S$ el siguiente procedimiento efectivo:
- Se recibe como dato de entrada $x \in \omega.$
- Etapa 1: Se ejecuta $\mathbb{P}_2$ con $x$ para obtener $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{∗m}$.
- Etapa 2: Se ejecuta $\mathbb{P}_1$ con $(\vec{x}, \vec{\alpha})$ para obtener el valor booleano R.
- Etapa 3: Si R = 1, dar como dato de salida $(\vec{x}, \vec{\alpha})$ y terminar. Caso contrario, dar como dato de salida $(\vec{z}, \gamma)$ y terminar.

Claramente el procedimiento efectivo $\mathbb{P}_S$ enumera a $S$.

---

### Teorema (Caracterización de conjuntos $\Sigma$-RE).
Dado $S \subseteq \omega^n \times \Sigma^{∗m}$, son equivalentes <br>
(1) $S$ es $\Sigma$-recursivamente enumerable <br>
(2) $S = I_F$ , para alguna $F : D_F \subseteq \omega^k \times \Sigma^{∗l} \longmapsto \omega^n \times \Sigma^{∗m}$ tal que cada $F_{(i)}$ es $\Sigma$-recursiva. <br>
(3) $S = D_f$ , para alguna función $\Sigma$-recursiva $f$

> Haga solo la prueba de $(2) \implies (3)$, caso k = l = 1 y n = m = 2

Proof

$(2) \implies (3)$ <br>
Tenemos que $S \subseteq \omega^2 \times \Sigma^{∗2}$ y $F : D_F \subseteq \omega \times \Sigma^∗ \longmapsto \omega^2 \times \Sigma^{∗2}$ tal que $S = I_F$, con $F_{(1)}, F_{(2)}, F_{(3)}, F_{(4)}$ son $\Sigma$-R.

Sean $\mathcal{P}_i$ programas que computan a $F_{(i)}$, con $i = 1, 2, 3, 4$. Sea $\le$ un orden total sobre $\Sigma$. Definamos
$$
H_{i}=\lambda tx_{1}\alpha_{1}\left[\lnot
Halt^{1,1}(t,x_{1},\alpha_{1},\mathcal{P}_{i})\right]
$$
El cual, como se fija $\mathcal{P}_i$, entonces por independencia de alfabetos tenemos que $H_i$ son $\Sigma$-PR. Ademas, por segundo manantial de macros tenemos que existe la siguiente macro:
$$
\left[\mathrm{IF}\;H_{i}(\mathrm{V}2,\mathrm{V}1,\mathrm{W}1)\;\mathrm{GOTO}\;\mathrm{A}1\right]
$$
el cual la escribiré de la siguiente forma:
$$
\left[\mathrm{IF}\;\lnot
Halt^{1,1}(\mathrm{V}2,\mathrm{V}1,\mathrm{W}1,\mathcal{P}_{i})\;\mathrm{GOTO}\;\mathrm{A}1\right]
$$

Para $i = 1, 2$ defino:
$$
E_{i}=\lambda xtx_{1}\alpha_{1}\left[x\neq
E_{\#1}^{1,1}(t,x_{1},\alpha_{1},\mathcal{P}_{i})\right]
$$
Para $i = 3, 4$ defino:
$$
E_{i}=\lambda tx_{1}\alpha_{1}\alpha \left[\alpha\neq
E_{*1}^{1,1}(t,x_{1},\alpha_{1},\mathcal{P}_{i})\right]
$$
Las cuales, como se fija $\mathcal{P}_i$, entonces por independencia de alfabetos tenemos que $E_i$ son $\Sigma$-PR. Ademas, por segundo manantial de macros tenemos que existe la siguiente macros:
$$
\left[\mathrm{IF}\;E_{i}(\mathrm{V}2,\mathrm{V}3,\mathrm{V}1,\mathrm{W}1)\;\mathrm{GOTO}\;\mathrm{A}1\right] \\
\left[\mathrm{IF}\;E_{i}(\mathrm{V}2,\mathrm{V}1,\mathrm{W}1,\mathrm{W}2)\;\mathrm{GOTO}\;\mathrm{A}1\right]
$$
las cuales las escribiré de la siguiente forma:
$$
\left[\mathrm{IF}\;\mathrm{V}2\neq
E_{\#i}^{1,1}(\mathrm{V}3,\mathrm{V}1,\mathrm{W}1,\mathcal{P}_{i})\;\mathrm{GOTO}\;\mathrm{A}1\right] \\
\left[\mathrm{IF}\;\mathrm{W}2\neq
E_{*i}^{1,1}(\mathrm{V}3,\mathrm{V}1,\mathrm{W}1,\mathcal{P}_{i})\;\mathrm{GOTO}\;\mathrm{A}1\right] \\
$$

Entonces el siguiente programa $\mathcal{P} \in Pro^{\Sigma}$ (se utilizan alguna macros las cuales surgen del segundo manantial de macros de funciones claramente $\Sigma$-R):
$$
\begin{array}{l}
\mathrm{L}1\ \mathrm{N}20\leftarrow\mathrm{N}20+1\\{}
[\mathrm{N}10\leftarrow(\mathrm{N}20)_{1}]\\{}
[\mathrm{N}3\leftarrow(\mathrm{N}20)_{2}]\\{}
[\mathrm{P}3\leftarrow\ast^{\leq}(\mathrm{N}20)_{3}]\\
\left[\mathrm{IF}\;\lnot
Halt^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{1})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\lnot
Halt^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{2})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\lnot
Halt^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{3})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\lnot
Halt^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{4})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\mathrm{N}1\neq
E_{\#1}^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{1})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\mathrm{N}2\neq
E_{\#1}^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{2})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\mathrm{P}1\neq
E_{\ast1}^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{3})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\mathrm{P}2\neq
E_{\ast1}^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{4})\;\mathrm{GOTO}\;\mathrm{L}1\right]
\end{array}
$$

Tenemos entonces que $\mathcal{P}$ computa $p_{1}^{2,2}|_{S}$. Como $p_{1}^{2,2}|_{S}$ es $\Sigma$-C entonces por teorema (Godel vence a Neumann) tenemos que también es $\Sigma$-R. Ademas, como es una función con dominio restringido a $S$, claramente su dominio es $S$. Por lo que cumple (3).
