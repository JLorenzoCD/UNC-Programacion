# Combo 6
### Teorema (Teorema de Completitud)
Sea $T = (\Sigma, \tau)$ una teoría de primer orden. Si $\mathbb{T} \models \varphi$ entonces $T \vdash \varphi$.
> Haga solo el caso en que $\tau$ tiene una cantidad infinita de nombres de cte que no ocurren en las sentencias de $\Sigma$. En la exposición de la prueba no es necesario que demuestre los ítems: (1), (2), (3) y (4).

#### Proof
Asumo los ítems (1) al (4) y el modelo $\mathbb{A}_{\mathcal{U}}$:

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


Por lo que (5) esta probado por inducción:
