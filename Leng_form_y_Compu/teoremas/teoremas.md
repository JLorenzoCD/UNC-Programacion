# Teoremas
---
# Combo 1.
### Proposición (Caracterización de conjuntos $\Sigma$-PR). Un conjunto $S$ es $\Sigma$-PR sii $S$ es el dominio de alguna función $\Sigma$-PR
> En la inducción de la prueba hacer solo el caso de la composición

Proof

($\implies$) Note que $S = D_{Pred \circ \chi_S^{\omega^n \times \Sigma^{*m}}}$ <br>
($\Longleftarrow$) **Solo el caso de composición.** (no casos $F = R(f, g)$, $F = R(f, \mathcal{G})$, para recursion con imagen contenida en $\omega$ y $\Sigma^*$) <br>

Probare por inducción en $k$ que $D_F$ es $\Sigma$-PR para cada $F \in PR^\Sigma_k$.

El caso $k=0$ es fácil, ya que las funciones en $PR^\Sigma_0$ tienen dominio contenido en $\omega^n \times \Sigma^{*m}$ y como $\omega$ y $\Sigma^*$ son conjuntos no vacíos $\Sigma$-PR, entonces el producto cruz de estos es un conjunto $\Sigma$-PR.

- Supongamos que el resultado vale para un k fijo, con $k \gt 0$.

Supongamos que $F = g \circ [g_1, \cdots, g_r ]$ con $g, g_1, \cdots, g_r \in (PR^\Sigma_k - PR^\Sigma_{k-1})$, por lo cual, notar que $F \in PR^\Sigma_{k+1}$.

- Si $F = \emptyset$, entonces es claro que $D_F = \emptyset$ es $\Sigma$-PR.

- Supongamos entonces que $F$ no es la función $\emptyset$.

Tenemos entonces que $r$ es de la forma $n + m$ y
$$
\begin{array}{cl}

    & g : D_g \subseteq \omega^n \times \Sigma^{∗m} \longmapsto O \\

    & g_i : D_{g_i} \subseteq \omega^k \times \Sigma^{∗l} \longmapsto \omega, \quad i = 1, \cdots, n \\

    & g_i : D_{g_i} \subseteq \omega^k \times \Sigma^{∗l} \longmapsto \Sigma^∗, \quad i = n + 1, \cdots, n + m \\

\end{array}
$$
con $O \in \{ \omega, \Sigma^∗ \}$ y $k, l ∈ \omega$. Por Lema 19, hay funciones $\Sigma$-PR, $\overline{g}, \overline{g}_1, \cdots, \overline{g}_{n + m} \in PR^\Sigma_k$ las cuales son $\Sigma$-totales y cumplen
$$
\begin{aligned}
& g = \overline{g} |_{D_{g}} \\
& g_i = \overline{g}_i |_{D_{g_i}} ,  \quad \text{para } i = 1, \cdots, n + m
\end{aligned}
$$

Por hipótesis inductiva los conjuntos $D_g , D_{g_i} , i = 1, \cdots, n + m$, son $\Sigma$-PR y por lo tanto
$$ S = \bigcap_{i=1}^{n + m} D_{g_i} $$
lo es. Nótese que
$$ \chi_{D_F}^{\omega^n \times \Sigma^{*m}} = (\chi_{D_g}^{\omega^n \times \Sigma^{*m}} \circ [\overline{g}_1, \cdots, \overline{g}_{n+m}] \wedge \chi_S^{\omega^n \times \Sigma^{*m}}) $$
lo cual nos dice que $D_F$ es $\Sigma$-PR. Por lo cual se cumple la hipótesis para $PR^\Sigma_{k+1}$.

---
### Teorema (Neumann vence a Godel). Si $h$ es $\Sigma$-recursiva, entonces $h$ es $\Sigma$-computable
> En la inducción de la prueba hacer solo el caso $h = R(f, \mathcal{G})$, con $I_h \subseteq \omega$

Proof

Probemos por inducción en k que si $h \in R^\Sigma_k$, entonces h es $\Sigma$-C.

El caso $k = 0$ es trivial ya que las funciones existentes en $R^\Sigma_0$ se pueden realizar con las instrucciones básicas en $\mathcal{S}^\Sigma$.

Caso $h \in R^\Sigma_k$: Valido por ser hipótesis inductiva.

- Sea $h \in (R^\Sigma_{k+1} - R^\Sigma_k)$. Hay varios casos.

Caso $h = M(P)$. (no se hace, combo 8).

Caso $h = R(f, \mathcal{G})$ ($I_h \subseteq \omega$), con:
$$
\begin{aligned}

f & : S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \longmapsto \omega \\

\mathcal{G}_a & : \omega \times S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \times \Sigma^* \longmapsto \omega, \quad a \in \Sigma \\

\end{aligned}
$$

elementos de $R^\Sigma_k$, con $S_1, \cdots, S_n \subseteq \omega$ y $L_1, \cdots, L_m \subseteq \Sigma^*$. Sea $\Sigma = \{ a_1 , \cdots, a_r \}$. Por hipotesis inductiva, las funciones $f$ y $\mathcal{G}_a \ (a \in \Sigma)$, son $\Sigma$-computables y por lo tanto tenemos macros
$$ [V\overline{n+1} \longleftarrow f(V1, \cdots, V\overline{n}, W1, \cdots, W\overline{m})] $$
$$
[ V\overline{n+2} \longleftarrow \mathcal{G}_{a_{i}}(V\overline{n+1}, V1, \cdots, V\overline{n}, W1, \cdots, W\overline{m}, W\overline{m+1})], \quad i = 1, \cdots, r
$$

Podemos entonces hacer el siguiente programa:
$$
\begin{array}{rl}

& [ N\overline{n+1} \longleftarrow f(N1, \cdots, N\overline{n}, P1, \cdots, P\overline{m}) ] \\

L\overline{r+1} & IF\;P\overline{m+1}\
\text{BEGINS } a_{1} \text{ GOTO L}1 \\
& \ \ \ \ \ \ \ \ \ \ \ \ \vdots\\
& \text{IF P}\overline{m+1} \text{ BEGINS }a_{r} \text{GOTO L}\overline{r}\\
& \text{GOTO L}\overline{r+2}\\

