# Teoremas
---
# Combo 1
### Teorema (Teorema del Filtro Primo)
Sea $(L, s, i)$ un reticulado terna distributivo y $F$ un filtro. Supongamos $x_0 \in (L - F)$. Entonces hay un filtro primo $P$ tal que $x_0 \notin P$ y $F \subseteq P$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema de "Zorn"*.
> - *Lema "$[S)$ es filtro"*.

Sea
$$
\mathcal{F} = \{F_1 : F_1 \text{ es un filtro, } x_0 \notin F_1 \text{ y } F \subseteq F_1\}
$$
Notar que $\mathcal{F} \neq \emptyset$ ya que $F \in \mathcal{F}$. Y como $\subseteq$ es un orden parcial, entonces $(\mathcal{F}, \subseteq)$ es un poset.

Veamos que cada cadena en $(\mathcal{F}, \subseteq)$ tiene al menos una cota superior (para aplicar el Lema de Zorn). Sea $C$ una cadena.
- Si $C = \emptyset$, entonces cualquier elemento de $\mathcal{F}$ es cota superior de $C$ (ya que $\emptyset \subseteq F_1, \forall F_1 \in \mathcal{F}$).
- Si $C \neq \emptyset$, sea
$$
G = \{x : x \in F_1, \text{ para algún } F_1 \in C\}
$$
Con $F_1 \in \mathcal{F}$.
> Nota (*): Si $x \in G \implies x \in F_1$, para algún $F_1 \in \mathcal{F}$. Pero ademas, $\forall y \in F_1$ se tiene que $y \in G$, entonces $F_1 \subseteq G$.

Veamos que $G$ es un filtro. Para ello hay que probar las $3$ propiedades de un filtro:
1. **$G \neq \emptyset$**, lo cual es claro ya que $C \neq \emptyset$.
2. **$x, y \in G \implies x \; i \; y \in G$**:

   Supongamos $x, y \in G$. Por definición de $G$ tenemos que hay $F_1, F_2 \in \mathcal{F}$ tales que $x \in F_1$ y $y \in F_2$. Pero como $F_1, F_2 \in C$ y $C$ es una cadena de $(\mathcal{F}, \subseteq)$, entonces $F_1 \subseteq F_2$ o $F_2 \subseteq F_1$.
   - Si $F_1 \subseteq F_2 \implies x, y \in F_2$, como $F_2$ es un filtro tenemos que $x \ i \ y \in F_2$.
   - Si $F_2 \subseteq F_1 \implies x, y \in F_1$, como $F_1$ es un filtro tenemos que $x \ i \ y \in F_1$.

   Por lo tanto en cualquier caso, por (*) tenemos que $x \; i \; y \in G$
3. **$x \in G$ y $x \le y \implies y \in G$**:

   Supongamos $x \in G$ y supongamos $x \le y$ para algún $y \in L$. Por definición de $G$ tenemos que hay $F_1 \in \mathcal{F}$ tal que $x \in F_1$. Como $F_1$ es filtro $\land \; x \in F_1 \land \;x \le y \implies y \in F_1$. Por lo tanto, por (*) tenemos que $y \in G$.

Entonces $G$ es un filtro, $x_0 \notin G$ y $F \subseteq G$ ya que todo filtro $F_1 \in \mathcal{F}$ usado para construir $G$ cumplía que $x_0 \notin F_1$ y $F \subseteq F_1$. Por lo que $G \in \mathcal{F}$.

Si tomamos cualquier $F_1 \in C$, por (*) se tiene $F_1 \subseteq G$, entonces, $G$ es una cota superior de $C$ en $(\mathcal{F}, \subseteq)$.

Así hemos probado que cada cadena en $(\mathcal{F}, \subseteq)$ tiene al menos una cota superior. Por el *Lema de Zorn*, $(\mathcal{F}, \subseteq)$ tiene un elemento maximal $P$. Veamos que $P$ es un filtro primo. Claramente $P$ es un filtro ya que $P \in \mathcal{F}$. Para terminar de ver que sea *primo* debemos ver que cumpla las siguientes propiedades:
1. **$P \neq L$**, es directo ya que $P \in \mathcal{F}$, entonces $x_0 \notin P$, por lo tanto $P \neq L$.
2. $x \ s \ y \in P \implies x \in P \lor y \in P$.

Prueba de (2): Supongamos que $x \ s \ y \in P$. Vamos a probar que $x \in P$ o $y \in P$ por el absurdo. Supongamos $x, y \notin P$. Como $\emptyset \neq P \cup \{x\} \subseteq L$, por el *Lema para $[S)$* tengo que $[P \cup \{x\})$ es un filtro. Además $P \subset P \cup \{x\} \subseteq [P \cup \{x\})$, pero como $P$ es un elemento maximal de $(\mathcal{F}, \subseteq)$, tenemos que $[P \cup \{x\}) \notin \mathcal{F}$, por lo que $x_0 \in [P \cup \{x\})$ (ya que es filtro y $F \subseteq P \subseteq [P \cup \{x\})$). Análogamente $x_0 \in [P \cup \{y\})$.

Como $x_0 \in [P \cup \{x\})$ tenemos que hay $p_1, \dots, p_k \in P \cup \{x\}$ tales que
$$
x_0 \ge p_1 \ i \ \dots \ i \ p_k
$$

Si $p_i \neq x$ para $i = 1, \dots, k$, tenemos que $p_i \in P$, entonces por propiedad de filtro (2), $p_1 \ i \ \dots \ i \ p_k \in P$. Como $p_1 \ i \ \dots \ i \ p_k \le x_0$, de nuevo por propiedad de filtro (3), $x_0 \in P$, **absurdo**. Entonces $(x \in P \land y \in P) \lor x \in P \lor y \in P$.

Si existe $p_j = x$ con $j \in \{1, \dots, k\}$, entonces $p_1 \ i \ \dots \ i \ p_k = p_1 \ i \ \dots \ i \ p_{j-1} \ i \ p_{j+1} \ i \ \dots \ i \ p_k \ i \ x$. Esto lo podemos repetir para cada $p_i$ que sea igual a $x$ y como $x \ i \ x = x$ tenemos que claramente hay $p'_1, \dots, p'_n \in P$ tales que $p_1 \ i \ \dots \ i \ p_k = p'_1 \ i \ \dots \ i \ p'_n \ i \ x$. Concluimos entonces que hay $p_1, \dots, p_n \in P$ tales que
$$
p_1 \ i \ \dots \ i \ p_n \ i \ x \le x_0
$$
Análogamente, como $x_0 \in [P \cup \{y\})$, tenemos que hay $q_1, \dots, q_m \in P$ tales que
$$
q_1 \ i \ \dots \ i \ q_m \ i \ y \le x_0
$$

Si llamamos $p$ y $q$ a los siguientes elementos
$$
p = p_1 \ i \ \dots \ i \ p_n \qquad \text{y} \qquad q = q_1 \ i \ \dots \ i \ q_m
$$
Usando que el $i$ es cota inferior y transitividad, tenemos que
$$
(p \ i \ x) \ i \ q \le (p \ i \ x) \le x_0 \qquad \text{y} \qquad (q \ i \ y) \ i \ p \le (q \ i \ y) \le x_0
$$
Por asociativa de $i$
$$
(p \ i \ q) \ i \ x \le x_0 \qquad \text{y} \qquad (p \ i \ q) \ i \ y \le x_0
$$
Si llamamos $h = p \ i \ q$, tenemos que
$$
h \ i \ x \le x_0 \qquad \text{y} \qquad h \ i \ y \le x_0
$$
Ahora por la propiedad de que el $s$ es la menor cota superior tenemos que
$$
(h \ i \ x) \ s \ (h \ i \ y) \le x_0
$$
Pero como $(L, s, i)$ es distributivo, tenemos que
$$
(h \ i \ x) \ s \ (h \ i \ y) = h \ i \ (x \ s \ y)
$$
Por lo tanto $h \ i \ (x \ s \ y) \le x_0$. Pero como $p, q \in P$, entonces por la propiedad de los filtros (2), $h \in P$, y por hipótesis $x \ s \ y \in P$, entonces nuevamente por la propiedad de los filtros (2) tenemos que $h \ i \ (x \ s \ y) \in P$. Finalmente, como $h \ i \ (x \ s \ y) \le x_0$, por propiedad de los filtros (3) tenemos que $x_0 \in P$, **absurdo**. Entonces $x \in P \lor y \in P$.

Por lo que se demuestra (2), entonces $P \in \mathcal{F}$ es un filtro primo tal que $x_0 \notin P$ y $F \subseteq P$.

### Lema (Propiedades básicas de la consistencia)
Sea $(\Sigma, \tau)$ una teoría.
1. Si $(\Sigma, \tau)$ es inconsistente, entonces $(\Sigma, \tau) \vdash \varphi$, para toda sentencia $\varphi$.
2. Si $(\Sigma, \tau)$ es consistente y $(\Sigma, \tau) \vdash \varphi$, entonces $(\Sigma \cup \{\varphi\}, \tau)$ es consistente.
3. Si $(\Sigma, \tau) \nvdash \neg \varphi$, entonces $(\Sigma \cup \{\varphi\}, \tau)$ es consistente.

#### Proof
> **Resultado auxiliar utilizado**
> - *Lema "Propiedades básicas de $\vdash$" (combo 4)*.

