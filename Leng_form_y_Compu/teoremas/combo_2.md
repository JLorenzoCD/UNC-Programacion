# Combo 2.
### Lema (Lema de división por casos para funciones $\Sigma$-PR).
Supongamos $f_i : D_{f_i} \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}$ , $i = 1, \cdots, k$, son funciones $\Sigma$-PR tales que $D_{f_i} \cap D_{f_j} = \emptyset$ para
$i \neq j$. Entonces $f_1 \cup \cdots \cup f_k$ es $\Sigma$-PR
> (Hacer el caso k = 2, n = 2 y m = 1)

Proof

Por suposición $f_i, i=1, 2$ son funciones $\Sigma$-PR, por lema tenemos que sus dominios también deben de ser $\Sigma$-PR. Como $D_{f_1}, D_{f_2}$ son $\Sigma$-PR, entonces (por lema) $D_{f_1} \cup D_{f_2}$ es $\Sigma$-PR

Sean
$$ \overline{f}_i : D_{\overline{f}_i} \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}, \quad i = 1, 2 $$
funciones $\Sigma$-PR tales que $f_i = \overline{f}_i |_{f_i}, \quad i = 1, 2$ (lema) y como por suposición tenemos que $D_{f_1} \cap D_{f_2} = \emptyset$.

Entonces notar que:
$$ f_1 \cup f_2 = ( \lambda \alpha \beta [ \alpha \beta ] \circ [ \quad \lambda x \alpha [\alpha^x] \circ[ \chi^{\omega^m \times \Sigma^{*m}}_{D_{f_1}}, \overline{f}_1 ], \quad \lambda x \alpha [\alpha^x] \circ[ \chi^{\omega^m \times \Sigma^{*m}}_{D_{f_2}}, \overline{f}_2 ] \quad ] )|_{D_{f_1} \cup D_{f_2}} $$
por lo cual $f_1 \cup f_2$ es $\Sigma$-PR.

### Proposición (Caracterización básica de conjuntos $\Sigma$-enumerables).
Sea $S \subseteq \omega^n \times \Sigma^{∗m}$ un conjunto no vacı́o. Entonces son equivalentes:
1. $S$ es $\Sigma$-enumerable
2. Hay un programa $\mathcal{P} \in Pro^\Sigma$ tal que:
    1.  Para cada $x \in \omega$, tenemos que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$, donde $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$.
    2. Para cada $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$ hay un $x \in \omega$ tal que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$
> (Hacer el caso n = 2 y m = 1)

Proff

$(1) \Longrightarrow (2)$ <br>
Como S no es vació y por (1) sabemos que es $\Sigma$-E, entonces por definicion tenemos un $F: \omega \longrightarrow \omega^2 \times \Sigma^{*}$ tal que $I_F = S$ y $F_{(i)}$ es $\Sigma$-C, para cada $i = 1, 2, 3$. Y por primer manantial de macros, sabemos que existen las macros asociadas a cada una de las $F_{(i)}$. El siguiente programa claramente cumple con (2):
$$
\begin{aligned}

& \left[ \mathrm{P}1\leftarrow F_{(3)}(\mathrm{N}1) \right]\\
& \left[ \mathrm{N}2\leftarrow
F_{(2)}(\mathrm{N}1) \right]\\
& \left[ \mathrm{N}1\leftarrow F_{(1)}(\mathrm{N}1) \right]

\end{aligned}
$$

$(1) \Longleftarrow (2)$ <br>
Utilizaremos $\mathcal{P}$ para armar cada $F_{(i)}$, con $i = 1, 2, 3$. Como sabemos que $\mathcal{P}$ siempre termina partiendo $\forall x \in \omega$, entonces $T^{1, 0}(x, \mathcal{P})$ esta definido y lo utilizare con $E^{1, 0}_{\#(j)}$ y $E^{1, 0}_{*(j)}$ para hacer los programas que computen los $F_{(i)}$, gracias al segundo manantial de macros. (claramente se fija $\mathcal{P}$ para que las funciones anteriores sean $\Sigma$-R)
$$
\mathcal{P_{F_{(1)}}} \in Pro^\Sigma : \\

\begin{aligned}
& \left[ \mathrm{N}2\leftarrow T^{1, 0}(\mathrm{N}1, \mathcal{P}) \right]\\

& \left[ \mathrm{N}1\leftarrow E^{1, 0}_{\#(1)}(\mathrm{N}2, \mathrm{N}1, \mathcal{P}) \right]

\end{aligned}
$$

$$
\mathcal{P_{F_{(2)}}} \in Pro^\Sigma : \\

\begin{aligned}
& \left[ \mathrm{N}2\leftarrow T^{1, 0}(\mathrm{N}1, \mathcal{P}) \right]\\

& \left[ \mathrm{N}1\leftarrow E^{1, 0}_{\#(2)}(\mathrm{N}2, \mathrm{N}1, \mathcal{P}) \right]

\end{aligned}
$$

$$
\mathcal{P_{F_{(3)}}} \in Pro^\Sigma : \\

\begin{aligned}
& \left[ \mathrm{N}2\leftarrow T^{1, 0}(\mathrm{N}1, \mathcal{P}) \right]\\

& \left[ \mathrm{P}1\leftarrow E^{1, 0}_{*(1)}(\mathrm{N}2, \mathrm{N}1, \mathcal{P}) \right]

\end{aligned}
$$

Por lo que:
$$
\begin{aligned}

F_{(1)} = \Psi^{1, 0, \#}_{\mathcal{P_{F_{(1)}}}} \\
F_{(2)} = \Psi^{1, 0, \#}_{\mathcal{P_{F_{(2)}}}} \\
F_{(3)} = \Psi^{1, 0, *}_{\mathcal{P_{F_{(3)}}}}

\end{aligned}
$$

los cuales son $\Sigma$-C y tendriamos a $F = \left[ F_{(1)}, F_{(2)}, F_{(3)} \right]$ donde $I_F = S$.