L1 & P\overline{m+1} \longleftarrow \text{}^{\curvearrowright} \ P\overline{m+1} \\
& [ N\overline{n+1} \longleftarrow \mathcal{G}_{a_1}( N\overline{n+1}, N1, \cdots, N\overline{n}, P1,\cdots, P\overline{m}, P\overline{m+2} ) ]\\
& P\overline{m+2} \longleftarrow P\overline{m+2}.a_{1} \\
& \text{GOTO L}\overline{r+1} \\
& \ \ \ \ \ \ \ \ \ \ \ \ \vdots\\
L\overline{r} &  P\overline{m+1} \longleftarrow \text{}^{\curvearrowright} \ P\overline{m+1} \\
& [ N\overline{n+1} \longleftarrow \mathcal{G}_{a_r}( N\overline{n+1}, N1, \cdots, N\overline{n}, P1, \cdots, P\overline{m}, P\overline{m+2} ) ] \\
& P\overline{m+2} \longleftarrow P\overline{m+2}.a_{r}\\
& \text{GOTO L}\overline{r+1}\\

L\overline{r+2} & N1\longleftarrow N\overline{n+1}

\end{array}
$$

Claramente este programa computa $h$.


---
---
# Combo 2.
### Lema (Lema de división por casos para funciones $\Sigma$-PR).
Supongamos $f_i : D_{f_i} \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}$ , $i = 1, \cdots, k$, son funciones $\Sigma$-PR tales que $D_{f_i} \cap D_{f_j} = \emptyset$ para
$i \neq j$. Entonces $f_1 \cup \cdots \cup f_k$ es $\Sigma$-PR
> Hacer el caso k = 2, n = 2 y m = 1

Proof

Por suposición $f_i, i=1, 2$ son funciones $\Sigma$-PR, por lema tenemos que sus dominios también deben de ser $\Sigma$-PR. Como $D_{f_1}, D_{f_2}$ son $\Sigma$-PR, entonces (por lema) $D_{f_1} \cup D_{f_2}$ es $\Sigma$-PR

Sean
$$ \overline{f}_i : \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}, \quad i = 1, 2 $$
funciones $\Sigma$-PR tales que $f_i = \overline{f}_i |_{D_{f_i}}, \quad i = 1, 2$ (lema) y como por suposición tenemos que $D_{f_1} \cap D_{f_2} = \emptyset$.

Entonces notar que:
$$ f_1 \cup f_2 = ( \lambda \alpha \beta [ \alpha \beta ] \circ [ \quad \lambda x \alpha [\alpha^x] \circ[ \chi^{\omega^m \times \Sigma^{*m}}_{D_{f_1}}, \overline{f}_1 ], \quad \lambda x \alpha [\alpha^x] \circ[ \chi^{\omega^m \times \Sigma^{*m}}_{D_{f_2}}, \overline{f}_2 ] \quad ] )|_{D_{f_1} \cup D_{f_2}} $$
por lo cual $f_1 \cup f_2$ es $\Sigma$-PR.

---
### Proposición (Caracterización básica de conjuntos $\Sigma$-enumerables).
Sea $S \subseteq \omega^n \times \Sigma^{∗m}$ un conjunto no vacı́o. Entonces son equivalentes:
1. $S$ es $\Sigma$-enumerable
2. Hay un programa $\mathcal{P} \in Pro^\Sigma$ tal que:
    1.  Para cada $x \in \omega$, tenemos que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$, donde $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$.
    2. Para cada $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$ hay un $x \in \omega$ tal que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$
> Hacer el caso n = 2 y m = 1

Proof

$(1) \Longrightarrow (2)$ <br>
Como S no es vació y sabemos que es $\Sigma$-E, entonces por definicion tenemos un $F: \omega \longrightarrow \omega^2 \times \Sigma^{*}$ tal que $I_F = S$ y $F_{(i)}$ es $\Sigma$-C, para cada $i = 1, 2, 3$. Y por primer manantial de macros, sabemos que existen las macros asociadas a cada una de las $F_{(i)}$. El siguiente programa claramente cumple con (2):
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

los cuales son $\Sigma$-C y tendriamos a $F = \left[ F_{(1)}, F_{(2)}, F_{(3)} \right]$ donde $I_F = S$. Por lo que, por definición, tenemos que $S$ es $\Sigma$-E.


---
---
# Combo 3.
### Teorema (Godel vence a Neumann). Si $f : D_f \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}$ es $\Sigma$-computable, entonces $f$ es $\Sigma$-recursiva.

> Similar al combo 9, cambia conjunto de llegada

Función $\Phi_*^{n,m}$: <br>
Para $n, m \in \omega$ definamos la función $\Phi_*^{n,m}$ de la siguiente manera:
$$
\begin{aligned}

D_{\Phi_*^{n,m}} & = \left\{ (\vec{x},\vec{\alpha},\mathcal{P}) \in \omega^{n} \times \Sigma^{*m} \times \mathrm{Pro}^{\Sigma} :(\vec{x},\vec{\alpha}) \in D_{\Psi_{\mathcal{P}}^{n,m,*}} \right\} \\

\Phi_*^{n,m}(\vec{x},\vec{\alpha},\mathcal{P}) & =\Psi_{\mathcal{P}}^{n,m,*}(\vec{x},\vec{\alpha}) \text{, para cada }(\vec{x},\vec{\alpha},\mathcal{P}) \in D_{\Phi_*^{n,m}}

\end{aligned}
$$
Nótese que
$$ \Phi_{*}^{n,m} = \lambda\vec{x}\vec{\alpha}\mathcal{P}\left[\Psi_{\mathcal{P}}^{n,m,*}(\vec{x},\vec{\alpha}) \right] $$
Por teorema, tenemos que $\Phi_*^{n,m}$ es $(\Sigma \cup \Sigma^p)$-R

Proof

Sea $\mathcal{P}_0$ un programa que compute a $f$. Primero veremos que $f$ es $(\Sigma \cup \Sigma^p)$-R. Note que
$$ f=\Phi_{*}^{n,m}\circ\left[p_{1}^{n,m},...,p_{n+m}^{n,m},C_{\mathcal{P}_{0}}^{n,m}\right] $$

donde cabe destacar que $p_1^{n, m}, \cdots, p_{n + m}^{n, m}$ son proyecciones respecto al alfabeto $\Sigma \cup \Sigma^p$, es decir que tienen dominio $\omega^n \times (\Sigma \cup \Sigma^p)^{*m}$. Ya que $\Phi_*^{n,m}$ es $(\Sigma \cup \Sigma^p)$-R tenemos que f también lo es.

Si se fija el $\mathcal{P}_0$, por independencia del alfabeto tendríamos que f es $\Sigma$-R.

