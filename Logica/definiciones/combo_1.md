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
