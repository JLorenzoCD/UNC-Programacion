# Definiciones
---
# Combo 1
### (1) Defina $n(J)$ (para $J \in Just^+$)
Lemma 7.39. Sea $\bm{J} \in Just^+$. Hay únicos $n \ge 1$ y $J_1 , \cdots , J_n \in Just$ tales que $\bm{J} = J_1 \cdots J_n$.

Dada $\bm{J} \in Just^+$ , usaremos $n(\bm{J})$ y $J_1 , \cdots , J_{n(J)}$ para denotar los únicos $n$ y $J_1 , \cdots , J_n$ cuya existencia garantiza el lema anterior.

### (2) Defina "par adecuado de tipo $\tau$" (No hace falta que defina cuando $J \in Just^+$ es balanceada)
Es un par $(\bm{\varphi}, J) \in S^{\tau+} \times Just^+$ tal que $n(\bm{\varphi}) = n (J)$ y $J$ es balanceada.

> $\bm{\varphi} = \varphi_1, \dots, \varphi_n$, con $n \ge 1$. </br>
> $\bm{J} = J_1 \cdots J_n$, con $n \ge 1$.

### (3) Defina $Mod_{T}(\varphi)$
Sea $T = (\Sigma,\tau)$ una teoría. Dada $\varphi \in S^\tau$ definamos
$$
\mathrm{Mod}_{T}(\varphi)=\{\mathbb{A}:\mathbb{A}\text{
es modelo de }T\text{ y }\mathbb{A}\vDash\varphi\}
$$

> Es decir, es la clase de todas las estructuras $\mathbb{A}$ de tipo $\tau$ tales que $\mathbb{A} \models \Sigma$ y $\mathbb{A} \models \varphi$.

### (4) Dados $\varphi =_d \varphi(v_1, \dots, v_n)$, $\mathbb{A}$ una estructura de tipo $\tau$ y $a_1, \dots, a_n \in A$, defina que significa $\mathbb{A} \models \varphi[a_1, \dots, a_n]$ (i.e. Convención notacional 4 de la Guía 11)

Cuando hayamos declarado $\varphi=_{d}\varphi(v_{1},...,v_{n})$, si $\mathbb{A}$ es un modelo de tipo $\tau$ y $a_{1},...,a_{n}\in A$, entonces $\mathbb{A}\models\varphi[a_{1}...,a_{n}]$ significara que $\mathbb{A}\models\varphi[\vec{b}]$, donde $\vec{b}$ es una asignación tal que a cada $v_{i}$ le asigna el valor $a_{i}$. Si $n=0$, $\mathbb{A}\models\varphi[]$ significara que $\mathbb{A}\models\varphi[\vec{b}]$, donde $\vec{b}$ es una asignación cualquiera. En gral $\mathbb{A}\not\models\varphi[a_{1},....,a_{n}]$ significara que no sucede $\mathbb{A}\models\varphi[a_{1},....,a_{n}]$.


### (5) Defina $(L, s, i, ^c, 0, 1)/\theta$ ($\theta$ una congruencia del reticulado complementado $(L, s, i, ^c, 0, 1)$). Justifique por qué la definición de las operaciones de $(L, s, i, ^c, 0, 1)/\theta$ es inambigua. (No hace falta que defina el concepto de congruencia.)

Sea $\mathbb{L} = (L,s,i,^{c},0,1)$ un reticulado complementado y $\theta$ es una congruencia sobre $\mathbb{L}$. Entonces definimos sobre $\mathbb{L} / \theta$ dos operaciones binarias $\tilde{s}$ e $\tilde{i}$, y una operación unaria $^{\tilde{c}}$ de la siguiente manera:
$$
\begin{aligned}
x/\theta\;\tilde{s}\;y/\theta &
=(x\;s\;y)/\theta\\
x/\theta\;\tilde{\imath}\;y/\theta &
=(x\;i\;y)/\theta\\
(x/\theta)^{\tilde{c}} & =x^{c}/\theta
\end{aligned}
$$
La 6-upla $(L/\theta,\tilde{s},\tilde{\imath},^{\tilde{c}},0/\theta,1/\theta)$ es llamada el cociente de $(L,s,i,^{c},0,1)$ sobre $\theta$ y la denotaremos con $(L,s,i,^{c},0,1)/\theta$, o como $\mathbb{L} / \theta$.