---
### Teorema (Caracterización de conjuntos $\Sigma$-efectivamente computables).
Sea $S \subseteq \omega^n \times \Sigma^{∗m}$. Son equivalentes <br>
(a) $S$ es $\Sigma$-efectivamente computable <br>
(b) $S$ y $(\omega^n \times \Sigma^{∗m}) − S$ son $\Sigma$-efectivamente enumerables

> Haga solo (b) implica (a). La prueba de este resultado esta al final de la Guı́a 3

Proof

$(b) \Longrightarrow (a)$ <br>
- Si $S = \emptyset$ ó $S = \omega^n \times \Sigma^{*m}$, seria evidente que cumple (a)
- Supongamos que $S \neq \emptyset$ y $S \neq \omega^n \times \Sigma^{*m}$.

Sean $\mathbb{P}_1$ un procedimiento efectivo que enumere a S y $\mathbb{P}_2$ un procedimiento efectivo que enumere a $(\omega^n \times \Sigma^{*m}) - S$. Es facil ver que el siguiente procedimiento computa el predicado $\chi^{\omega^n \times \Sigma^{*m}}_S$:

Dato de entrada: $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}$
- Etapa 1: Darle a la variable T el valor 0.
- Etapa 2: Realizar $\mathbb{P}_1$ con el valor de T como dato de entrada para obtener de salida la upla $(\vec{y}, \vec{\beta})$.
- Etapa 3: Realizar $\mathbb{P}_2$ con el valor de T como dato de entrada para obtener de salida la upla $(\vec{z}, \vec{\gamma})$.
- Etapa 4: Si $(\vec{y}, \vec{\beta}) = (\vec{x}, \vec{\alpha})$, entonces detenerse y dar como dato de salida el valor 1. Si $(\vec{z}, \vec{\gamma}) = (\vec{x}, \vec{\alpha})$, entonces detenerse y dar como dato de salida el valor 0. Si no sucede ninguna de las dos posibilidades mencionadas, aumentar en 1 el valor de la variable T y dirigirse a Etapa2.


---
---
# Combo 4.
### Proposición (Caracterización básica de conjuntos $\Sigma$-enumerables).

Sea $S \subseteq \omega^n \times \Sigma^{∗m}$ un conjunto no vacı́o. Entonces son equivalentes:
1. $S$ es $\Sigma$-enumerable
2. Hay un programa $\mathcal{P} \in Pro^\Sigma$ tal que:
    1. Para cada $x \in \omega$, tenemos que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$, donde $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$.
    2. Para cada $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$ hay un $x \in \omega$ tal que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$
> Hacer el caso n = 2 y m = 1

Proof

> **(mismo que combo 2)**

---
### Lema (Lema de la sumatoria).
Sea $\Sigma$ un alfabeto finito. Si $f : \omega \times S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \longmapsto \omega$ es $\Sigma$-PR, con $S_1 , \cdots, S_n \subseteq \omega$ y $L_1, \cdots, L_m \subseteq \Sigma^*$ no vacı́os, entonces la función $\lambda x y \vec{x} \vec{\alpha} \left[ \ \sum_{t=x}^{t=y} \quad f(t, \vec{x}, \vec{\alpha}) \ \right]$ es $\Sigma$-PR

Proof

Sea $G = \lambda t x \vec{x} \vec{\alpha} \left[ \ \sum_{i=x}^{i=t} \quad f(i, \vec{x}, \vec{\alpha}) \ \right]$. Ya que
$$
\lambda
xy\vec{x}\vec{\alpha}\left[\sum_{i=x}^{i=y}f(i,\vec{x},\vec{\alpha})\right]=G\circ\left[p_{2}^{n+2,m},p_{1}^{n+2,m},p_{3}^{n+2,m},\cdots,p_{n+m+2}^{n+2,m}\right]
$$
solo tenemos que probar que $G$ es $\Sigma$-PR. Primero notar que:
$$
\begin{aligned}

G(0,x,\vec{x},\vec{\alpha}) & =\left\{ \begin{array}{lll}
0 &  & \text{si }x>0\\
f(0,\vec{x},\vec{\alpha}) &  & \text{si }x=0
\end{array}\right.\\

G(t+1,x,\vec{x},\vec{\alpha}) & =\left\{ \begin{array}{lll}
0 &  & \text{si }x>t+1\\
G(t,x,\vec{x},\vec{\alpha})+f(t+1,\vec{x},\vec{\alpha}) &  &
\text{si }x\leq t+1
\end{array}\right.

\end{aligned}
$$

O sea que si definimos
$$
\begin{array}{rll}
h:\omega\times S_{1}\times \cdots \times S_{n}\times L_{1}\times \cdots \times
L_{m} & \longrightarrow & \omega\\

(x,\vec{x},\vec{\alpha}) & \longrightarrow & \left\{
\begin{array}{lll}
0 &  & \text{si }x>0\\
f(0,\vec{x},\vec{\alpha}) &  & \text{si }x=0
\end{array}\right.
\end{array}
$$
$$
\begin{array}{rll}
g:\omega^{3}\times S_{1}\times \cdots \times S_{n}\times L_{1}\times \cdots \times
L_{m} & \longrightarrow & \omega\\

(A,t,x,\vec{x},\vec{\alpha}) & \longrightarrow & \left\{
\begin{array}{lll}
0 &  & \text{si }x>t+1\\
A+f(t+1,\vec{x},\vec{\alpha}) &  & \text{si }x\leq t+1
\end{array}\right.
\end{array}
$$
tenemos que $G = R(h, g)$. Es decir que solo nos falta probar que h y g son $\Sigma$-PR. <br>
Nótese que
$$
\begin{aligned}
h & =C_{0}^{n+1,m}|_{D_{1}}\cup\lambda x\vec{x}\vec{\alpha}\left[f(0,\vec{x},\vec{\alpha})\right]|_{D_{2}}\\

g & =C_{0}^{n+3,m}|_{H_{1}}\cup \lambda Atx\vec{x}\vec{\alpha}\left[A+f(t+1,\vec{x},\vec{\alpha})\right])|_{H_{2}}
\end{aligned}
$$
asi que para ver que h y g son $\Sigma$-PR podemos aplicar el lema de division por casos y revisar que las funciones que componen a h y g sean $\Sigma$-PR

Es claro que $C_{0}^{n+1,m}$ y $C_{0}^{n+3,m}$ son $\Sigma$-PR. También nótese que:
$$
\begin{aligned}
\lambda x\vec{x}\vec{\alpha}\left[f(0,\vec{x},\vec{\alpha})\right] & = f \circ \left[C_{0}^{n+1,m},p_{2}^{n+1,m},p_{3}^{n+1,m},\cdots,p_{n+1+m}^{n+1,m} \right]\\

\lambda Atx\vec{x}\vec{\alpha}\left[A+f(t+1,\vec{x},\vec{\alpha})\right]) & = \lambda xy[x+y]\circ\left[p_{1}^{n+3,m},f\circ\left[Suc\circ p_{2}^{n+3,m},p_{4}^{n+3,m},\cdots,p_{n+3+m}^{n+3,m}\right]\right]
\end{aligned}
$$
lo cual, ya que f es $\Sigma$-PR, nos dice que $\lambda x\vec{x}\vec{\alpha}\left[f(0,\vec{x},\vec{\alpha})\right]$ y $\lambda Atx\vec{x}\vec{\alpha}\left[A+f(t+1,\vec{x},\vec{\alpha})\right])$ son $\Sigma$-PR. Por lo que solo nos quedaría revisar que los conjuntos que restringen a las funciones ($D_1, D_2, H_1, H_2$) son disjuntos y $\Sigma$-PR.
$$
\begin{aligned}
D_{1} & =\left\{ (x,\vec{x},\vec{\alpha})\in\omega\times
S_{1}\times \cdots \times S_{n}\times L_{1}\times \cdots \times
L_{m}:x>0\right\} \\
D_{2} & =\left\{ (x,\vec{x},\vec{\alpha})\in\omega\times
S_{1}\times \cdots \times S_{n}\times L_{1}\times \cdots \times L_{m}:x=0\right\}
\\
H_{1} & =\left\{ (z,t,x,\vec{x},\vec{\alpha})\in\omega^{3}\times
S_{1}\times \cdots \times S_{n}\times L_{1}\times \cdots \times
L_{m}:x>t+1\right\} \\
H_{2} & =\left\{ (z,t,x,\vec{x},\vec{\alpha})\in\omega^{3}\times
S_{1}\times \cdots \times S_{n}\times L_{1}\times \cdots \times L_{m}:x\leq
t+1\right\} .
\end{aligned}
$$

- Como f es $\Sigma$-PR, entonces su dominio $D_f = \omega \times S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m$ es $\Sigma$-PR.
- Como el producto cruz es $\Sigma$-PR, entonces los conjuntos $S_1, \cdots, S_n, L_1, \cdots, L_m$ son conjuntos no vacios y $\Sigma$-PR.
- Claramente $\omega$ es $\Sigma$-PR.

Por lo cual los siguientes conjuntos son $\Sigma$-PR.
$$
D = \omega \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m} \\

