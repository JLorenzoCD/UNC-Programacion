# Combo 11. Defina:
### (1) $\Psi^{n, m, \#}_{\mathcal{P}}$
Dados $x_1, \cdots, x_n \in \omega$ y $\alpha_1, \cdots, \alpha_m \in \Sigma^*$, con $n, m \in \omega$, usaremos
$$ || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m || $$
para denotar el estado
$$ ((x_1, \cdots, x_n, 0, \cdots), (\alpha_1, \cdots, \alpha_m, \epsilon, \cdots)) $$

**Dado $\mathcal{P} \in Pro^\Sigma$ , definamos para cada par $n, m \ge 0$, la función $\Psi^{n, m, \#}_{\mathcal{P}}$** de la siguiente manera:
$$
D_{\Psi^{n, m, \#}_{\mathcal{P}}} = \{ (\overrightarrow{x}, \overrightarrow{\alpha}) \in \omega^n \times \Sigma^{*m}: \mathcal{P} \text{ termina partiendo del estado } || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m || \}
$$

$$
\Psi^{n, m, \#}_{\mathcal{P}} = \text{ valor de N1 en el estado obtenido cuando } \mathcal{P} \text{ termina, partiendo del estado } || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||
$$

### (2) "$f$ es $\Sigma$-computable" y (3) "$\mathcal{P}$ computa a $f$"
Una función $\Sigma$-mixta $f: S \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$ sera llamada $\Sigma$-computable si hay un programa $\mathcal{P}$ de $\mathcal{S}^\Sigma$ tal que $f = \Psi^{n, m, \#}_{\mathcal{P}}$. En tal caso diremos que la función $f$ es computada por $\mathcal{P}$. <br>
Análogamente una función $\Sigma$-mixta $f: S \subseteq \omega^n \times \Sigma^{*m} \longmapsto \Sigma^*$ sera llamada $\Sigma$-computable si hay un programa $\mathcal{P}$ de $\mathcal{S}^\Sigma$ tal que $f = \Psi^{n, m, *}_{\mathcal{P}}$. En tal caso diremos que la función $f$ es computada por $\mathcal{P}$.

### (4) $M^{\le}(\mathcal{P})$
Sea $\Sigma$ un alfabeto finito no vacio. Sea $\le$ orden total sobre $\Sigma$. Sea $P : D_P \subseteq \omega^n \times \Sigma^{*m} \times \Sigma^* \longmapsto \omega$ un predicado. Dado $(\overrightarrow{x}, \overrightarrow{\alpha}) \in \omega^n \times \Sigma^{*m}$ , cuando exista al menos un $\alpha \in \Sigma^*$ tal que $P(\overrightarrow{x}, \overrightarrow{\alpha}, \alpha) = 1$, usaremos $\min_{\alpha}^{\le} P(\overrightarrow{x}, \overrightarrow{\alpha}, \alpha)$ para denotar al menor de tales $\alpha's$.

> Nótese que la expresión $\min_{\alpha}^{\le} P(\overrightarrow{x}, \overrightarrow{\alpha}, \alpha)$ esta definida solo para aquellas $(n + m)$-uplas $(\overrightarrow{x}, \overrightarrow{\alpha})$ para las cuales hay al menos un $\alpha$ tal que se da $P(\overrightarrow{x}, \overrightarrow{\alpha}, \alpha) = 1$.

$$ M^{\le}(P) = \lambda \overrightarrow{x} \overrightarrow{\alpha} [\min_{\alpha}^{\le} \ P(\overrightarrow{x}, \overrightarrow{\alpha}, \alpha)] $$

Nótese que:
$$
D_{M^{\le}(P)} = \{(\overrightarrow{x}, \overrightarrow{\alpha}) \in \omega^n \times \Sigma^{*m} : (\exist \alpha \in \Sigma^*) \quad P(\overrightarrow{x}, \overrightarrow{\alpha}, \alpha) = 1 \}

\\ \\

M^{\le}(P)(\overrightarrow{x}, \overrightarrow{\alpha}) = \min_{\alpha}^{\le} \ P(\overrightarrow{x}, \overrightarrow{\alpha}, \alpha),\quad \text{para cada} \ (\overrightarrow{x}, \overrightarrow{\alpha}) \in D_{M^{\le}(P)}
$$
