# Teoremas
---
# Combo 1.
### Proposición (Caracterización de conjuntos $\Sigma$-PR). Un conjunto $S$ es $\Sigma$-PR sii $S$ es el dominio de alguna función $\Sigma$-PR
> En la inducción de la prueba hacer solo el caso de la composición

Proof

($\implies$) Note que $S = D_{Pred \circ \chi_S^{\omega^n \times \Sigma^{*m}}}$ <br>
($\Longleftarrow$) **Solo el caso de composición.**

Probare por inducción en $k$ que $D_F$ es $\Sigma$-PR para cada $F \in PR^\Sigma_k$.

El caso $k=0$ es fácil, ya que las funciones en $PR^\Sigma_0$ tienen dominio contenido en $\omega^n \times \Sigma^{*m}$ y como $\omega$ y $\Sigma^*$ son conjuntos no vacíos $\Sigma$-PR, entonces el producto cruz de estos es un conjunto $\Sigma$-PR.

- Supongamos que el resultado vale para un k fijo.

Supongamos $F \in PR^\Sigma_{k+1}$, tal que $F = g \circ [g_1, \cdots, g_r ]$ con $g, g_1, \cdots, g_r \in PR^\Sigma_k$.

- Si $F = \emptyset$, entonces es claro que $D_F = \emptyset$ es $\Sigma$-PR.

- Supongamos entonces que $F$ no es la función $\emptyset$.

Tenemos entonces que $r$ es de la forma $n + m$ y

Por Lema 19, hay funciones $\Sigma$-PR, $\overline{g}, \overline{g}_1, \cdots, \overline{g}_{n + m} \in PR^\Sigma_k$ las cuales son $\Sigma$-totales y cumplen
$$
\begin{aligned}
& g = \overline{g} |_{D_{g}} \\
& g_i = \overline{g}_i |_{D_{g_i}} ,  \quad \text{para } i = 1, \cdots, n + m
\end{aligned}
$$

Por hipótesis inductiva los conjuntos $D_g , D_{g_i} , i = 1, \cdots, n + m$, son $\Sigma$-PR y por lo tanto
$$ S = \bigcap_{i=1}^{n + m} D_{g_i} $$
lo es. Nótese que
$$ \chi_{D_F}^{\omega^k \times \Sigma^{*l}} = (\chi_{D_g}^{\omega^n \times \Sigma^{*m}} \circ [\overline{g}_1, \cdots, \overline{g}_{n+m}] \wedge \chi_S^{\omega^k \times \Sigma^{*l}}) $$

---
### Teorema (Neumann vence a Godel). Si $h$ es $\Sigma$-recursiva, entonces $h$ es $\Sigma$-computable
> En la inducción de la prueba hacer solo el caso $h = R(f, \mathcal{G})$, con $I_h \subseteq \omega$

Proof

Probemos por inducción en k que si $h \in R^\Sigma_k$, entonces h es $\Sigma$-C.

El caso $k = 0$ es trivial ya que las funciones existentes en $R^\Sigma_0$ se pueden realizar con las instrucciones básicas en $\mathcal{S}^\Sigma$.

Caso $h \in R^\Sigma_k$: Valido por ser hipótesis inductiva.

- Sea $h \in (R^\Sigma_{k+1} - R^\Sigma_k)$. Hay varios casos.

Caso $h = R(f, \mathcal{G})$ ($I_h \subseteq \omega$). Con $f, \mathcal{G} \in R^\Sigma_k$.

Sea $\Sigma = \{ a_1 , \cdots, a_r \}$. Por hipotesis inductiva, las funciones $f$ y $\mathcal{G}_a \ (a \in \Sigma)$, son $\Sigma$-computables y por lo tanto existen sus macros.

Podemos entonces hacer el siguiente programa computa a h:
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


---
---
# Combo 2.
### Lema (Lema de división por casos para funciones $\Sigma$-PR).
Supongamos $f_i : D_{f_i} \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}$ , $i = 1, \cdots, k$, son funciones $\Sigma$-PR tales que $D_{f_i} \cap D_{f_j} = \emptyset$ para
$i \neq j$. Entonces $f_1 \cup \cdots \cup f_k$ es $\Sigma$-PR
> Hacer el caso k = 2, n = 2 y m = 1

Proof

