# Combo 3
### Teorema (Lectura única de términos)
Dado $t \in T^\tau$ se da una de las siguientes:
1. $t \in (Var \cup \mathcal{C})$
2. Hay únicos $n \ge 1$, $f \in \mathcal{F}_n$, $t_1, \dots, t_n \in T^\tau$ tales que $t = f(t_1, \dots, t_n)$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema Menú para términos*: Supongamos $t \in T_{k+1}^\tau$, con $k \ge 0$. Entonces se da alguna de las siguientes: (1) $t \in Var \cup \mathcal{C}$; (2) $t = f(t_1, \dots, t_n)$, con $n \ge 1$, $f \in \mathcal{F}_n^\tau$ y $t_1, \dots, t_n \in T_k^\tau$.
> - *Lema Mordisqueo de Términos*: Sean $s, t \in T^\tau$ y supongamos que hay palabras $x, y, z$, con $y \neq \varepsilon$, tales que $s = xy$ y $t = yz$. Entonces $x = z = \varepsilon$ o $s, t \in \mathcal{C}$. *"En particular si un término es tramo inicial o final de otro término, entonces dichos términos son iguales"*.

Por el *Lema Menú para términos* tenemos que se dan (1) o (2) y obviamente no pueden darse ambas a la vez. Veamos que vale la unicidad de (2). Supongamos que
$$
t = f(t_1, \dots, t_n) = g(s_1, \dots, s_m)
$$
con $n, m \ge 1$, $f \in \mathcal{F}_n^\tau$, $g \in \mathcal{F}_m^\tau$, $t_1, \dots, t_n \in T^\tau$ y $s_1, \dots, s_m \in T^\tau$. Claramente $f = g$, por lo que $n = m$. Notar que si $t_1$ es tramo inicial de $s_1$ o $s_1$ es tramo inicial de $t_1$, el *Lema Mordisqueo de Términos* nos dice que $t_1 = s_1$. Con el mismo razonamiento, podemos probar que $t_i = s_i$ para cada $i = 1, \dots, n$.

### Lema
Supongamos que $F: \mathbb{A} \rightarrow \mathbb{B}$ es un isomorfismo. Sea $\varphi \in F^\tau$. Entonces $$\mathbb{A} \models \varphi[(a_1, a_2, ...)] \quad \; \Longleftrightarrow \; \quad \mathbb{B} \models \varphi[(F(a_1), F(a_2), ...)]$$ para cada $(a_1, a_2, ...) \in A^\mathbb{N}$. En particular $\mathbb{A}$ y $\mathbb{B}$ satisfacen las mismas sentencias de tipo $\tau$.

#### Proof
> **Resultados auxiliares utilizados:**
> - *Lema análogo para términos*: Sea $F: \mathbb{A} \rightarrow \mathbb{B}$ un isomorfismo. Entonces $F(t^{\mathbb{A}}[\vec{a}]) = t^{\mathbb{B}}[F(\vec{a})]$ para cada $t \in T^\tau$ y cada $\vec{a} \in A^\mathbb{N}$.
> - *Teorema de lectura única de fórmulas*: Dado $\varphi \in F^\tau$ se da una y solo una de las siguientes: (1) $\varphi = (t \equiv s)$ con $t, s \in T^\tau$, únicos; (2) $\varphi = r(t_1, \dots, t_n)$ con $r \in \mathcal{R}_n^\tau$, $t_1, \dots, t_n \in T^\tau$, únicos; (3) $\varphi = \neg \varphi_1$ con $\varphi_1 \in F_k^\tau$, único; (4) $\varphi = (\varphi_1 \eta \varphi_2)$ con $\eta \in \{\land, \lor, \rightarrow, \leftrightarrow\}$, $\varphi_1, \varphi_2 \in F_k^\tau$, únicos; (5) $\varphi = Q v \varphi_1$ con $Q \in \{\forall, \exists\}$, $\varphi_1 \in F_k^\tau$ y $v \in Var$, únicos.


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