Es **inambigüa**, debido a que el resultado de las operaciones no depende de los representantes elegidos en cada clase. Es decir, supongamos que $a/\theta = a'/\theta$ y $b/\theta = b'/\theta$. Por definición de clase de equivalencia, esto significa que $(a, a') \in \theta$ y $(b, b') \in \theta$.
Como $\theta$ es una **congruencia** de $\mathbb{L}$, es compatible con las operaciones fundamentales $s$, $i$ y $^c$:

* $(a \, s \, b, \, a' \, s \, b') \in \theta$, lo que implica $(a \, s \, b)/\theta = (a' \, s \, b')/\theta$.
* $(a \, i \, b, \, a' \, i \, b') \in \theta$, lo que implica $(a \, i \, b)/\theta = (a' \, i \, b')/\theta$.
* $(a^c, \, (a')^c) \in \theta$, lo que implica $(a^c)/\theta = ((a')^c)/\theta$.


---
---
# Combo 2
### (1) Defina $(\Sigma, \tau) \models \varphi$
> Se escribe $(\Sigma, \tau) \models \varphi$, cuando $\varphi$ es verdadero para todo modelo de $(\Sigma, \tau)$.

Dada una teoría elemental $(\Sigma, \tau)$ y una sentencia elemental pura $\varphi$ de tipo $\tau$, decimos que $\varphi$ es consecuencia semántica (o lógica) de $(\Sigma, \tau)$, y escribimos $(\Sigma, \tau) \models \varphi$, si y solo si para toda estructura $\mathbb{A}$ de tipo $\tau$:

$$\text{Si } \mathbb{A} \models \Sigma, \text{ entonces } \mathbb{A} \models \varphi$$

### (2) Defina "Partición de $A$" y $R_{\mathcal{P}}$
Dado un conjunto $A$ por una partición de $A$ entenderemos un conjunto $\mathcal{P}$ tal que:

- Cada elemento de $\mathcal{P}$ es un subconjunto no vacío de $A$.
- Si $S_{1},S_{2}\in\mathcal{P}$ y $S_{1}\neq S_{2}$, entonces $S_{1}\cap S_{2}=\emptyset$.
- $A=\{a:a\in S, \text{ para algún } S\in\mathcal{P}\}$.

Dada una partición $\mathcal{P}$ de un conjunto $A$ podemos definir una relación binaria asociada a $\mathcal{P}$ de la siguiente manera:
$$
R_{\mathcal{P}}=\{(a,b)\in A^{2}:a,b\in S,\text{ para algún }S\in\mathcal{P}\}
$$

### (3) Defina cuando "$\varphi_i$ está bajo la hipótesis $\varphi_l$ en $(\boldsymbol{\varphi},\mathbf{J})$" (No hace falta que defina $\mathcal{B}^J$)
Sea $(\boldsymbol{\varphi},\mathbf{J})$ un par adecuado de tipo $\tau$. Si $\left\langle i,j\right\rangle \in\mathcal{B}^{\mathbf{J}}$. Diremos que $\boldsymbol{\varphi}_{i}$ esta bajo la hipótesis $\boldsymbol{\varphi}_{l}$ en $(\boldsymbol{\varphi},\mathbf{J})$ o que $\boldsymbol{\varphi}_{l}$ es una hipótesis de $\boldsymbol{\varphi}_{i}$ en $(\boldsymbol{\varphi},\mathbf{J})$ cuando haya en $\mathcal{B}^{\mathbf{J}}$ un bloque de la forma $\left\langle l,j\right\rangle$ el cual contenga a $i$.

