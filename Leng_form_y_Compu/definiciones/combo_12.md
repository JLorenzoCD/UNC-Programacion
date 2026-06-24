# Combo 12.
### Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-computable, cuando es llamado $\Sigma$-enumerable y defina "el programa $\mathcal{P}$ enumera a S"

Un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ **sera llamado $\Sigma$-computable** cuando la función $\chi^{\omega^n \times \Sigma^{*m}}_S$ sea $\Sigma$-computable. O sea que $S \subseteq \omega^n \times \Sigma^{*m}$ es $\Sigma$-computable sii hay un programa $\mathcal{P} \in Pro^\Sigma$ el cual computa a $\chi^{\omega^n \times \Sigma^{*m}}_S$, es decir:
- Si $(\vec{x}, \vec{\alpha}) \in S$, entonces $\mathcal{P}$ se detiene partiendo desde $|| x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||$ y la variable N1 queda con contenido igual a 1.
- Si $(\vec{x}, \vec{\alpha}) \notin S$, entonces $\mathcal{P}$ se detiene partiendo desde $|| x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||$ y la variable N1 queda con contenido igual a 0.

Un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ **sera llamado $\Sigma$-enumerable** cuando sea vacio o haya una función $F : \omega \longmapsto \omega^n \times \Sigma^{*m}$ tal que $I_F = S$ y $F{(i)}$ sea $\Sigma$-computable, para cada $i \in \{ 1, \cdots, n + m \}$.

El programa $\mathcal{P}$ **enumera a S** si: <br>
(a) Para cada $x \in \omega$, tenemos que $\mathcal{P}$ se detiene partiendo desde el estado $|| x ||$ y llega a un estado de la forma $((x_1 , \cdots, x_n, y_1 , \cdots), (\alpha_1 , \cdots, \alpha_m , \beta_1 , \cdots))$, donde $(x_1 , \cdots, x_n , \alpha_1 , \cdots, \alpha_m ) \in S$. <br>
(b) Para cada $(x_1 , \cdots, x_n , \alpha_1 , \cdots, \alpha_m ) ∈ S$ hay un $x \in \omega$ tal que $\mathcal{P}$ se detiene partiendo desde el estado $|| x ||$ y llega a un estado de la forma $((x_1 , \cdots, x_n, y_1 , \cdots), (\alpha_1 , \cdots, \alpha_m , \beta_1 , \cdots))$
