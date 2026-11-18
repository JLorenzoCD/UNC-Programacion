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
Sean $(L, s, i)$ y $(L', s', i')$ reticulados terna y sean $(L, \le)$ y $(L', \le')$ los posets asociados. Sea $F: \mathbb{L} \rightarrow \mathbb{L'}$ una función. Entonces $F$ es un isomorfismo de $(L, s, i)$ en $(L', s', i')$ si y solo si $F$ es un isomorfismo de $(L, \le)$ en $(L', \le')$.
> Nota: Explicado en Combo 4
