# Combo 8.
### Lema. Supongamos $\Sigma \supseteq \Sigma^p$. Entonces $AutoHalt^\Sigma$ no es $\Sigma$-recursivo.

### Teorema. Supongamos $\Sigma \supseteq \Sigma^p$ . Entonces $AutoHalt^\Sigma$ no es $\Sigma$-efectivamente computable.
> Es decir no hay ningún procedimiento efectivo que decida si un programa de $\mathcal{S}^\Sigma$ termina partiendo de si mismo.

### Lema.
Supongamos que $\Sigma \supseteq \Sigma^p$ . Entonces
$$ A = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 1 \} $$
es $\Sigma$-RE. y no es $\Sigma$-R. Mas aun el conjunto
$$ N = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 0 \} $$
no es $\Sigma$-RE

### Teorema (Neumann vence a Godel). Si $h$ es $\Sigma$-recursiva, entonces $h$ es $\Sigma$-computable.
> (En la inducción de la prueba hacer solo el caso $h = M(P)$)
