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
