# Combo 4.
### Proposición (Caracterización básica de conjuntos $\Sigma$-enumerables).
> **(mismo que combo 2)**

Sea $S \subseteq \omega^n \times \Sigma^{∗m}$ un conjunto no vacı́o. Entonces son equivalentes:
1. $S$ es $\Sigma$-enumerable
2. Hay un programa $\mathcal{P} \in Pro^\Sigma$ tal que:
    1. Para cada $x \in \omega$, tenemos que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$, donde $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$.
    2. Para cada $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$ hay un $x \in \omega$ tal que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$
> (Hacer el caso n = 2 y m = 1)

Proof

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

$(2) \Longrightarrow (1)$ <br>
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

---
### Lema (Lema de la sumatoria).
Sea $\Sigma$ un alfabeto finito. Si $f : \omega \times S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \longmapsto \omega$ es $\Sigma$-PR, con $S_1 , \cdots, S_n \subseteq \omega$ y $L_1, \cdots, L_m \subseteq \Sigma^*$ no vacı́os, entonces la función $\lambda x y \vec{x} \vec{\alpha} \left[ \ \sum_{t=x}^{t=y} \quad f(t, \vec{x} \vec{\alpha}) \ \right]$ es $\Sigma$-PR

Proof

Sea $G = \lambda t x \vec{x} \vec{\alpha} \left[ \ \sum_{i=x}^{i=t} \quad f(i, \vec{x} \vec{\alpha}) \ \right]$. Ya que
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
lo cual, ya que f es $\Sigma$-PR, nos dice que $\lambda x\vec{x}\vec{\alpha}\left[f(0,\vec{x},\vec{\alpha})\right]$ y $\lambda Atx\vec{x}\vec{\alpha}\left[A+f(t+1,\vec{x},\vec{\alpha})\right])$ son $\Sigma$-PR. Por lo que solo nos quedaría revisar que los conjuntos que restringen a las funciones ($D_1, D_2, H_1, H_2$) son $\Sigma$-PR y disjuntos.
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
- Como el producto cruz es $\Sigma$-PR, entonces los conjuntos $S_1, \cdots, S_n, L_1, \cdots, L_m$ son $\Sigma$-PR. Claramente $\omega$ es $\Sigma$-PR.

Por lo cual los siguientes conjuntos son $\Sigma$-PR.
$$
D = \omega \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m} \\

H = \omega^3 \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m}
$$

Por lo que las siguientes funciones características de los conjuntos $D_1, D_2, H_1, H_2$ son $\Sigma$-PR (los predicados que lo conforman son $\Sigma$-PR).
$$
\chi^{\omega^{1 + n} \times \Sigma^{*m}}_{D_1} = (\chi^{\omega^{1 + n} \times \Sigma^{*m}}_{D} \wedge \lambda x \vec{x} \vec{\alpha} \left[ x \gt 0 \right]) \\

\chi^{\omega^{1 + n} \times \Sigma^{*m}}_{D_2} = (\chi^{\omega^{1 + n} \times \Sigma^{*m}}_{D} \wedge \lambda x \vec{x} \vec{\alpha} \left[ x = 0 \right]) \\
$$

$$
\chi^{\omega^{3 + n} \times \Sigma^{*m}}_{H_1} = (\chi^{\omega^{3 + n} \times \Sigma^{*m}}_{H} \wedge \lambda z t x \vec{x} \vec{\alpha} \left[ x \gt t + 1 \right]) \\

\chi^{\omega^{3 + n} \times \Sigma^{*m}}_{H_2} = (\chi^{\omega^{3 + n} \times \Sigma^{*m}}_{H} \wedge \lambda z t x \vec{x} \vec{\alpha} \left[ x \le t + 1 \right])
$$

Por lo tanto los conjuntos $D_1, D_2, H_1, H_2$ son $\Sigma$-PR y claramente son disjuntos. Por lo que h y g son $\Sigma$-PR. Por lo que G es $\Sigma$-PR.
