# Combo 6.
### Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-efectivamente enumerable y defina: "el procedimiento efectivo $\mathbb{P}$ enumera a $S$"

Prev

Supongamos que $k, l, n, m \in \omega$ y que $F : D_F \subseteq \omega^k \times \Sigma^{*l} \longmapsto \omega^n \times \Sigma^{*m}$. Supongamos ademas que $n + m \ge 1$. Entonces denotaremos con $F_{(i)}$ a la función $p_i \circ F$.

Notar que:
$$
\begin{aligned}

    F_{(i)} &: D_F \subseteq \omega^k \times \Sigma^{*l} \longmapsto \omega, \quad \text{para cada} \ \ i = 1, \cdots, n \\
    F_{(i)} &: D_F \subseteq \omega^k \times \Sigma^{*l} \longmapsto \Sigma^{*}, \quad \text{para cada} \ \ i = n + 1, \cdots, n + m

\end{aligned}
$$
Por lo cual cada una de las funciones $F_{(i)}$ son $\Sigma$-mixtas.

Def

Un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ **sera llamado $\Sigma$-efectivamente enumerable** cuando sea vacio o haya una función $F :\omega \longmapsto \omega^n \times \Sigma^{*m}$ tal que $I_F = S$ y $F_{(i)}$ sea $\Sigma$-efectivamente computable, para cada $i \in \{ 1, \cdots, n + m \}$.

El procedimiento efectivo **$\mathbb{P}$ enumera a $S$** si:
1. El conjunto de datos de entrada de $\mathbb{P}$ es $\omega$.
2. $\mathbb{P}$ se detiene para cada $x \in \omega$.
3. El conjunto de datos de salida de $\mathbb{P}$ es igual a $S$.

(Es decir, siempre que $\mathbb{P}$ se detiene, da como salida un elemento de $S$, y para cada elemento $(\vec{x}, \vec{\alpha}) \in S$, hay un $x \in \omega$ tal que $\mathbb{P}$ da como salida a $(\vec{x}, \vec{\alpha})$ cuando lo corremos con $x$ como dato de entrada)
