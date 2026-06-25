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