##### Punto 1:
**Supongamos** que $(\Sigma, \tau)$ **es inconsistente**. Por lo tanto, por definición, $(\Sigma, \tau) \vdash (\psi \land \neg \psi)$ para alguna sentencia $\psi$. Ahora, dada una sentencia $\varphi$ arbitraria pero fija, tenemos que $\varphi$ se deduce por la **regla del absurdo** a partir de $(\psi \land \neg \psi)$. Entonces por *Propiedades básicas de $\vdash$ (2)* tenemos que $(\Sigma, \tau) \vdash \varphi$. Como $\varphi$ era arbitraria pero fija, entonces vale para toda sentencia $\varphi$.

##### Punto 2:
Supongamos que $(\Sigma, \tau)$ es consistente y $(\Sigma, \tau) \vdash \varphi$. Para probarlo lo haremos por el absurdo. Supongamos que $(\Sigma \cup \{\varphi\}, \tau)$ es inconsistente. Por lo tanto tendríamos que vale
$$
(\Sigma, \tau) \vdash \varphi \quad \text{y} \quad (\Sigma \cup \{\varphi\}, \tau) \vdash (\psi \land \neg \psi)
$$
con $\psi$ alguna sentencia. Pero entonces por *Propiedades básicas de $\vdash$ (1)* tendríamos que $(\Sigma, \tau) \vdash (\psi \land \neg \psi)$, es decir, $(\Sigma, \tau)$ es inconsistente, absurdo. Entonces $(\Sigma \cup \{\varphi\}, \tau)$ es consistente.

##### Punto 3:
Supongamos que $(\Sigma, \tau) \nvdash \neg \varphi$. Supongamos que $(\Sigma \cup \{\varphi\}, \tau)$ es inconsistente. Entonces por definición tenemos que
$$
(\Sigma \cup \{\varphi\}, \tau) \vdash (\psi \land \neg \psi)
$$
para algún $\psi$. Pero por *Propiedades básicas de $\vdash$ (3)* tendríamos
$$
(\Sigma, \tau) \vdash (\varphi \rightarrow (\psi \land \neg \psi))
$$
Finalmente tenemos que $\neg \varphi$ se deduce por la **regla del absurdo** a partir de $(\varphi \rightarrow (\psi \land \neg \psi))$. Por lo tanto tendríamos que $(\Sigma, \tau) \vdash \neg \varphi$, absurdo. Entonces $(\Sigma \cup \{\varphi\}, \tau)$ es consistente.


---
---
# Combo 2
### Teorema 1 (Teorema de Dedekind)
Sea $(L, s, i)$ un reticulado terna. La relación binaria sobre $L$ definida por $$\le = \{(x, y) \in L^2 : x \ s \ y = y\}$$ es un orden parcial sobre $L$ para el cual se cumple que:
$$
\sup(\{x, y\}) = x \ s \ y \\
\inf(\{x, y\}) = x \ i \ y
$$
cualesquiera sean $x, y \in L$.

#### Proof
Probemos que $\le$ **es reflexiva**. Sea $x \in L$. Por propiedad de $(L, s, i)$ tenemos que $x \ s \ x = x$, entonces por definición de $\le$, se da $x \le x$.

Probemos que $\le$ **es antisimétrica**. Sean $x, y \in L$ tales que $x \le y \; \land \; y \le x$. Es decir por definición de $\le$ tenemos que $x \ s \ y = y \; \land \; y \ s \ x = x$. Entonces aplicando propiedades de $(L, s, i)$ tenemos que
$$
x = y \ s \ x = x \ s \ y = y \implies x = y
$$

Probemos que $\le$ **es transitiva**. Sean $x, y, z \in L$ tales que $x \le y \; \land \; y \le z$. Es decir por definición de $\le$ tenemos que $x \ s \ y = y \; \land \; y \ s \ z = z$. Entonces aplicando propiedades de $(L, s, i)$ tenemos que
$$
x \ s \ z = x \ s \ (y \ s \ z) = (x \ s \ y) \ s \ z = y \ s \ z = z
\implies x \ s \ z = z \implies x \le z
$$

Por lo tanto $(L, \le)$ es un poset.

**Probemos que $\sup(\{x, y\}) = x \ s \ y$**.
Primero debemos ver que $x \ s \ y$ es cota superior de $\{x, y\}$, es decir
$$
x \le x \ s \ y \quad \text{y} \quad y \le x \ s \ y
$$
que por definición de $\le$ es equivalente a ver
$$
x \ s \ (x \ s \ y) = x \ s \ y \quad \text{y} \quad y \ s \ (x \ s \ y) = x \ s \ y
$$
usando propiedades de $(L, s, i)$ tenemos que
$$
\begin{aligned}
x \ s \ (x \ s \ y) &= (x \ s \ x) \ s \ y = x \ s \ y \\
y \ s \ (x \ s \ y) &= y \ s \ (y \ s \ x) = (y \ s \ y) \ s \ x = y \ s \ x = x \ s \ y
\end{aligned}
$$
entonces $x \ s \ y$ es cota superior. Falta ver que $x \ s \ y$ es menor o igual que cualquier otra cota superior de $\{x, y\}$. Para ello supongamos $x, y \le z$ con $z \in L$. Por definición de $\le$ tenemos que
$$
x \ s \ z = z \quad \text{y} \quad y \ s \ z = z
$$
usando propiedades de $(L, s, i)$ tenemos que
$$
(x \ s \ y) \ s \ z = x \ s \ (y \ s \ z) = x \ s \ z = z
$$
por lo tanto por definición de $\le$ tenemos que $x \ s \ y \le z$, lo que nos dice que $x \ s \ y$ es la menor cota superior. Entonces probamos que $\sup(\{x, y\}) = x \ s \ y$.

**Probemos que $\inf(\{x, y\}) = x \ i \ y$**. Para ello vamos a probar que para todo $x, y \in L$ vale $x \le y \Longleftrightarrow x \ i \ y = x$:

$\Rightarrow)$ Supongamos $x \le y$. Por definición de $\le$ tenemos que $x \ s \ y = y$. Entonces usando propiedades de $(L, s, i)$ tenemos que
$$
x \ i \ y = x \ i \ (x \ s \ y) = x \implies x \ i \ y = x
$$

$\Leftarrow)$ Supongamos $x \ i \ y = x$. Entonces usando propiedades de $(L, s, i)$ tenemos que
$$
x \ s \ y = (x \ i \ y) \ s \ y = y \ s \ (x \ i \ y) = y \ s \ (y \ i \ x) = y \implies x \ s \ y = y
$$
por definición de $\le$ tenemos que $x \le y$.

Usando lo anterior podemos probar que $\inf(\{x, y\}) = x \ i \ y$ de forma similar a como vimos $\sup(\{x, y\}) = x \ s \ y$.

### Lema
Supongamos que $\vec{a}, \vec{b}$ son asignaciones tales que si $x_i \in Li(\varphi)$, entonces $a_i = b_i$. Entonces $\mathbb{A} \models \varphi[\vec{a}] \; \Longleftrightarrow \; \mathbb{A} \models \varphi[\vec{b}]$.

#### Proof
> **Resultado auxiliar utilizado:**
> - *Lema análogo para Términos*.

Sea $\mathbb{A}$ una estructura de tipo $\tau$. Probaremos por inducción en $k$ que vale el *Lema* para cada $\varphi \in F_k^\tau$.

**$\text{Enu}_k$:** </br>
Sea $\varphi \in F_k^\tau$ y sean $\vec{a}, \vec{b}$ asignaciones tales que si $x_i \in Li(\varphi)$, entonces $a_i = b_i$. Entonces $\mathbb{A} \models \varphi[\vec{a}] \; \Longleftrightarrow \; \mathbb{A} \models \varphi[\vec{b}]$.

**$\text{Enu}_0$:** </br>
Sea $\varphi \in F_0^\tau$ y sean $\vec{a}, \vec{b}$ asignaciones tales que si $x_i \in Li(\varphi)$, entonces $a_i = b_i$. Entonces tenemos dos casos para $\varphi$:
1. $\varphi = (t \equiv s)$, con $t, s \in T^\tau$. Notar que todas las variables que ocurren en $\varphi$ son libres, entonces sabemos por el *Lema análogo para Términos* que $t^{\mathbb{A}}[\vec{a}] = t^{\mathbb{A}}[\vec{b}]$ y $s^{\mathbb{A}}[\vec{a}] = s^{\mathbb{A}}[\vec{b}]$. Ahora por definición y reemplazando obtenemos que:
$$
\begin{array}{cl}
& \mathbb{A} \models (t \equiv s)[\vec{a}] \quad \\
& \Longleftrightarrow \quad t^{\mathbb{A}}[\vec{a}] = s^{\mathbb{A}}[\vec{a}] \quad \\
& \Longleftrightarrow \quad t^{\mathbb{A}}[\vec{b}] = s^{\mathbb{A}}[\vec{b}] \quad \\
& \Longleftrightarrow \quad \mathbb{A} \models (t \equiv s)[\vec{b}]
\end{array}
$$

