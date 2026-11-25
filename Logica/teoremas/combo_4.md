# Combo 4
### Lema (Propiedades básicas de la deducción)
Sea $(\Sigma, \tau)$ una teoría.
1. (Uso de Teoremas). Si $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$ y $(\Sigma \cup \{\varphi_1, \dots, \varphi_n\}, \tau) \vdash \varphi$, entonces $(\Sigma, \tau) \vdash \varphi$.
2. Supongamos $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$. Si $R$ es una regla distinta de GENERALIZACION o ELECCION y $\varphi$ se deduce de $\varphi_1, \dots, \varphi_n$ por la regla $R$, entonces $(\Sigma, \tau) \vdash \varphi$.
3. $(\Sigma, \tau) \vdash (\varphi \rightarrow \psi) \; \Longleftrightarrow \;(\Sigma \cup \{\varphi\}, \tau) \vdash \psi$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema (Cambio de índice de hipótesis)*: Sea $(\boldsymbol{\varphi}, \mathbf{J})$ una prueba formal de $\varphi$ en $(\Sigma, \tau)$. Sea $m \in \mathbb{N}$ tal que $J_i \neq \text{HIPOTESIS}\bar{m}$ para cada $i = 1, \dots, n(\boldsymbol{\varphi})$. Supongamos que $\mathbf{J}_i = \text{HIPOTESIS}\bar{k}$ y que $\mathbf{J}_j = \text{TESIS}\bar{k}\,\alpha$, con $[\alpha]_1 \notin \text{Num}$. Sea $\tilde{\mathbf{J}}$ el resultado de reemplazar en $\mathbf{J}$ la justificación $\mathbf{J}_i$ por $\text{HIPOTESIS}\bar{m}$ y la justificación $\mathbf{J}_j$ por $\text{TESIS}\bar{m}\,\alpha$. Entonces $(\boldsymbol{\varphi}, \tilde{\mathbf{J}})$ es una prueba formal de $\varphi$ en $(\Sigma, \tau)$.
> - *Lema (Cambio de nombres de constante auxiliares)*: Sea $(\boldsymbol{\varphi}, \mathbf{J})$ una prueba formal de $\varphi$ en $(\Sigma, \tau)$. Sea $C_1$ el conjunto de nombres de constantes auxiliares de $(\boldsymbol{\varphi}, \mathbf{J})$. Sea $e \in C_1$. Sea $\tilde{e} \notin C \cup C_1$ tal que $(C \cup (C_1 - \{e\}) \cup \{\tilde{e}\}, F, R, a)$ es un tipo. Sea $\tilde{\varphi}_i$ el resultado de reemplazar en $\varphi_i$ cada ocurrencia de $e$ por $\tilde{e}$. Entonces $(\tilde{\varphi}_1 \cdots \tilde{\varphi}_n(\boldsymbol{\varphi}), \mathbf{J})$ es una prueba formal de $\varphi$ en $(\Sigma, \tau)$.


**(1)** Notar que basta con hacer el caso $n = 1$. Para $n \ge 2$ sale aplicando $n$ veces el caso $n = 1$. Supongamos que $(\Sigma, \tau) \vdash \varphi_1$ y $(\Sigma \cup \{\varphi_1\}, \tau) \vdash \varphi$. Sea $(\alpha_1, \dots, \alpha_h, I_1, \dots, I_h)$ una prueba formal de $\varphi_1$ en $(\Sigma, \tau)$. Sea $(\psi_1, \dots, \psi_m, J_1, \dots, J_m)$ una prueba formal de $\varphi$ en $(\Sigma \cup \{\varphi_1\}, \tau)$. Notar que por el *Lema (Cambio de índice de hipótesis)* y el *Lema (Cambio de nombres de constante auxiliares)* podemos suponer que estas dos pruebas no comparten ningún nombre de constante auxiliar y que tampoco comparten números asociados a hipótesis o tesis. Para cada $i = 1, \dots, m$, definamos $\tilde{J}_i$ de la siguiente manera (sea $\alpha \in \{\varepsilon\} \cup \{\text{TESIS}\bar{k} : k \in \mathbb{N}\}$):
- Si $\psi_i = \varphi_1$ y $J_i = \alpha\,\text{AXIOMAPROPIO}$, entonces $\tilde{J}_i = \alpha\,\text{EVOCACION}(\bar{h})$.
- Si $\psi_i \neq \varphi_1$ y $J_i = \alpha\,\text{AXIOMAPROPIO}$, entonces $\tilde{J}_i = J_i$.
- Si $J_i \in \{\alpha\,\text{AXIOMALOGICO}, \alpha\,\text{CONCLUSION}, \alpha\,\text{HIPOTESIS}\bar{k}\}$, entonces $\tilde{J}_i = J_i$.
- Si $J_i = \alpha\,R(\bar{l}_1, \dots, \bar{l}_k)$ y $R$ alguna regla, entonces $\tilde{J}_i = \alpha\,R(\overline{l_1 + h}, \dots, \overline{l_k + h})$.

