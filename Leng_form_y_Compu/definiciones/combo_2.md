# Combo 2. Defina
### (1) $d \vdash^n d'$ y $d \vdash d'$ (no hace falta que defina $\vdash$)
Para $d, d' \in Des$ y $n \in \omega$, escribiremos $d \vdash^n d'$ si existen $d_1 , \cdots, d_{n+1} \in Des$ tales que

$$
\begin{aligned}
d & = d_1 \\
d' & = d_{n+1} \\ \\
d_i & \vdash d_{i+1} , \quad i = 1, \cdots, n. \\
\end{aligned}
$$

Finalmente definamos
$$ d \vdash^* d' \quad \text{sii} \quad (\exists n \in \omega) \quad d \vdash^n d'. $$

### (2) $L(M)$
Diremos que una palabra $\alpha \in \Sigma^*$ es aceptada por $M$ por alcance de estado final cuando

$$ ⌊q_0 B \alpha⌋ \vdash^* d, \quad \text{con d tal que } St(d) \in F $$

El lenguage aceptado por $M$ por alcance de estado final se define de la siguiente manera

$$ L(M) = \{ \alpha \in \Sigma^∗ : \alpha \text{ es aceptada por M por alcance de estado final} \} $$


### (3) "$f$ es una función de tipo $(n, m, s)$"
Dada una función $\Sigma$-mixta $f$ y $n, m \in \omega$ tales que $D_f \subseteq \omega^n \times \Sigma^{*m}$ diremos que:
- $f$ es del tipo $(n, m, \#)$ si $I_f \subseteq \omega$
- $f$ es del tipo $(n, m, *)$ si $I_f \subseteq \Sigma^*$

### (4) $(x)$
Dando $x \in \mathbb{N}$ donde $(x) =$ única infinitupla $(s_1, s_2, \cdots) \in \omega^{[\mathbb{N}]}$ tal que:

$$ x = ⟨ s_1, s_2, \cdots ⟩ = \prod_{i=1}^{\infty} pr(i)^{s_i} $$

### (5) $(x)_i$
Dadas $x, i \in \mathbb{N}$:

$$
\begin{aligned}
(x)_i & = \max_t(pr(i)^t \ \ \text{divide a x}) \\
(x)_i & = \text{exponente de pr(i) en la (única posible) factorización de x como producto de primos}  \\
(x)_i & = s_i = \text{i-esimo elemento de la infinitupla } (x) \\
\end{aligned}
$$