H = \omega^3 \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m}
$$

Por lo que las siguientes funciones características de los conjuntos $D_1, D_2, H_1, H_2$ son $\Sigma$-PR (los predicados que lo conforman son claramente $\Sigma$-PR).
$$
\chi^{\omega^{1 + n} \times \Sigma^{*m}}_{D_1} = (\chi^{\omega^{1 + n} \times \Sigma^{*m}}_{D} \wedge \lambda x \vec{x} \vec{\alpha} \left[ x \gt 0 \right]) \\

\chi^{\omega^{1 + n} \times \Sigma^{*m}}_{D_2} = (\chi^{\omega^{1 + n} \times \Sigma^{*m}}_{D} \wedge \lambda x \vec{x} \vec{\alpha} \left[ x = 0 \right]) \\
$$

$$
\chi^{\omega^{3 + n} \times \Sigma^{*m}}_{H_1} = (\chi^{\omega^{3 + n} \times \Sigma^{*m}}_{H} \wedge \lambda z t x \vec{x} \vec{\alpha} \left[ x \gt t + 1 \right]) \\

\chi^{\omega^{3 + n} \times \Sigma^{*m}}_{H_2} = (\chi^{\omega^{3 + n} \times \Sigma^{*m}}_{H} \wedge \lambda z t x \vec{x} \vec{\alpha} \left[ x \le t + 1 \right])
$$

Por lo tanto los conjuntos $D_1, D_2, H_1, H_2$ son $\Sigma$-PR y claramente son disjuntos. Por lo que h y g son $\Sigma$-PR. Entonces G es $\Sigma$-PR. Entonces tenemos que $\lambda x y \vec{x} \vec{\alpha} \left[ \ \sum_{t=x}^{t=y} \quad f(t, \vec{x}, \vec{\alpha}) \ \right]$ es $\Sigma$-PR.


---
---
# Combo 5.
### Lema.
Sea $\Sigma = \{ @, \%, ! \}$. Sea
$$ f : S_1 \times S_2 \times L_1 \times L_2 \longmapsto \omega $$
con $S_1, S_2 \subseteq \omega$ y $L_1, L_2 \subseteq \Sigma^∗$ conjuntos no vacı́os y sea $\mathcal{G}$ una familia $\Sigma$-indexada de funciones tal que
$$ \mathcal{G}_a : \omega \times S_1 \times S_2 \times L_1 \times L_2 \times \Sigma^∗ \longmapsto \omega$$
para cada $a \in \Sigma$. Si $f, \mathcal{G}_@ , \mathcal{G}_{\%}$ y $\mathcal{G}_!$ son $\Sigma$-efectivamente computables, entonces $R(f, \mathcal{G})$ lo es.
> Es un ejercicio de la Guı́a 5

Proof

Como $f, \mathcal{G}_@ , \mathcal{G}_{\%}$ y $\mathcal{G}_!$ son $\Sigma$-efectivamente computables, entonces existen los siguientes procedimientos efectivos que las computan $\mathbb{P}_{f}, \mathbb{P}_{\mathcal{G}_@}, \mathbb{P}_{\mathcal{G}_{\%}}, \mathbb{P}_{\mathcal{G}_!}$. Sea $\mathbb{P}_{R(f, \mathcal{G})}$ el siguiente procedimiento:

Se recibe como dato de entrada $(\vec{x}, \vec{\alpha}, \alpha)$, con $\vec{x} \in \omega^2$, $\vec{\alpha} \in \Sigma^{*2}$ y $\alpha \in \Sigma^*$, entonces:
- Etapa 1: Ejecuto $\mathbb{P}_{f}$ con $(\vec{x}, \vec{\alpha})$ obteniendo A com resultado.
- Etapa 2: Si $\alpha = \epsilon$, devuelvo A y termino.
- Etapa 3: $C = \left[ \alpha \right]_{|\alpha|} y \ \alpha = \text{}^{\curvearrowright} \alpha$.
- Etapa 4: Si $C = @$, ejecuto $\mathbb{P}_{\mathcal{G}_@}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.
- Etapa 5: Si $C = \%$, ejecuto $\mathbb{P}_{\mathcal{G}_\%}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.
- Etapa 6: Ejecuto $\mathbb{P}_{\mathcal{G}_!}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.

