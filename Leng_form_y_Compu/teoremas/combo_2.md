# Combo 2.
### Lema (Lema de división por casos para funciones $\Sigma$-PR).
Supongamos $f_i : D_{f_i} \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}$ , $i = 1, \cdots, k$, son funciones $\Sigma$-PR tales que $D_{f_i} \cap D_{f_j} = \emptyset$ para
$i \neq j$. Entonces $f_1 \cup \cdots \cup f_k$ es $\Sigma$-PR
> (Hacer el caso k = 2, n = 2 y m = 1)


### Proposición (Caracterización básica de conjuntos $\Sigma$-enumerables).
Sea $S \subseteq \omega^n \times \Sigma^{∗m}$ un conjunto no vacı́o. Entonces son equivalentes:
1. $S$ es $\Sigma$-enumerable
2. Hay un programa $\mathcal{P} \in Pro^\Sigma$ tal que:
    1.  Para cada $x \in \omega$, tenemos que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$, donde $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$.
    2. Para cada $(x_1, \cdots, x_n , \alpha_1, \cdots, \alpha_m) \in S$ hay un $x \in \omega$ tal que $\mathcal{P}$ se detiene partiendo desde el estado $||x||$ y llega a un estado de la forma $((x_1, \cdots, x_n, y_1, \cdots), (\alpha_1, \cdots, \alpha_m, \beta_1 , \cdots))$
> (Hacer el caso n = 2 y m = 1)