> En el paso $l$ se abre un bloque en el que $\varphi_l$ es una hipótesis, y el paso $i$ ocurre dentro de la extensión de dicho bloque antes de que se cierre en $j$.

### (4) Defina $(L, s, i)/\theta$ ($\theta$ una congruencia del reticulado terna $(L, s, i)$). Justifique por qué la definición de las operaciones de $(L, s, i)/\theta$ es inambigua. (No hace falta que defina el concepto de congruencia.)
> Nota: Muy similar a Combo 1 - item 5

Sea $\mathbb{L} = (L,s,i)$ un reticulado terna y $\theta$ es una congruencia sobre $\mathbb{L}$. Entonces definimos sobre $\mathbb{L} / \theta$ dos operaciones binarias $\tilde{s}$ e $\tilde{i}$ de la siguiente manera:
$$
\begin{aligned}
x/\theta\;\tilde{s}\;y/\theta &
=(x\;s\;y)/\theta\\
x/\theta\;\tilde{\imath}\;y/\theta &
=(x\;i\;y)/\theta\\
\end{aligned}
$$
La terna $(L/\theta,\tilde{s},\tilde{\imath})$ es llamada el cociente de $(L,s,i)$ sobre $\theta$ y la denotaremos con $(L,s,i)/\theta$, o como $\mathbb{L} / \theta$.

Es **inambigüa**, debido a que el resultado de las operaciones no depende de los representantes elegidos en cada clase. Es decir, supongamos que $a/\theta = a'/\theta$ y $b/\theta = b'/\theta$. Por definición de clase de equivalencia, esto significa que $(a, a') \in \theta$ y $(b, b') \in \theta$.
Como $\theta$ es una **congruencia** de $\mathbb{L}$, es compatible con las operaciones fundamentales $s$ y $i$:

* $(a \, s \, b, \, a' \, s \, b') \in \theta$, lo que implica $(a \, s \, b)/\theta = (a' \, s \, b')/\theta$.
* $(a \, i \, b, \, a' \, i \, b') \in \theta$, lo que implica $(a \, i \, b)/\theta = (a' \, i \, b')/\theta$.


---
---
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


---
---
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


---
---
# Combo 5
### Explique la notación declaratoria para términos con sus 3 convenciones notacionales (convenciones 1, 2 y 5 de la Guía 11)

* **Convención Notacional 1:**
Cuando hayamos hecho la declaración $t=_{d}t(v_{1},...,v_{n})$, si $P_{1},...,P_{n}$ son palabras cualesquiera (no necesariamente términos), entonces $t(P_{1},...,P_{n})$ denotará la palabra que resulta de reemplazar simultáneamente cada ocurrencia de $v_{1}$ en $t$, por $P_{1}$, cada ocurrencia de $v_{2}$ en $t$, por $P_{2}$, etc.

* **Convención Notacional 2:**
    > Nota: Explicado en Combo 3 - item 1

* **Convención Notacional 5:**
Cuando hayamos declarado $t=_{d}t(v_{1},...,v_{n})$ y se dé el caso (3) del Lema *"Lectura única de términos declarados"* supondremos tácitamente que también hemos hecho las declaraciones $t_{1}=_{d}t_{1}(v_{1},...,v_{n}),...,t_{m}=_{d}t_{m}(v_{1},...,v_{n})$. Esto lo podemos hacer ya que obviamente las variables que ocurren en cada uno de los $t_{i}^{\prime}s$ están en $\{v_{1},...,v_{n}\}$.


---
---
# Combo 6
### Explique la notación declaratoria para fórmulas con sus 3 convenciones notacionales (convenciones 3, 4 y 6 de la Guía 11). Puede asumir la notación declaratoria para términos

