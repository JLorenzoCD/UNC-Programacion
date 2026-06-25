# Combo 11. Defina:
### (1) $\Psi^{n, m, \#}_{\mathcal{P}}$
Dados $x_1, \cdots, x_n \in \omega$ y $\alpha_1, \cdots, \alpha_m \in \Sigma^*$, con $n, m \in \omega$, usaremos
$$ || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m || $$
para denotar el estado
$$ ((x_1, \cdots, x_n, 0, \cdots), (\alpha_1, \cdots, \alpha_m, \epsilon, \cdots)) $$

**Dado $\mathcal{P} \in Pro^\Sigma$ , definamos para cada par $n, m \ge 0$, la función $\Psi^{n, m, \#}_{\mathcal{P}}$** de la siguiente manera:
$$
D_{\Psi^{n, m, \#}_{\mathcal{P}}} = \{ (\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}: \mathcal{P} \text{ termina partiendo del estado } || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m || \}
$$

$$
\Psi^{n, m, \#}_{\mathcal{P}} = \text{ valor de N1 en el estado obtenido cuando } \mathcal{P} \text{ termina, partiendo del estado } || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||
$$

### (2) "$f$ es $\Sigma$-computable" y (3) "$\mathcal{P}$ computa a $f$"
Una función $\Sigma$-mixta $f: D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$ sera llamada $\Sigma$-computable si hay un programa $\mathcal{P}$ de $\mathcal{S}^\Sigma$ tal que $f = \Psi^{n, m, \#}_{\mathcal{P}}$. En tal caso diremos que la función $f$ es computada por $\mathcal{P}$. <br>
Análogamente una función $\Sigma$-mixta $f: D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \Sigma^*$ sera llamada $\Sigma$-computable si hay un programa $\mathcal{P}$ de $\mathcal{S}^\Sigma$ tal que $f = \Psi^{n, m, *}_{\mathcal{P}}$. En tal caso diremos que la función $f$ es computada por $\mathcal{P}$.

### (4) $M^{\le}(\mathcal{P})$
Sea $\Sigma$ un alfabeto finito no vacio. Sea $\le$ orden total sobre $\Sigma$. Sea $P : D_P \subseteq \omega^n \times \Sigma^{*m} \times \Sigma^* \longmapsto \omega$ un predicado. Dado $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}$ , cuando exista al menos un $\alpha \in \Sigma^*$ tal que $P(\vec{x}, \vec{\alpha}, \alpha) = 1$, usaremos $\min_{\alpha}^{\le} P(\vec{x}, \vec{\alpha}, \alpha)$ para denotar al menor de tales $\alpha's$.

> Nótese que la expresión $\min_{\alpha}^{\le} P(\vec{x}, \vec{\alpha}, \alpha)$ esta definida solo para aquellas $(n + m)$-uplas $(\vec{x}, \vec{\alpha})$ para las cuales hay al menos un $\alpha$ tal que se da $P(\vec{x}, \vec{\alpha}, \alpha) = 1$.

$$ M^{\le}(P) = \lambda \vec{x} \vec{\alpha} [\min_{\alpha}^{\le} \ P(\vec{x}, \vec{\alpha}, \alpha)] $$

Nótese que:
$$
D_{M^{\le}(P)} = \{(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m} : (\exist \alpha \in \Sigma^*) \quad P(\vec{x}, \vec{\alpha}, \alpha) = 1 \}

\\ \\

M^{\le}(P)(\vec{x}, \vec{\alpha}) = \min_{\alpha}^{\le} \ P(\vec{x}, \vec{\alpha}, \alpha),\quad \text{para cada} \ (\vec{x}, \vec{\alpha}) \in D_{M^{\le}(P)}
$$