2. $\varphi = r(t_1, \dots, t_n)$, con $r \in R_n^\tau$ y $t_1, \dots, t_n \in T^\tau$, es análogo. Nuevamente todas las variables que ocurren en $\varphi$ son libres, entonces sabemos por el *Lema análogo para Términos* que $t_i^{\mathbb{A}}[\vec{a}] = t_i^{\mathbb{A}}[\vec{b}]$ con $i = 1, \dots, n$. Ahora por definición y reemplazando obtenemos que:
$$
\begin{array}{cl}
& \mathbb{A} \models r(t_1, \dots, t_n)[\vec{a}] \quad \\
& \Longleftrightarrow \quad (t_1^{\mathbb{A}}[\vec{a}], \dots, t_n^{\mathbb{A}}[\vec{a}]) \in r^{\mathbb{A}} \quad \\
& \Longleftrightarrow \quad (t_1^{\mathbb{A}}[\vec{b}], \dots, t_n^{\mathbb{A}}[\vec{b}]) \in r^{\mathbb{A}} \quad \\
& \Longleftrightarrow \quad \mathbb{A} \models r(t_1, \dots, t_n)[\vec{b}]
\end{array}
$$

**$\text{Enu}_{k+1}$:** </br>
Supongamos que el lema vale para todo $\varphi \in F_k^\tau$ y probaremos que vale para todo $\varphi \in F_{k+1}^\tau$. Sea $\varphi \in F_{k+1}^\tau - F_k^\tau$, ya que si $\varphi \in F_k^\tau$ sale directo. Además sean $\vec{a}, \vec{b}$ asignaciones tales que si $x_i \in Li(\varphi)$, entonces $a_i = b_i$. Entonces tenemos varios casos para $\varphi$, veremos algunos:

- Si $\varphi = (\varphi_1 \land \varphi_2)$: Notar que $Li(\varphi_i) \subseteq Li(\varphi)$, $i = 1, 2$; por $\text{Enu}_k$ tenemos que $\mathbb{A} \models \varphi_i[\vec{a}] \Longleftrightarrow \mathbb{A} \models \varphi_i[\vec{b}]$. Entonces por definición y reemplazando obtenemos que
$$
\begin{array}{cl}
& \mathbb{A} \models \varphi[\vec{a}] \quad \\
& \Longleftrightarrow \quad \mathbb{A} \models \varphi_1[\vec{a}] \; \land \; \mathbb{A} \models \varphi_2[\vec{a}] \quad \\
& \Longleftrightarrow \quad \mathbb{A} \models \varphi_1[\vec{b}] \; \land \; \mathbb{A} \models \varphi_2[\vec{b}] \quad \\
& \Longleftrightarrow \quad \mathbb{A} \models \varphi[\vec{b}]
\end{array}
$$

- Los casos para $\varphi = (\varphi_1 \lor \varphi_2)$, $\varphi = (\varphi_1 \rightarrow \varphi_2)$, $\varphi = (\varphi_1 \leftrightarrow \varphi_2)$ y $\varphi = \neg \varphi_1$ son análogos.

- Si $\varphi = \forall x_j \varphi_1$: Supongamos $\mathbb{A} \models \varphi[\vec{a}]$, entonces:
$$
\begin{array}{cl}
& \mathbb{A} \models \varphi[\vec{a}] \\
& \Longleftrightarrow \text{ vale que para todo } a \in A, \; \mathbb{A} \models \varphi_1[\downarrow_j^a(\vec{a})] \\
& ( \text{como } \downarrow_j^a(\vec{a}) \text{ y } \downarrow_j^a(\vec{b}) \text{ coinciden en toda } x_i \in Li(\varphi_1) \text{ ya que } Li(\varphi_1) \subseteq Li(\varphi) \cup \{x_j\} ) \\
& \Longleftrightarrow \text{ vale que para todo } a \in A, \; \mathbb{A} \models \varphi_1[\downarrow_j^a(\vec{b})] \\
& \mathbb{A} \models \varphi[\vec{b}]
\end{array}
$$

- El caso para $\varphi = \exists x_j \varphi_1$ es análogo.

Por lo tanto $\mathbb{A} \models \varphi[\vec{a}] \Longleftrightarrow \mathbb{A} \models \varphi[\vec{b}]$ para $\varphi \in F_{k+1}^\tau$.

Entonces vale para $\varphi \in F^\tau$.


---
---
# Combo 3
### Teorema (Lectura única de términos)
Dado $t \in T^\tau$ se da una de las siguientes:
1. $t \in (Var \cup \mathcal{C})$
2. Hay únicos $n \ge 1$, $f \in \mathcal{F}_n$, $t_1, \dots, t_n \in T^\tau$ tales que $t = f(t_1, \dots, t_n)$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema "Menú para términos"*.
> - *Lema "Mordisqueo de Términos"*.

Por el *Lema Menú para términos* tenemos que se dan (1) o (2) y obviamente no pueden darse ambas a la vez. Veamos que vale la unicidad de (2). Supongamos que
$$
t = f(t_1, \dots, t_n) = g(s_1, \dots, s_m)
$$
con $n, m \ge 1$, $f \in \mathcal{F}_n^\tau$, $g \in \mathcal{F}_m^\tau$, $t_1, \dots, t_n \in T^\tau$ y $s_1, \dots, s_m \in T^\tau$. Claramente $f = g$, por lo que $n = m$. Notar que si $t_1$ es tramo inicial de $s_1$ o $s_1$ es tramo inicial de $t_1$, el *Lema Mordisqueo de Términos* nos dice que $t_1 = s_1$. Con el mismo razonamiento, podemos probar que $t_i = s_i$ para cada $i = 1, \dots, n$.

### Lema
Supongamos que $F: \mathbb{A} \rightarrow \mathbb{B}$ es un isomorfismo. Sea $\varphi \in F^\tau$. Entonces $$\mathbb{A} \models \varphi[(a_1, a_2, ...)] \quad \; \Longleftrightarrow \; \quad \mathbb{B} \models \varphi[(F(a_1), F(a_2), ...)]$$ para cada $(a_1, a_2, ...) \in A^\mathbb{N}$. En particular $\mathbb{A}$ y $\mathbb{B}$ satisfacen las mismas sentencias de tipo $\tau$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema análogo para términos*.
> - *Teorema de "lectura única de fórmulas"*.

Para $\vec{a} = (a_1, a_2, \dots) \in A^\mathbb{N}$, denotaremos a $(F(a_1), F(a_2), \dots)$ con $F(\vec{a})$. Vamos a probar por inducción en $k$:

**$\text{Enu}_k$:** </br>
Supongamos que $F: \mathbb{A} \rightarrow \mathbb{B}$ es un isomorfismo. Sea $\varphi \in F_k^\tau$. Entonces $\mathbb{A} \models \varphi[\vec{a}] \; \Longleftrightarrow \ \mathbb{B} \models \varphi[F(\vec{a})]$ para cada $\vec{a} \in A^\mathbb{N}$.

**$\text{Enu}_0$:** </br>
Sea $\varphi \in F_0^\tau$ y $\vec{a} \in A^\mathbb{N}$ arbitraria. Tenemos dos casos para $\varphi$:
- $\varphi = (t \equiv s)$, con $t, s \in T^\tau$:
$$
\begin{aligned}
\mathbb{A} \models \varphi[\vec{a}] \quad &\Longleftrightarrow \quad t^{\mathbb{A}}[\vec{a}] = s^{\mathbb{A}}[\vec{a}] && (\text{def. de } \models) \\
&\Longleftrightarrow \quad F(t^{\mathbb{A}}[\vec{a}]) = F(s^{\mathbb{A}}[\vec{a}]) && (F \text{ un iso}) \\
&\Longleftrightarrow \quad t^{\mathbb{B}}[F(\vec{a})] = s^{\mathbb{B}}[F(\vec{a})] && (\text{Lema análogo para términos}) \\
&\Longleftrightarrow \quad \mathbb{B} \models (t \equiv s)[F(\vec{a})] && (\text{def. de } \models) \\
&\Longleftrightarrow \quad \mathbb{B} \models \varphi[F(\vec{a})]\\
\end{aligned}
$$

- $\varphi = r(t_1, \dots, t_n)$, con $r \in R_n^\tau$ y $t_1, \dots, t_n \in T^\tau$:
$$
\begin{aligned}
\mathbb{A} \models \varphi[\vec{a}] \quad &\Longleftrightarrow \quad (t_1^{\mathbb{A}}[\vec{a}], \dots, t_n^{\mathbb{A}}[\vec{a}]) \in r^{\mathbb{A}} && (\text{def. de } \models) \\
&\Longleftrightarrow \quad (F(t_1^{\mathbb{A}}[\vec{a}]), \dots, F(t_n^{\mathbb{A}}[\vec{a}])) \in r^{\mathbb{B}} && (F \text{ un iso}) \\
&\Longleftrightarrow \quad (t_1^{\mathbb{B}}[F(\vec{a})], \dots, t_n^{\mathbb{B}}[F(\vec{a})]) \in r^{\mathbb{B}} && (\text{Lema análogo para términos}) \\
&\Longleftrightarrow \quad \mathbb{B} \models r(t_1, \dots, t_n)[F(\vec{a})] && (\text{def. de } \models) \\
&\Longleftrightarrow \quad \mathbb{B} \models \varphi[F(\vec{a})]\\
\end{aligned}
$$

