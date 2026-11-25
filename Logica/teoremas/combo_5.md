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
