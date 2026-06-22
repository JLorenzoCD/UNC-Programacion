# Combo 5.
### Lema.
Sea $\Sigma = \{ @, \%, ! \}$. Sea
$$ f : S_1 \times S_2 \times L_1 \times L_2 \longmapsto \omega $$
con $S_1, S_2 \subseteq \omega$ y $L_1, L_2 \subseteq \Sigma^∗$ conjuntos no vacı́os y sea $\mathcal{G}$ una familia $\Sigma$-indexada de funciones tal que
$$ \mathcal{G}_a : \omega \times S_1 \times S_2 \times L_1 \times L_2 \times \Sigma^∗ \longmapsto \omega$$
para cada $a \in \Sigma$. Si $f, \mathcal{G}_@ , \mathcal{G}_{\%}$ y $\mathcal{G}_!$ son $\Sigma$-efectivamente computables, entonces $R(f, \mathcal{G})$ lo es.
> (Es un ejercicio de la Guı́a 5)

### Lema (Lema de cuantificación acotada).
Sea $\Sigma$ un alfabeto finito. Sea $P : S \times S_1 \times \cdots\times S_n \times L_1 \times\cdots\times L_m \longmapsto \omega$ un predicado $\Sigma$-PR, con $S, S_1, \cdots, S_n \subseteq \omega$ y $L_1 , \cdots, L_m \subseteq \Sigma^∗$ no vacı́os. Supongamos $\overline{S} \subset S$ es $\Sigma$-PR. Entonces $ \lambda x \overrightarrow{x} \overrightarrow{\alpha} [ \ (\forall t \in \overline{S})_{t \le x} \quad  P(t, \overrightarrow{x} \overrightarrow{\alpha}) \ ] $ es $\Sigma$-PR