Claramente el procedimiento anterior computa a $R(f, \mathcal{G})$, por lo que este ultimo es $\Sigma$-efectivamente computable.

---
### Lema (Lema de cuantificación acotada).
Sea $\Sigma$ un alfabeto finito. Sea $P : S \times S_1 \times \cdots\times S_n \times L_1 \times\cdots\times L_m \longmapsto \omega$ un predicado $\Sigma$-PR, con $S, S_1, \cdots, S_n \subseteq \omega$ y $L_1 , \cdots, L_m \subseteq \Sigma^∗$ no vacı́os. Supongamos $\overline{S} \subset S$ es $\Sigma$-PR. Entonces $ \lambda x \vec{x} \vec{\alpha} [ \ (\forall t \in \overline{S})_{t \le x} \quad  P(t, \vec{x} \vec{\alpha}) \ ] $ es $\Sigma$-PR

Proof

Como $P$ es $\Sigma$-PR, entonces por lema su dominio es $\Sigma$-PR. Por lema, el producto cruz es $\Sigma$-PR si cada conjunto del mismo es no vacio y $\Sigma$-PR, por lo que $S, S_1, \cdots, S_n, L_1,\cdots, L_m$ son conjuntos $\Sigma$-PR.

Sea
$$
\overline{P} = P|_{\overline{S}\times S_{1} \times \cdots \times
S_{n} \times L_{1} \times \cdots \times L_{m}} \cup C_{1}^{1+n,m}|_{(\omega - \overline{S}) \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m}}
$$
claramente $C_{1}^{1+n,m}$ es $\Sigma$-PR. Ademas, como por suposición $\overline{S}$ es $\Sigma$-PR, entonces $(\omega - \overline{S})$ también es $\Sigma$-PR. Por lema de la restricción y de la union de funciones, donde en este caso los dominios son claramente disjuntos, tendríamos que $\overline{P}$ es $\Sigma$-PR.

Por "Lema de la Sumatoria" sabemos que $\lambda x y \vec{x} \vec{\alpha} \left[ \prod_{t=x}^{t=y} \overline{P}(t, \vec{x},\vec{\alpha}) \right]$ es $\Sigma$-PR. Como es valida la siguiente igualdad:
$$
\begin{aligned}

\lambda x \vec{x} \vec{\alpha} \left[ (\forall t\in\overline{S})_{t\leq
x}\overline{P}(t,\vec{x},\vec{\alpha})\right] & =\lambda
x\vec{x}\vec{\alpha}\left[\prod\limits_{t=0}^{t=x}\overline{P}(t,\vec{x},\vec{\alpha})\right]\\
& =\lambda
xy\vec{x}\vec{\alpha}\left[\prod\limits_{t=x}^{t=y}\overline{P}(t,\vec{x},\vec{\alpha})\right]\circ\left[C_{0}^{1+n,m},p_{1}^{1+n,m},\cdots,p_{1+n+m}^{1+n,m}\right]

\end{aligned}
$$
entonces tenemos que $ \lambda x \vec{x} \vec{\alpha} [ \ (\forall t \in \overline{S})_{t \le x} \  \overline{P}(t, \vec{x} \vec{\alpha}) \ ] $ es $\Sigma$-PR.

Por lema de la restricción del dominio de una función $\Sigma$-PR, se puede probar fácilmente que $\lambda x \vec{x} \vec{\alpha} \left[ (\forall t\in\overline{S})_{t\leq x}P(t,\vec{x},\vec{\alpha})\right]$ es $\Sigma$-PR.


---
---
# Combo 6.
### Lema ($\Sigma$-efectivamente computable implica $\Sigma$-efectivamente enumerable).
Si $S \subseteq \omega^n \times \Sigma^{∗m}$ es $\Sigma$-efectivamente computable entonces $S$ es $\Sigma$-efectivamente enumerable.

Proof
- Si $S = \emptyset$, entonces claramente es $\Sigma$-efectivamente computable y $\Sigma$-efectivamente enumerable.
- Supongamos que $S \neq \emptyset$.

Como $S \neq \emptyset$ entonces fijo $(\vec{z}, \gamma) \in S$.

Como $S$ es $\Sigma$-efectivamente computable, entonces tenemos que $\mathbb{P}_{1}$ es el procedimiento efectivo que computa a $\chi^{\omega^n \times \Sigma^{∗m}}_S$.

Como $\omega^n \times \Sigma^{∗m}$ es claramente $\Sigma$-efectivamente enumerable, entonces tenemos que $\mathbb{P}_2$ es el procedimiento efectivo que enumera a $\chi^{\omega^n \times \Sigma^{∗m}}_{\omega^n \times \Sigma^{∗m}}$.

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


---
---
# Combo 7.
### Lema (Lema de minimización acotada).
Sean $n, m \ge 0$. Sea $P : D_P \subseteq \omega \times \omega^n \times \Sigma^{∗m} \longmapsto \omega$ un predicado $\Sigma$-PR. Entonces <br>
(a) $M(P)$ es $\Sigma$-recursiva. <br>
(b) Si hay una función $\Sigma$-PR $f : \omega^n \times \Sigma^{∗m} \longmapsto \omega$ tal que
$$
M(P)(\vec{x},\vec{\alpha}) = \min_t P (t,\vec{x},\vec{\alpha}) \le f (\vec{x},\vec{\alpha}), \text{ para cada } (\vec{x},\vec{\alpha}) \in D_{M(P)},
$$
entonces $M(P)$ es $\Sigma$-PR.

Proof

(a) <br>
Sea $\overline{P} = P \cup C_{0}^{n+1,m}|_{(\omega^{n+1} \times \Sigma^{* m}) - D_P}$, por lema de union de funciones con dominio disjunto, tenemos que $\overline{P}$ es $\Sigma$-PR y $\Sigma$-Total.

Notar que:
$$
\{t\in\omega:P(t,\vec{x},\vec{\alpha})=1\}=\{t\in\omega:\overline{P}(t,\vec{x},\vec{\alpha})=1\}
$$
por lo que $D_{M(P)} = D_{M(\overline{P})}$ y tenemos que $M(P)(\vec{x},\vec{\alpha}) = M(\overline{P})(\vec{x},\vec{\alpha})$, para $\forall (\vec{x}, \vec{\alpha}) \in D_{M(P)}$. Por lo que $M(P) = M(\overline{P})$.