**$\text{Enu}_{k+1}$:** </br>
Supongamos que vale $\text{Enu}_k$ y probaremos que vale $\text{Enu}_{k+1}$. Sea $\varphi \in (F_{k+1}^\tau - F_k^\tau)$, ya que si $\varphi \in F_k^\tau$ sale directo. Por *Teorema de lectura única de fórmulas* hay varios casos:
- Si $\varphi = (\varphi_1 \land \varphi_2)$ con $\varphi_1, \varphi_2 \in F_k^\tau$, entonces
$$
\begin{aligned}
\mathbb{A} \models \varphi[\vec{a}] \quad &\Longleftrightarrow \quad \mathbb{A} \models \varphi_1[\vec{a}] \text{ y } \mathbb{A} \models \varphi_2[\vec{a}] && (\text{def. de } \models) \\
&\Longleftrightarrow \quad \mathbb{B} \models \varphi_1[F(\vec{a})] \text{ y } \mathbb{B} \models \varphi_2[F(\vec{a})] && (\text{Enu}_k) \\
&\Longleftrightarrow \quad \mathbb{B} \models \varphi[F(\vec{a})] && (\text{def. de } \models)
\end{aligned}
$$

- Los casos para $\varphi = (\varphi_1 \lor \varphi_2)$, $\varphi = (\varphi_1 \rightarrow \varphi_2)$, $\varphi = (\varphi_1 \leftrightarrow \varphi_2)$ y $\varphi = \neg \varphi_1$ son análogos.

- Si $\varphi = \forall x_j \varphi_1$ con $\varphi_1 \in F_k^\tau$: Sea $\vec{a} \in A^\mathbb{N}$ arbitraria. Tenemos que
$$
\begin{aligned}
\mathbb{A} \models \varphi[\vec{a}] \quad &\Longleftrightarrow \quad \forall a \in A, \text{ se da } \mathbb{A} \models \varphi_1[\downarrow_j^a(\vec{a})] && (\text{def. de } \models) \\
&\Longleftrightarrow \quad \forall a \in A, \text{ se da } \mathbb{B} \models \varphi_1[F(\downarrow_j^a(\vec{a}))] && (\text{Enu}_k) \\
&\Longleftrightarrow \quad \forall a \in A, \text{ se da } \mathbb{B} \models \varphi_1[\downarrow_j^{F(a)}(F(\vec{a}))] && (\text{deducción}) \\
&\Longleftrightarrow \quad \forall b \in B, \text{ se da } \mathbb{B} \models \varphi_1[\downarrow_j^b(F(\vec{a}))] && (F \text{ sobre, ya que es iso}) \\
&\Longleftrightarrow \quad \mathbb{B} \models \varphi[F(\vec{a})] && (\text{def. de } \models)
\end{aligned}
$$

- El caso para $\varphi = \exists x_j \varphi_1$ con $\varphi_1 \in F_k^\tau$ es análogo.

Por lo que el lema es valido por inducción.

### Teorema
Sea $T = (\Sigma, \tau)$ una teoría. Entonces $(S^\tau / \dashv\vdash_T, s^T, i^T, ^{c^T}, 0^T, 1^T)$ es un álgebra de Boole.
> Pruebe solo el ítem (6).

#### Proof
Sea $T = (\Sigma, \tau)$ una teoría. Por definición de álgebra de Boole, debemos probar que valen varias propiedades. En total (13), pero solo veremos la (6). Para cualquier $\varphi_1, \varphi_2, \varphi_3 \in S^\tau$ debe cumplirse la siguiente igualdad:
$$
[\varphi_1]_T \ s^T \ ([\varphi_2]_T \ s^T \ [\varphi_3]_T) = ([\varphi_1]_T \ s^T \ [\varphi_2]_T) \ s^T \ [\varphi_3]_T
$$
Aplicando la definición de $s^T$, básicamente tenemos que ver
$$
[\varphi_1 \lor (\varphi_2 \lor \varphi_3)]_T = [(\varphi_1 \lor \varphi_2) \lor \varphi_3]_T
$$
Por lo que debemos probar que $T \vdash ((\varphi_1 \lor (\varphi_2 \lor \varphi_3)) \leftrightarrow ((\varphi_1 \lor \varphi_2) \lor \varphi_3))$. Su prueba formal es:

$$\begin{array}{ll} 1.\ (\varphi_1 \lor (\varphi_2 \lor \varphi_3)) & \text{HIPOTESIS}\bar{1} \\ 2.\ \varphi_1 & \text{HIPOTESIS}\bar{2} \\ 3.\ (\varphi_1 \lor \varphi_2) & \text{DISJUNCIONINTRODUCCION}(3) \\ 4.\ ((\varphi_1 \lor \varphi_2) \lor \varphi_3) & \text{TESIS}\bar{2}\text{DISJUNCIONINTRODUCCION}(3) \\ 5.\ (\varphi_1 \rightarrow ((\varphi_1 \lor \varphi_2) \lor \varphi_3)) & \text{CONCLUSION} \\ 6.\ (\varphi_2 \lor \varphi_3) & \text{HIPOTESIS}\bar{3} \\ 7.\ \varphi_2 & \text{HIPOTESIS}\bar{4} \\ 8.\ (\varphi_1 \lor \varphi_2) & \text{DISJUNCIONINTRODUCCION}(7) \\ 9.\ ((\varphi_1 \lor \varphi_2) \lor \varphi_3) & \text{TESIS}\bar{4}\text{DISJUNCIONINTRODUCCION}(8) \\ 10.\ (\varphi_2 \rightarrow ((\varphi_1 \lor \varphi_2) \lor \varphi_3)) & \text{CONCLUSION} \\ 11.\ \varphi_3 & \text{HIPOTESIS}\bar{5} \\ 12.\ ((\varphi_1 \lor \varphi_2) \lor \varphi_3) & \text{TESIS}\bar{5}\text{DISJUNCIONINTRODUCCION}(11) \\ 13.\ (\varphi_3 \rightarrow ((\varphi_1 \lor \varphi_2) \lor \varphi_3)) & \text{CONCLUSION} \\ 14.\ ((\varphi_1 \lor \varphi_2) \lor \varphi_3) & \text{TESIS}\bar{3}\text{DIVISIONPORCASOS}(6, 10, 13) \\ 15.\ ((\varphi_2 \lor \varphi_3) \rightarrow ((\varphi_1 \lor \varphi_2) \lor \varphi_3)) & \text{CONCLUSION} \\ 16.\ ((\varphi_1 \lor \varphi_2) \lor \varphi_3) & \text{TESIS}\bar{1}\text{DIVISIONPORCASOS}(1, 5, 15) \\ 17.\ ((\varphi_1 \lor (\varphi_2 \lor \varphi_3)) \rightarrow ((\varphi_1 \lor \varphi_2) \lor \varphi_3)) & \text{CONCLUSION} \\ 18.\ ((\varphi_1 \lor \varphi_2) \lor \varphi_3) & \text{HIPOTESIS}\bar{6} \\ 19.\ (\varphi_1 \lor \varphi_2) & \text{HIPOTESIS}\bar{7} \\ 20.\ \varphi_1 & \text{HIPOTESIS}\bar{8} \\ 21.\ (\varphi_1 \lor (\varphi_2 \lor \varphi_3)) & \text{TESIS}\bar{8}\text{DISJUNCIONINTRODUCCION}(19) \\ 22.\ (\varphi_1 \rightarrow (\varphi_1 \lor (\varphi_2 \lor \varphi_3))) & \text{CONCLUSION} \\ 23.\ \varphi_2 & \text{HIPOTESIS}\bar{9} \\ 24.\ (\varphi_2 \lor \varphi_3) & \text{DISJUNCIONINTRODUCCION}(23) \\ 25.\ (\varphi_1 \lor (\varphi_2 \lor \varphi_3)) & \text{TESIS}\bar{9}\text{DISJUNCIONINTRODUCCION}(24) \\ 26.\ (\varphi_2 \rightarrow (\varphi_1 \lor (\varphi_2 \lor \varphi_3))) & \text{CONCLUSION} \\ 27.\ (\varphi_1 \lor (\varphi_2 \lor \varphi_3)) & \text{TESIS}\bar{7}\text{DIVISIONPORCASOS}(19, 22, 16) \\ 28.\ ((\varphi_1 \lor \varphi_2) \rightarrow (\varphi_1 \lor (\varphi_2 \lor \varphi_3))) & \text{CONCLUSION} \\ 29.\ \varphi_3 & \text{HIPOTESIS}\overline{10} \\ 30.\ (\varphi_2 \lor \varphi_3) & \text{DISJUNCIONINTRODUCCION}(29) \\ 31.\ (\varphi_1 \lor (\varphi_2 \lor \varphi_3)) & \text{TESIS}\overline{10}\text{DISJUNCIONINTRODUCCION}(30) \\ 32.\ (\varphi_3 \rightarrow (\varphi_1 \lor (\varphi_2 \lor \varphi_3))) & \text{CONCLUSION} \\ 33.\ (\varphi_1 \lor (\varphi_2 \lor \varphi_3)) & \text{TESIS}\bar{6}\text{DIVISIONPORCASOS}(18, 28, 32) \\ 34.\ ((((\varphi_1 \lor \varphi_2) \lor \varphi_3)) \rightarrow (\varphi_1 \lor (\varphi_2 \lor \varphi_3))) & \text{CONCLUSION} \\ 35.\ ((\varphi_1 \lor (\varphi_2 \lor \varphi_3)) \leftrightarrow ((\varphi_1 \lor \varphi_2) \lor \varphi_3)) & \text{EQUIVALENCIAINTRODUCCION}(17, 34) \end{array}$$

