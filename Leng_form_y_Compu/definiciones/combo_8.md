# Combo 8. Defina:
### (1) $M(P)$
Sea $\Sigma$ un alfabeto finito y sea $P : D_P \subseteq \omega \times \omega^n \times \Sigma^{*m} \longmapsto \omega$ un predicado. Dado $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}$ , cuando exista al menos un $t \in \omega$ tal que $P(t, \vec{x}, \vec{\alpha}) = 1$, usaremos $\min_t P(t, \vec{x}, \vec{\alpha})$ para denotar al menor de tales $t's$.

> Nótese que la expresión $\min_t P(t, \vec{x}, \vec{\alpha})$ esta definida solo para aquellas $(n + m)$-uplas $(\vec{x}, \vec{\alpha})$ para las cuales hay al menos un $t$ tal que se da $P(t, \vec{x}, \vec{\alpha}) = 1$.

$$ M(P) = \lambda \vec{x} \vec{\alpha} [\min_t \ P(t, \vec{x}, \vec{\alpha})] $$

Nótese que:
$$
D_{M(P)} = \{(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m} : (\exist t \in \omega) \quad P(t, \vec{x}, \vec{\alpha}) = 1 \}

\\ \\

M(P)(\vec{x}, \vec{\alpha}) = \min_t \ P(t,\vec{x}, \vec{\alpha}),\quad \text{para cada} \ (\vec{x}, \vec{\alpha}) \in D_{M(P)}
$$

### (2) $Lt$
Definimos la función $Lt : \mathbb{N} \longmapsto \omega$ de la siguiente manera:

$$
Lt(x) = \left\{ \begin{aligned}

    & \max_i ((x)_i \neq 0), &\quad x \neq 1 \\
    & 0, & \quad x = 1

\end{aligned} \right.
$$

### (3) Conjunto rectangular
Un conjunto es llamado rectangular si es de la forma
$$ S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m $$

con $n, m \in \omega, S_i \subseteq \omega$ y cada $L_i$ es un conjunto de palabras (no necesariamente se habla de palabras del alfabeto $\Sigma$, si fuese asi, este seria $\Sigma$-mixto).

### (4) "$S$ es un conjunto de tipo $(n, m)$"
Dado un conjunto $\Sigma$-mixto $S$, si $n, m \in \omega$ son tales que $S \subseteq \omega^n \times \Sigma^{∗m}$ , entonces diremos que $S$ es un conjunto de tipo $(n, m)$.
> Notar que si $S$ es vacio, entonces $S$ es de tipo $(n, m)$ cualquiera sea $n, m \in \omega$. Caso contrario, $n$ y $m$ son únicos para el conjunto $S$.