Es fácil chequear que $(\alpha_1 \cdots \alpha_h \varphi_1 \cdots \varphi_m, I_1 \cdots I_h \tilde{J}_1 \cdots \tilde{J}_m)$ es una prueba formal de $\varphi$ en $(\Sigma, \tau)$.

**(2)** Notar que
$$
\begin{array}{llll}
1. & \varphi_1 & & \text{AXIOMAPROPIO} \\
2. & \varphi_2 & & \text{AXIOMAPROPIO} \\
\vdots & \vdots & & \vdots \\
n. & \varphi_n & & \text{AXIOMAPROPIO} \\
n+1. & \varphi & & R(\bar{1}, \dots, \bar{n})
\end{array}
$$
es una prueba formal de $\varphi$ en $(\Sigma \cup \{\varphi_1, \dots, \varphi_n\}, \tau)$, entonces por (1) tenemos que $(\Sigma, \tau) \vdash \varphi$.

**(3)**
- **$\Rightarrow)$**: Si $(\Sigma, \tau) \vdash (\varphi \rightarrow \psi) \implies (\Sigma \cup \{\varphi\}, \tau) \vdash (\varphi \rightarrow \psi)$, y por (2) (usando $R = \text{MODUSPONENS}$) esto implica que $(\Sigma \cup \{\varphi\}, \tau) \vdash \psi$.
- **$\Leftarrow)$**: Si $(\Sigma \cup \{\varphi\}, \tau) \vdash \psi$, sea $(\varphi_1, \dots, \varphi_n, J_1, \dots, J_n)$ una prueba formal de $\psi$ en $(\Sigma \cup \{\varphi\}, \tau)$. Entonces para cada $i = 1, \dots, n$, definamos $\tilde{J}_i$ de la siguiente manera (sea $\alpha \in \{\varepsilon\} \cup \{\text{TESIS}\bar{k} : k \in \mathbb{N}\}$):
  - Si $\varphi_i = \varphi$ y $J_i = \alpha\,\text{AXIOMAPROPIO}$, entonces $\tilde{J}_i = \alpha\,\text{EVOCACION}(\bar{1})$.
  - Si $\varphi_i \neq \varphi$ y $J_i = \alpha\,\text{AXIOMAPROPIO}$, entonces $\tilde{J}_i = J_i$.
  - Si $J_i \in \{\alpha\,\text{AXIOMALOGICO}, \alpha\,\text{CONCLUSION}, \alpha\,\text{HIPOTESIS}\bar{k}\}$, entonces $\tilde{J}_i = J_i$.
  - Si $J_i = \alpha\,R(\bar{l}_1, \dots, \bar{l}_k)$ y $R$ alguna regla, entonces $\tilde{J}_i = \alpha\,R(\overline{l_1 + 1}, \dots, \overline{l_k + 1})$.

  Notar que $\tilde{J}_n$ **no** es de la forma $\text{TESIS}\bar{k}\,\beta$ ya que si lo fuera también debería serlo $J_n$, entonces debería existir $J_{n+1} = \text{CONCLUSION}$, pero $J_n$ es la última. Análogamente $\tilde{J}_n$ tampoco es de la forma $\text{HIPOTESIS}\bar{k}$. Sea $m$ tal que ninguna $J_i$ es igual a $\text{HIPOTESIS}\bar{m}$. Es fácil chequear que
  $$
  (\varphi\,\varphi_1, \dots, \varphi_n\,(\varphi \rightarrow \psi), \text{HIPOTESIS}\bar{m}\,\tilde{J}_1 \cdots \tilde{J}_{n-1}\,\text{TESIS}\bar{m}\,\tilde{J}_n\,\text{CONCLUSION})
  $$
  es una prueba formal de $(\varphi \rightarrow \psi)$ en $(\Sigma, \tau)$.