Por lo que se cumple la propiedad (6)


---
---
# Combo 4
### Lema (Propiedades básicas de la deducción)
Sea $(\Sigma, \tau)$ una teoría.
1. (Uso de Teoremas). Si $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$ y $(\Sigma \cup \{\varphi_1, \dots, \varphi_n\}, \tau) \vdash \varphi$, entonces $(\Sigma, \tau) \vdash \varphi$.
2. Supongamos $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$. Si $R$ es una regla distinta de GENERALIZACION o ELECCION y $\varphi$ se deduce de $\varphi_1, \dots, \varphi_n$ por la regla $R$, entonces $(\Sigma, \tau) \vdash \varphi$.
3. $(\Sigma, \tau) \vdash (\varphi \rightarrow \psi) \; \Longleftrightarrow \;(\Sigma \cup \{\varphi\}, \tau) \vdash \psi$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema "Cambio de índice de hipótesis"*.
> - *Lema "Cambio de nombres de constante auxiliares"*.

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
> - *Lema "Unicidad del Complemento en reticulado acotado distributivo"*.
> - *Lema "útil"*: Sea $(B, s, i, ^c, 0, 1)$ un álgebra de Boole. Entonces para cualesquiera $x, y \in B$ se tiene que $y = (y \ i \ x) \ s \ (y \ i \ x^c)$.
> - *Lema "Monotonía"*.

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
> - *Teorema de Dedekind*.
> - *Lema "sup e inf en Isomorfismo de Posets"*.

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


---
---
# Combo 5
### Teorema (Teorema de Completitud)
Sea $T = (\Sigma, \tau)$ una teoría de primer orden. Si $\mathbb{T} \models \varphi$ entonces $T \vdash \varphi$.
> Haga solo el caso en que $\tau$ tiene una cantidad infinita de nombres de cte que no ocurren en las sentencias de $\Sigma$. En la exposición de la prueba no es necesario que demuestre los ítems (1) y (5).

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema "Orden del Álgebra de Lindenbaum" ($\le^T$)*.
> - *Lema "Carácter recursivo de la notación $t^{\mathbb{A}}[a_1, \dots, a_n]$" (Carácter recursivo)*.

**Item (2)** Para cada $\varphi =_d \varphi(v_1, \dots, v_n) \in F^\tau$, $t_1, \dots, t_n, s_1, \dots, s_n \in T_c^\tau$, si $t_1 \bowtie s_1, \dots, t_n \bowtie s_n$, entonces
$$
[\varphi(t_1, \dots, t_n)]_T \in \mathcal{U} \quad \Longleftrightarrow \quad [\varphi(s_1, \dots, s_n)]_T \in \mathcal{U}
$$

**Demostración (2):** </br>
Notar que
$$
T \vdash (((t_1 \equiv s_1) \land \dots \land (t_n \equiv s_n) \land \varphi(t_1, \dots, t_n)) \rightarrow \varphi(s_1, \dots, s_n))
$$

Por *Lema de "$\le^T$"* sabemos que
$$
[(t_1 \equiv s_1) \land \dots \land (t_n \equiv s_n) \land \varphi(t_1, \dots, t_n)]_T \le^T [\varphi(s_1, \dots, s_n)]_T
$$
por definición de $i^T$ tenemos que
$$
[t_1 \equiv s_1]_T \ i^T \ \dots \ i^T \ [t_n \equiv s_n]_T \ i^T \ [\varphi(t_1, \dots, t_n)]_T \le^T [\varphi(s_1, \dots, s_n)]_T \qquad (*)
$$
En particular, como $t_1 \bowtie s_1, \dots, t_n \bowtie s_n$, por definición de $\bowtie$ tenemos que $[t_1 \equiv s_1]_T, \dots, [t_n \equiv s_n]_T \in \mathcal{U}$, y por ser $\mathcal{U}$ un filtro ($x, y \in F \Rightarrow x \ i \ y \in F$) tenemos que
$$
[t_1 \equiv s_1]_T \ i^T \ \dots \ i^T \ [t_n \equiv s_n]_T \in \mathcal{U}
$$
Pero si suponemos $[\varphi(t_1, \dots, t_n)]_T \in \mathcal{U}$, por lo mismo tenemos que
$$
[t_1 \equiv s_1]_T \ i^T \ \dots \ i^T \ [t_n \equiv s_n]_T \ i^T \ [\varphi(t_1, \dots, t_n)]_T \in \mathcal{U}
$$
por ser $\mathcal{U}$ un filtro ($x \in \mathcal{U} \text{ y } x \le^T y \Rightarrow y \in \mathcal{U}$) y por $(*)$, tengo que $[\varphi(s_1, \dots, s_n)]_T \in \mathcal{U}$. Conclusión:
$$
[\varphi(t_1, \dots, t_n)]_T \in \mathcal{U} \quad \implies \quad [\varphi(s_1, \dots, s_n)]_T \in \mathcal{U}
$$
La otra implicación es análoga.

---

**Item (3)** Para cada $f \in \mathcal{F}_n$, $t_1, \dots, t_n, s_1, \dots, s_n \in T_c^\tau$, se da que
$$
t_1 \bowtie s_1, \dots, t_n \bowtie s_n \quad \implies \quad f(t_1, \dots, t_n) \bowtie f(s_1, \dots, s_n)
$$

**Demostración (3):** </br>
**(3)** Sea $f \in \mathcal{F}_n$, $t_1, \dots, t_n, s_1, \dots, s_n \in T_c^\tau$ y supongamos $t_1 \bowtie s_1, \dots, t_n \bowtie s_n$. Si tomamos $\varphi = (f(v_1, \dots, v_n) \equiv f(s_1, \dots, s_n))$, aplicando (2) obtenemos que
$$
\begin{aligned}
[\varphi(t_1, \dots, t_n)]_T \in \mathcal{U} \quad & \Longleftrightarrow \quad [\varphi(s_1, \dots, s_n)]_T \in \mathcal{U} \\
[f(t_1, \dots, t_n) \equiv f(s_1, \dots, s_n)]_T \in \mathcal{U} \quad & \Longleftrightarrow \quad [(f(s_1, \dots, s_n) \equiv f(s_1, \dots, s_n))]_T \in \mathcal{U}
\end{aligned}
$$
Pero $[(f(s_1, \dots, s_n) \equiv f(s_1, \dots, s_n))]_T = 1^T$ y $1^T \in \mathcal{U}$, entonces $[(f(s_1, \dots, s_n) \equiv f(s_1, \dots, s_n))]_T \in \mathcal{U}$. Así concluimos que $[f(t_1, \dots, t_n) \equiv f(s_1, \dots, s_n)]_T \in \mathcal{U}$, es decir, $f(t_1, \dots, t_n) \bowtie f(s_1, \dots, s_n)$.

Gracias a (3) defino el modelo $\mathbb{A}_{\mathcal{U}}$ de tipo $\tau$, el cual sera util para (4) y (5):
- Universo de $\mathbb{A}_{\mathcal{U}} = T_c^\tau / \bowtie$.
- $c^{\mathbb{A}_{\mathcal{U}}} = c / \bowtie$, para cada $c \in \mathcal{C}$.
- $f^{\mathbb{A}_{\mathcal{U}}}(t_1/\bowtie, \dots, t_n/\bowtie) = f(t_1, \dots, t_n)/\bowtie$, para cada $f \in \mathcal{F}_n$ y $t_1, \dots, t_n \in T_c^\tau$.
- $r^{\mathbb{A}_{\mathcal{U}}} = \{(t_1/\bowtie, \dots, t_n/\bowtie) : [r(t_1, \dots, t_n)]_T \in \mathcal{U}\}$, para cada $r \in \mathcal{R}_n$.

---

**Item (4)** Para cada $t =_d t(v_1, \dots, v_n) \in T^\tau$, $t_1, \dots, t_n \in T_c^\tau$, tenemos que
$$
t^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] = t(t_1, \dots, t_n)/\bowtie
$$

**Demostración (4):** </br>
Lo vamos a probar por inducción.

- **$\mathrm{Enu}_{k}$:** Para cada $t=_{d}t(v_{1},...,v_{n})\in T_{k}^{\tau}, t_{1},...,t_{n}\in T_{c}^{\tau}$, tenemos que
$t^{\mathbf{A}_{\mathcal{U}}}[t_{1}/\mathrm{\bowtie},...,t_{n}/\mathrm{\bowtie}]=t(t_{1},...,t_{n})/\mathrm{\bowtie}$

- **$\mathrm{Enu}_{0}:$** Sea $t =_d t(v_1, \dots, v_n) \in T_0^\tau$, $t_1, \dots, t_n \in T_c^\tau$. Tenemos dos casos:
  - Si $t = c \in \mathcal{C}$:
    $$
    \begin{aligned}
    t^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] &= c^{\mathbb{A}_{\mathcal{U}}} && (\text{Lema "Carácter recursivo"}) \\
    &= c/\bowtie && (\text{def. } \mathbb{A}_{\mathcal{U}}) \\
    &= t(t_1, \dots, t_n)/\bowtie && (\text{por Notación Declaratoria})
    \end{aligned}
    $$

  - Si $t = v_i$ para algún $i = 1, \dots, n$:
    $$
    \begin{aligned}
    t^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] &= t_i/\bowtie && (\text{Lema "Carácter recursivo"}) \\
    &= t(t_1, \dots, t_n)/\bowtie && (\text{por Notación Declaratoria})
    \end{aligned}
    $$

