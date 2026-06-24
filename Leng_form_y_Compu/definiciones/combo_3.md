# Combo 3.
### (1) Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-recursivamente enumerable (no hace falta que defina "función $\Sigma$-recursiva")
Es llamado $\Sigma$-RE cuando $S = \emptyset$ o haya una función $F: \omega \longmapsto \omega^n \times \Sigma^{*m}$ tal que $I_F = S$ y $F_{(i)}$ sea $\Sigma$-R $\forall i \in \{ 1, \cdots, n + m \}$.

### (2) Defina $s^{\le}$
Sea $\Sigma$ un alfabeto no vacio y supongamos $\le$ orden total sobre $\Sigma$. Supongamos $\Sigma = \{ a_1, \cdots, a_n \}$ con $a_1 \lt \cdots \lt a_n$.

$$ s^\le : \Sigma^* \longmapsto \Sigma^* $$

$$
\begin{aligned}
s^\le((a_n)^m) & = (a_1)^{m+1}, \quad m \in \omega \\
s^\le(\alpha a_i (a_n)^m) & = \alpha a_{i+1} (a_1)^m, \quad \alpha \in \Sigma^* \wedge 1 \le i \lt n \wedge m \in \omega
\end{aligned}
$$

### (3) Defina $*^{\le}$
Sea $\Sigma$ un alfabeto no vacio y supongamos $\le$ orden total sobre $\Sigma$. Supongamos $\Sigma = \{ a_1, \cdots, a_n \}$ con $a_1 \lt \cdots \lt a_n$.

$$ *^\le : \omega \longmapsto \Sigma^* $$

$$
\begin{aligned}
*^\le(0) & = \epsilon \\
*^\le(i + 1) & = s^\le(*^\le(i))
\end{aligned}
$$

### (4) Defina $\#^{\le}$
Lema:
Sea $\Sigma$ un alfabeto no vacio y supongamos $\le$ orden total sobre $\Sigma$. Supongamos $\Sigma = \{ a_1, \cdots, a_n \}$ con $a_1 \lt \cdots \lt a_n$. Entonces para cada $\alpha \in \Sigma^+$ hay únicos $k \in \omega$ y $i_0, i_1, \cdots, i_k \in \{ 1, \cdots, n\}$ tal que:
$$ \alpha = a_{i_k} \cdots a_{i_0} $$
(notar que $k = |\alpha| - 1$).

$$ \#^\le : \Sigma^* \longmapsto \omega $$

$$
\begin{aligned}
\#^\le(\epsilon) & = 0 \\
\#^\le(a_{i_k} \cdots a_{i_0}) & = i_k n^k + \cdots + i_0 n^0 
\end{aligned}
$$
