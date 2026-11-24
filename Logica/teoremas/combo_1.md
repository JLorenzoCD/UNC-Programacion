# Combo 1
### Teorema (Teorema del Filtro Primo)
Sea $(L, s, i)$ un reticulado terna distributivo y $F$ un filtro. Supongamos $x_0 \in (L - F)$. Entonces hay un filtro primo $P$ tal que $x_0 \notin P$ y $F \subseteq P$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema de Zorn*: Sea $(P, \le)$ un poset y supongamos que toda cadena en $P$ tiene al menos una cota superior. Entonces hay un elemento maximal en $(P, \le)$.
> - *Lema para $[S)$*: Sea $(L, s, i)$ un reticulado terna. Supongamos $S \subseteq L$ es no vacío. Entonces $[S)$ es un filtro de $(L, s, i)$.

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
> **Resultado auxiliar utilizado: (en combo 4)** *Lema (Propiedades básicas de $\vdash$)*: Sea $(\Sigma, \tau)$ una teoría.
> 1. (Uso de Teoremas) Si $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$ y $(\Sigma \cup \{\varphi_1, \dots, \varphi_n\}, \tau) \vdash \varphi$, entonces $(\Sigma, \tau) \vdash \varphi$.
> 2. Supongamos $(\Sigma, \tau) \vdash \varphi_1, \dots, \varphi_n$. Si $R$ es una regla distinta de GENERALIZACION y ELECCION y $\varphi$ se deduce de $\varphi_1, \dots, \varphi_n$ por la regla $R$, entonces $(\Sigma, \tau) \vdash \varphi$.
> 3. $(\Sigma, \tau) \vdash (\varphi \rightarrow \psi)$ sii $(\Sigma \cup \{\varphi\}, \tau) \vdash \psi$.

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