### Teorema
Sea $(B, s, i, ^c, 0, 1)$ un álgebra de Boole y sean $a, b \in B$. Se tiene que:
1. $(a \ i \ b)^c = a^c \ s \ b^c$
2. $a \ i \ b = 0 \; \Longleftrightarrow \; b \le a^c$

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema (Unicidad del Complemento)*: Sea $(L, s, i, 0, 1)$ un reticulado acotado. Si $(L, s, i, 0, 1)$ es distributivo, entonces todo elemento tiene a lo sumo un complemento.
> - *Lema (útil)*: Sea $(B, s, i, ^c, 0, 1)$ un álgebra de Boole. Entonces para cualesquiera $x, y \in B$ se tiene que $y = (y \ i \ x) \ s \ (y \ i \ x^c)$.
> - *Lema (Monotonía)*: Sea $(L, \le)$ un reticulado par y sean $x, y, z, w \in L$ tales que $x \le z$ e $y \le w$. Entonces $x \ i \ y \le z \ i \ w$.

**(1)** Para probar, veamos que $a^c \ s \ b^c$ es el complemento de $a \ i \ b$. Es decir debemos ver que
$$
(a \ i \ b) \ s \ (a^c \ s \ b^c) = 1 \quad \text{y} \quad (a \ i \ b) \ i \ (a^c \ s \ b^c) = 0
$$

$$
\begin{aligned}
(a \ i \ b) \ s \ (a^c \ s \ b^c) &= (a^c \ s \ b^c) \ s \ (a \ i \ b) && (\text{I2}) \\
&= ((a^c \ s \ b^c) \ s \ a) \ i \ ((a^c \ s \ b^c) \ s \ b) && (\text{Dis}_2) \\
&= ((a \ s \ a^c) \ s \ b^c) \ i \ ((b \ s \ b^c) \ s \ a^c) && (\text{I4 e I2}) \\
&= (1 \ s \ b^c) \ i \ (1 \ s \ a^c) && (\text{I9}) \\
&= 1 \ i \ 1 && (\text{I1}) \\
&= 1 &&
\end{aligned}
\qquad
\begin{aligned}
(a \ i \ b) \ i \ (a^c \ s \ b^c) &= ((a \ i \ b) \ i \ a^c) \ s \ ((a \ i \ b) \ i \ b^c) && (\text{Dis}_1) \\
&= ((a \ i \ a^c) \ i \ b) \ s \ ((b \ i \ b^c) \ i \ a) && (\text{I5 e I3}) \\
&= (0 \ i \ b) \ s \ (0 \ i \ a) && (\text{I8}) \\
&= 0 \ s \ 0 && (\text{I1}) \\
&= 0 &&
\end{aligned}
$$
Entonces $a^c \ s \ b^c$ es un complemento de $(a \ i \ b)$, pero el *Lema (Unicidad del Complemento)* aplicado a $(B, s, i, 0, 1)$ nos dice que es único, por lo tanto $(a \ i \ b)^c = a^c \ s \ b^c$.

**(2)**
- **$\Rightarrow)$**: Supongamos que $a \ i \ b = 0$. Entonces
  $$
  \begin{aligned}
  b &= (b \ i \ a) \ s \ (b \ i \ a^c) && (\text{Lema útil}) \\
  &= (a \ i \ b) \ s \ (b \ i \ a^c) && \\
  &= 0 \ s \ (b \ i \ a^c) && \\
  &= b \ i \ a^c &&
  \end{aligned}
  $$
  Dado que $b \ i \ a^c$ es cota inferior de $a^c$ tenemos que $b \ i \ a^c \le a^c$; reemplazando por lo anterior sale que $b \le a^c$.

