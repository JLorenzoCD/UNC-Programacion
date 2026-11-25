# Combo 8
### Lema
Supongamos que $F: \mathbb{A} \rightarrow \mathbb{B}$ es un isomorfismo. Sea $\varphi =_d \varphi(v_1, \dots, v_n) \in F^\tau$. Entonces
$$
\mathbb{A} \models \varphi[a_1, a_2, \dots, a_n] \quad  \Longleftrightarrow \quad \mathbb{B} \models \varphi[F(a_1), F(a_2), \dots, F(a_n)]$$
para cada $a_1, a_2, \dots, a_n \in A$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema análogo para términos*: Sea $F: \mathbb{A} \rightarrow \mathbb{B}$ un isomorfismo. Sea $t =_d t(v_1, \dots, v_n) \in T^\tau$. Entonces $F(t^{\mathbb{A}}[a_1, \dots, a_n]) = t^{\mathbb{B}}[F(a_1), \dots, F(a_n)]$ para cada $t \in T^\tau$ y cada $a_1, \dots, a_n \in A$.
> - *Lema Carácter recursivo de la notación $\mathbb{A} \models \varphi[a_1, \dots, a_n]$*.
> - *Lema Lectura única de fórmulas declaradas*.

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