* **Convención Notacional 3:**
Cuando hayamos hecho la declaración $\varphi=_{d}\varphi(v_{1},...,v_{n})$, si $P_{1},...,P_{n}$ son palabras cualesquiera, entonces $\varphi(P_{1},...,P_{n})$ denotará la palabra que resulta de reemplazar simultáneamente cada ocurrencia libre de $v_{1}$ en $\varphi$, por $P_{1}$, cada ocurrencia libre de $v_{2}$ en $\varphi$, por $P_{2}$, etc.

* **Convención Notacional 4:**
    > Nota: Explicado en Combo 1 - item 4

* **Convención Notacional 6:**
    Cuando hayamos declarado $\varphi=_{d}\varphi(v_{1},...,v_{n})$, entonces:

    - Si se da el caso (1) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho las declaraciones $t=_{d}t(v_{1},...,v_{n})$ y $s=_{d}s(v_{1},...,v_{n})$.

    - Si se da el caso (2) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho las declaraciones $t_{1}=_{d}t_{1}(v_{1},...,v_{n}),...,t_{m}=_{d}t_{m}(v_{1},...,v_{n})$.

    - Si se el caso (3) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho las declaraciones $\varphi_{1}=_{d}\varphi_{1}(v_{1},...,v_{n})$ y $\varphi_{2}=_{d}\varphi_{2}(v_{1},...,v_{n})$.

    - Si se da el caso (4) o el (5) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho la declaración $\varphi_{1}=_{d}\varphi_{1}(v_{1},...,v_{n})$.

    - Si se da el caso (6) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho la declaración $\varphi_{1}=_{d}\varphi_{1}(v_{1},...,v_{n},v)$.


---
---
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

### (2) Defina cuando $J \in Just^+$ es balanceada (no hace falta que defina $\mathcal{B}^J$)
> Nota: Explicado en Combo 3 - item 4

### (3) Defina "filtro del reticulado terna $(L, s, i)$"
Un filtro de un reticulado terna $(L,\mathsf{s},\mathsf{i})$ será un subconjunto $F\subseteq L$ tal que:

1. $F\neq\emptyset$

2. para cada $x,y\in F\text{ se tiene que }x\;\mathsf{i\;}y\in F$

3. para cada $x,y\in L$, si $x\in F$ y $x\leq y\text{ entonces }y\in F$

### (4) Defina "teoría elemental"
Una teoría (de primer orden) será un par ordenado $T = (\Sigma,\tau)$, donde $\tau$ es un tipo y $\Sigma$ es un conjunto de sentencias elementales puras de tipo $\tau$, llamados axiomas propios de $T$.


---
---
# Combo 8
### (1) Defina $(L, s, i, ^c, 0, 1)/\theta$ ($\theta$ una congruencia del reticulado complementado $(L, s, i, ^c, 0, 1)$). Justifique por qué la definición de las operaciones de $(L, s, i, ^c, 0, 1)/\theta$ es inambigua. (No hace falta que defina el concepto de congruencia.)
> Nota: Explicado en Combo 1 - item 5

### (2) Dados $\varphi =_d \varphi(v_1, \dots, v_n)$, $\mathbb{A}$ una estructura de tipo $\tau$ y $a_1, \dots, a_n \in A$, defina qué significa $\mathbb{A} \models \varphi[a_1, \dots, a_n]$ (i.e. Convención notacional 4 de la Guía 11)
> Nota: Explicado en Combo 1 - item 4

### (3) Dado un poset $(P, \le)$, defina "a es supremo de $S$ en $(P, \le)$"
Sea $(P, \le)$ un poset, un subconjunto $S \subseteq P$ y $a\in P$. Decimos que **$a$ es supremo de $S$** en $(P, \le)$ si:
1. $a$ es cota superior de $S$ en $(P, \le)$.
2. Para cada $b \in P$, si $b$ es cota superior de $S$ en $(P, \le)$, entonces $a \le b$.