Sea $k$ tal que $\overline{P} \in PR^\Sigma_k$, como $PR^\Sigma_k \subseteq R^\Sigma_k$ tenemos que $\overline{P} \in R^\Sigma_k$ y como $\overline{P}$ es $\Sigma$-Total tenemos que $M(\overline{P}) \in R^\Sigma_{k+1}$. Entonces $M(\overline{P})$ es $\Sigma$-R, lo cual implica que $M(P)$ es $\Sigma$-R.

(b) <br>
Sea f una función $\Sigma$-PR $f : \omega^n \times \Sigma^{∗m} \longmapsto \omega$.

Como $M(P) = M(\overline{P})$, basta probar que $M(\overline{P})$ es $\Sigma$-PR. Primero veamos que $D_{M(\overline{P})}$ es un conjunto $\Sigma$-PR.
$$
\begin{aligned}

\chi_{D_{M(\overline{P})}}^{\omega^{n}\times\Sigma^{\ast m}} & = \lambda\vec{x}\vec{\alpha}\left[(\exists t\in\omega)_{t\leq
f(\vec{x},\vec{\alpha})}\;\overline{P}(t,\vec{x},\vec{\alpha})\right] \\

& = \lambda x\vec{x}\vec{\alpha}\left[(\exists t\in\omega)_{t\leq
x}\;\overline{P}(t,\vec{x},\vec{\alpha})\right]\circ\left[f,p_{1}^{n,m},\cdots,p_{n+m}^{n,m}\right]
\end{aligned}
$$

Por lema sabemos que $\lambda x\vec{x}\vec{\alpha}\left[(\exists t\in\omega)_{t\leq x}\;\overline{P}(t,\vec{x},\vec{\alpha})\right]$ es $\Sigma$-PR y como f es $\Sigma$-PR tenemos que $\chi_{D_{M(\overline{P})}}^{\omega^{n}\times\Sigma^{\ast m}}$ es $\Sigma$-PR, por lo que $D_{M(\overline{P})}$ es $\Sigma$-PR.

Sea
$$
\begin{aligned}

P_{1} & = \lambda t\vec{x}\vec{\alpha}\left[\overline{P}(t,\vec{x},\vec{\alpha})\wedge(\forall j\in\omega)_{j\leq t}\;(j=t\vee\lnot\overline{P}(j,\vec{x},\vec{\alpha}))\right] \\

& = \lambda zt\vec{x}\vec{\alpha}\left[(\forall j\in\omega)_{j\leq z} \; Q(j, t,\vec{x},\vec{\alpha}) \right] \circ \left[ p^{n+1,m}_1, p^{n+1,m}_1, p^{n+1,m}_2, \cdots, p^{n+1,m}_{n+1,m} \right] \\

\text{donde} \\

& Q = \lambda jt\vec{x}\vec{\alpha}\left[\overline{P}(t,\vec{x},\vec{\alpha})\wedge(j=t\vee\lnot\overline{P}(j,\vec{x},\vec{\alpha}))\right]\\

\end{aligned}
$$
por lo que $P_1$ es $\Sigma$-Total y $\Sigma$-PR. Ademas nótese que $\forall (\vec{x},\vec{\alpha})\in\omega^{n}\times\Sigma^{\ast m}$ se tiene que:
$$
P_{1}(t,\vec{x},\vec{\alpha})=1\text{ si y solo
si }(\vec{x},\vec{\alpha})\in D_{M(\overline{P})}\text{ y
}t=M(\overline{P})(\vec{x},\vec{\alpha})
$$

Esto nos dice que
$$
M(\overline{P})=\left(\lambda\vec{x}\vec{\alpha}\left[\prod_{t=0}^{t=f(\vec{x},\vec{\alpha})}t^{P_{1}(t,\vec{x},\vec{\alpha})}\right]\right)|_{D_{M(\overline{P})}}
$$
por lo cual para probar que $M(\overline{P})$ es $\Sigma$-PR solo nos resta probar que la función interna es $\Sigma$-PR, pero notar que
$$
\begin{aligned}

F = & \lambda\vec{x}\vec{\alpha}\left[\prod_{t=0}^{t=f(\vec{x},\vec{\alpha})}t^{P_{1}(t,\vec{x},\vec{\alpha})}\right] \\

= & \lambda
xy\vec{x}\vec{\alpha}\left[\prod_{t=x}^{t=y} B(t, \vec{x}, \vec{\alpha})\right]\circ\left[C_{0}^{n,m},f,p_{1}^{n,m},\cdots,p_{n+m}^{n,m}\right] \\

\text{donde} \\

& B = \lambda xy \left[ x^y \right] \circ \left[ p_1^{n+1, m}, P_{1} \right]

\end{aligned}
$$
y como por lema tenemos que $\lambda xy\vec{x}\vec{\alpha}\left[\prod_{t=x}^{t=y} B(t, \vec{x}, \vec{\alpha}) \right]$ es $\Sigma$-PR, $B$ es $\Sigma$-PR, entonces F es $\Sigma$-PR.

Por lema de restricción de dominio de función $\Sigma$-PR con un conjunto $\Sigma$-PR, tenemos que $M(\overline{P})$ es $\Sigma$-PR, por lo que $M(P)$ es $\Sigma$-PR.

---
### Lema.
Supongamos $f : D_f \subseteq \omega^n \times \Sigma^{∗m} \longmapsto O$ es $\Sigma$-R y $S \subseteq D_f$ es $\Sigma$-RE, entonces $f|_S$ es $\Sigma$-R.

> Haga solo el caso $S$ no vacı́o, $n = m = 1$ y $O = \Sigma^∗$

Proof

- Supongamos $f : D_f \subseteq \omega \times \Sigma^∗ \longmapsto \Sigma^*$ es $\Sigma$-R, con $S \subseteq D_f$ un conjunto $\Sigma$-RE.
- Si $S = \emptyset$, entonces $f|_S = \emptyset$ y por lo que $f|_S$ es $\Sigma$-R.
- Supongamos $S \neq \emptyset$.

Como $S$ es $\Sigma$-RE entonces tenemos que hay una función $F : \omega \longmapsto \omega \times \Sigma^∗$ tal que $S = I_F$ y $F_{(1)}, F_{(2)}$ son $\Sigma$-R.

Como $f, F_{(1)}, F_{(2)}$ son $\Sigma$-R, entonces por segundo manantial de macros existen las macros para estas.

