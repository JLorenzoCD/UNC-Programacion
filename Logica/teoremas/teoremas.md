# Teoremas
---

# Combo 1
### Teorema (Teorema del Filtro Primo)
Sea $(L, s, i)$ un reticulado terna distributivo y $F$ un filtro. Supongamos $x_0 \in L - F$. Entonces hay un filtro primo $P$ tal que $x_0 \notin P$ y $F \subseteq P$.

### Lema (Propiedades básicas de la consistencia)
Sea $(\Sigma, \tau)$ una teoría.
1. Si $(\Sigma, \tau)$ es inconsistente, entonces $(\Sigma, \tau) \vdash \varphi$, para toda sentencia $\varphi$.
2. Si $(\Sigma, \tau)$ es consistente y $(\Sigma, \tau) \vdash \varphi$, entonces $(\Sigma \cup \{\varphi\}, \tau)$ es consistente.
3. Si $(\Sigma, \tau) \nvdash \neg \varphi$, entonces $(\Sigma \cup \{\varphi\}, \tau)$ es consistente.

---
# Combo 2
### Teorema 1 (Teorema de Dedekind)
Sea $(L, s, i)$ un reticulado terna. La relación binaria sobre $L$ definida por $$\le = \{(x, y) \in L^2 : x \ s \ y = y\}$$ es un orden parcial sobre $L$ para el cual se cumple que:
$$
\sup(\{x, y\}) = x \ s \ y \\
\inf(\{x, y\}) = x \ i \ y
$$
cualesquiera sean $x, y \in L$.

### Lema
Supongamos que $\vec{a}, \vec{b}$ son asignaciones tales que si $x_i \in Li(\varphi)$, entonces $a_i = b_i$. Entonces $\mathbb{A} \models \varphi[\vec{a}]$ sii $\mathbb{A} \models \varphi[\vec{b}]$.

---
# Combo 3
### Teorema (Lectura única de términos)
Dado $t \in T^\tau$ se da una de las siguientes:
1. $t \in (Var \cup \mathcal{C})$
2. Hay únicos $n \ge 1$, $f \in \mathcal{F}_n$, $t_1, \dots, t_n \in T^\tau$ tales que $t = f(t_1, \dots, t_n)$.

### Lema
Supongamos que $F: A \rightarrow B$ es un isomorfismo. Sea $\varphi \in F^\tau$. Entonces $$\mathbb{A} \models \varphi[(a_1, a_2, ...)] \quad \text{sii} \quad \mathbb{B} \models \varphi[(F(a_1), F(a_2), ...)]$$ para cada $(a_1, a_2, ...) \in A^\mathbb{N}$. En particular $\mathbb{A}$ y $\mathbb{B}$ satisfacen las mismas sentencias de tipo $\tau$.

### Teorema
Sea $T = (\Sigma, \tau)$ una teoría. Entonces $(S^\tau / \dashv\vdash_T, s^T, i^T, ^{c^T}, 0^T, 1^T)$ es un álgebra de Boole. Pruebe solo el ítem (6).

---
# Combo 4
### Lema (Propiedades básicas de la deducción)
Sea $(\Sigma, \tau)$ una teoría.
1. (Uso de Teoremas). Si $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$ y $(\Sigma \cup \{\varphi_1, \dots, \varphi_n\}, \tau) \vdash \varphi$, entonces $(\Sigma, \tau) \vdash \varphi$.
2. Supongamos $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$. Si $R$ es una regla distinta de GENERALIZACION o ELECCION y $\varphi$ se deduce de $\varphi_1, \dots, \varphi_n$ por la regla $R$, entonces $(\Sigma, \tau) \vdash \varphi$.
3. $(\Sigma, \tau) \vdash (\varphi \rightarrow \psi)$ si y solo si $(\Sigma \cup \{\varphi\}, \tau) \vdash \psi$.

### Teorema
Sea $\mathfrak{a}(B, s, i, ^c, 0, 1)$ un álgebra de Boole y sean $a, b \in B$. Se tiene que:
1. $(a \ i \ b)^c = a^c \ s \ b^c$
2. $a \ i \ b = 0$ si y solo si $b \le a^c$

