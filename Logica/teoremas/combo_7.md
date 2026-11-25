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
