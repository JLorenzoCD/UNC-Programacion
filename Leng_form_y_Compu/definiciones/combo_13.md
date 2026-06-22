# Combo 13. Defina:
### (1) $i^{n, m}$, (2) $E^{n, m}_{\#}$ y (3) $E^{n, m}_{*}$
Sean $n, m \in \omega$, fijos. Definimos:
$$
\begin{array}{cl}

& i^{n, m}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \omega \\ \\
& E^{n, m}_{\#}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \omega^{[\mathbb{N}]} \\ \\
& E^{n, m}_{*}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \Sigma^{*[\mathbb{N}]} \\ \\

\end{array}
$$

Definición recursiva:
$$
\begin{array}{cl}

& (i^{n, m}(0, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}), E^{n, m}_{\#}(0, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}), E^{n, m}_{*}(0, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P})) = (1, (x_1, \cdots, x_n, 0, \cdots), (\alpha_1, \cdots, \alpha_n, 0, \cdots)) \\
& (i^{n, m}(t + 1, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}), E^{n, m}_{\#}(t + 1, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}), E^{n, m}_{*}(t + 1, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P})) = S_{\mathcal{P}}(i^{n, m}(t, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}), E^{n, m}_{\#}(t, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}), E^{n, m}_{*}(t, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}))

\end{array}
$$

> $i^{n, m}$ es $(\Sigma \cup \Sigma^p)$-PR

### (4) $E^{n, m}_{\#(j)}$
Sean $n, m \in \omega$, fijos y $j \in \mathbb{N}$. Definimos:
$$
\begin{array}{cl}

& E^{n, m}_{\#(j)}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \omega^{[\mathbb{N}]} \\ \\

& E^{n, m}_{\#(j)}(t, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}) = j \text{-esima coordenada de } E^{n, m}_{\#}(t, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P})

\end{array}
$$

> $E^{n, m}_{\#(j)}$ es $(\Sigma \cup \Sigma^p)$-PR

### (5) $E^{n, m}_{*(j)}$
Sean $n, m \in \omega$, fijos y $j \in \mathbb{N}$. Definimos:
$$
\begin{array}{cl}

& E^{n, m}_{*(j)}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \omega^{[\mathbb{N}]} \\ \\

& E^{n, m}_{*(j)}(t, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}) = j \text{-esima coordenada de } E^{n, m}_{*}(t, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P})

\end{array}
$$

> $E^{n, m}_{*(j)}$ es $(\Sigma \cup \Sigma^p)$-PR

### (6) $Halt^{n, m}$
Dados $n, m \in \omega$, definamos:
$$
Halt^{n, m} = \lambda t \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P} [ i^{n, m}(t, \overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}) = n(\mathcal{P}) + 1 ]
$$

> $Halt^{n, m}$ es $(\Sigma \cup \Sigma^p)$-PR

### (7) $T^{n, m}$
Dados $n, m \in \omega$, definamos:
$$
T^{n, m} = M(Halt^{n, m}) \\ \\

D_{T^{n, m}} = \{ (\overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}) \in \omega^n \times \Sigma^{*m} \times Pro^\Sigma : \mathcal{P} \text{ se detiene partiendo del estado } || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m || \}
$$

Para $(\overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}) \in D_{T^{n, m}}$ tenemos que $T^{n, m}(\overrightarrow{x} \overrightarrow{\alpha} \mathcal{P}) =$ cantidad de pasos necesarios para que $\mathcal{P}$ se detenga partiendo del estado $|| x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||$

> $T^{n, m}$ es $(\Sigma \cup \Sigma^p)$-R

### (8) $AutoHalt^\Sigma$
Supongamos que $\Sigma \supseteq \Sigma^p$. Entonces
$$ AutoHalt^\Sigma = \lambda \mathcal{P} [ (\exist t \in \omega) \quad Halt^{0, 1}(t, \mathcal{P}, \mathcal{P}) ] $$

Notar que el dominio de $AutoHalt^\Sigma$ es $Pro^\Sigma$ y que para cada $\mathcal{P} \in Pro^\Sigma$ tenemos que
$$ AutoHalt^\Sigma(\mathcal{P}) = 1 \text{ sii } \mathcal{P} \text{ se detiene partiendo del estado } ||\mathcal{P}|| $$

> $AutoHalt^\Sigma$ no es $\Sigma$-R

### (9) Los conjuntos $A$ y $N$
Supongamos que $\Sigma \supseteq \Sigma^p$. Entonces
$$ A = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 1 \} $$
es $\Sigma$-RE. y no es $\Sigma$-R. Mas aun el conjunto
$$ N = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 0 \} $$
no es $\Sigma$-RE