Sea $\mathcal{P}$ el siguiente programa:
$$
\begin{aligned}
\mathrm{L}2 \quad & \left[\mathrm{N}2 \longleftarrow F_{(1)}(\mathrm{N}20) \right] \\
& \left[\mathrm{P}2 \longleftarrow F_{(2)}(\mathrm{N}20) \right] \\

& \left[\mathrm{IF \ N}1 \neq \mathrm{N}2 \mathrm{\ GOTO \ L}1 \right] \\
& \left[\mathrm{IF \ P}1 \neq \mathrm{P}2 \mathrm{\ GOTO \ L}1 \right] \\
& \left[\mathrm{P}1 \longleftarrow f(\mathrm{N1,P1}) \right] \\
& \mathrm{GOTO \ L}3 \\

\mathrm{L}1 \quad & \mathrm{N20} \longleftarrow \mathrm{N20} + 1 \\
& \mathrm{GOTO \ L}2 \\

\mathrm{L}3 \quad & \mathrm{SKIP} \\
\end{aligned}
$$
es fácil ver que $\mathcal{P}$ computa a $f|_S$, por lo que $f|_S$ es $\Sigma$-C y por teorema (Godel vence a Neumann) tenemos que es $\Sigma$-R.


---
---
# Combo 8.
### Lema. Supongamos $\Sigma \supseteq \Sigma^p$. Entonces $AutoHalt^\Sigma$ no es $\Sigma$-recursivo.

Proof

Supongamos que $AutoHalt^\Sigma$ es $\Sigma$-recursivo. Por el segundo manantial de macros tenemos que hay una macro
$$
\left[ \mathrm{IF} \ AutoHalt^\Sigma(\mathrm{W1}) \ \mathrm{GOTO \ A1} \right]
$$

Sea $\mathcal{P}_0$ el siguiente programa:
$$
\mathrm{L1} \quad \left[ \mathrm{IF} \ AutoHalt^\Sigma(\mathrm{P1}) \ \mathrm{GOTO \ L1} \right]
$$

Notar que $\mathcal{P}_0$ termina partiendo desde $|| \mathcal{P}_0 ||$ si y solo si $AutoHalt^\Sigma(\mathcal{P}_0) = 0$, lo cual produce una contradicción por la definición de $AutoHalt^\Sigma$.

> $\forall \mathcal{P} \in Pro^\Sigma$ tenemos que $$ AutoHalt^\Sigma(\mathcal{P}) = 1 \text{ sii } \mathcal{P} \text{ se detiene partiendo del estado } ||\mathcal{P}|| $$

---
### Teorema. Supongamos $\Sigma \supseteq \Sigma^p$ . Entonces $AutoHalt^\Sigma$ no es $\Sigma$-efectivamente computable.
> Es decir no hay ningún procedimiento efectivo que decida si un programa de $\mathcal{S}^\Sigma$ termina partiendo de si mismo.

Proof

Si $AutoHalt^\Sigma$ fuera $\Sigma$-C, la Tesis de Church nos diría que es $\Sigma$-R, contradiciendo el lema anterior.

---
### Lema.
Supongamos que $\Sigma \supseteq \Sigma^p$ . Entonces
$$ A = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 1 \} $$
es $\Sigma$-RE. y no es $\Sigma$-R. Mas aun el conjunto
$$ N = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 0 \} $$
no es $\Sigma$-RE

Proof

Para ver que $A$ es $\Sigma$-RE se lo puede hacer imperativamente dando un programa (usando macros) que enumere a $A$. De esta forma probaríamos que $A$ es $\Sigma$-E y por lo tanto (por tesis de Church) es $\Sigma$-RE.

Sea $P = \lambda t \mathcal{P} \left[ Halt^{0,1}(t, \mathcal{P}, \mathcal{P}) \right]$. Note que P es $\Sigma$-PR por lo que $M(P)$ es $\Sigma$-R. Ademas note que $D_{M(P)} = A$, por ser dominio de una función $\Sigma$-R tenemos que por lema **implica que $A$ es $\Sigma$-RE**.

Supongamos ahora que $N$ es $\Sigma$-RE Entonces la función $C_0^{0, 1}|_N$ es $\Sigma$-R ya que $C_0^{0, 1}$ lo es. Ademas ya que $A$ es $\Sigma$-RE. tenemos que $C_1^{0, 1}|_A$ es $\Sigma$-R.

Ya que
$$
AutoHalt^\Sigma = C_1^{0, 1}|_A \cup C_0^{0, 1}|_N
$$

el lema de division por casos nos dice que $AutoHalt^\Sigma$ es $\Sigma$-R, contradiciendo el lema anterior. Este absurdo vino de suponer que N es $\Sigma$-RE, por lo que **$N$ no es $\Sigma$-RE**.

Finalmente supongamos A es $\Sigma$-R. Entonces el conjunto
$$
N = (\Sigma^* − A) \cap Pro^\Sigma
$$
deberia serlo, lo cual es absurdo. Este absurdo vino de suponer que A es $\Sigma$-R, por lo que **$A$ no es $\Sigma$-R**.

---
### Teorema (Neumann vence a Godel). Si $h$ es $\Sigma$-recursiva, entonces $h$ es $\Sigma$-computable.
> En la inducción de la prueba hacer solo el caso $h = M(P)$

Proof

Probemos por inducción en k que si $h \in R^\Sigma_k$, entonces h es $\Sigma$-C.

El caso $k = 0$ es trivial ya que las funciones existentes en $R^\Sigma_0$ se pueden realizar con las instrucciones básicas en $\mathcal{S}^\Sigma$.

Caso $h \in R^\Sigma_k$: Valido por ser hipótesis inductiva.

- Sea $h \in (R^\Sigma_{k+1} - R^\Sigma_k)$. Hay varios casos.

Caso $h=R(f,\mathcal{G})$. (no se hace, combo 1).

