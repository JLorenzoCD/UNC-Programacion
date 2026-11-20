# Combo 3
### (1) Dados $t =_d t(v_1, \dots, v_n) \in T^\tau$, $\mathbb{A}$ una estructura de tipo $\tau$ y $a_1, \dots, a_n \in A$, defina $t^A[a_1, \dots, a_n]$ (i.e. Convención notacional 2 de la Guía 11)
Cuando hayamos declarado $t=_{d}t(v_{1},...,v_{n})$, si $\mathbb{A}$ es un modelo de tipo $\tau$ y $a_{1},...,a_{n}\in A$, entonces con $t^{\mathbb{A}}[a_{1},...,a_{n}]$ denotaremos al elemento $t^{\mathbb{A}}[\vec{b}]$, donde $\vec{b}$ es una asignación tal que a cada $v_{i}$ le asigna el valor $a_{i}$.

Caso $n=0$, con $t^{\mathbb{A}}[]$ denotaremos al elemento $t^{\mathbb{A}}[\vec{b}]$, donde $\vec{b}$ es una asignación cualquiera.

### (2) Defina "F es un homomorfismo de $(L, s, i, ^c, 0, 1)$ en $(L', s', i', ^{c'}, 0', 1')$"
Sean $(L, s, i, ^c, 0, 1)$ y $(L', s', i', ^{c'}, 0', 1')$ reticulados complementados. Una función $F:\mathbb{L}\rightarrow \mathbb{L'}$ será llamada un homomorfismo de $(L, s, i, ^c, 0, 1)$ en $(L', s', i', ^{c'}, 0', 1')$ si para todo $x,y\in L$ se cumple que
$$
\begin{aligned}
F(x\mathsf{\;s\;}y) & =F(x)\;\mathsf{s}^{\prime}\ F(y)\\
F(x\mathsf{\;i\;}y) & =F(x)\;\mathsf{i}^{\prime}\ F(y)\\
F(x^{c}) & =F(x)^{c^{\prime}}\\
F(0) & =0^{\prime}\\
F(1) & =1^{\prime}
\end{aligned}
$$

### (3) Defina "filtro generado por $S$ en $(L, s, i)$"

Sea $(L, s, i)$ un reticulado terna no vacío y $S \subseteq L$ un subconjunto no vacío, denotemos con $[S)$ el siguiente conjunto:
$$
\{y\in L:y\geq
s_{1}\;\mathsf{i\;}...\;\mathsf{i\;}s_{n}\text{, para algunos
}s_{1},...,s_{n}\in S\text{, }n\geq1\}
$$
Donde $[S)$ es el menor filtro que contiene a $S$ y llamaremos a $[S)$ el filtro generado por $S$ en $(L,\mathsf{s},\mathsf{i})$.

### (4) Defina cuando $J \in Just^+$ es balanceada (no hace falta que defina $\mathcal{B}^J$)
Diremos que $\mathbf{J}\in Just^{+}$ es balanceada si se dan las siguientes:

1. Por cada $k\in\mathbb{N}$ a lo sumo hay un $i$ tal que $\mathbf{J}_{i}= \mathrm{HIPOTESIS}\bar{k}$ y a lo sumo hay un $j$ tal que $\mathbf{J}_{j}= \mathrm{TESIS}\bar{k}\alpha$, con $\alpha\in JustBas$.
2. Si $\mathbf{J}_{i}=\mathrm{HIPOTESIS}\bar{k}$ entonces hay un $l>i$ tal que $\mathbf{J}_{l}=\mathrm{TESIS}\bar{k}\alpha$, con $\alpha\in JustBas$.
3. Si $\mathbf{J}_{i}=\mathrm{TESIS}\bar{k}\alpha$, con $\alpha\in JustBas$, entonces hay un $l<i$ tal que $\mathbf{J}_{l}=\mathrm{HIPOTESIS}\bar{k}$.
4. Si $B_{1},B_{2}\in\mathcal{B}^{\mathbf{J}}$, entonces $B_{1}\cap B_{2}=\emptyset$ o $B_{1}\subseteq B_{2}$ o $B_{2}\subseteq B_{1}$.