### (4) Defina "$i$ es anterior a $j$ en $(\bm{\varphi}, \mathbf{J})$" (no hace falta que defina $\mathcal{B}^J$)
Sea $(\bm{\varphi}, \mathbf{J})$ un par adecuado de longitud $n$, y sean $1 \le i, j \le n$. Diremos que el paso $i$ es anterior a $j$ en $(\boldsymbol{\varphi},\mathbf{J})$ si:
1. $i\lt j$.
2. Para todo $B\in\mathcal{B}^{\mathbf{J}}$ se tiene que $i\in B\Rightarrow j\in B$.


---
---
# Combo 9
### (1) Defina "término elemental de tipo $\tau$"
Dado un tipo $\tau=(\mathcal{C},\mathcal{F},\mathcal{R},a)$ los términos elementales de tipo $\tau$ se definen con las siguientes clausulas:
1. Cada palabra de $\mathcal{C}$ es un término elemental de tipo $\tau$
2. Las variables $x,y,z,w,...$ son términos elementales de tipo $\tau$
3. Los nombres de elementos fijos $a,b,c,d,...$ son términos elementales de tipo $\tau$
4. Si $f\in\mathcal{F}_{n}$, con $n\geq1$ y $t_{1},...,t_{n}$ son términos elementales de tipo $\tau$, entonces la palabra $f(t_{1},...,t_{n})$ es un término elemental de tipo $\tau$
5. Una palabra es un término elemental de tipo $\tau$ si y solo si se puede construir usando las clausulas anteriores
> Duda: Esta es la definición matemáticamente imprecisa

Sea $\tau=(\mathcal{C},\mathcal{F},\mathcal{R},a)$ un tipo. Los terminos de tipo $\tau^{\prime}$, con $\tau^{\prime}$ alguna extension de $\tau$ por nombres de constante, modelizan matematicamente a los terminos elementales de tipo $\tau$.
> Duda: Esta es la definición matemáticamente precisa

### (2) Defina $\dashv\vdash_T$
Sea $T=(\Sigma,\tau)$ una teoría. Podemos definir la siguiente relación binaria sobre $S^{\tau}$ (conjunto de las sentencias de tipo $\tau$):
$$
\varphi\dashv\vdash_{T}\psi \Longleftrightarrow T\vdash\left(\varphi\leftrightarrow\psi\right)
$$
Es decir
$$
\dashv\vdash_{T}=\{(\varphi,\psi)\in
S^{\tau}\times
S^{\tau}:T\vdash\left(\varphi\leftrightarrow\psi\right)\}
$$

> Nota: $\dashv\vdash_{T}$ es una relación de equivalencia.

### (3) Defina $s^T$ (explique por qué la definición es inambigua)
> TODO


### (4) Defina $\mathcal{A}_T$
> TODO

### (5) Defina "$S$ es un subuniverso del reticulado complementado $(L, s, i, ^c, 0, 1)$"
Un conjunto $S\subseteq L$ es llamado subuniverso de $(L,\mathsf{s},\mathsf{i},^{c},0,1)$ si $0,1\in S$ y además $S$ es cerrado bajo las operaciones $\mathsf{s}$, $\mathsf{i}$ y $^{c}$


---
---
# Combo 10
### (1) Defina "tesis del bloque $\left\langle i,j\right\rangle$ en $(\bm{\varphi}, \mathbf{J})$"
Sea $(\boldsymbol{\varphi},\mathbf{J})$ un par adecuado de tipo $\tau$. Si $\left\langle i,j\right\rangle \in\mathcal{B}^{\mathbf{J}}$, entonces $\boldsymbol{\varphi}_{i}$ será la hipótesis del bloque $\left\langle i,j\right\rangle$ en $(\boldsymbol{\varphi},\mathbf{J})$ y $\boldsymbol{\varphi}_{j}$ será **la tesis del bloque $\left\langle i,j\right\rangle$ en $(\boldsymbol{\varphi},\mathbf{J})$**.