Caso $h = M(P)$, con $P:\omega\times\omega^{n}\times\Sigma^{*m}\longrightarrow\omega$, un predicado perteneciente a $R^\Sigma_k$. Por hipótesis inductiva, P es $\Sigma$-C y por lo tanto tenemos una macro
$$
\left[\mathrm{IF}\;P(\mathrm{V}\overline{n+1}, \mathrm{V}1,\cdots,\mathrm{V}\overline{n},\mathrm{W}1,\cdots,\mathrm{W}\overline{m})\;\mathrm{GOTO}\;\mathrm{A}1\right]
$$
lo cual nos permite realizar el siguiente programa:
$$
\begin{array}{ll}
\mathrm{L}2 &
\left[\mathrm{IF}\;P(\mathrm{N}\overline{n+1},\mathrm{N}1,\cdots,\mathrm{N}\overline{n},\mathrm{P}1,\cdots,\mathrm{P}\overline{m})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
& \mathrm{N}\overline{n+1}\longrightarrow\mathrm{N}\overline{n+1}+1\\
& \mathrm{GOTO}\;\mathrm{L}2\\
\mathrm{L}1 & \mathrm{N}1\longrightarrow\mathrm{N}\overline{n+1}
\end{array}
$$

Claramente este programa computa a $h$.


---
---
# Combo 9.
### Lema (Lema de división por casos para funciones $\Sigma$-R).
Supongamos $f_i : D_{fi} \subseteq \omega^n \times \Sigma^{∗m} \longmapsto O$, $i = 1, \cdots, k$, son funciones $\Sigma$-R tales que $D_{f_i} \cap D{f_j} = \emptyset$ para $i \neq j$. Entonces la función $f_1 \cup \cdots \cup f_k$ es $\Sigma$-R.
> Haga el caso $k = 2, n = m = 1$ y $O = \omega$

Proof

Sean $\mathcal{P}_1$ y $\mathcal{P}_1$ programas que computen las funciones $f_1$ y $f_2$ respectivamente. Para $i = 1, 2$ definamos:
$$
H_{i}=\lambda
tx_{1}\alpha_{1}\left[Halt^{1,1}(t,x_{1},\alpha_{1},\mathcal{P}_{i})\right]
$$
Notar que $H_i$ es $\Sigma$-mixta. Ademas sabemos que $Halt^{1,1}$ es $(\Sigma \cup \Sigma^p)$-PR, por lo cual $H_i$ es $(\Sigma \cup \Sigma^p)$-R. Por teorema de independencia de alfabetos tenemos que $H_i$ son $\Sigma$-PR, por lo que también es $\Sigma$-R. Por segundo manantial de macros tenemos que existe la siguiente macro
$$
\left[\mathrm{IF}\;H_{i}(\mathrm{V}1,\mathrm{V}2,\mathrm{W}1)\;\mathrm{GOTO}\;\mathrm{A}1\right]
$$
la cual la escribiré como
$$
\left[\mathrm{IF}\;Halt^{1,1}(\mathrm{V}1,\mathrm{V}2,\mathrm{W}1,\mathcal{P}_{i})\;\mathrm{GOTO}\;\mathrm{A}1\right]
$$

Ya que $f_i$ es $\Sigma$-C, por primer manantial de macros tenemos que existe la siguiente macro:
$$
\left[\mathrm{V}2 \longleftarrow f_{i}(\mathrm{V}1,\mathrm{W}1)\right]\\
$$

Sea $\mathcal{P}$ el siguiente programa:
$$
\begin{aligned}
\mathrm{L}1 \quad & \mathrm{N}20\longleftarrow\mathrm{N}20+1\\
& \left[\mathrm{IF}\;Halt^{1,1}(\mathrm{N}20,\mathrm{N}1,\mathrm{P}1,\mathcal{P}_{1})\;\mathrm{GOTO}\;\mathrm{L}2\right]\\
& \left[\mathrm{IF}\;Halt^{1,1}(\mathrm{N}20,\mathrm{N}1,\mathrm{P}1,\mathcal{P}_{2})\;\mathrm{GOTO}\;\mathrm{L}3\right]\\
& \mathrm{GOTO}\;\mathrm{L}1\\
\mathrm{L}2 \quad & \left[\mathrm{N}1\longleftarrow
f_{1}(\mathrm{N}1,\mathrm{P}1)\right]\\
& \mathrm{GOTO}\;\mathrm{L}4\\
\mathrm{L}3\quad & \left[\mathrm{N}1\longleftarrow
f_{2}(\mathrm{N}1,\mathrm{P}1)\right]\\
\mathrm{L}4\quad & \mathrm{SKIP}
\end{aligned}
$$
claramente $\mathcal{P}$ computa la función $f_1 \cup f_2$, por lo que es $\Sigma$-C y por teorema sabemos que es $\Sigma$-R.


---
### Teorema (Godel vence a Neumann). Si $f : D_f \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \omega$ es $\Sigma$-C, entonces $f$ es $\Sigma$-R.

> Similar al combo 3, cambia conjunto de llegada

Función $\Phi_{\#}^{n,m}$: <br>
Para $n, m \in \omega$ definamos la función $\Phi_{\#}^{n,m}$ de la siguiente manera:
$$
\begin{aligned}

D_{\Phi_{\#}^{n,m}} & = \left\{ (\vec{x},\vec{\alpha},\mathcal{P}) \in \omega^{n} \times \Sigma^{*m} \times \mathrm{Pro}^{\Sigma} :(\vec{x},\vec{\alpha}) \in D_{\Psi_{\mathcal{P}}^{n,m,\#}} \right\} \\

\Phi_{\#}^{n,m}(\vec{x},\vec{\alpha},\mathcal{P}) & =\Psi_{\mathcal{P}}^{n,m,\#}(\vec{x},\vec{\alpha}) \text{, para cada }(\vec{x},\vec{\alpha},\mathcal{P}) \in D_{\Phi_{\#}^{n,m}}

\end{aligned}
$$
Nótese que
$$ \Phi_{\#}^{n,m} = \lambda\vec{x}\vec{\alpha}\mathcal{P}\left[\Psi_{\mathcal{P}}^{n,m,\#}(\vec{x},\vec{\alpha}) \right] $$
Por teorema, tenemos que $\Phi_{\#}^{n,m}$ es $(\Sigma \cup \Sigma^p)$-R

Proof

Sea $\mathcal{P}_0$ un programa que compute a $f$. Veamos que $f$ es $(\Sigma \cup \Sigma^p)$-R. Note que
$$
f = \Phi_{\#}^{n,m} \circ \left[ p_{1}^{n,m}, \cdots, p_{n+m}^{n,m}, C_{\mathcal{P}_{0}}^{n,m} \right]
$$
donde cabe destacar que $p_{1}^{n,m}, \cdots, p_{n+m}^{n,m}$ son respecto al alfabeto $\Sigma \cup \Sigma^p$, es decir que tienen dominio $\omega^n \times (\Sigma \cup \Sigma^p)^{*m}$. Ya que $\Phi_{\#}^{n,m}$ es $(\Sigma \cup \Sigma^p)$-R tenemos que f lo es.

Por lo que si se fija $\mathcal{P}_0$, por teorema de la independencia de Alfabeto, tendríamos que f es $\Sigma$-R.


---
