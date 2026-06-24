# Combo 1.
### Proposición (Caracterización de conjuntos $\Sigma$-PR). Un conjunto $S$ es $\Sigma$-PR sii $S$ es el dominio de alguna función $\Sigma$-PR
> (En la inducción de la prueba hacer solo el caso de la composición)

Proof

($\implies$) Note que $S = D_{\chi_S^{\omega^n \times \Sigma^{*m}}}$ <br>
($\Longleftarrow$) **Solo el caso de composición.** (no casos $F = R(f, g)$, $F = R(f, \mathcal{G})$, para recursion con imagen contenida en $\omega$ y $\Sigma^*$) <br>

Probare por inducción en $k$ que $D_F$ es $\Sigma$-PR para cada $F \in PR^\Sigma_k$.

El caso $k=0$ es facil, ya que las funciones en $PR^\Sigma_0$ son $\Sigma$-totales.

- Supongamos que el resultado vale para un k fijo.

Supongamos que $F = g \circ [g_1, \cdots, g_r ]$ con $g, g_1, \cdots, g_r \in PR^\Sigma_k$ (notar que $F \in PR^\Sigma_{k+1}$).

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
con $O \in \{ \omega, \Sigma^∗ \}$ y $k, l ∈ \omega$. Por Lema 19, hay funciones $\Sigma$-PR, $\overline{g}_1, \cdots, \overline{g}_{n + m} \in PR^\Sigma_k$ las cuales son $\Sigma$-totales y cumplen
$$ g_i = \overline{g}_i |_{D_{g_i}} ,  \quad \text{para } i = 1, \cdots, n + m $$

Por hipótesis inductiva los conjuntos $D_g , D_{g_i} , i = 1, \cdots, n + m$, son $\Sigma$-PR y por lo tanto
$$ S = \bigcap_{i=1}^{n + m} D_{g_i} $$
lo es. Nótese que
$$ \chi_{D_F}^{\omega^n \times \Sigma^{*m}} = (\chi_{D_g}^{\omega^n \times \Sigma^{*m}} \circ [\overline{g}_1, \cdots, \overline{g}_{n+m}] \wedge \chi_S^{\omega^n \times \Sigma^{*m}}) $$
lo cual nos dice que $D_F$ es $\Sigma$-PR.

---
### Teorema (Neumann vence a Godel). Si $h$ es $\Sigma$-recursiva, entonces $h$ es $\Sigma$-computable
> (En la inducción de la prueba hacer solo el caso $h = R(f, \mathcal{G})$, con $I_h \subseteq \omega$)

Proof

- Caso $h = R(f, \mathcal{G})$ ($I_h \subseteq \omega$), con:
$$
\begin{aligned}

f & : S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \longmapsto \omega \\

\mathcal{G}_a & : \omega \times S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \times \Sigma^* \longmapsto \omega, \quad a \in \Sigma

\end{aligned}
$$

elementos de $R^\Sigma_k$ . Sea $\Sigma = \{ a_1 , \cdots, a_r \}$. Por hipotesis inductiva, las funciones $f$ y $\mathcal{G}_a \ (a \in \Sigma)$, son $\Sigma$-computables y por lo tanto tenemos macros
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
