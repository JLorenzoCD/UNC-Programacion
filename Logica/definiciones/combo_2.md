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
Sea $(\boldsymbol{\varphi},\mathbf{J})$ un par adecuado de tipo $\tau$. Si $\left\langle i,j\right\rangle \in\mathcal{B}^{\mathbf{J}}$, entonces $\boldsymbol{\varphi}_{i}$ será la hipótesis del bloque $\left\langle i,j\right\rangle$ en $(\boldsymbol{\varphi},\mathbf{J})$ y $\boldsymbol{\varphi}_{j}$ será la tesis del bloque $\left\langle i,j\right\rangle$ en $(\boldsymbol{\varphi},\mathbf{J})$.

Diremos que $\boldsymbol{\varphi}_{i}$ esta bajo la hipótesis $\boldsymbol{\varphi}_{l}$ en $(\boldsymbol{\varphi},\mathbf{J})$ o que $\boldsymbol{\varphi}_{l}$ es una hipótesis de $\boldsymbol{\varphi}_{i}$ en $(\boldsymbol{\varphi},\mathbf{J})$ cuando haya en $\mathcal{B}^{\mathbf{J}}$ un bloque de la forma $\left\langle l,j\right\rangle$ el cual contenga a $i$.

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
