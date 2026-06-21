# Combo 8. Defina:
### (1) $M(P)$
Sea $\Sigma$ un alfabeto finito y sea $P : D_P \subseteq \omega \times \omega^n \times \Sigma^{*m} \longmapsto \omega$ un predicado. Dado $(\overrightarrow{x}, \overrightarrow{\alpha}) \in \omega^n \times \Sigma^{*m}$ , cuando exista al menos un $t \in \omega$ tal que $P(t, \overrightarrow{x}, \overrightarrow{\alpha}) = 1$, usaremos $\min_t P(t, \overrightarrow{x}, \overrightarrow{\alpha})$ para denotar al menor de tales $t's$.

> Nótese que la expresión $\min_t P(t, \overrightarrow{x}, \overrightarrow{\alpha})$ esta definida solo para aquellas $(n + m)$-uplas $(\overrightarrow{x}, \overrightarrow{\alpha})$ para las cuales hay al menos un $t$ tal que se da $P(t, \overrightarrow{x}, \overrightarrow{\alpha}) = 1$.

$$ M(P) = \lambda \overrightarrow{x} \overrightarrow{\alpha} [\min_t \ P(t, \overrightarrow{x}, \overrightarrow{\alpha})] $$

Nótese que:
$$
D_{M(P)} = \{(\overrightarrow{x}, \overrightarrow{\alpha}) \in \omega^n \times \Sigma^{*m} : (\exist t \in \omega) \quad P(t, \overrightarrow{x}, \overrightarrow{\alpha}) = 1 \}

\\ \\

M(P)(\overrightarrow{x}, \overrightarrow{\alpha}) = \min_t \ P(t,\overrightarrow{x}, \overrightarrow{\alpha}),\quad \text{para cada} \ (\overrightarrow{x}, \overrightarrow{\alpha}) \in D_{M(P)}
$$

### (2) $Lt$
Definimos la función $Lt : \mathbb{N} \longmapsto \omega$ de la siguiente manera:

$$
Lt(x) = \left\{ \begin{array}{cl}

    & \max_i ((x)_i \neq 0), &\quad x \neq 1 \\
    & 0, & \quad x = 1

\end{array} \right.
$$

### (3) Conjunto rectangular
Un conjunto es llamado rectangular si es de la forma
$$ S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m $$

con $n, m \in \omega, S_i \subseteq \omega$ y cada $L_i$ es un conjunto de palabras (no necesariamente se habla de palabras del alfabeto $\Sigma$, si fuese asi, este seria $\Sigma$-mixto).

### (4) "$S$ es un conjunto de tipo $(n, m)$"
Dado un conjunto $\Sigma$-mixto $S$, si $n, m \in \omega$ son tales que $S \subseteq \omega^n \times \Sigma^{∗m}$ , entonces diremos que $S$ es un conjunto de tipo $(n, m)$.
> Notar que si $S$ es vacio, entonces $S$ es de tipo $(n, m)$ cualquiera sea $n, m \in \omega$. Caso contrario, $n$ y $m$ son únicos para el conjunto $S$.
