# Combo 14. Explique en forma detallada la notación lambda
- La notación depende de un alfabeto fijado previamente.
- No todas las expresiones pueden ser lambdificables.


#### Fijado anteriormente un alfabeto $\Sigma$. Las excreciones que cumplas las siguiente condiciones serán llamada "expresiones lambdificables":

- Pueden tener variables numéricas de $\omega$. Se las puede representar con letras comunes del alfabeto español (p.e.j. $x, y, z, w, b, x_1, y_1, etc$).
- Pueden tener variables alfabéticas (palabras de $\Sigma$). Se las puede representar con letras griegas.
- Puede ocurrir que al evaluar las variables estas expresiones no estén definidas (p.e.j. $Pred(\alpha), \quad \text{notar que } \alpha \neq \epsilon$)
- El resultado obtenido al evaluar la expresión **deberá** estar contenida en $\omega$ o en $\Sigma^*$.
- Se puede utilizar **lenguaje coloquial castellano** (no toda expresión son operaciones matemáticas bien definidas)
- Al evaluar las expresiones booleanas, se asume que el valor que toma esta en el conjunto $\{ 1, 0 \} \in \omega$.
- Se puede no utilizar variables y en su lugar utilizar constantes, mientras que se cumpla lo anterior.

### Notación lambda
Dado un alfabeto finito $\Sigma$ y una expresión lambdificable con respecto a $\Sigma$, donde $x_1, \cdots, x_n$ son todas las variables numéricas que pueden ocurrir en la expresión E y $\alpha_1, \cdots, \alpha_m$ son todas las variables alfabéticas que pueden ocurrir en la expresión E, entonces:

$$ f = \lambda x_1 \cdots x_n \alpha_1 \cdots \alpha_m [E] $$

denotara la función f definida por:
- $D_f = $ conjunto de las $(x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m) \in \omega^n \times \Sigma^{m*}$ tales que E esta definida con la $(n + m)$-upla.
- $f(x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m)$ = valor que asume o representa E cuando la evaluamos con la $(n + m)$-upla.

> Notar que f es $\Sigma$-Mixta de tipo $(n, m, s), s \in \{ \#, * \}$.
