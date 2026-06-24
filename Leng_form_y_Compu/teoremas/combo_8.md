# Combo 8.
### Lema. Supongamos $\Sigma \supseteq \Sigma^p$. Entonces $AutoHalt^\Sigma$ no es $\Sigma$-recursivo.

Proof

Supongamos que $AutoHalt^\Sigma$ es $\Sigma$-recursivo. Por el segundo manantial de macros tenemos que hay una macro
$$
\left[ \mathrm{IF} \ AutoHalt^\Sigma(\mathrm{W1}) \ \mathrm{GOTO \ A1} \right]
$$

Sea $\mathcal{P}_0$ el siguiente programa:
$$
\mathrm{L1} \quad \left[ \mathrm{IF} \ AutoHalt^\Sigma(\mathrm{P1}) \ \mathrm{GOTO \ L1} \right]
$$

Notar que $\mathcal{P}_0$ termina partiendo desde $|| \mathcal{P}_0 ||$ si y solo si $AutoHalt^\Sigma(\mathcal{P}_0) = 0$, lo cual produce una contradicción por la definición de $AutoHalt^\Sigma$.

> $\forall \mathcal{P} \in Pro^\Sigma$ tenemos que $$ AutoHalt^\Sigma(\mathcal{P}) = 1 \text{ sii } \mathcal{P} \text{ se detiene partiendo del estado } ||\mathcal{P}|| $$

---
### Teorema. Supongamos $\Sigma \supseteq \Sigma^p$ . Entonces $AutoHalt^\Sigma$ no es $\Sigma$-efectivamente computable.
> Es decir no hay ningún procedimiento efectivo que decida si un programa de $\mathcal{S}^\Sigma$ termina partiendo de si mismo.

Proof

Si $AutoHalt^\Sigma$ fuera $\Sigma$-C, la Tesis de Church nos diría que es $\Sigma$-R, contradiciendo el lema anterior.

---
### Lema.
Supongamos que $\Sigma \supseteq \Sigma^p$ . Entonces
$$ A = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 1 \} $$
es $\Sigma$-RE. y no es $\Sigma$-R. Mas aun el conjunto
$$ N = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 0 \} $$
no es $\Sigma$-RE

Proof

Para ver que $A$ es $\Sigma$-RE se lo puede hacer imperativamente dando un programa (usando macros) que enumere a $A$. De esta forma probaríamos que $A$ es $\Sigma$-E y por lo tanto es $\Sigma$-RE Daremos ahora una prueba no imperativa  de este hecho, es decir mas propia del paradigma funcional. Sea $P = \lambda t \mathcal{P} \left[ Halt^{0,1}(t, \mathcal{P}, \mathcal{P}) \right]$. Note que P es $\Sigma$-PR por lo que $M(P)$ es $\Sigma$-R. Ademas note que $D_{M(P)} = A$, **lo cual implica que $A$ es $\Sigma$-RE**.

Supongamos ahora que $N$ es $\Sigma$-RE Entonces la función $C_0^{0, 1}|_N$ es $\Sigma$-R ya que $C_0^{0, 1}$ lo es. Ademas ya que $A$ es $\Sigma$-RE. tenemos que $C_1^{0, 1}|_A$ es $\Sigma$-R.

Ya que
$$
AutoHalt^\Sigma = C_1^{0, 1}|_A \cup C_0^{0, 1}|_N
$$

el lema de division por casos nos dice que $AutoHalt^\Sigma$ es $\Sigma$-R, contradiciendo el lema anterior. **Esto prueba que $N$ no es $\Sigma$-RE**.

Finalmente supongamos A es $\Sigma$-R. Entonces el conjunto
$$
N = (\Sigma^* − A) \cap Pro^\Sigma
$$
deberia serlo, lo cual es absurdo. Hemos probado entonces que **$A$ no es $\Sigma$-R**.

---
### Teorema (Neumann vence a Godel). Si $h$ es $\Sigma$-recursiva, entonces $h$ es $\Sigma$-computable.
> (En la inducción de la prueba hacer solo el caso $h = M(P)$)

Proof

Probemos por inducción en k que si $h \in R^\Sigma_k$, entonces h es $\Sigma$-C.

El caso $k = 0$ es trivial ya que las funciones existentes en $R^\Sigma_0$ se pueden realizar con las instrucciones básicas en $\mathcal{S}^\Sigma$.

Caso $h \in R^\Sigma_k$: Valido por ser hipótesis inductiva.

- Sea $h \in (R^\Sigma_{k+1} - R^\Sigma_k)$. Hay varios casos.

Caso $h=R(f,\mathcal{G})$. (no se hace).

Caso $h = M(P)$, con $P:\omega\times\omega^{n}\times\Sigma^{*m}\longrightarrow\omega$, un predicado perteneciente a $R^\Sigma_k$. Por hipótesis inductiva, P es $\Sigma$-C y por lo tanto tenemos una macro
$$
\left[\mathrm{IF}\;P(\mathrm{V}1,\cdots,\mathrm{V}\overline{n+1},\mathrm{W}1,\cdots,\mathrm{W}\bar{m})\;\mathrm{GOTO}\;\mathrm{A}1\right]
$$
lo cual nos permite realizar el siguiente programa:
$$
\begin{array}{ll}
\mathrm{L}2 &
\left[\mathrm{IF}\;P(\mathrm{N}\overline{n+1},\mathrm{N}1,\cdots,\mathrm{N}\overline{n},\mathrm{P}1,\cdots,\mathrm{P}\overline{m})\;\mathrm{GOTO}\;\mathrm{L}1\right]\\
& \mathrm{N}\overline{n+1}\longrightarrow\mathrm{N}\overline{n+1}+1\\
& \mathrm{GOTO}\;\mathrm{L}2\\
\mathrm{L}1 & \mathrm{N}1\longrightarrow\mathrm{N}\overline{n+1}
\end{array}
$$

Claramente este programa computa a $h$.