### Lema
Sean $(L, s, i)$ y $(L', s', i')$ reticulados terna y sean $(L, \le)$ y $(L', \le')$ los posets asociados. Sea $F: L \rightarrow L'$ una función. Entonces $F$ es un isomorfismo de $(L, s, i)$ en $(L', s', i')$ si y solo si $F$ es un isomorfismo de $(L, \le)$ en $(L', \le')$.

---
# Combo 5
### Teorema (Teorema de Completitud)
Sea $T = (\Sigma, \tau)$ una teoría de primer orden. Si $\mathbb{T} \models \varphi$ entonces $T \vdash \varphi$.
> Haga solo el caso en que $\tau$ tiene una cantidad infinita de nombres de cte que no ocurren en las sentencias de $\Sigma$. En la exposición de la prueba no es necesario que demuestre los ítems (1) y (5).

---
# Combo 6
### Teorema (Teorema de Completitud)
Sea $T = (\Sigma, \tau)$ una teoría de primer orden. Si $\mathbb{T} \models \varphi$ entonces $T \vdash \varphi$.
> Haga solo el caso en que $\tau$ tiene una cantidad infinita de nombres de cte que no ocurren en las sentencias de $\Sigma$. En la exposición de la prueba no es necesario que demuestre los ítems: (1), (2), (3) y (4).

---
# Combo 7
### Lema (Propiedades básicas de la deducción)
Sea $(\Sigma, \tau)$ una teoría.
1. (Uso de Teoremas). Si $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$ y $(\Sigma \cup \{\varphi_1, \dots, \varphi_n\}, \tau) \vdash \varphi$, entonces $(\Sigma, \tau) \vdash \varphi$.
2. Supongamos $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$. Si $R$ es una regla distinta de GENERALIZACION o ELECCION y $\varphi$ se deduce de $\varphi_1, \dots, \varphi_n$ por la regla $R$, entonces $(\Sigma, \tau) \vdash \varphi$.
3. $(\Sigma, \tau) \vdash (\varphi \rightarrow \psi)$ si y solo si $(\Sigma \cup \{\varphi\}, \tau) \vdash \psi$.
> Nota: Explicado en Combo 4

### Lema
Sea $(L, s, i)$ un reticulado terna y sea $\theta$ una congruencia de $(L, s, i)$. Entonces:
1. $(L/\theta, \tilde{s}, \tilde{i})$ es un reticulado terna.
2. El orden parcial $\tilde{\le}$ asociado al reticulado terna $(L/\theta, \tilde{s}, \tilde{i})$ cumple $$x/\theta \le y/\theta \text{ sii } y\theta(x \ s \ y)$$

### Lema
Sean $(L, s, i)$ y $(L', s', i')$ reticulados terna y sean $(L, \le)$ y $(L', \le')$ los posets asociados. Sea $F: L \rightarrow L'$ una función. Entonces $F$ es un isomorfismo de $(L, s, i)$ en $(L', s', i')$ si y solo si $F$ es un isomorfismo de $(L, \le)$ en $(L', \le')$.
> Nota: Explicado en Combo 4

---
# Combo 8
### Lema
Supongamos que $F: \mathbb{A} \rightarrow \mathbb{B}$ es un isomorfismo. Sea $\varphi =_d \varphi(v_1, \dots, v_n) \in F^\tau$. Entonces
$$
\mathbb{A} \models \varphi[a_1, a_2, \dots, a_n] \quad \text{sii} \quad \mathbb{B} \models \varphi[F(a_1), F(a_2), \dots, F(a_n)]$$
para cada $a_1, a_2, \dots, a_n \in A$.

### Lema
Sean $(P, \le)$ y $(P', \le')$ posets. Supongamos $F$ es un isomorfismo de $(P, \le)$ en $(P', \le')$.

(a) Para cada $S \subseteq P$ y cada $a \in P$, se tiene que $a$ es cota superior de $S$ si y solo si $F(a)$ es cota superior de $F(b), \forall b\in S$.

(b) Para cada $S \subseteq P$ se tiene que existe $\sup(S)$ si y solo si existe $\sup(F(S))$ y en el caso de que existan tales elementos se tiene que $F(\sup(S)) = \sup(F(S))$.
