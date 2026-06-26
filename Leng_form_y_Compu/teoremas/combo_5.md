# Combo 5.
### Lema.
Sea $\Sigma = \{ @, \%, ! \}$. Sea
$$ f : S_1 \times S_2 \times L_1 \times L_2 \longmapsto \omega $$
con $S_1, S_2 \subseteq \omega$ y $L_1, L_2 \subseteq \Sigma^∗$ conjuntos no vacı́os y sea $\mathcal{G}$ una familia $\Sigma$-indexada de funciones tal que
$$ \mathcal{G}_a : \omega \times S_1 \times S_2 \times L_1 \times L_2 \times \Sigma^∗ \longmapsto \omega$$
para cada $a \in \Sigma$. Si $f, \mathcal{G}_@ , \mathcal{G}_{\%}$ y $\mathcal{G}_!$ son $\Sigma$-efectivamente computables, entonces $R(f, \mathcal{G})$ lo es.
> Es un ejercicio de la Guı́a 5

Proof

Como $f, \mathcal{G}_@ , \mathcal{G}_{\%}$ y $\mathcal{G}_!$ son $\Sigma$-efectivamente computables, entonces existen los siguientes procedimientos efectivos que las computan $\mathbb{P}_{f}, \mathbb{P}_{\mathcal{G}_@}, \mathbb{P}_{\mathcal{G}_{\%}}, \mathbb{P}_{\mathcal{G}_!}$. Sea $\mathbb{P}_{R(f, \mathcal{G})}$ el siguiente procedimiento:

Se recibe como dato de entrada $(\vec{x}, \vec{\alpha}, \alpha)$, con $\vec{x} \in \omega^2$, $\vec{\alpha} \in \Sigma^{*2}$ y $\alpha \in \Sigma^*$, entonces:
- Etapa 1: Ejecuto $\mathbb{P}_{f}$ con $(\vec{x}, \vec{\alpha})$ obteniendo A com resultado.
- Etapa 2: Si $\alpha = \epsilon$, devuelvo A y termino.
- Etapa 3: $C = \left[ \alpha \right]_{|\alpha|} y \ \alpha = \text{}^{\curvearrowright} \alpha$.
- Etapa 4: Si $C = @$, ejecuto $\mathbb{P}_{\mathcal{G}_@}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.
- Etapa 5: Si $C = \%$, ejecuto $\mathbb{P}_{\mathcal{G}_\%}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.
- Etapa 6: Ejecuto $\mathbb{P}_{\mathcal{G}_!}$ con $(A, \vec{x}, \vec{\alpha}, \alpha)$ obteniendo a y asigno $A = a$ e ir a Etapa 2.

Claramente el procedimiento anterior computa a $R(f, \mathcal{G})$, por lo que este ultimo es $\Sigma$-efectivamente computable.

---
### Lema (Lema de cuantificación acotada).
Sea $\Sigma$ un alfabeto finito. Sea $P : S \times S_1 \times \cdots\times S_n \times L_1 \times\cdots\times L_m \longmapsto \omega$ un predicado $\Sigma$-PR, con $S, S_1, \cdots, S_n \subseteq \omega$ y $L_1 , \cdots, L_m \subseteq \Sigma^∗$ no vacı́os. Supongamos $\overline{S} \subset S$ es $\Sigma$-PR. Entonces $ \lambda x \vec{x} \vec{\alpha} [ \ (\forall t \in \overline{S})_{t \le x} \quad  P(t, \vec{x} \vec{\alpha}) \ ] $ es $\Sigma$-PR

Proof

Como $P$ es $\Sigma$-PR, entonces por lema su dominio es $\Sigma$-PR. Por lema, el producto cruz es $\Sigma$-PR si cada conjunto del mismo es no vacio y $\Sigma$-PR, por lo que $S, S_1, \cdots, S_n, L_1,\cdots, L_m$ son conjuntos $\Sigma$-PR.

Sea
$$
\overline{P} = P|_{\overline{S}\times S_{1} \times \cdots \times
S_{n} \times L_{1} \times \cdots \times L_{m}} \cup C_{1}^{1+n,m}|_{(\omega - \overline{S}) \times S_{1} \times \cdots \times S_{n} \times L_{1}\times \cdots \times L_{m}}
$$
claramente $C_{1}^{1+n,m}$ es $\Sigma$-PR. Ademas, como por suposición $\overline{S}$ es $\Sigma$-PR, entonces $(\omega - \overline{S})$ también es $\Sigma$-PR. Por lema de la restricción y de la union de funciones, donde en este caso los dominios son claramente disjuntos, tendríamos que $\overline{P}$ es $\Sigma$-PR.

Por "Lema de la Sumatoria" sabemos que $\lambda x y \vec{x} \vec{\alpha} \left[ \prod_{t=x}^{t=y} \overline{P}(t, \vec{x},\vec{\alpha}) \right]$ es $\Sigma$-PR. Como es valida la siguiente igualdad:
$$
\begin{aligned}

\lambda x \vec{x} \vec{\alpha} \left[ (\forall t\in\overline{S})_{t\leq
x}\overline{P}(t,\vec{x},\vec{\alpha})\right] & =\lambda
x\vec{x}\vec{\alpha}\left[\prod\limits_{t=0}^{t=x}\overline{P}(t,\vec{x},\vec{\alpha})\right]\\
& =\lambda
xy\vec{x}\vec{\alpha}\left[\prod\limits_{t=x}^{t=y}\overline{P}(t,\vec{x},\vec{\alpha})\right]\circ\left[C_{0}^{1+n,m},p_{1}^{1+n,m},\cdots,p_{1+n+m}^{1+n,m}\right]

\end{aligned}
$$
entonces tenemos que $ \lambda x \vec{x} \vec{\alpha} [ \ (\forall t \in \overline{S})_{t \le x} \  \overline{P}(t, \vec{x} \vec{\alpha}) \ ] $ es $\Sigma$-PR.

Por lema de la restricción del dominio de una función $\Sigma$-PR, se puede probar fácilmente que $\lambda x \vec{x} \vec{\alpha} \left[ (\forall t\in\overline{S})_{t\leq x}P(t,\vec{x},\vec{\alpha})\right]$ es $\Sigma$-PR.
