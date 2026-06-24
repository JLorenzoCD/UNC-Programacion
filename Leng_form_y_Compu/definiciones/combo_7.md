# Combo 7.
### Defina cuando una función $f : D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$ es llamada $\Sigma$-Turing computable y defina "la maquina de Turing $M$ computa a la función $f$"

Para poder computar funciones mixtas con una maquina de Turing necesitaremos un simbolo para representar numeros sobre la cinta. Llamaremos a este simbolo unit y lo denotaremos con $|$.

Una maquina de Turing con unit es una 8-upla $M = (Q, \Sigma, \Gamma, \delta, q_0, B, |, F )$ tal que $(Q, \Sigma, \Gamma, \delta, q_0, B, F )$ es una maquina de Turing y $|$ es un simbolo distingido perteneciente a $\Gamma − (\{B\} \cup \Sigma)$.

Diremos que **una función $f : D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$, es llamada $\Sigma$-Turing computable** si existe una maquina de Turing con unit, $M = (Q, \Sigma, \Gamma, \delta, q_0, B, |, F )$, tal que:
1. Si $(\vec{x}, \vec{\alpha}) \in D_f$ , entonces hay un $p \in Q$ tal que
$$
⌊q_0B |^{x_1} B \cdots B |^{x_n} B \alpha_1 B \cdots B \alpha_m ⌋ \vdash^* ⌊p B |^{f(\vec{x}, \vec{\alpha})}⌋
$$
y $⌊p B |^{f(\vec{x}, \vec{\alpha})}⌋ \nvdash d$, para cada $d \in Des$

2. Si $(\vec{x}, \vec{\alpha}) \in ((\omega^n \times \Sigma^{*m}) − D_f)$, equivalentemente $(\vec{x}, \vec{\alpha}) \notin D_f$, entonces $M$ no se detiene partiendo de
$$
⌊q_0B |^{x_1} B \cdots B |^{x_n} B \alpha_1 B \cdots B \alpha_m ⌋
$$

Cuando una maquina de Turing con unit $M$ cumpla los items (1) y (2) de la definición anterior, diremos que **$M$ computa a la función $f$ o que $f$ es computada por $M$**. 