- **$\Leftarrow)$**: Supongamos que $b \le a^c$. Por reflexividad $a \le a$ y el *Lema (Monotonía)* aplicado al reticulado par $(B, \le)$ nos dice que $a \ i \ b \le a \ i \ a^c = 0$, pero $0$ es mínimo, entonces $0 \le a \ i \ b$. Entonces por antisimetría $a \ i \ b = 0$.

### Lema
Sean $(L, s, i)$ y $(L', s', i')$ reticulados terna y sean $(L, \le)$ y $(L', \le')$ los posets asociados. Sea $F: \mathbb{L} \rightarrow \mathbb{L'}$ una función. Entonces $F$ es un isomorfismo de $(L, s, i)$ en $(L', s', i')$ si y solo si $F$ es un isomorfismo de $(L, \le)$ en $(L', \le')$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Teorema de Dedekind* (Combo 2.1): Sea $(L, s, i)$ un reticulado terna. La relación binaria definida por $x \le y \; \Longleftrightarrow \; x \ s \ y = y$ es un orden parcial sobre $L$ para el cual se cumple que cualesquiera sean $x, y \in L$: $\sup(\{x, y\}) = x \ s \ y$ y $\inf(\{x, y\}) = x \ i \ y$.
> - *Lema (sup e inf en Isomorfismo de Posets)*: Sean $(P, \le)$ y $(P', \le')$ posets y sea $F: P \rightarrow P'$ un isomorfismo de posets. Para cada $x, y, z \in P$, tenemos que:
>   $$z = \sup(\{x, y\}) \quad \Longleftrightarrow \quad F(z) = F(\sup(\{x, y\})) = \sup(\{F(x), F(y)\})$$
>   $$z = \inf(\{x, y\}) \quad \Longleftrightarrow \quad F(z) = F(\inf(\{x, y\})) = \inf(\{F(x), F(y)\})$$

**$\Rightarrow)$** Supongamos que $F$ es un isomorfismo de $(L, s, i)$ en $(L', s', i')$. Para que $F$ sea un isomorfismo de $(L, \le)$ en $(L', \le')$, debemos ver:
1. **$F$ es biyectiva**: Lo cual sale directo ya que $F$ es isomorfismo de reticulados.

2. **$F$ es un homomorfismo de $(L, \le)$ en $(L', \le')$**: </br>
  Sean $x, y \in L$ tales que $x \le y$. Entonces $x \ s \ y = y$, por lo cual $F(y) = F(x \ s \ y) = F(x) \ s' \ F(y)$, es decir, $F(x) \le' F(y)$.

3. **$F^{-1}$ es un homomorfismo de $(L', \le')$ en $(L, \le)$**: </br>
  Análogo al anterior.

Entonces $F$ es un isomorfismo de $(L, \le)$ en $(L', \le')$.

**$\Leftarrow)$** Supongamos que $F$ es un isomorfismo de $(L, \le)$ en $(L', \le')$. Para que $F$ sea un isomorfismo de $(L, s, i)$ en $(L', s', i')$, debemos ver:
1. **$F$ es biyectiva**: Lo cual sale directo ya que $F$ es isomorfismo de posets.

2. **$F$ es un homomorfismo de $(L, s, i)$ en $(L', s', i')$**: </br>
  Sean $x, y \in L$.

  $$
  \begin{aligned}
  F(x \ s \ y) &= F(\sup(\{x, y\})) && (\text{Teorema de Dedekind}) \\
  &= \sup(\{F(x), F(y)\}) && (\text{Lema sup e inf en iso de posets}) \\
  &= F(x) \ s' \ F(y) && (\text{Teorema de Dedekind})
  \end{aligned}
  $$
  entonces $F(x \ s \ y) = F(x) \ s' \ F(y)$ y de forma similar se prueba que $F(x \ i \ y) = F(x) \ i' \ F(y)$.

3. **$F^{-1}$ es un homomorfismo de $(L', s', i')$ en $(L, s, i)$**: </br>
  Análogo al anterior.

Entonces $F$ es un isomorfismo de $(L, s, i)$ en $(L', s', i')$.
