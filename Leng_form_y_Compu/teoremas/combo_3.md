# Combo 3.
### Teorema (Godel vence a Neumann). Si $f : D_f \subseteq \omega^n \times \Sigma^{∗m} \longmapsto \Sigma^{∗}$ es $\Sigma$-computable, entonces $f$ es $\Sigma$-recursiva.

> Similar al combo 9, cambia conjunto de llegada

Función $\Phi_*^{n,m}$: <br>
Para $n, m \in \omega$ definamos la función $\Phi_*^{n,m}$ de la siguiente manera:
$$
\begin{aligned}

D_{\Phi_*^{n,m}} & = \left\{ (\vec{x},\vec{\alpha},\mathcal{P}) \in \omega^{n} \times \Sigma^{*m} \times \mathrm{Pro}^{\Sigma} :(\vec{x},\vec{\alpha}) \in D_{\Psi_{\mathcal{P}}^{n,m,*}} \right\} \\

\Phi_*^{n,m}(\vec{x},\vec{\alpha},\mathcal{P}) & =\Psi_{\mathcal{P}}^{n,m,*}(\vec{x},\vec{\alpha}) \text{, para cada }(\vec{x},\vec{\alpha},\mathcal{P}) \in D_{\Phi_*^{n,m}}

\end{aligned}
$$
Nótese que
$$ \Phi_{*}^{n,m} = \lambda\vec{x}\vec{\alpha}\mathcal{P}\left[\Psi_{\mathcal{P}}^{n,m,*}(\vec{x},\vec{\alpha}) \right] $$
Por teorema, tenemos que $\Phi_*^{n,m}$ es $(\Sigma \cup \Sigma^p)$-R

Proof

Sea $\mathcal{P}_0$ un programa que compute a $f$. Primero veremos que $f$ es $(\Sigma \cup \Sigma^p)$-R. Note que
$$ f=\Phi_{*}^{n,m}\circ\left[p_{1}^{n,m},...,p_{n+m}^{n,m},C_{\mathcal{P}_{0}}^{n,m}\right] $$

donde cabe destacar que $p_1^{n, m}, \cdots, p_{n + m}^{n, m}$ son proyecciones respecto al alfabeto $\Sigma \cup \Sigma^p$, es decir que tienen dominio $\omega^n \times (\Sigma \cup \Sigma^p)^{*m}$. Ya que $\Phi_*^{n,m}$ es $(\Sigma \cup \Sigma^p)$-R tenemos que f también lo es.

Si se fija el $\mathcal{P}_0$, por independencia del alfabeto tendríamos que f es $\Sigma$-R.

---
### Teorema (Caracterización de conjuntos $\Sigma$-efectivamente computables).
Sea $S \subseteq \omega^n \times \Sigma^{∗m}$. Son equivalentes <br>
(a) $S$ es $\Sigma$-efectivamente computable <br>
(b) $S$ y $(\omega^n \times \Sigma^{∗m}) − S$ son $\Sigma$-efectivamente enumerables

> Haga solo (b) implica (a). La prueba de este resultado esta al final de la Guı́a 3

Proof

$(b) \Longrightarrow (a)$ <br>
- Si $S = \emptyset$ ó $S = \omega^n \times \Sigma^{*m}$, seria evidente que cumple (a)
- Supongamos que $S \neq \emptyset$ y $S \neq \omega^n \times \Sigma^{*m}$.

Sean $\mathbb{P}_1$ un procedimiento efectivo que enumere a S y $\mathbb{P}_2$ un procedimiento efectivo que enumere a $(\omega^n \times \Sigma^{*m}) - S$. Es facil ver que el siguiente procedimiento computa el predicado $\chi^{\omega^n \times \Sigma^{*m}}_S$:

Dato de entrada: $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}$
- Etapa 1: Darle a la variable T el valor 0.
- Etapa 2: Realizar $\mathbb{P}_1$ con el valor de T como dato de entrada para obtener de salida la upla $(\vec{y}, \vec{\beta})$.
- Etapa 3: Realizar $\mathbb{P}_2$ con el valor de T como dato de entrada para obtener de salida la upla $(\vec{z}, \vec{\gamma})$.
- Etapa 4: Si $(\vec{y}, \vec{\beta}) = (\vec{x}, \vec{\alpha})$, entonces detenerse y dar como dato de salida el valor 1. Si $(\vec{z}, \vec{\gamma}) = (\vec{x}, \vec{\alpha})$, entonces detenerse y dar como dato de salida el valor 0. Si no sucede ninguna de las dos posibilidades mencionadas, aumentar en 1 el valor de la variable T y dirigirse a Etapa2.
