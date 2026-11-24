# Combo 7
### (1) Defina recursivamente la relación "$v$ es sustituible por $w$ en $\varphi$"
Sean $v, w$ variables y $\varphi$ una fórmula elemental pura de tipo $\tau$. La relación **"$v$ es sustituible por $w$ en $\varphi$"** se define recursivamente sobre la estructura de $\varphi$:

1. Si $\varphi$ es atómica, entonces $v$ es sustituible por $w$ en $\varphi$

2. Si $\varphi=(\varphi_{1}\eta\varphi_{2})$, entonces $v$ es sustituible por $w$ en $\varphi$ $\Longleftrightarrow$ $v$ es sustituible por $w$ en $\varphi_{1}$ y $v$ es sustituible por $w$ en $\varphi_{2}$

3. Si $\varphi=\lnot\varphi_{1}$, entonces $v$ es sustituible por $w$ en $\varphi$ $\Longleftrightarrow$ $v$ es sustituible por $w$ en $\varphi_{1}$

4. Si $\varphi=Qv\varphi_{1}$, entonces $v$ es sustituible por $w$ en $\varphi$

5. Si $\varphi=Qw\varphi_{1}$ y $v\in Li(\varphi_{1})$, entonces $v$ no es sustituible por $w$ en $\varphi$

6. Si $\varphi=Qw\varphi_{1}$ y $v\not\in Li(\varphi_{1})$, entonces $v$ es sustituible por $w$ en $\varphi$

7. Si $\varphi=Qu\varphi_{1}$, con $u\neq v,w$, entonces $v$ es sustituible por $w$ en $\varphi$ $\Longleftrightarrow$ $v$ es sustituible por $w$ en $\varphi_{1}$

Con $\varphi_1, \varphi_2 \in F^\tau$, $\eta \in \{ \vee, \wedge, \rightarrow, \leftrightarrow \}$ y $Q \in \{ \forall, \exist \}$.

### (2) Defina cuando $J \in Just^+$ es balanceada (no hace falta que defina $\mathcal{B}^J$)
> Nota: Explicado en Combo 3 - item 4

### (3) Defina "filtro del reticulado terna $(L, s, i)$"
Un filtro de un reticulado terna $(L,\mathsf{s},\mathsf{i})$ será un subconjunto $F\subseteq L$ tal que:

1. $F\neq\emptyset$

2. para cada $x,y\in F\text{ se tiene que }x\;\mathsf{i\;}y\in F$

3. para cada $x,y\in L$, si $x\in F$ y $x\leq y\text{ entonces }y\in F$

### (4) Defina "teoría elemental"
Una teoría (de primer orden) será un par ordenado $T = (\Sigma,\tau)$, donde $\tau$ es un tipo y $\Sigma$ es un conjunto de sentencias elementales puras de tipo $\tau$, llamados axiomas propios de $T$.
