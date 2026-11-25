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
> **Resultado auxiliar utilizado:** *Lema análogo para Términos*: Sea $\mathbb{A}$ una estructura de tipo $\tau$ y sea $t \in T^\tau$. Supongamos que $\vec{a}, \vec{b}$ son asignaciones tales que $a_i = b_i$ cada vez que $x_i$ ocurre en $t$. Entonces $t^{\mathbb{A}}[\vec{a}] = t^{\mathbb{A}}[\vec{b}]$.

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
