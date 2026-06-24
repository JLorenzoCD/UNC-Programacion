# Combo 1
### 1. Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-recursivo (no hace falta que defina "función $\Sigma$-recursiva")
Es llamado $\Sigma$-recursivo sii su función de caracterización $\chi^{\omega^n \times \Sigma^{*m}}_S$ es $\Sigma$-recursivo.

###  2. Defina $⟨s_1 , s_2 , \cdots⟩$
Se utiliza para denotar el numero $x = \prod_{i=1}^{\infty} pr(i)^{s_i}$.

###  3. Defina "f es una función $\Sigma$-mixta"
Sea $\Sigma$ un alfabeto finito. Una función f es $\Sigma$-mixta si cumple:

- $\exists n,m \in \omega$ tal que $D_f \subseteq \omega^n \times \Sigma^{*m}$
- $I_f \subseteq \omega$ o $I_f \subseteq \Sigma^{*}$

###  4. Defina "familia $\Sigma$-indexada de funciones"
Dado un alfabeto $\Sigma$ una familia $\Sigma$-indexada de funciones seria una función $\mathcal{G}$ tal que $D_{\mathcal{G}} = \Sigma$, $\forall a \in \Sigma$ se tiene que $\mathcal{G}(a)$ es una función.

###   5. Defina $R(f, G)$ (haga el caso de valores numéricos)
Sea
$$ f: S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \longmapsto \omega $$
con $S_1, \cdots, S_n \subseteq \omega$ y $L_1, \cdots, L_m \subseteq \Sigma^*$ conjuntos no vacíos.

Sea $\mathcal{G}$ una familia $\Sigma$-indexada de funciones tales que:
$$ \mathcal{G}_a: \omega \times S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \times \Sigma^* \longmapsto \omega $$

Tomando a $\mathcal{G}(a) = \mathcal{G}_a, \forall a \in \Sigma$

Tenemos que:
$$ R(f, \mathcal{G}) : S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \times \Sigma^* \longmapsto \omega $$

$$
\begin{aligned}
R(f, \mathcal{G})(\vec{x}, \vec{\alpha}, \epsilon) & = & f(\vec{x}, \vec{\alpha}) \\
R(f, \mathcal{G})(\vec{x}, \vec{\alpha}, \alpha a) & = & \mathcal{G}_a(R(f, \mathcal{G})(\vec{x}, \vec{\alpha}, \alpha), \vec{x}, \vec{\alpha}, \alpha)
\end{aligned}
$$

Diremos que $R(f, \mathcal{G})$ es obtenida por recursion primitiva a partir de $f$ y $\mathcal{G}$