Como $f_i$ son funciones $\Sigma$-PR $\Longrightarrow$ $D_{f_i}$ son $\Sigma$-PR $\Longrightarrow$ $D_{f_1} \cup D_{f_2}$ es $\Sigma$-PR

Sean $\overline{f}_i$ funciones $\Sigma$-PR y  $\Sigma$-Totales tales que $f_i = \overline{f}_i |_{D_{f_i}}$ y como por suposición tenemos que $D_{f_1} \cap D_{f_2} = \emptyset$.

Entonces notar que:
$$ f_1 \cup f_2 = ( \lambda \alpha \beta [ \alpha \beta ] \circ [ \quad \lambda x \alpha [\alpha^x] \circ[ \chi^{\omega^m \times \Sigma^{*m}}_{D_{f_1}}, \overline{f}_1 ], \quad \lambda x \alpha [\alpha^x] \circ[ \chi^{\omega^m \times \Sigma^{*m}}_{D_{f_2}}, \overline{f}_2 ] \quad ] )|_{D_{f_1} \cup D_{f_2}} $$

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
Como S no es vació y es $\Sigma$-E $\Longrightarrow$ $\exist F: \omega \longrightarrow \omega^2 \times \Sigma^{*}$ tal que $I_F = S$ y $F_{(i)}$ es $\Sigma$-C, para cada $i = 1, 2, 3$. Y existen sus macros. El siguiente programa claramente cumple con (2):
$$
\begin{aligned}

& \left[ \mathrm{P}1\leftarrow F_{(3)}(\mathrm{N}1) \right]\\
& \left[ \mathrm{N}2\leftarrow
F_{(2)}(\mathrm{N}1) \right]\\
& \left[ \mathrm{N}1\leftarrow F_{(1)}(\mathrm{N}1) \right]

\end{aligned}
$$