### (2) Defina cuando una teoría de primer orden $(\Sigma, \tau)$ es consistente
Una teoría $(\Sigma,\tau)$ será inconsistente cuando haya una sentencia $\varphi$ tal que $(\Sigma,\tau)\vdash(\varphi\wedge\lnot\varphi)$. Una teoría $(\Sigma,\tau)$ será **consistente** cuando no sea inconsistente.

### (3) Dada una teoría elemental $(\Sigma, \tau)$ y una sentencia elemental pura $\varphi$ de tipo $\tau$, defina "prueba elemental de $\varphi$ en $(\Sigma, \tau)$"
> "Como objeto matemático una prueba resultara ser un par ordenado de palabras cuya primera coordenada codificara en forma natural la sucesión de sentencias y su segunda coordenada codificará la sucesión de justificaciones."

Sea $\tau$ un tipo. Dada una teoría elemental $(\Sigma, \tau)$ y una sentencia elemental pura $\varphi$ de tipo $\tau$, una **prueba elemental** de $\varphi$ en $(\Sigma, \tau)$ es un par adecuado $(\bm{\psi}, \mathbf{J})$ de tipo $\tau$, con $\bm{\psi} = (\psi_1, \dots, \psi_n)$ y $\mathbf{J} = (J_1, \dots, J_n)$, tal que:

1. $\psi_n = \varphi$
2. Cada paso $k \in \{1, \dots, n\}$ está correctamente justificado por $J_k$ según las reglas de deducción natural (es una hipótesis, un axioma de $\Sigma$, un axioma lógico/de igualdad, o se obtiene aplicando una regla de inferencia a pasos anteriores disponibles en $(\bm{\psi}, \mathbf{J})$).
3. El paso final $n$ no se encuentra bajo ninguna hipótesis activa (es decir, no existe ningún bloque $\left\langle i,j\right\rangle \in \mathcal{B}^J$ tal que $i \le n \le j$).


---
---
# Combo 11
### Enuncie el programa de lógica matemática dado al final de la Guía 8 y explique brevemente con qué definiciones matemáticas se van resolviendo los tres primeros puntos y qué teoremas garantizan la resolución del 4to punto de dicho programa.

#### Programa de Lógica Matemática
1. **Modelizar** las **formula elemental de tipo $\tau$**.
2. **Definir cuando** una **formula elemental** de tipo $\tau$ **es verdadera en una estructura** de tipo $\tau$ **para una asignación** dada de valores a las variables libres y a los nombres de elementos fijos de dicha formula elemental.
3. **Modelizar** las **prueba elemental** en una teoría elemental mediante **pruebas formales**.
4. **Probar** que **nuestro concepto de prueba formal modelizan adecuadamente** de la idea intuitiva de prueba elemental en una teoría elemental.

#### Definiciones y Teoremas utilizados para concretar cada punto
1. Definicion de tipo ($\tau$), variables, estructura de tipo $\tau$ ($\mathbb{A}$), términos ($T^\tau$), fórmulas ($F^\tau$) y la extensión de $\tau$ por nombres de constante.
2. Definición de asignación, valor de un termino, relación $\models$, sentencias universalmente válidas y equivalencia de fórmulas.
3. Definición de teoría elemental, reglas universales, axiomas lógicos, justificaciones, concatenaciones balanceadas, pares adecuados, prueba formal, nombres de constante auxiliare y teorema.
4. Consecuencia del Teorema de Corrección y el Teorema de Completitud de Godel.


---
---
# Combo 12
### Defina el concepto de función y desarrolle las tres Convenciones Notacionales asociadas a dicho concepto (Guía 0)

Una función es un conjunto $f$ de pares ordenados con la siguiente propiedad
$$ (x,y)\in f \wedge (x,z)\in f \implies y=z $$

- Convención Notacional 1: Dado $x\in D_{f}$, usaremos $f(x)$ para denotar al único $y\in I_{f}$ tal que $(x,y)\in f$.

