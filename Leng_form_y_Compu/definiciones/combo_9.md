# Combo 9. Defina:
### (1) "$I$ es una instruccion de $\mathcal{S}^\Sigma$"
Una instrucción de $\mathcal{S}^\Sigma$ es ya sea una instrucción básica de $\mathcal{S}^\Sigma$ o una palabra de la forma $\alpha I$, donde $\alpha \in \{ L\overline{n} : n \in \mathbb{N} \}$ y $I$ es una instrucción básica de $\mathcal{S}^\Sigma$ .

Usaremos $Ins^\Sigma$ para denotar el conjunto de todas las instrucciones de $\mathcal{S}^\Sigma$.

### (2) "$\mathcal{P}$ es un programa de $\mathcal{S}^\Sigma$"
Un programa de $\mathcal{S}^\Sigma$ es una palabra de la forma
$$ I_1 I_2 \cdots I_n $$
donde $n \ge 1, I_1 , \cdots, I_n \in Ins^\Sigma$ y ademas se cumple la siguiente propiedad, llamada la ley de los GOTO,
> (G) Para cada $i \in \{1, \cdots, n \}$, si $GOTOL\overline{m}$ es un tramo final de $I_i$ , entonces existe $j \in \{1, \cdots, n \}$ tal que $I_j$ tiene label $L\overline{m}$

Usaremos $Pro^\Sigma$ para denotar el conjunto de todos los programas de $\mathcal{S}^\Sigma$.

### (3) y (4) $I_{i}^{\mathcal{P}}$; $n(\mathcal{P})$
Lema: Sea $\Sigma$ un alfabeto finito. Se tiene que: <br>
a. Si $I_1 \cdots I_n = J_1 \cdots J_m$, con $I_1, \cdots, I_n, J_1, \cdots, J_m \in Ins^\Sigma$, entonces $n = m$ y $I_j = J_j$ para cada $j \ge 1$. <br>
b. Si $\mathcal{P} \in Pro^\Sigma$, entonces existe una única sucesión de instrucciones $I_1, \cdots, I_n$ tal que $\mathcal{P} = I_1 \cdots I_n$.

> (b) del lema anterior nos dice que dado un programa $\mathcal{P}$, tenemos unívocamente determinados $n(\mathcal{P}) \in \mathbb{N}$ y $I_1^{\mathcal{P}} , \cdots , I_{n(\mathcal{P})}^{\mathcal{P}} \in Ins^\Sigma$ tales que $P = I_1^{\mathcal{P}} \cdots I_{n(\mathcal{P})}^{\mathcal{P}}$. Definamos también $I_i^{\mathcal{P}} = \epsilon$ cuando $i = 0$ o $i \gt n(\mathcal{P})$.

### (5) $Bas$
$$
Bas : Ins^\Sigma \longmapsto (\Sigma \cup \Sigma^p )^∗
$$

$$
Bas(I) = \left\{ \begin{aligned}
    & J, \quad \text{si I es de la forma } L\overline{k}J \text{ con } J \in Ins^\Sigma \text{ y } k \in \mathbb{N}\\
    & I, \quad \text{caso contrario}
\end{aligned} \right.
$$