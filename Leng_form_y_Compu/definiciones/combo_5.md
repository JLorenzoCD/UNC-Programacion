# Combo 5.
### Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-efectivamente computable y defina: "el procedimiento efectivo $\mathbb{P}$ decide la pertenencia a $S$"

Sea $X$ un conjunto cualquiera y sea $S \subseteq X$. Usaremos $\chi^{X}_S$ para denotar la función

$$
\begin{aligned}

    \chi^{X}_S \ : \ \ \ & X & \longmapsto & \quad \omega \\

    & x & \longmapsto & \left\{ \begin{aligned}
        1 & : \ x \in S \\
        0 & : \ x \notin S

        \end{aligned} \right.

\end{aligned}
$$

Un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ sera llamado $\Sigma$-efectivamente computable cuando la función $\chi^{\omega^n \times \Sigma^{*m}}_S$ sea $\Sigma$-efectivamente computable.

Si $\mathbb{P}$ es un procedimiento efectivo el cual computa a $\chi^{\omega^n \times \Sigma^{*m}}_S$, diremos que $\mathbb{P}$ decide la pertenecia a $S$, con respecto al conjunto $\omega^n \times \Sigma^{*m}$,  es decir:

- El conjunto de datos de entrada de $\mathbb{P}$ es $\omega^n \times \Sigma^{*m}$ , siempre termina y da como dato de salida un elemento de $\{0, 1 \}$.
- Dado $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}$, $\mathbb{P}$ da como salida al numero $1$ si $(\vec{x}, \vec{\alpha}) \in S$ y al numero $0$ si $(\vec{x}, \vec{\alpha}) \notin S$.