$(1) \Longleftarrow (2)$ <br>
Utilizaremos $\mathcal{P}$ para armar cada $F_{(i)}$, con $i = 1, 2, 3$. Como sabemos que $\mathcal{P}$ siempre termina partiendo $\forall x \in \omega$, entonces se utilizara $T^{1, 0}(x, \mathcal{P})$, $E^{1, 0}_{\#(j)}$ y $E^{1, 0}_{*(j)}$. (claramente se fija $\mathcal{P}$ para que las funciones sean $\Sigma$-R)
$$
\mathcal{P_{F_{(1)}}} \in Pro^\Sigma : \\

\begin{aligned}
& \left[ \mathrm{N}2\leftarrow T^{1, 0}(\mathrm{N}1, \mathcal{P}) \right]\\

& \left[ \mathrm{N}1\leftarrow E^{1, 0}_{\#(1)}(\mathrm{N}2, \mathrm{N}1, \mathcal{P}) \right]

\end{aligned}
$$

...

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

F_{(1)} = \Psi^{1, 0, \#}_{\mathcal{P_{F_{(1)}}}}; \quad
F_{(2)} = \Psi^{1, 0, \#}_{\mathcal{P_{F_{(2)}}}}; \quad
F_{(3)} = \Psi^{1, 0, *}_{\mathcal{P_{F_{(3)}}}}

\end{aligned}
$$

los cuales son $\Sigma$-C y tendriamos a $F = \left[ F_{(1)}, F_{(2)}, F_{(3)} \right]$ donde $I_F = S$. Por lo que, por definición, tenemos que $S$ es $\Sigma$-E.


---
---
# Combo 3.
### Teorema (Godel vence a Neumann). Si $f : D_f \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}$ es $\Sigma$-computable, entonces $f$ es $\Sigma$-recursiva.

> Similar al combo 9, cambia conjunto de llegada

Nótese que
$$ \Phi_{*}^{n,m} = \lambda\vec{x}\vec{\alpha}\mathcal{P}\left[\Psi_{\mathcal{P}}^{n,m,*}(\vec{x},\vec{\alpha}) \right] $$
Por teorema, tenemos que $\Phi_*^{n,m}$ es $(\Sigma \cup \Sigma^p)$-R

Sea $\mathcal{P}_0$ un programa que compute a $f$. Primero veremos que $f$ es $(\Sigma \cup \Sigma^p)$-R. Note que
$$ f=\Phi_{*}^{n,m}\circ\left[p_{1}^{n,m},...,p_{n+m}^{n,m},C_{\mathcal{P}_{0}}^{n,m}\right] $$

entonces tenemos que f es $(\Sigma \cup \Sigma^p)$-R.

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
- Etapa 1: $T=0$.
- Etapa 2: Ejecutar $\mathbb{P}_1$ con T para obtener la upla $(\vec{y}, \vec{\beta})$.
- Etapa 3: Ejecutar $\mathbb{P}_2$ con T para obtener la upla $(\vec{z}, \vec{\gamma})$.
- Etapa 4: Si $(\vec{y}, \vec{\beta}) = (\vec{x}, \vec{\alpha})$, entonces detenerse y dar como dato de salida el valor 1. Si $(\vec{z}, \vec{\gamma}) = (\vec{x}, \vec{\alpha})$, entonces detenerse y dar como dato de salida el valor 0. Caso contrario, aumentar en $T = T + 1$ y dirigirse a Etapa2.


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

Sea $G = \lambda t x \vec{x} \vec{\alpha} \left[ \ \sum_{i=x}^{i=t} \quad f(i, \vec{x}, \vec{\alpha}) \ \right]$. Notar que se puede armar la sumatoria utilizando composición de funciones con $G$.
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
Claramente las funciones utilizadas son $\Sigma$-PR. Por lo que solo nos quedaría revisar que los conjuntos que restringen a las funciones ($D_1, D_2, H_1, H_2$) son disjuntos y $\Sigma$-PR.
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

Claramente los siguientes conjuntos son $\Sigma$-PR.
$$
D = \omega \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m} \\

H = \omega^3 \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m}
$$

Por lo que las siguientes funciones características de los conjuntos $D_1, D_2, H_1, H_2$ son $\Sigma$-PR.
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
- Etapa 3: $C = \left[ \alpha \right]_{|\alpha|} y \ \alpha = \alpha \text{}^{\curvearrowleft}$.
- Etapa 4: Si $C = @$, ejecuto $\mathbb{P}_{\mathcal{G}_@}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.
- Etapa 5: Si $C = \%$, ejecuto $\mathbb{P}_{\mathcal{G}_\%}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.
- Etapa 6: Ejecuto $\mathbb{P}_{\mathcal{G}_!}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.

Claramente el procedimiento anterior computa a $R(f, \mathcal{G})$, por lo que este ultimo es $\Sigma$-efectivamente computable.

---
### Lema (Lema de cuantificación acotada).
Sea $\Sigma$ un alfabeto finito. Sea $P : S \times S_1 \times \cdots\times S_n \times L_1 \times\cdots\times L_m \longmapsto \omega$ un predicado $\Sigma$-PR, con $S, S_1, \cdots, S_n \subseteq \omega$ y $L_1 , \cdots, L_m \subseteq \Sigma^∗$ no vacı́os. Supongamos $\overline{S} \subset S$ es $\Sigma$-PR. Entonces $ \lambda x \vec{x} \vec{\alpha} [ \ (\forall t \in \overline{S})_{t \le x} \quad  P(t, \vec{x} \vec{\alpha}) \ ] $ es $\Sigma$-PR

Proof

Como $P$ es $\Sigma$-PR $\Longrightarrow$ $D_P$ es $\Sigma$-PR $\Longrightarrow$ $S, S_1, \cdots, S_n, L_1,\cdots, L_m$ son conjuntos $\Sigma$-PR y no vacíos.

Sea
$$
\overline{P} = P|_{\overline{S}\times S_{1} \times \cdots \times
S_{n} \times L_{1} \times \cdots \times L_{m}} \cup C_{1}^{1+n,m}|_{(\omega - \overline{S}) \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m}}
$$
claramente $\overline{P}$ es $\Sigma$-PR.

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

Como la cuantificación acotada para $\overline{P}$ y $P$ daría lo mismo, tenemos que cuantificación acotada para $P$ es $\Sigma$-PR.


---
---
# Combo 6.
### Lema ($\Sigma$-efectivamente computable implica $\Sigma$-efectivamente enumerable).
Si $S \subseteq \omega^n \times \Sigma^{∗m}$ es $\Sigma$-efectivamente computable entonces $S$ es $\Sigma$-efectivamente enumerable.

Proof
- Si $S = \emptyset$, entonces claramente es $\Sigma$-efectivamente computable y $\Sigma$-efectivamente enumerable.
- Supongamos que $S \neq \emptyset$.

Como $S \neq \emptyset$ entonces fijo $(\vec{z}, \gamma) \in S$.

Como $S$ es $\Sigma$-EC, entonces tenemos que $\mathbb{P}_{1}$ computa a $\chi^{\omega^n \times \Sigma^{∗m}}_S$.

Como $\omega^n \times \Sigma^{∗m}$ es $\Sigma$-EE, entonces tenemos que $\mathbb{P}_2$ enumera a $\omega^n \times \Sigma^{∗m}$.

Sea $\mathbb{P}_S$ el siguiente procedimiento efectivo que enumera a $S$:
- Se recibe como dato de entrada $x \in \omega.$
- Etapa 1: Se ejecuta $\mathbb{P}_2$ con $x$ para obtener $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{∗m}$.
- Etapa 2: Se ejecuta $\mathbb{P}_1$ con $(\vec{x}, \vec{\alpha})$ para obtener el valor booleano R.
- Etapa 3: Si R = 1, dar como dato de salida $(\vec{x}, \vec{\alpha})$ y terminar. Caso contrario, dar como dato de salida $(\vec{z}, \gamma)$ y terminar.

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
\lambda tx_{1}\alpha_{1}\left[\lnot
Halt^{1,1}(t,x_{1},\alpha_{1},\mathcal{P}_{i})\right]
$$
El cual, como se fija $\mathcal{P}_i$, entonces por independencia de alfabetos tenemos que son $\Sigma$-PR $\Longrightarrow$ existe sus macros.

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
Las cuales, como se fija $\mathcal{P}_i$, entonces por independencia de alfabetos tenemos que $E_i$ son $\Sigma$-PR $\Longrightarrow$ existen sus macros.

Entonces el siguiente programa $\mathcal{P} \in Pro^{\Sigma}$:
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
E_{\#(1)}^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{1})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\mathrm{N}2\neq
E_{\#(2)}^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{2})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\mathrm{P}1\neq
E_{\ast(1)}^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{3})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
\left[\mathrm{IF}\;\mathrm{P}2\neq
E_{\ast(2)}^{1,1}(\mathrm{N}10,\mathrm{N}3,\mathrm{P}3,\mathcal{P}_{4})\;\mathrm{GOTO}\;\mathrm{L}1\right]
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
Sea $\overline{P} = P \cup C_{0}^{n+1,m}|_{(\omega^{n+1} \times \Sigma^{* m}) - D_P}$, $\Longrightarrow$ $\overline{P}$ es $\Sigma$-PR y $\Sigma$-Total.

Notar que $M(P) = M(\overline{P})$.

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
Claramente $\chi_{D_{M(\overline{P})}}^{\omega^{n}\times\Sigma^{\ast m}}$ es $\Sigma$-PR, por lo que $D_{M(\overline{P})}$ es $\Sigma$-PR.

Sea
$$
\begin{aligned}

P_{1} & = \lambda t\vec{x}\vec{\alpha}\left[\overline{P}(t,\vec{x},\vec{\alpha})\wedge(\forall j\in\omega)_{j\leq t}\;(j=t\vee\lnot\overline{P}(j,\vec{x},\vec{\alpha}))\right] \\
\end{aligned}
$$
Tenemos que $P_1$ es $\Sigma$-Total y $\Sigma$-PR. Ademas nótese que $\forall (\vec{x},\vec{\alpha})\in\omega^{n}\times\Sigma^{\ast m}$ se tiene que:
$$
P_{1}(t,\vec{x},\vec{\alpha})=1\text{ si y solo
si }(\vec{x},\vec{\alpha})\in D_{M(\overline{P})}\text{ y
}t=M(\overline{P})(\vec{x},\vec{\alpha})
$$

Esto nos dice que
$$
M(\overline{P})=\left(\lambda\vec{x}\vec{\alpha}\left[\prod_{t=0}^{t=f(\vec{x},\vec{\alpha})}t^{P_{1}(t,\vec{x},\vec{\alpha})}\right]\right)|_{D_{M(\overline{P})}}
$$
como la función interna es $\Sigma$-PR y por lema de restricción de dominio, tenemos que $M(\overline{P})$ es $\Sigma$-PR, por lo que $M(P)$ es $\Sigma$-PR.

---
### Lema.
Supongamos $f : D_f \subseteq \omega^n \times \Sigma^{∗m} \longmapsto O$ es $\Sigma$-R y $S \subseteq D_f$ es $\Sigma$-RE, entonces $f|_S$ es $\Sigma$-R.

> Haga solo el caso $S$ no vacı́o, $n = m = 1$ y $O = \Sigma^∗$

Proof

- Supongamos $f : D_f \subseteq \omega \times \Sigma^∗ \longmapsto \Sigma^*$ es $\Sigma$-R, con $S \subseteq D_f$ un conjunto $\Sigma$-RE.
- Si $S = \emptyset$, entonces $f|_S = \emptyset$ y por lo que $f|_S$ es $\Sigma$-R.
- Supongamos $S \neq \emptyset$.

Como $S$ es $\Sigma$-RE $\Longrightarrow$ $\exist F : \omega \longmapsto \omega \times \Sigma^∗$ tal que $S = I_F$ y $F_{(1)}, F_{(2)}$ son $\Sigma$-R.

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

Supongamos que $AutoHalt^\Sigma$ es $\Sigma$-R $\Longrightarrow$ existe una macro para esta.

Sea $\mathcal{P}_0$ el siguiente programa:
$$
\mathrm{L1} \quad \left[ \mathrm{IF} \ AutoHalt^\Sigma(\mathrm{P1}) \ \mathrm{GOTO \ L1} \right]
$$

Notar que produce una contradicción, por que $AutoHalt^\Sigma$ no es $\Sigma$-R.

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

Sea $P = \lambda t \mathcal{P} \left[ Halt^{0,1}(t, \mathcal{P}, \mathcal{P}) \right]$. Note que P es $\Sigma$-PR por lo que $M(P)$ es $\Sigma$-R. Ademas note que $D_{M(P)} = A$, por ser dominio de una función $\Sigma$-R tenemos que por lema **implica que $A$ es $\Sigma$-RE**.

Supongamos ahora que $N$ es $\Sigma$-RE Entonces la función $C_0^{0, 1}|_N$ es $\Sigma$-R. Ademas ya que $A$ es $\Sigma$-RE. tenemos que $C_1^{0, 1}|_A$ es $\Sigma$-R.

Ya que
$$
AutoHalt^\Sigma = C_1^{0, 1}|_A \cup C_0^{0, 1}|_N
$$
esto nos dice que $AutoHalt^\Sigma$ es $\Sigma$-R, contradiciendo el lema anterior. Este absurdo vino de suponer que N es $\Sigma$-RE, por lo que **$N$ no es $\Sigma$-RE**.

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

Caso $h = M(P)$, con $P:\omega\times\omega^{n}\times\Sigma^{*m}\longrightarrow\omega$, un predicado perteneciente a $R^\Sigma_k$. Por hipótesis inductiva, P es $\Sigma$-C y por lo tanto tenemos que existe su macro, lo cual nos permite realizar el siguiente programa:
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
\lambda t x_{1}\alpha_{1}\left[Halt^{1,1}(t,x_{1},\alpha_{1},\mathcal{P}_{i})\right]
$$
el cual es $\Sigma$-R $\Longrightarrow$ existen sus macros.

Ya que $f_i$ es $\Sigma$-C $\Longrightarrow$ existen sus macros.

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

Nótese que
$$ \Phi_{\#}^{n,m} = \lambda\vec{x}\vec{\alpha}\mathcal{P}\left[\Psi_{\mathcal{P}}^{n,m,\#}(\vec{x},\vec{\alpha}) \right] $$
Por teorema, tenemos que $\Phi_{\#}^{n,m}$ es $(\Sigma \cup \Sigma^p)$-R

Proof

Sea $\mathcal{P}_0$ un programa que compute a $f$. Note que
$$
f = \Phi_{\#}^{n,m} \circ \left[ p_{1}^{n,m}, \cdots, p_{n+m}^{n,m}, C_{\mathcal{P}_{0}}^{n,m} \right]
$$
entonces $f$ es $(\Sigma \cup \Sigma^p)$-R. Por lo que si se fija $\mathcal{P}_0$, por teorema de la independencia de Alfabeto, tendríamos que f es $\Sigma$-R.


---