- **$\mathrm{Enu}_{k+1}$:** Supongamos que vale para cada $s \in T_k^\tau$ y veamos que se cumple para $t \in T_{k+1}^\tau$. Sea $t =_d t(v_1, \dots, v_n) \in T_{k+1}^\tau$, $t_1, \dots, t_n \in T_c^\tau$. Si $t \in T_k^\tau$, directo por $\mathrm{Enu}_{k}$

  Si $t =_d t(v_1, \dots, v_n) \in (T_{k+1}^\tau - T_k^\tau)$, se da que $t =_d f(s_1, \dots, s_m)$ con $f \in \mathcal{F}_m$ y $s_1, \dots, s_m \in T_k^\tau$. Por convención notacional $s_i =_d s_i(v_1, \dots, v_n)$. Entonces por el *Lema "Carácter recursivo"* tenemos que
  $$
  t^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] = f^{\mathbb{A}_{\mathcal{U}}}(s_1^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie], \dots, s_m^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie])
  $$

  Luego por $\mathrm{Enu}_{k}$. $s_i^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] = s_i(t_1, \dots, t_n)/\bowtie$, entonces
  $$
  t^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] = f^{\mathbb{A}_{\mathcal{U}}}(s_1(t_1, \dots, t_n)/\bowtie, \dots, s_m(t_1, \dots, t_n)/\bowtie)
  $$
  por definición de $f^{\mathbb{A}_{\mathcal{U}}}$
  $$
  t^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] = f(s_1(t_1, \dots, t_n), \dots, s_m(t_1, \dots, t_n))/\bowtie
  $$
  por notación declaratoria llegamos a que
  $$
  t^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] = t(t_1, \dots, t_n)/\bowtie
  $$

Por lo que (4) esta probado por inducción.


---
---
# Combo 6
### Teorema (Teorema de Completitud)
Sea $T = (\Sigma, \tau)$ una teoría de primer orden. Si $\mathbb{T} \models \varphi$ entonces $T \vdash \varphi$.
> Haga solo el caso en que $\tau$ tiene una cantidad infinita de nombres de cte que no ocurren en las sentencias de $\Sigma$. En la exposición de la prueba no es necesario que demuestre los ítems: (1), (2), (3) y (4).

#### Proof
Asumo los ítems (1) al (4) y tomo el modelo $\mathbb{A}_{\mathcal{U}}$ de tipo $\tau$ (definido gracias a (3)):
- Universo de $\mathbb{A}_{\mathcal{U}} = T_c^\tau / \bowtie$.
- $c^{\mathbb{A}_{\mathcal{U}}} = c / \bowtie$, para cada $c \in \mathcal{C}$.
- $f^{\mathbb{A}_{\mathcal{U}}}(t_1/\bowtie, \dots, t_n/\bowtie) = f(t_1, \dots, t_n)/\bowtie$, para cada $f \in \mathcal{F}_n$ y $t_1, \dots, t_n \in T_c^\tau$.
- $r^{\mathbb{A}_{\mathcal{U}}} = \{(t_1/\bowtie, \dots, t_n/\bowtie) : [r(t_1, \dots, t_n)]_T \in \mathcal{U}\}$, para cada $r \in \mathcal{R}_n$.

**(5)** Para cada $\varphi =_d \varphi(v_1, \dots, v_n) \in F^\tau$, $t_1, \dots, t_n \in T_c^\tau$, se da que
$$
\mathbb{A}_{\mathcal{U}} \models \varphi[t_1/\bowtie, \dots, t_n/\bowtie] \quad \Longleftrightarrow \quad [\varphi(t_1, \dots, t_n)]_T \in \mathcal{U}
$$

Lo probaremos por inducción:
- $\text{Enu}_{k}$: Para cada $\varphi=_{d}\varphi(v_{1},...,v_{n})\in F_{k}^{\tau}, t_{1},...,t_{n}\in T_{c}^{\tau}$, tenemos que
$$
\mathbb{A}_{\mathcal{U}}\models\varphi[t_{1}/\mathrm{\bowtie},...,t_{n}/\mathrm{\bowtie}] \Longleftrightarrow [\varphi(t_{1},...,t_{n})]_{T}\in\mathcal{U}
$$

- **$\text{Enu}_0$:** Sea $\varphi =_d \varphi(v_1, \dots, v_n) \in F_0^\tau$, $t_1, \dots, t_n \in T_c^\tau$. Tenemos dos casos:
  - Si $\varphi = (t \equiv s)$ con $t, s \in T^\tau$: Por convención notacional tenemos $t =_d t(v_1, \dots, v_n)$ y $s =_d s(v_1, \dots, v_n)$.
    $$
    \begin{aligned}
    \mathbb{A}_{\mathcal{U}} \models \varphi[t_1/\bowtie, \dots, t_n/\bowtie] \quad & \Longleftrightarrow \quad t^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] = s^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie] && \\
    & \Longleftrightarrow \quad t(t_1, \dots, t_n)/\bowtie \; = s(t_1, \dots, t_n)/\bowtie && (\text{por } 4) \\
    & \Longleftrightarrow \quad t(t_1, \dots, t_n) \bowtie s(t_1, \dots, t_n) && (\text{def. clase equiv}) \\
    & \Longleftrightarrow \quad [(t(t_1, \dots, t_n) \equiv s(t_1, \dots, t_n))]_T \in \mathcal{U} && (\text{def. } \bowtie) \\
    & \Longleftrightarrow \quad [\varphi(t_1, \dots, t_n)]_T \in \mathcal{U} &&
    \end{aligned}
    $$

  - Si $\varphi = r(s_1, \dots, s_m)$ con $r \in \mathcal{R}_m$ y $s_1, \dots, s_m \in T^\tau$: Por convención notacional $s_i =_d s_i(v_1, \dots, v_n)$.
    $$
    \begin{aligned}
    \mathbb{A}_{\mathcal{U}} \models \varphi[t_1/\bowtie, \dots, t_n/\bowtie] \quad & \Longleftrightarrow \quad (s_1^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie], \dots, s_m^{\mathbb{A}_{\mathcal{U}}}[t_1/\bowtie, \dots, t_n/\bowtie]) \in r^{\mathbb{A}_{\mathcal{U}}} && \\
    & \Longleftrightarrow \quad (s_1(t_1, \dots, t_n)/\bowtie, \dots, s_m(t_1, \dots, t_n)/\bowtie) \in r^{\mathbb{A}_{\mathcal{U}}} && (\text{por } 4) \\
    & \Longleftrightarrow \quad [r(s_1(t_1, \dots, t_n), \dots, s_m(t_1, \dots, t_n))]_T \in \mathcal{U} && (\text{def. } r^{\mathbb{A}_{\mathcal{U}}}) \\
    & \Longleftrightarrow \quad [\varphi(t_1, \dots, t_n)]_T \in \mathcal{U} &&
    \end{aligned}
    $$

