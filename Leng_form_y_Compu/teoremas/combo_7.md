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

Sea $k$ tal que $\overline{P} \in PR^\Sigma_k$, como $PR^\Sigma_k \subseteq R^\Sigma_k$, tenemos que $\overline{P} \in R^\Sigma_k$ y como $\overline{P}$ es $\Sigma$-Total tenemos que $M(\overline{P}) \in R^\Sigma_{k+1}$. Entonces $M(\overline{P})$ es $\Sigma$-R, lo cual implica que $M(P)$ es $\Sigma$-R.

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

