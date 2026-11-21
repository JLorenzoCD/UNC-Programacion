# Combo 4
### (1) Defina "$(L, s, i, ^c, 0, 1)$ es un subreticulado complementado de $(L', s', i', ^{c'}, 0', 1')$"
Dados reticulados complementados $(L,\mathsf{s},\mathsf{i},^{c},0,1)$ y $(L^{\prime},\mathsf{s}^{\prime},\mathsf{i}^{\prime},^{c^{\prime}},0^{\prime},1^{\prime})$ diremos que $(L,\mathsf{s},\mathsf{i},^{c},0,1)$ es un subreticulado complementado de $(L^{\prime},\mathsf{s}^{\prime},\mathsf{i}^{\prime},^{c^{\prime}},0^{\prime},1^{\prime})$ si se dan las siguientes condiciones:
1. $L\subseteq L^{\prime}$
2. $L$ es cerrado bajo las operaciones $\mathsf{s}^{\prime}$, $\mathsf{i}^{\prime}$ y $^{c^{\prime}}$.
3. $0=0^{\prime}$ y $1=1^{\prime}$.
4. $\mathsf{s}=\mathsf{s}^{\prime}|_{L\times L}, \mathsf{i}=\mathsf{i}^{\prime}|_{L\times L}$ y $^{c}=\ ^{c^{\prime}}|_{L}$.

### (2) Defina $\mathbb{A} \models \varphi[\vec{a}]$ (versión absoluta, no dependiente de una declaración previa, i.e. $\vec{a} \in A^\mathbb{N}$. No hace falta definir $t^A[\vec{a}]$)
1. Si $\varphi=(t\equiv s)$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si $t^{\mathbb{A}}[\vec{a}]=s^{\mathbb{A}}[\vec{a}]$

2. Si $\varphi=r(t_{1},...,t_{m})$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si $(t_{1}^{\mathbb{A}}[\vec{a}],...,t_{m}^{\mathbb{A}}[\vec{a}])\in i(r)$

3. Si $\varphi=(\varphi_{1}\wedge\varphi_{2})$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si $\mathbb{A}\models\varphi_{1}[\vec{a}]$ y $\mathbb{A}\models\varphi_{2}[\vec{a}]$

4. Si $\varphi=(\varphi_{1}\vee\varphi_{2})$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si $\mathbb{A}\models\varphi_{1}[\vec{a}]$ o $\mathbb{A}\models\varphi_{2}[\vec{a}]$

5. Si $\varphi=(\varphi_{1}\rightarrow\varphi_{2})$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si $\mathbb{A}\not\models\varphi_{1}[\vec{a}]$ o $\mathbb{A}\models\varphi_{2}[\vec{a}]$

6. Si $\varphi=(\varphi_{1}\leftrightarrow\varphi_{2})$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si ya sea se dan $\mathbb{A}\models\varphi_{1}[\vec{a}]$ y $\mathbb{A}\models\varphi_{2}[\vec{a}]$ o se dan $\mathbb{A}\not\models\varphi_{1}[\vec{a}]$ y $\mathbb{A}\not\models\varphi_{2}[\vec{a}]$

7. Si $\varphi=\lnot\varphi_{1}$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si $\mathbb{A}\not\models\varphi_{1}[\vec{a}]$

8. Si $\varphi=\forall x_{i}\varphi_{1}$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si para cada $a\in A$, se da que $\mathbb{A}\models\varphi_{1}[\downarrow_{i}^{a}(\vec{a})]$

9. Si $\varphi=\exists x_{i}\varphi_{1}$, entonces
    - $\mathbb{A}\models\varphi[\vec{a}]$ si y solo si hay un $a\in A$ tal que $\mathbb{A}\models\varphi_{1}[\downarrow_{i}^{a}(\vec{a})]$

### (3) Defina la relación "$v$ ocurre libremente en $\varphi$ a partir de $i$"
Definamos recursivamente la relación $"v\mathit{\ ocurre\ libremente\ en\ }\varphi\mathit{\ a\ partir\ de\ }i"$, donde $v\in Var$, $\varphi\in F^{\tau}$ y $i\in\{1,...,\left\vert \varphi\right\vert \}$, de la siguiente manera:

1. Si $\varphi$ es atómica, entonces $v$ ocurre libremente en $\varphi$ a partir de $i$ $\Longleftrightarrow$ $v$ ocurre en $\varphi$ a partir de $i$

2. Si $\varphi=(\varphi_{1}\eta\varphi_{2})$, entonces $v$ ocurre libremente en $\varphi$ a partir de $i$ $\Longleftrightarrow$ se da alguna de las siguientes

    (a). $v$ ocurre libremente en $\varphi_{1}$ a partir de $i-1$

    (b). $v$ ocurre libremente en $\varphi_{2}$ a partir de $i-\left\vert (\varphi_{1}\eta\right\vert$

3. Si $\varphi=\lnot\varphi_{1}$, entonces $v$ ocurre libremente en $\varphi$ a partir de $i$ $\Longleftrightarrow$ $v$ ocurre libremente en $\varphi_{1}$ a partir de $i-1$

4. Si $\varphi=Qw\varphi_{1}$, entonces $v$ ocurre libremente en $\varphi$ a partir de $i$ $\Longleftrightarrow$ $v\neq w$ y $v$ ocurre libremente en $\varphi_{1}$ a partir de $i-\left\vert Qw\right\vert$

### (4) Defina reticulado cuaterna
Por un reticulado cuaterna entenderemos una 4-upla $(L,\mathsf{s},\mathsf{i},\leq)$ tal que $L$ es un conjunto no vacío, $\mathsf{s}$ e $\mathsf{i}$ son operaciones binarias sobre $L$, $\leq$ es una relación binaria sobre $L$ y se cumplen las siguientes propiedades:

1. $x\leq x$, cualesquiera sea $x\in L$

2. $x\leq y\text{ y }y\leq z\text{ implican }x\leq z$, cualesquiera sean $x,y,z\in L$

3. $x\leq y\text{ y }y\leq x\text{ implican }x=y$, cualesquiera sean $x,y\in L$

4. $x\leq x\;\mathsf{s}\;y\text{ y }y\leq x\;\mathsf{s}\;y$, cualesquiera sean $x,y\in L$

5. $x\leq z\text{ y }y\leq z\text{ implican }x\;\mathsf{s}\;y\leq z$, cualesquiera sean $x,y,z\in L$

6. $x\;\mathsf{i}\;y\leq x\text{ y }x\;\mathsf{i}\;y\leq y$, cualesquiera sean $x,y\in L$

7. $z\leq x\text{ y }z\leq y\text{ implican }z\leq x\;\mathsf{i}\;y$, cualesquiera sean $x,y,z\in L$