- **$\text{Enu}_{k+1}$:** Supongamos que vale para cada $\psi \in F_k^\tau$ y veamos que se cumple para $\varphi \in F_{k+1}^\tau$. Sea $\varphi =_d \varphi(v_1, \dots, v_n) \in F_{k+1}^\tau$, $t_1, \dots, t_n \in T_c^\tau$. Si $\varphi \in F_k^\tau$, es directo por $\text{Enu}_k$. Entonces veamos $\varphi =_d \varphi(v_1, \dots, v_n) \in F_{k+1}^\tau - F_k^\tau$. Tenemos varios casos para la forma de $\varphi$:
  - Si $\varphi = (\varphi_1 \land \varphi_2)$: Por convención notacional $\varphi_i =_d \varphi_i(v_1, \dots, v_n)$.
    $$
    \begin{aligned}
    \mathbb{A}_{\mathcal{U}} \models \varphi[t_1/\bowtie, \dots, t_n/\bowtie] \quad & \Longleftrightarrow \quad \mathbb{A}_{\mathcal{U}} \models \varphi_1[t_1/\bowtie, \dots, t_n/\bowtie] \text{ y } \mathbb{A}_{\mathcal{U}} \models \varphi_2[t_1/\bowtie, \dots, t_n/\bowtie] && \\
    & \Longleftrightarrow \quad [\varphi_1(t_1, \dots, t_n)]_T \in \mathcal{U} \text{ y } [\varphi_2(t_1, \dots, t_n)]_T \in \mathcal{U} && (\text{por Enu}_k) \\
    & \Longleftrightarrow \quad [\varphi_1(t_1, \dots, t_n) \ i^T \ \varphi_2(t_1, \dots, t_n)]_T \in \mathcal{U} && (\mathcal{U} \text{ filtro primo}) \\
    & \Longleftrightarrow \quad [\varphi_1(t_1, \dots, t_n) \land \varphi_2(t_1, \dots, t_n)]_T \in \mathcal{U} && (\text{def. } i^T) \\
    & \Longleftrightarrow \quad [\varphi(t_1, \dots, t_n)]_T \in \mathcal{U} &&
    \end{aligned}
    $$
  - Los casos para $\varphi = (\varphi_1 \lor \varphi_2)$, $\varphi = (\varphi_1 \rightarrow \varphi_2)$, $\varphi = (\varphi_1 \leftrightarrow \varphi_2)$ y $\varphi = \neg \varphi_1$ son análogos.

  - Si $\varphi = \forall v \varphi_1$, con $v \in Var - \{v_1, \dots, v_n\}$: Por convención notacional $\varphi_1 =_d \varphi_1(v_1, \dots, v_n)$.
    $$
    \begin{aligned}
    \mathbb{A}_{\mathcal{U}} \models \varphi[t_1/\bowtie, \dots, t_n/\bowtie] \quad & \Longleftrightarrow \quad \mathbb{A}_{\mathcal{U}} \models \varphi_1[t_1/\bowtie, \dots, t_n/\bowtie, t/\bowtie], \quad \text{para todo } t \in T_c^\tau && \\
    & \Longleftrightarrow \quad [\varphi_1(t_1, \dots, t_n, t)]_T \in \mathcal{U}, \quad \text{para todo } t \in T_c^\tau && (\text{por Enu}_k) \\
    & \Longleftrightarrow \quad [\forall v_1 \varphi_1(t_1, \dots, t_n, t)]_T \in \mathcal{U} && \\
    & \Longleftrightarrow \quad [\varphi(t_1, \dots, t_n, t)]_T \in \mathcal{U} &&
    \end{aligned}
    $$

  - Si $\varphi = \exists v \varphi_1$, con $v \in Var - \{v_1, \dots, v_n\}$: Por convención notacional $\varphi_1 =_d \varphi_1(v_1, \dots, v_n)$.
    $$
    \begin{aligned}
    \mathbb{A}_{\mathcal{U}} \models \varphi[t_1/\bowtie, \dots, t_n/\bowtie] \quad & \Longleftrightarrow \quad \mathbb{A}_{\mathcal{U}} \models \varphi_1[t_1/\bowtie, \dots, t_n/\bowtie, t/\bowtie], \quad \text{para algún } t \in T_c^\tau && \\
    & \Longleftrightarrow \quad [\varphi_1(t_1, \dots, t_n, t)]_T \in \mathcal{U}, \quad \text{para algún } t \in T_c^\tau && (\text{por Enu}_k) \\
    & \Longleftrightarrow \quad ([\varphi_1(t_1, \dots, t_n, t)]_T)^{c^T} \notin \mathcal{U}, \quad \text{para algún } t \in T_c^\tau && \\
    & \Longleftrightarrow \quad [\neg \varphi_1(t_1, \dots, t_n, t)]_T \notin \mathcal{U}, \quad \text{para algún } t \in T_c^\tau && \\
    & \Longleftrightarrow \quad [\forall v \neg \varphi_1(t_1, \dots, t_n, t)]_T \notin \mathcal{U}, \quad \text{para algún } t \in T_c^\tau && \\
    & \Longleftrightarrow \quad ([\forall v \neg \varphi_1(t_1, \dots, t_n, t)]_T)^{c^T} \in \mathcal{U}, \quad \text{para algún } t \in T_c^\tau && \\
    & \Longleftrightarrow \quad [\neg \forall v \neg \varphi_1(t_1, \dots, t_n, t)]_T \in \mathcal{U}, \quad \text{para algún } t \in T_c^\tau && \\
    & \Longleftrightarrow \quad [\exists v_1 \varphi_1(t_1, \dots, t_n, t)]_T \in \mathcal{U} && \\
    & \Longleftrightarrow \quad [\varphi(t_1, \dots, t_n, t)]_T \in \mathcal{U} &&
    \end{aligned}
    $$

Por lo que (5) esta probado por inducción.


---
---
# Combo 7
### Lema (Propiedades básicas de la deducción)
Sea $(\Sigma, \tau)$ una teoría.
1. (Uso de Teoremas). Si $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$ y $(\Sigma \cup \{\varphi_1, \dots, \varphi_n\}, \tau) \vdash \varphi$, entonces $(\Sigma, \tau) \vdash \varphi$.
2. Supongamos $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$. Si $R$ es una regla distinta de GENERALIZACION o ELECCION y $\varphi$ se deduce de $\varphi_1, \dots, \varphi_n$ por la regla $R$, entonces $(\Sigma, \tau) \vdash \varphi$.
3. $(\Sigma, \tau) \vdash (\varphi \rightarrow \psi)$ si y solo si $(\Sigma \cup \{\varphi\}, \tau) \vdash \psi$.
> Nota: Explicado en Combo 4.

### Lema
Sea $(L, s, i)$ un reticulado terna y sea $\theta$ una congruencia de $(L, s, i)$. Entonces:
1. $(L/\theta, \tilde{s}, \tilde{i})$ es un reticulado terna.
2. El orden parcial $\tilde{\le}$ asociado al reticulado terna $(L/\theta, \tilde{s}, \tilde{i})$ cumple $$x/\theta \le y/\theta \; \Longleftrightarrow \; y\theta(x \ s \ y)$$

#### Proof
Recordemos las definiciones:
$$
x/\theta \ \tilde{s} \ y/\theta = (x \ s \ y)/\theta \qquad \text{y} \qquad x/\theta \ \tilde{i} \ y/\theta = (x \ i \ y)/\theta
$$

**(1)** Veamos entonces que $(L/\theta, \tilde{s}, \tilde{i})$ cumple las propiedades (I1)–(I7) para ser un reticulado terna. Sean $x/\theta, y/\theta, z/\theta \in L/\theta$ elementos arbitrarios.
- **(I1)** $x/\theta \ \tilde{s} \ x/\theta = (x \ s \ x)/\theta = x/\theta \quad \land \quad x/\theta \ \tilde{i} \ x/\theta = (x \ i \ x)/\theta = x/\theta$.
- **(I2)** $x/\theta \ \tilde{s} \ y/\theta = (x \ s \ y)/\theta = (y \ s \ x)/\theta = y/\theta \ \tilde{s} \ x/\theta$.
- **(I3)** Análogo al anterior.
- **(I4)** $(x/\theta \ \tilde{s} \ y/\theta) \ \tilde{s} \ z/\theta = ((x \ s \ y)/\theta \ \tilde{s} \ z/\theta) = ((x \ s \ y) \ s \ z)/\theta = (x \ s \ (y \ s \ z))/\theta = (x/\theta \ \tilde{s} \ (y \ s \ z)/\theta) = (x/\theta \ \tilde{s} \ (y/\theta \ \tilde{s} \ z/\theta))$.
- **(I5)** Análogo al anterior.
- **(I6)** $x/\theta \ \tilde{s} \ (x/\theta \ \tilde{i} \ y/\theta) = (x/\theta \ \tilde{s} \ (x \ i \ y)/\theta) = (x \ s \ (x \ i \ y))/\theta = x/\theta$.
- **(I7)** Análogo al anterior.

**(2)** Por definición de $\tilde{\le}$ tenemos que
$$
\begin{array}{cl}
& x/\theta \ \tilde{\le} \ y/\theta \\
& \Longleftrightarrow \quad y/\theta = x/\theta \ \tilde{s} \ y/\theta \quad (\text{def de} \; \tilde{\le})\\
& \Longleftrightarrow \quad y/\theta = (x \ s \ y)/\theta \quad (\text{def de} \; \tilde{s} ) \\
\end{array}
$$
como se da que $y/\theta = (x \ s \ y)/\theta$ y sabemos que $\theta$ es una relación de equivalencia, entonces al estar $y$ e $(x \ s \ y)$ en la misma clase tenemos que $y\theta(x \ s \ y)$. Por lo que:
$$
x/\theta \ \tilde{\le} \ y/\theta \quad \Longleftrightarrow \quad y\theta(x \ s \ y)
$$