- Convención Notacional 2: Escribiremos $f:S\subseteq A\rightarrow B$ para expresar que $f$ es una función tal que $D_{f}=S\subseteq A$ y $I_{f}\subseteq B$. También escribiremos $f:A\rightarrow B$ para expresar que $f$ es una función tal que $D_{f}=A$ y $I_{f}\subseteq B$. En tal contexto llamaremos a $B$ conjunto de llegada. Por supuesto $B$ no esta determinado por $f$ ya que solo debe cumplir $I_{f}\subseteq B$. Es decir que cualquier conjunto $B$ que contenga a $I_{f}$ es un conjunto de llegada de $f$.

- Convención Notacional 3: Muchas veces para definir una función $f$, lo haremos dando su dominio y su regla de asignación, es decir, especificaremos en forma precisa que conjunto es el dominio de $f$ y además especificaremos en forma precisa quien es $f(x)$ para cada $x$ de dicho dominio. Obviamente esto determina por completo a la función $f$ ya que siempre se da $f=\{(x,f(x)):x\in D_{f}\}$.


---
---
# Combo 13
### (1) Defina "tipo"
Por un tipo entenderemos una 4-upla $\tau=(\mathcal{C},\mathcal{F},\mathcal{R},a)$ tal que:

1. Hay alfabetos finitos $\Sigma_{1}, \Sigma_{2}$ y $\Sigma_{3}$ tales:

    (a) $\mathcal{C}\subseteq\Sigma_{1}^{+}, \mathcal{F}\subseteq\Sigma_{2}^{+}$ y $\mathcal{R}\subseteq\Sigma_{3}^{+}$

    (b) $\Sigma_{1}, \Sigma_{2}$ y $\Sigma_{3}$ son disjuntos de a pares.

    (c) $\Sigma_{1}\cup\Sigma_{2}\cup\Sigma_{3}$ no contiene ningún símbolo de la lista

    $$
    \forall\ \exists\;\lnot\;\vee\;\wedge\;\rightarrow\;\leftrightarrow\;(\;)\;,\;\equiv\;\mathsf{X\;}\mathit{0}\;\mathit{1\;}...\;\mathit{9}\;\mathbf{0}\;\mathbf{1}\ ...\;\mathbf{9}
    $$

2. $a:\mathcal{F}\cup\mathcal{R}\rightarrow\mathbb{N}$ es una función que a cada $p\in\mathcal{F}\cup\mathcal{R}$ le asocia un número natural $a(p)$, llamado la aridad de $p$.

3. Ninguna palabra de $\mathcal{C}$ (resp. $\mathcal{F}, \mathcal{R}$) es subpalabra propia de otra palabra de $\mathcal{C}$ (resp. $\mathcal{F}, \mathcal{R}$).

### (2) Defina "Estructura de tipo $\tau$"
Una estructura o modelo de tipo $\tau$ será un par $\mathbf{A}=(A,i)$ tal que:

1. $A$ es un conjunto no vacío

2. $i$ es una función con dominio $\mathcal{C}\cup\mathcal{F}\cup\mathcal{R}$, tal que:

    (a) $i(c)$ es un elemento de $A$, para cada $c\in\mathcal{C}$

    (b) $i(f)$ es una operación n-aria sobre $A$, para cada $f\in\mathcal{F}_{n}, n\geq1$

    (c) $i(r)$ es una relación n-aria sobre $A$, para cada $r\in\mathcal{R}_{n}, n\geq1$


---
---
# Combo 14
### (1) Defina "teoría elemental"
> Nota: Explicado en Combo 7 - item 4

### (2) Defina "prueba elemental de $\varphi$ en $(\Sigma, \tau)$, donde $(\Sigma, \tau)$ es una teoría elemental y $\varphi$ es una sentencia elemental pura de tipo $\tau$
> Nota: Explicado en Combo 10 - item 3


---