### Lema
Sean $(L, s, i)$ y $(L', s', i')$ reticulados terna y sean $(L, \le)$ y $(L', \le')$ los posets asociados. Sea $F: \mathbb{L} \rightarrow \mathbb{L'}$ una función. Entonces $F$ es un isomorfismo de $(L, s, i)$ en $(L', s', i')$ si y solo si $F$ es un isomorfismo de $(L, \le)$ en $(L', \le')$.
> Nota: Explicado en Combo 4.


---
---
# Combo 8
### Lema
Supongamos que $F: \mathbb{A} \rightarrow \mathbb{B}$ es un isomorfismo. Sea $\varphi =_d \varphi(v_1, \dots, v_n) \in F^\tau$. Entonces
$$
\mathbb{A} \models \varphi[a_1, a_2, \dots, a_n] \quad  \Longleftrightarrow \quad \mathbb{B} \models \varphi[F(a_1), F(a_2), \dots, F(a_n)]$$
para cada $a_1, a_2, \dots, a_n \in A$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema análogo para términos*.
> - *Lema "Carácter recursivo de la notación $\mathbb{A} \models \varphi[a_1, \dots, a_n]$"*.
> - *Lema "Lectura única de fórmulas declaradas"*.

Llamaremos $(*)$ al *Lema Carácter recursivo de la notación $\mathbb{A} \models \varphi[a_1, \dots, a_n]$* y probaremos por inducción en $k$:

**$\text{Enu}_k$**: </br>
Supongamos que $F: \mathbb{A} \rightarrow \mathbb{B}$ es un isomorfismo. Sea $\varphi \in F_k^\tau$. Entonces $\mathbb{A} \models \varphi[a_1, \dots, a_n] \; \Longleftrightarrow \; \mathbb{B} \models \varphi[F(a_1), \dots, F(a_n)]$ para cada $a_1, \dots, a_n \in A$.

**$\text{Enu}_0$**: </br>
Sea $\varphi =_d \varphi(v_1, \dots, v_n) \in F_0^\tau$ y $a_1, \dots, a_n \in \mathbb{A}$. Por definición de $F_0^\tau$ tenemos dos casos:
- Si $\varphi = (t \equiv s)$ con $t, s \in T^\tau$: Por convención notacional tenemos $t =_d t(v_1, \dots, v_n)$ y $s =_d s(v_1, \dots, v_n)$.
  $$
  \begin{aligned}
  \mathbb{A} \models \varphi[a_1, \dots, a_n] \quad & \Longleftrightarrow \quad t^{\mathbb{A}}[a_1, \dots, a_n] = s^{\mathbb{A}}[a_1, \dots, a_n] && (*) \\
  & \Longleftrightarrow \quad F(t^{\mathbb{A}}[a_1, \dots, a_n]) = F(s^{\mathbb{A}}[a_1, \dots, a_n]) && (\text{por ser } F \text{ inyectiva}) \\
  & \Longleftrightarrow \quad t^{\mathbb{B}}[F(a_1), \dots, F(a_n)] = s^{\mathbb{B}}[F(a_1), \dots, F(a_n)] && (\text{Lema análogo para términos}) \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi[F(a_1), \dots, F(a_n)] && (*)
  \end{aligned}
  $$

- Si $\varphi = r(t_1, \dots, t_m)$ con $r \in \mathcal{R}_m$ y $t_1, \dots, t_m \in T^\tau$: Análogo, solo cambia que usamos $F$ isomorfismo. Por convención notacional $t_i =_d t_i(v_1, \dots, v_n)$:
  $$
  \begin{aligned}
  \mathbb{A} \models \varphi[a_1, \dots, a_n] \quad & \Longleftrightarrow \quad (t_1^{\mathbb{A}}[a_1, \dots, a_n], \dots, t_m^{\mathbb{A}}[a_1, \dots, a_n]) \in r^{\mathbb{A}} && (*) \\
  & \Longleftrightarrow \quad (F(t_1^{\mathbb{A}}[a_1, \dots, a_n]), \dots, F(t_m^{\mathbb{A}}[a_1, \dots, a_n])) \in r^{\mathbb{B}} && (\text{por ser } F \text{ iso}) \\
  & \Longleftrightarrow \quad (t_1^{\mathbb{B}}[F(a_1), \dots, F(a_n)], \dots, t_m^{\mathbb{B}}[F(a_1), \dots, F(a_n)]) \in r^{\mathbb{B}} && (\text{Lema análogo para términos}) \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi[F(a_1), \dots, F(a_n)] && (*)
  \end{aligned}
  $$

**$\text{Enu}_{k+1}$**: </br>
Supongamos que vale $\text{Enu}_k$ y veamos $\text{Enu}_{k+1}$. Sea $\varphi \in (F_{k+1}^\tau - F_k^\tau)$, ya que si $\varphi \in F_k^\tau$ es directo. Sean $a_1, \dots, a_n \in A$. Por el *Lema Lectura única de fórmulas declaradas*, para $\varphi$ tenemos los casos:
- Si $\varphi = (\varphi_1 \land \varphi_2)$: Por convención notacional $\varphi_i =_d \varphi_i(v_1, \dots, v_n)$. Además claramente $\varphi_1, \varphi_2 \in F_k^\tau$.
  $$
  \begin{aligned}
  \mathbb{A} \models \varphi[a_1, \dots, a_n] \quad & \Longleftrightarrow \quad \mathbb{A} \models \varphi_1[a_1, \dots, a_n] \text{ y } \mathbb{A} \models \varphi_2[a_1, \dots, a_n] && (*) \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi_1[F(a_1), \dots, F(a_n)] \text{ y } \mathbb{B} \models \varphi_2[F(a_1), \dots, F(a_n)] && (\text{por Enu}_k) \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi[F(a_1), \dots, F(a_n)] && (*)
  \end{aligned}
  $$

- Si $\varphi = (\varphi_1 \eta \varphi_2)$ con $\eta \in \{\lor, \rightarrow, \leftrightarrow\}$ o $\varphi = \neg \varphi_1$: Son análogos al caso anterior.
- Si $\varphi = \forall v_j \varphi_1$: Por convención notacional $\varphi_1 =_d \varphi_1(v_1, \dots, v_n)$. Claramente $\varphi_1 \in F_k^\tau$.
  $$
  \begin{aligned}
  \mathbb{A} \models \varphi[a_1, \dots, a_n] \quad & \Longleftrightarrow \quad \mathbb{A} \models \varphi_1[a_1, \dots, a_{j-1}, a, a_{j+1}, \dots, a_n] \text{ para cada } a \in \mathbb{A} && (*) \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi_1[F(a_1), \dots, F(a_{j-1}), F(a), F(a_{j+1}), \dots, F(a_n)] \text{ para cada } a \in \mathbb{A} && (\text{por Enu}_k) \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi_1[F(a_1), \dots, F(a_{j-1}), b, F(a_{j+1}), \dots, F(a_n)] \text{ para cada } b \in \mathbb{B} && (\text{por } F \text{ sobre}) \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi[F(a_1), \dots, F(a_n)] && (*)
  \end{aligned}
  $$

- Si $\varphi = \exists v \varphi_1$ con $v \notin \{v_1, \dots, v_n\}$: Por conv. notacional $\varphi_1 =_d \varphi_1(v_1, \dots, v_n, v)$. Claramente $\varphi_1 \in F_k^\tau$.
  $$
  \begin{aligned}
  \mathbb{A} \models \varphi[a_1, \dots, a_n] \quad & \Longleftrightarrow \quad \mathbb{A} \models \varphi_1[a_1, \dots, a_n, a] \text{ para algún } a \in \mathbb{A} && (*) \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi_1[F(a_1), \dots, F(a_n), F(a)] \text{ para algún } a \in \mathbb{A} && (\text{por Enu}_k) \\
  &\quad \text{(si tomamos tal elemento } a, \text{ tenemos que } F(a) \in B, \text{ por lo tanto)} && \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi_1[F(a_1), \dots, F(a_n), b] \text{ para algún } b \in \mathbb{B} && \\
  & \Longleftrightarrow \quad \mathbb{B} \models \varphi[F(a_1), \dots, F(a_n)] && (*)
  \end{aligned}
  $$

- Los casos $\varphi = \forall v \varphi_1$ con $v \notin \{v_1, \dots, v_n\}$ y $\varphi = \exists v_j \varphi_1$ son análogos a los anteriores.

Por lo tanto, el lema es valido por inducción.

### Lema
Sean $(P, \le)$ y $(P', \le')$ posets. Supongamos $F$ es un isomorfismo de $(P, \le)$ en $(P', \le')$.

(a) Para cada $S \subseteq P$ y cada $a \in P$, se tiene que $a$ es cota superior de $S$ si y solo si $F(a)$ es cota superior de $F(b), \forall b\in S$.

(b) Para cada $S \subseteq P$ se tiene que existe $\sup(S)$ si y solo si existe $\sup(F(S))$ y en el caso de que existan tales elementos se tiene que $F(\sup(S)) = \sup(F(S))$.

#### Proof
> Nota: En este caso $F(S) = \{F(a) : a \in S\}$.

**(a)** Sea $S \subseteq P$ y sea $a \in P$.
- Supongamos que $a$ es cota superior de $S$ (veamos entonces que $F(a)$ es cota superior de $F(S)$). Sea $b' \in F(S)$ arbitrario; como $F$ es sobre, existe $b \in S$ tal que $b' = F(b)$. Entonces $b \le a$ y por ser $F$ un isomorfismo tenemos que $F(b) \le' F(a)$, es decir, $b' \le' F(a)$. Como $b' \in F(S)$ era arbitrario, tenemos que $F(a)$ es cota superior de $F(S)$.
- Supongamos ahora que $F(a)$ es cota superior de $F(S)$ (veamos entonces que $a$ es cota superior de $S$). Sea $b \in S$ arbitrario. Entonces $F(b) \le' F(a)$ y por ser $F$ isomorfismo, tengo que $F^{-1}$ también es un homomorfismo. Por lo cual $F^{-1}(F(b)) \le F^{-1}(F(a))$, es decir, $b \le a$. Como $b \in S$ era arbitrario, tenemos que $a$ es cota superior de $S$.

**(b)** Sea $S \subseteq P$.
- Supongamos que existe $a = \sup(S)$ (veamos entonces que $F(a) = \sup(F(S))$). Por (a) tenemos que $F(a)$ es una cota superior de $F(S)$ arbitraria (falta ver que es la menor de ellas). Supongamos $b' \in P'$ es cota superior de $F(S)$. Como $F$ es sobre, existe $b \in P$ tal que $b' = F(b)$. Es decir, $F(b)$ es cota superior de $F(S)$, entonces por (a) tenemos que $b$ es cota superior de $S$. Como $a = \sup(S)$, se da que $a \le b$ y como $F$ es un isomorfismo, $F(a) \le' F(b)$, es decir, $F(a) \le' b'$. Pero como $b'$ era una cota superior arbitraria de $F(S)$, probamos que $F(a)$ es la menor cota superior. Entonces $F(a) = \sup(F(S))$, por lo tanto existe $\sup(F(S))$.
- Si existe $\sup(F(S))$ entonces existe $\sup(S)$, es análogo al anterior.
