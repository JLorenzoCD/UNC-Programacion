# Definiciones
---
# Combo 1
### 1. Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-recursivo (no hace falta que defina "función $\Sigma$-recursiva")
Es llamado $\Sigma$-recursivo sii su función de caracterización $\chi^{\omega^n \times \Sigma^{*m}}_S$ es $\Sigma$-recursivo.

###  2. Defina $⟨s_1 , s_2 , \cdots⟩$
Se utiliza para denotar el numero $x = \prod_{i=1}^{\infty} pr(i)^{s_i}$.

###  3. Defina "f es una función $\Sigma$-mixta"
Sea $\Sigma$ un alfabeto finito. Una función f es $\Sigma$-mixta si cumple:

- $\exists n,m \in \omega$ tal que $D_f \subseteq \omega^n \times \Sigma^{*m}$
- $I_f \subseteq \omega$ o $I_f \subseteq \Sigma^{*}$

###  4. Defina "familia $\Sigma$-indexada de funciones"
Dado un alfabeto $\Sigma$ una familia $\Sigma$-indexada de funciones seria una función $\mathcal{G}$ tal que $D_{\mathcal{G}} = \Sigma$, $\forall a \in \Sigma$ se tiene que $\mathcal{G}(a)$ es una función.

###   5. Defina $R(f, \mathcal{G})$ (haga el caso de valores numéricos)
Sea
$$ f: S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \longmapsto \omega $$
con $S_1, \cdots, S_n \subseteq \omega$ y $L_1, \cdots, L_m \subseteq \Sigma^*$ conjuntos no vacíos.

Sea $\mathcal{G}$ una familia $\Sigma$-indexada de funciones tales que:
$$ \mathcal{G}_a: \omega \times S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \times \Sigma^* \longmapsto \omega $$

Tomando a $\mathcal{G}(a) = \mathcal{G}_a, \forall a \in \Sigma$

Tenemos que:
$$ R(f, \mathcal{G}) : S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m \times \Sigma^* \longmapsto \omega $$

$$
\begin{aligned}
R(f, \mathcal{G})(\vec{x}, \vec{\alpha}, \epsilon) & = f(\vec{x}, \vec{\alpha}) \\
R(f, \mathcal{G})(\vec{x}, \vec{\alpha}, \alpha a) & = \mathcal{G}_a(R(f, \mathcal{G})(\vec{x}, \vec{\alpha}, \alpha), \vec{x}, \vec{\alpha}, \alpha)
\end{aligned}
$$

Diremos que $R(f, \mathcal{G})$ es obtenida por recursion primitiva a partir de $f$ y $\mathcal{G}$


---
---
# Combo 2. Defina
### (1) $d \vdash^n d'$ y $d \vdash d'$ (no hace falta que defina $\vdash$)
Para $d, d' \in Des$ y $n \in \omega$, escribiremos $d \vdash^n d'$ si existen $d_1 , \cdots, d_{n+1} \in Des$ tales que

$$
\begin{aligned}
d & = d_1 \\
d' & = d_{n+1} \\ \\
d_i & \vdash d_{i+1} , \quad i = 1, \cdots, n. \\
\end{aligned}
$$

Finalmente definamos
$$ d \vdash^* d' \quad \text{sii} \quad (\exists n \in \omega) \quad d \vdash^n d'. $$

### (2) $L(M)$
Diremos que una palabra $\alpha \in \Sigma^*$ es aceptada por $M$ por alcance de estado final cuando

$$ ⌊q_0 B \alpha⌋ \vdash^* d, \quad \text{con d tal que } St(d) \in F $$

El lenguage aceptado por $M$ por alcance de estado final se define de la siguiente manera

$$ L(M) = \{ \alpha \in \Sigma^∗ : \alpha \text{ es aceptada por M por alcance de estado final} \} $$


### (3) "$f$ es una función de tipo $(n, m, s)$"
Dada una función $\Sigma$-mixta $f$ y $n, m \in \omega$ tales que $D_f \subseteq \omega^n \times \Sigma^{*m}$ diremos que:
- $f$ es del tipo $(n, m, \#)$ si $I_f \subseteq \omega$
- $f$ es del tipo $(n, m, *)$ si $I_f \subseteq \Sigma^*$

### (4) $(x)$
Dando $x \in \mathbb{N}$ donde $(x) =$ única infinitupla $(s_1, s_2, \cdots) \in \omega^{[\mathbb{N}]}$ tal que:

$$ x = ⟨ s_1, s_2, \cdots ⟩ = \prod_{i=1}^{\infty} pr(i)^{s_i} $$

### (5) $(x)_i$
Dadas $x, i \in \mathbb{N}$:

$$
\begin{aligned}
(x)_i & = \max_t(pr(i)^t \ \ \text{divide a x}) \\
(x)_i & = \text{exponente de pr(i) en la (única posible) factorización de x como producto de primos}  \\
(x)_i & = s_i = \text{i-esimo elemento de la infinitupla } (x) \\
\end{aligned}
$$


---
---
# Combo 3.
### (1) Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-recursivamente enumerable (no hace falta que defina "función $\Sigma$-recursiva")
Es llamado $\Sigma$-RE cuando $S = \emptyset$ o haya una función $F: \omega \longmapsto \omega^n \times \Sigma^{*m}$ tal que $I_F = S$ y $F_{(i)}$ sea $\Sigma$-R $\forall i \in \{ 1, \cdots, n + m \}$.

### (2) Defina $s^{\le}$
Sea $\Sigma$ un alfabeto no vacio y supongamos $\le$ orden total sobre $\Sigma$. Supongamos $\Sigma = \{ a_1, \cdots, a_n \}$ con $a_1 \lt \cdots \lt a_n$.

$$ s^\le : \Sigma^* \longmapsto \Sigma^* $$

$$
\begin{aligned}
s^\le((a_n)^m) & = (a_1)^{m+1}, \quad m \in \omega \\
s^\le(\alpha a_i (a_n)^m) & = \alpha a_{i+1} (a_1)^m, \quad \alpha \in \Sigma^* \wedge 1 \le i \lt n \wedge m \in \omega
\end{aligned}
$$

### (3) Defina $*^{\le}$
Sea $\Sigma$ un alfabeto no vacio y supongamos $\le$ orden total sobre $\Sigma$. Supongamos $\Sigma = \{ a_1, \cdots, a_n \}$ con $a_1 \lt \cdots \lt a_n$.

$$ *^\le : \omega \longmapsto \Sigma^* $$

$$
\begin{aligned}
*^\le(0) & = \epsilon \\
*^\le(i + 1) & = s^\le(*^\le(i))
\end{aligned}
$$

### (4) Defina $\#^{\le}$
Lema:
Sea $\Sigma$ un alfabeto no vacio y supongamos $\le$ orden total sobre $\Sigma$. Supongamos $\Sigma = \{ a_1, \cdots, a_n \}$ con $a_1 \lt \cdots \lt a_n$. Entonces para cada $\alpha \in \Sigma^+$ hay únicos $k \in \omega$ y $i_0, i_1, \cdots, i_k \in \{ 1, \cdots, n\}$ tal que:
$$ \alpha = a_{i_k} \cdots a_{i_0} $$
(notar que $k = |\alpha| - 1$).

$$ \#^\le : \Sigma^* \longmapsto \omega $$

$$
\begin{aligned}
\#^\le(\epsilon) & = 0 \\
\#^\le(a_{i_k} \cdots a_{i_0}) & = i_k n^k + \cdots + i_0 n^0 
\end{aligned}
$$


---
---
# Combo 4.
### Defina cuando una función $f : D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$ es llamada $\Sigma$-efectivamente computable y defina ”el procedimiento $\mathbb{P}$ computa a la función $f$”

Una función $\Sigma$-mixta $f : D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$ sera llamada $\Sigma$-efectivamente computable si hay un procedimiento efectivo $\mathbb{P}$ tal que
1. El conjunto de datos de entrada de $\mathbb{P}$ es $\omega^n \times \Sigma^{*m}$
2. El conjunto de datos de salida esta contenido en $\omega$.
3. Si $(\vec{x}, \vec{\alpha}) \in D_f$ , entonces $\mathbb{P}$ se detiene partiendo de $(\vec{x}, \vec{\alpha})$, dando como dato de salida $f(\vec{x}, \vec{\alpha})$.
4. Si $(\vec{x}, \vec{\alpha}) \in ((\omega^n \times \Sigma^{*m}) − D_f)$, equivalentemente $(\vec{x}, \vec{\alpha}) \notin D_f$, entonces $\mathbb{P}$ no se detiene partiendo desde $(\vec{x}, \vec{\alpha})$.

Cuando un procedimiento $\mathbb{P}$ cumpla los items (1), (2), (3) y (4) de arriba diremos que $\mathbb{P}$ computa a la funcion $f$ o que $f$ es computada por $\mathbb{P}$.


---
---
# Combo 5.
### Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-efectivamente computable y defina: "el procedimiento efectivo $\mathbb{P}$ decide la pertenencia a $S$"

Sea $X$ un conjunto cualquiera y sea $S \subseteq X$. Usaremos $\chi^{X}_S$ para denotar la función

$$
\begin{aligned}

    \chi^{X}_S \ : \ \ \ & X & \longmapsto & \quad \omega \\

    & x & \longmapsto & \left\{ \begin{aligned}
        1 & : \ x \in S \\
        0 & : \ x \notin S

        \end{aligned} \right.

\end{aligned}
$$

Un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ sera llamado $\Sigma$-efectivamente computable cuando la función $\chi^{\omega^n \times \Sigma^{*m}}_S$ sea $\Sigma$-efectivamente computable.

Si $\mathbb{P}$ es un procedimiento efectivo el cual computa a $\chi^{\omega^n \times \Sigma^{*m}}_S$, diremos que $\mathbb{P}$ decide la pertenecia a $S$, con respecto al conjunto $\omega^n \times \Sigma^{*m}$,  es decir:

- El conjunto de datos de entrada de $\mathbb{P}$ es $\omega^n \times \Sigma^{*m}$ , siempre termina y da como dato de salida un elemento de $\{0, 1 \}$.
- Dado $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}$, $\mathbb{P}$ da como salida al numero $1$ si $(\vec{x}, \vec{\alpha}) \in S$ y al numero $0$ si $(\vec{x}, \vec{\alpha}) \notin S$.


---
---
# Combo 6.
### Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-efectivamente enumerable y defina: "el procedimiento efectivo $\mathbb{P}$ enumera a $S$"

Prev

Supongamos que $k, l, n, m \in \omega$ y que $F : D_F \subseteq \omega^k \times \Sigma^{*l} \longmapsto \omega^n \times \Sigma^{*m}$. Supongamos ademas que $n + m \ge 1$. Entonces denotaremos con $F_{(i)}$ a la función $p_i \circ F$.

Notar que:
$$
\begin{aligned}

    F_{(i)} &: D_F \subseteq \omega^k \times \Sigma^{*l} \longmapsto \omega, \quad \text{para cada} \ \ i = 1, \cdots, n \\
    F_{(i)} &: D_F \subseteq \omega^k \times \Sigma^{*l} \longmapsto \Sigma^{*}, \quad \text{para cada} \ \ i = n + 1, \cdots, n + m

\end{aligned}
$$
Por lo cual cada una de las funciones $F_{(i)}$ son $\Sigma$-mixtas.

Def

Un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ **sera llamado $\Sigma$-efectivamente enumerable** cuando sea vacio o haya una función $F :\omega \longmapsto \omega^n \times \Sigma^{*m}$ tal que $I_F = S$ y $F_{(i)}$ sea $\Sigma$-efectivamente computable, para cada $i \in \{ 1, \cdots, n + m \}$.

El procedimiento efectivo **$\mathbb{P}$ enumera a $S$** si:
1. El conjunto de datos de entrada de $\mathbb{P}$ es $\omega$.
2. $\mathbb{P}$ se detiene para cada $x \in \omega$.
3. El conjunto de datos de salida de $\mathbb{P}$ es igual a $S$.

(Es decir, siempre que $\mathbb{P}$ se detiene, da como salida un elemento de $S$, y para cada elemento $(\vec{x}, \vec{\alpha}) \in S$, hay un $x \in \omega$ tal que $\mathbb{P}$ da como salida a $(\vec{x}, \vec{\alpha})$ cuando lo corremos con $x$ como dato de entrada)


---
---
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


---
---
# Combo 8. Defina:
### (1) $M(P)$
Sea $\Sigma$ un alfabeto finito y sea $P : D_P \subseteq \omega \times \omega^n \times \Sigma^{*m} \longmapsto \omega$ un predicado. Dado $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}$ , cuando exista al menos un $t \in \omega$ tal que $P(t, \vec{x}, \vec{\alpha}) = 1$, usaremos $\min_t P(t, \vec{x}, \vec{\alpha})$ para denotar al menor de tales $t's$.

> Nótese que la expresión $\min_t P(t, \vec{x}, \vec{\alpha})$ esta definida solo para aquellas $(n + m)$-uplas $(\vec{x}, \vec{\alpha})$ para las cuales hay al menos un $t$ tal que se da $P(t, \vec{x}, \vec{\alpha}) = 1$.

$$ M(P) = \lambda \vec{x} \vec{\alpha} [\min_t \ P(t, \vec{x}, \vec{\alpha})] $$

Nótese que:
$$
D_{M(P)} = \{(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m} : (\exist t \in \omega) \quad P(t, \vec{x}, \vec{\alpha}) = 1 \}

\\ \\

M(P)(\vec{x}, \vec{\alpha}) = \min_t \ P(t,\vec{x}, \vec{\alpha}),\quad \text{para cada} \ (\vec{x}, \vec{\alpha}) \in D_{M(P)}
$$

### (2) $Lt$
Definimos la función $Lt : \mathbb{N} \longmapsto \omega$ de la siguiente manera:

$$
Lt(x) = \left\{ \begin{aligned}

    & \max_i ((x)_i \neq 0), &\quad x \neq 1 \\
    & 0, & \quad x = 1

\end{aligned} \right.
$$

### (3) Conjunto rectangular
Un conjunto es llamado rectangular si es de la forma
$$ S_1 \times \cdots \times S_n \times L_1 \times \cdots \times L_m $$

con $n, m \in \omega, S_i \subseteq \omega$ y cada $L_i$ es un conjunto de palabras (no necesariamente se habla de palabras del alfabeto $\Sigma$, si fuese asi, este seria $\Sigma$-mixto).

### (4) "$S$ es un conjunto de tipo $(n, m)$"
Dado un conjunto $\Sigma$-mixto $S$, si $n, m \in \omega$ son tales que $S \subseteq \omega^n \times \Sigma^{∗m}$ , entonces diremos que $S$ es un conjunto de tipo $(n, m)$.
> Notar que si $S$ es vacio, entonces $S$ es de tipo $(n, m)$ cualquiera sea $n, m \in \omega$. Caso contrario, $n$ y $m$ son únicos para el conjunto $S$.


---
---
# Combo 9. Defina:
### (1) "$I$ es una instruccion de $\mathcal{S}^\Sigma$"
Una instrucción de $\mathcal{S}^\Sigma$ es ya sea una instrucción básica de $\mathcal{S}^\Sigma$ o una palabra de la forma $\alpha I$, donde $\alpha \in \{ L\overline{n} : n \in \mathbb{N} \}$ e $I$ es una instrucción básica de $\mathcal{S}^\Sigma$ .

Usaremos $Ins^\Sigma$ para denotar el conjunto de todas las instrucciones de $\mathcal{S}^\Sigma$.

### (2) "$\mathcal{P}$ es un programa de $\mathcal{S}^\Sigma$"
Un programa de $\mathcal{S}^\Sigma$ es una palabra de la forma
$$ I_1 I_2 \cdots I_n $$
donde $n \ge 1, I_1 , \cdots, I_n \in Ins^\Sigma$ y ademas se cumple la siguiente propiedad, llamada la ley de los GOTO,
> (G) Para cada $i \in \{1, \cdots, n \}$, si $GOTOL\overline{m}$ es un tramo final de $I_i$ , entonces existe $j \in \{1, \cdots, n \}$ tal que $I_j$ tiene label $L\overline{m}$, con $m \in \omega$.

Usaremos $Pro^\Sigma$ para denotar el conjunto de todos los programas de $\mathcal{S}^\Sigma$.

### (3) "$I_{i}^{\mathcal{P}}$" y (4) "$n(\mathcal{P})$"
Lema: Sea $\Sigma$ un alfabeto finito. Se tiene que: <br>
a. Si $I_1 \cdots I_n = J_1 \cdots J_m$, con $I_1, \cdots, I_n, J_1, \cdots, J_m \in Ins^\Sigma$, entonces $n = m$ y $I_j = J_j$ para cada $j \ge 1$. <br>
b. Si $\mathcal{P} \in Pro^\Sigma$, entonces existe una única sucesión de instrucciones $I_1, \cdots, I_n$ tal que $\mathcal{P} = I_1 \cdots I_n$.

> Por (b) del lema anterior nos dice que dado un programa $\mathcal{P}$, tenemos unívocamente determinados $n(\mathcal{P}) \in \mathbb{N}$ instrucciones ($I_1^{\mathcal{P}} , \cdots , I_{n(\mathcal{P})}^{\mathcal{P}} \in Ins^\Sigma$) tales que $P = I_1^{\mathcal{P}} \cdots I_{n(\mathcal{P})}^{\mathcal{P}}$. Definamos también $I_i^{\mathcal{P}} = \epsilon$ cuando $i = 0$ o $i \gt n(\mathcal{P})$.

### (5) $Bas$
$$
Bas : Ins^\Sigma \longmapsto (\Sigma \cup \Sigma^p )^∗
$$

$$
Bas(I) = \left\{ \begin{aligned}
    & J, \quad \text{si I es de la forma } L\overline{k}J \text{ con } J \in Ins^\Sigma \text{ y } k \in \mathbb{N}\\
    & I, \quad \text{caso contrario}
\end{aligned} \right.
$$


---
---
# Combo 10. Defina relativo al lenguaje $\mathcal{S}^\Sigma$:
### (1) "estado"
Definamos <br>
$$
\omega^{[\mathbb{N}]} = \{ (s_1 , s_2 , \cdots) \in \omega^{\mathbb{N}} : (\exist n \in \mathbb{N}) \quad s_i = 0, \quad para \ i \ge n \}
\\
\Sigma^{*[\mathbb{N}]} = \{ (\sigma_1 , \sigma_2 , \cdots) \in \Sigma^{*\mathbb{N}} : (\exist n \in \mathbb{N}) \quad \sigma_i = \epsilon, \quad para \ i \ge n \}
$$

Un estado es un par
$$
(\vec{s}, \vec{\sigma}) = ((s_1 , s_2 , \cdots), (\sigma_1 , \sigma_2 , \cdots)) \in \omega^{[\mathbb{N}]} \times \Sigma^{*[\mathbb{N}]}
$$

### (2) "descripcion instantanea"
Es una terna $(i, \vec{s}, \vec{\sigma})$ tal que $(\vec{s}, \vec{\sigma})$ es un estado e $i \in \omega$. Por lo que, dado un programa $\mathcal{P} \in Pro^\Sigma$, tendríamos que i representa la instrucción $I^{\mathcal{P}}_i$ a ejecutar con el estado $(\vec{s}, \vec{\sigma})$.

### (3) $S_\mathcal{P}$ (dar la definición matemática)
Dado un programa $\mathcal{P}$ definiremos a continuación una función
$$
S_\mathcal{P} : \omega \times \omega^{[\mathbb{N}]} \times \Sigma^{*[\mathbb{N}]} \longmapsto \omega \times \omega^{[\mathbb{N}]} \times \Sigma^{*[\mathbb{N}]}
$$

la cual le asignara a una descripción instantánea $(i, \vec{s}, \vec{\sigma})$ la descripción instantánea sucesora de $(i, \vec{s}, \vec{\sigma})$ con respecto a $\mathcal{P}$.

**Definición matemática:**

Caso $i \notin \{1, \cdots, n(\mathcal{P}) \}$. Entonces $S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i,\vec{s},\vec{\sigma})$.

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{N}\overline{k}\longleftarrow\mathrm{N}\overline{k}\dot{-}1$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,(s_{1},\cdots,s_{k-1},s_{k}\dot{-}1,s_{k+1},\cdots),\vec{\sigma})$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{N}\overline{k}\longleftarrow\mathrm{N}\overline{k}+1$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,(s_{1},\cdots,s_{k-1},s_{k}+1,s_{k+1},\cdots),\vec{\sigma})$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{N}\overline{k}\longleftarrow\mathrm{N}\overline{n}$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,(s_{1},\cdots,s_{k-1},s_{n},s_{k+1},\cdots),\vec{\sigma})$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{N}\overline{k}\longleftarrow0$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,(s_{1},\cdots,s_{k-1},0,s_{k+1},\cdots),\vec{\sigma})$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{IF} \ \mathrm{N}\overline{k} \neq0 \ \mathrm{GOTO} \ \mathrm{L}\overline{m}$. Entonces tenemos dos subcasos.

- Subcaso a. El valor de $\mathrm{N}\overline{k}$ en $(\vec{s},\vec{\sigma})$ es $0$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,\vec{s},\vec{\sigma})$$

- Subcaso b. El valor de $\mathrm{N}\overline{k}$ en $(\vec{s},\vec{\sigma})$ es no nulo. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(\min\{l:I_{l}^{\mathcal{P}}\
\mathrm{tiene\ label\ L}\overline{m}\},\vec{s},\vec{\sigma})$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{P}\overline{k}\longleftarrow ^{\curvearrowright}\mathrm{P}\overline{k}$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,\vec{s},(\sigma_{1},\cdots,\sigma_{k-1},^{\curvearrowright}\sigma_{k},\sigma_{k+1},\cdots))$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{P}\overline{k}\longleftarrow\mathrm{P}\overline{k}.a$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,\vec{s},(\sigma_{1},\cdots,\sigma_{k-1},\sigma_{k}a,\sigma_{k+1},\cdots))$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{P}\overline{k}\longleftarrow\mathrm{P}\overline{n}$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,\vec{s},(\sigma_{1},\cdots,\sigma_{k-1},\sigma_{n},\sigma_{k+1},\cdots))$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{P}\overline{k}\longleftarrow\varepsilon$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,\vec{s},(\sigma_{1},\cdots,\sigma_{k-1},\varepsilon,\sigma_{k+1},\cdots))$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{IF}\;\mathrm{P}\overline{k}\;\mathrm{BEGINS}\;a\;\mathrm{GOTO}\;\mathrm{L}\overline{m}$. Entonces tenemos dos subcasos.

- Subcaso a. El valor de $\mathrm{P}\overline{k}$ en $(\vec{s},\vec{\sigma})$ comienza con $a$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(\min\{l:I_{l}^{\mathcal{P}}\
\mathrm{tiene\ label\ L}\overline{m}\},\vec{s},\vec{\sigma})$$

- Subcaso b. El valor de $\mathrm{P}\overline{k}$ en $(\vec{s},\vec{\sigma})$ no comienza con $a$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,\vec{s},\vec{\sigma})$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{GOTO}\;\mathrm{L}\overline{m}$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(\min\{l:I_{l}^{\mathcal{P}}\
\mathrm{tiene\ label\ L}\overline{m}\},\vec{s},\vec{\sigma})$$

Caso $Bas(I_{i}^{\mathcal{P}})=\mathrm{SKIP}$. Entonces
$$S_{\mathcal{P}}(i,\vec{s},\vec{\sigma})=(i+1,\vec{s},\vec{\sigma})$$

### (4) "estado obtenido luego de t pasos, partiendo del estado $(\vec{s}, \vec{\sigma})$"
Dado un programa $\mathcal{P}$ y un estado $(\vec{s}, \vec{\sigma})$ a la infinitupla
$$
((1,\vec{s}, \vec{\sigma}), S_\mathcal{P}(1,\vec{s}, \vec{\sigma} ), S_\mathcal{P}(S_\mathcal{P}(1,\vec{s}, \vec{\sigma})), S_\mathcal{P}(S_\mathcal{P}(S_\mathcal{P}(1,\vec{s}, \vec{\sigma} ))), \cdots )
$$
la llamaremos la computación partiendo de un estado.

Diremos que
$$
\overbrace{S_\mathcal{P}(\cdots S_\mathcal{P}(S_\mathcal{P}}^{\text{t veces}}(1, \vec{s}, \vec{\sigma}) \cdots)
$$
es la **descripción instantánea obtenida luego de $t$ pasos**, partiendo del estado $(\vec{s}, \vec{\sigma})$.

Si
$$
\overbrace{S_\mathcal{P}(\cdots S_\mathcal{P}(S_\mathcal{P}}^{\text{t veces}}(1, \vec{s}, \vec{\sigma}) \cdots) = (j, \vec{u}, \vec{\eta})
$$
diremos que $(\vec{u}, \vec{\eta})$ **es el estado obtenido luego de $t$ pasos**, partiendo del estado $(\vec{s}, \vec{\sigma})$.

### (5) "$\mathcal{P}$ se detiene (luego de t pasos), partiendo desde el estado $(\vec{s}, \vec{\sigma})$"
Cuando la primer coordenada de
$$
\overbrace{S_\mathcal{P}(\cdots S_\mathcal{P}(S_\mathcal{P}}^{\text{t veces}}(1, \vec{s}, \vec{\sigma}) \cdots)
$$
sea igual a $n(\mathcal{P}) + 1$, diremos que $\mathcal{P}$ se detiene (luego de $t$ pasos), partiendo desde el estado $(\vec{s}, \vec{\sigma})$.


---
---
# Combo 11. Defina:
### (1) $\Psi^{n, m, \#}_{\mathcal{P}}$
Dados $x_1, \cdots, x_n \in \omega$ y $\alpha_1, \cdots, \alpha_m \in \Sigma^*$, con $n, m \in \omega$, usaremos
$$ || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m || $$
para denotar el estado
$$ ((x_1, \cdots, x_n, 0, \cdots), (\alpha_1, \cdots, \alpha_m, \epsilon, \cdots)) $$

**Dado $\mathcal{P} \in Pro^\Sigma$ , definamos para cada par $n, m \ge 0$, la función $\Psi^{n, m, \#}_{\mathcal{P}}$** de la siguiente manera:
$$
D_{\Psi^{n, m, \#}_{\mathcal{P}}} = \{ (\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}: \mathcal{P} \text{ termina partiendo del estado } || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m || \}
$$

$$
\Psi^{n, m, \#}_{\mathcal{P}} = \text{ valor de N1 en el estado obtenido cuando } \mathcal{P} \text{ termina, partiendo del estado } || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||
$$

### (2) "$f$ es $\Sigma$-computable" y (3) "$\mathcal{P}$ computa a $f$"
Una función $\Sigma$-mixta $f: D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$ sera llamada $\Sigma$-computable si hay un programa $\mathcal{P}$ de $\mathcal{S}^\Sigma$ tal que $f = \Psi^{n, m, \#}_{\mathcal{P}}$. En tal caso diremos que la función $f$ es computada por $\mathcal{P}$. <br>
Análogamente una función $\Sigma$-mixta $f: D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \Sigma^*$ sera llamada $\Sigma$-computable si hay un programa $\mathcal{P}$ de $\mathcal{S}^\Sigma$ tal que $f = \Psi^{n, m, *}_{\mathcal{P}}$. En tal caso diremos que la función $f$ es computada por $\mathcal{P}$.

### (4) $M^{\le}(\mathcal{P})$
Sea $\Sigma$ un alfabeto finito no vacio. Sea $\le$ orden total sobre $\Sigma$. Sea $P : D_P \subseteq \omega^n \times \Sigma^{*m} \times \Sigma^* \longmapsto \omega$ un predicado. Dado $(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m}$ , cuando exista al menos un $\alpha \in \Sigma^*$ tal que $P(\vec{x}, \vec{\alpha}, \alpha) = 1$, usaremos $\min_{\alpha}^{\le} P(\vec{x}, \vec{\alpha}, \alpha)$ para denotar al menor de tales $\alpha's$.

> Nótese que la expresión $\min_{\alpha}^{\le} P(\vec{x}, \vec{\alpha}, \alpha)$ esta definida solo para aquellas $(n + m)$-uplas $(\vec{x}, \vec{\alpha})$ para las cuales hay al menos un $\alpha$ tal que se da $P(\vec{x}, \vec{\alpha}, \alpha) = 1$.

$$ M^{\le}(P) = \lambda \vec{x} \vec{\alpha} [\min_{\alpha}^{\le} \ P(\vec{x}, \vec{\alpha}, \alpha)] $$

Nótese que:
$$
D_{M^{\le}(P)} = \{(\vec{x}, \vec{\alpha}) \in \omega^n \times \Sigma^{*m} : (\exist \alpha \in \Sigma^*) \quad P(\vec{x}, \vec{\alpha}, \alpha) = 1 \}

\\ \\

M^{\le}(P)(\vec{x}, \vec{\alpha}) = \min_{\alpha}^{\le} \ P(\vec{x}, \vec{\alpha}, \alpha),\quad \text{para cada} \ (\vec{x}, \vec{\alpha}) \in D_{M^{\le}(P)}
$$


---
---
# Combo 12.
### Defina cuando un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ es llamado $\Sigma$-computable, cuando es llamado $\Sigma$-enumerable y defina "el programa $\mathcal{P}$ enumera a S"

Un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ **sera llamado $\Sigma$-computable** cuando la función $\chi^{\omega^n \times \Sigma^{*m}}_S$ sea $\Sigma$-computable. O sea que $S \subseteq \omega^n \times \Sigma^{*m}$ es $\Sigma$-computable sii hay un programa $\mathcal{P} \in Pro^\Sigma$ el cual computa a $\chi^{\omega^n \times \Sigma^{*m}}_S$, es decir:
- Si $(\vec{x}, \vec{\alpha}) \in S$, entonces $\mathcal{P}$ se detiene partiendo desde $|| x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||$ y la variable N1 queda con contenido igual a 1.
- Si $(\vec{x}, \vec{\alpha}) \notin S$, entonces $\mathcal{P}$ se detiene partiendo desde $|| x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||$ y la variable N1 queda con contenido igual a 0.

Un conjunto $S \subseteq \omega^n \times \Sigma^{*m}$ **sera llamado $\Sigma$-enumerable** cuando sea vacio o haya una función $F : \omega \longmapsto \omega^n \times \Sigma^{*m}$ tal que $I_F = S$ y $F{(i)}$ sea $\Sigma$-computable, para cada $i \in \{ 1, \cdots, n + m \}$.

El programa $\mathcal{P}$ **enumera a S** si: <br>
(a) Para cada $x \in \omega$, tenemos que $\mathcal{P}$ se detiene partiendo desde el estado $|| x ||$ y llega a un estado de la forma $((x_1 , \cdots, x_n, y_1 , \cdots), (\alpha_1 , \cdots, \alpha_m , \beta_1 , \cdots))$, donde $(x_1 , \cdots, x_n , \alpha_1 , \cdots, \alpha_m ) \in S$. <br>
(b) Para cada $(x_1 , \cdots, x_n , \alpha_1 , \cdots, \alpha_m ) ∈ S$ hay un $x \in \omega$ tal que $\mathcal{P}$ se detiene partiendo desde el estado $|| x ||$ y llega a un estado de la forma $((x_1 , \cdots, x_n, y_1 , \cdots), (\alpha_1 , \cdots, \alpha_m , \beta_1 , \cdots))$


---
---
# Combo 13. Defina:
### (1) $i^{n, m}$, (2) $E^{n, m}_{\#}$ y (3) $E^{n, m}_{*}$
Sean $n, m \in \omega$, fijos. Definimos:
$$
\begin{aligned}

& i^{n, m}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \omega \\
& E^{n, m}_{\#}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \omega^{[\mathbb{N}]} \\
& E^{n, m}_{*}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \Sigma^{*[\mathbb{N}]} \\

\end{aligned}
$$

Definición recursiva:
$$
\begin{aligned}

& (i^{n, m}(0, \vec{x}, \vec{\alpha}, \mathcal{P}), E^{n, m}_{\#}(0, \vec{x}, \vec{\alpha}, \mathcal{P}), E^{n, m}_{*}(0, \vec{x}, \vec{\alpha}, \mathcal{P})) = (1, (x_1, \cdots, x_n, 0, \cdots), (\alpha_1, \cdots, \alpha_n, 0, \cdots)) \\
& (i^{n, m}(t + 1, \vec{x}, \vec{\alpha}, \mathcal{P}), E^{n, m}_{\#}(t + 1, \vec{x}, \vec{\alpha}, \mathcal{P}), E^{n, m}_{*}(t + 1, \vec{x}, \vec{\alpha}, \mathcal{P})) = S_{\mathcal{P}}(i^{n, m}(t, \vec{x}, \vec{\alpha}, \mathcal{P}), E^{n, m}_{\#}(t, \vec{x}, \vec{\alpha}, \mathcal{P}), E^{n, m}_{*}(t, \vec{x}, \vec{\alpha}, \mathcal{P}))

\end{aligned}
$$

> $i^{n, m}$ es $(\Sigma \cup \Sigma^p)$-PR

### (4) $E^{n, m}_{\#(j)}$
Sean $n, m \in \omega$, fijos y $j \in \mathbb{N}$. Definimos:
$$
\begin{aligned}

& E^{n, m}_{\#(j)}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto \omega \\ \\

& E^{n, m}_{\#(j)}(t, \vec{x}, \vec{\alpha}, \mathcal{P}) = j \text{-esima coordenada de } E^{n, m}_{\#}(t, \vec{x}, \vec{\alpha}, \mathcal{P})

\end{aligned}
$$

> $E^{n, m}_{\#(j)}$ es $(\Sigma \cup \Sigma^p)$-PR

### (5) $E^{n, m}_{*(j)}$
Sean $n, m \in \omega$, fijos y $j \in \mathbb{N}$. Definimos:
$$
\begin{aligned}

& E^{n, m}_{*(j)}: \omega \times \omega^n \times \Sigma^{*m} \times Pro^\Sigma \longmapsto  \Sigma^* \\ \\

& E^{n, m}_{*(j)}(t, \vec{x}, \vec{\alpha}, \mathcal{P}) = j \text{-esima coordenada de } E^{n, m}_{*}(t, \vec{x}, \vec{\alpha}, \mathcal{P})

\end{aligned}
$$

> $E^{n, m}_{*(j)}$ es $(\Sigma \cup \Sigma^p)$-PR

### (6) $Halt^{n, m}$
Dados $n, m \in \omega$, definamos:
$$
Halt^{n, m} = \lambda t \vec{x} \vec{\alpha} \mathcal{P} [ i^{n, m}(t, \vec{x}, \vec{\alpha}, \mathcal{P}) = n(\mathcal{P}) + 1 ]
$$

> $Halt^{n, m}$ es $(\Sigma \cup \Sigma^p)$-PR

### (7) $T^{n, m}$
Dados $n, m \in \omega$, definamos:
$$
T^{n, m} = M(Halt^{n, m}) \\ \\

D_{T^{n, m}} = \{ (\vec{x}, \vec{\alpha}, \mathcal{P}) \in \omega^n \times \Sigma^{*m} \times Pro^\Sigma : \mathcal{P} \text{ se detiene partiendo del estado } || x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m || \}
$$

Para $(\vec{x}, \vec{\alpha}, \mathcal{P}) \in D_{T^{n, m}}$ tenemos que $T^{n, m}(\vec{x}, \vec{\alpha}, \mathcal{P}) =$ cantidad de pasos necesarios para que $\mathcal{P}$ se detenga partiendo del estado $|| x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m ||$

> $T^{n, m}$ es $(\Sigma \cup \Sigma^p)$-R

### (8) $AutoHalt^\Sigma$
Supongamos que $\Sigma \supseteq \Sigma^p$. Entonces
$$ AutoHalt^\Sigma = \lambda \mathcal{P} [ (\exist t \in \omega) \quad Halt^{0, 1}(t, \mathcal{P}, \mathcal{P}) ] $$

Notar que el dominio de $AutoHalt^\Sigma$ es $Pro^\Sigma$ y que para cada $\mathcal{P} \in Pro^\Sigma$ tenemos que
$$ AutoHalt^\Sigma(\mathcal{P}) = 1 \text{ sii } \mathcal{P} \text{ se detiene partiendo del estado } ||\mathcal{P}|| $$

> $AutoHalt^\Sigma$ no es $\Sigma$-R

### (9) Los conjuntos $A$ y $N$
Supongamos que $\Sigma \supseteq \Sigma^p$. Entonces
$$ A = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 1 \} $$
es $\Sigma$-RE. y no es $\Sigma$-R. Mas aun el conjunto
$$ N = \{ \mathcal{P} \in Pro^\Sigma: AutoHalt^\Sigma(\mathcal{P}) = 0 \} $$
no es $\Sigma$-RE


---
---
# Combo 14. Explique en forma detallada la notación lambda
- La notación depende de un alfabeto fijado previamente.
- No todas las expresiones pueden ser lambdificables.


#### Fijado anteriormente un alfabeto $\Sigma$. Las excreciones que cumplas las siguiente condiciones serán llamada "expresiones lambdificables":

- Pueden tener variables numéricas de $\omega$. Se las representa con letras comunes del alfabeto español (p.e.j. $x, y, z, w, b, x_1, y_1, etc$).
- Pueden tener variables alfabéticas (palabras de $\Sigma$). Se las representa con letras griegas.
- Puede ocurrir que al evaluar las variables estas expresiones no estén definidas (p.e.j. $Pred(|\alpha|), \quad \text{notar que } \alpha \neq \epsilon$)
- El resultado obtenido al evaluar la expresión **deberá** estar contenida en $\omega$ o en $\Sigma^*$.
- Se puede utilizar **lenguaje coloquial castellano** (no toda expresión son operaciones matemáticas bien definidas)
- Al evaluar las expresiones booleanas, se asume que el valor que toma esta en el conjunto $\{ 1, 0 \} \subseteq \omega$.
- Se puede no utilizar variables y en su lugar utilizar constantes, mientras que se cumpla lo anterior.

### Notación lambda
Dado un alfabeto finito $\Sigma$ y una expresión lambdificable E con respecto a $\Sigma$, donde $x_1, \cdots, x_n$ son todas las variables numéricas que pueden ocurrir en la expresión E y $\alpha_1, \cdots, \alpha_m$ son todas las variables alfabéticas que pueden ocurrir en la expresión E, entonces:

$$ f = \lambda x_1 \cdots x_n \alpha_1 \cdots \alpha_m [E] $$

denotara la función f definida por:
- $D_f = $ conjunto de las $(x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m) \in \omega^n \times \Sigma^{m*}$ tales que E esta definida con la $(n + m)$-upla.
- $f(x_1, \cdots, x_n, \alpha_1, \cdots, \alpha_m)$ = valor que asume o representa E cuando la evaluamos con la $(n + m)$-upla.

> Notar que f es $\Sigma$-Mixta de tipo $(n, m, s), s \in \{ \#, * \}$ y $n,m \in \omega$.


---
---
# Combo 15.
### Dada una función $f : D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$, describa que tipo de objeto es y que propiedades debe tener (cuando exista) el macro:
$$ [V2 \longleftarrow f(V1, W1)] $$

Sea $M = [V2 \longleftarrow f(V1, W1)]$. Como objeto matematico, M es simplemente una palabra ($Ti(M) = \text{PALABRA}$).

Dado un alfabeto finito $\Sigma$ fijado previamente, tendríamos que M es una macro de $\mathbb{S}^\Sigma$, el cual cumple las siguientes propiedades:
1. Las variables oficiales de M son V1, V2 y W1.
2. M no tiene labels oficiales.
3. Si se reemplaza las variables oficiales de M por variables concretas del un programa, las variables auxiliares por variables concretas (no utilizadas en el resto del programa) y los labels auxiliares de M por labels concretos (no utilizados en el resto del programa), entonces, la palabra obtenida es un programa $\Large \epsilon$ de $\mathbb{S}^\Sigma$. Y, en criollo, si el valor de las variables concretas no esta en $D_f$, entonces no termina. Caso contrario, asigna en la variable concreta que reemplaza a V2 el valor de correr el programa obtenido.

El programa $\Large \epsilon \normalsize = [N\overline{l} \longleftarrow f(N\overline{n}, P\overline{m})]$, con $l, n, m \in \omega$ tales que son variables concretas, entonces $\Large \epsilon$ es llamado la expansion del macro M, con respecto a la elección de variables y labels realizada.


---
---
# Combo 16.
### Dado un predicado $P : D_P \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$, describa que tipo de objeto es y que propiedades debe tener (cuando exista) el macro:
$$ [\text{IF P(V1, W1) GOTO A1}] $$

Sea $M = [\text{IF P(V1, W1) GOTO A1}]$. Como objeto matematico, M es simplemente una palabra ($Ti(M) = \text{PALABRA}$).

Dado un alfabeto finito $\Sigma$ fijado previamente, tendríamos que M es una macro de $\mathbb{S}^\Sigma$, el cual cumple las siguientes propiedades:
1. Las variables oficiales de M son V1 y W1.
2. A1 es el único label oficial de M.
3. Si se reemplaza las variables oficiales de M por variables concretas del un programa, el label oficial po un label concreto, las variables auxiliares por variables concretas (no utilizadas en el resto del programa) y los labels auxiliares de M por labels concretos (no utilizados en el resto del programa), entonces, la palabra obtenida es un programa $\Large \epsilon$ de $\mathbb{S}^\Sigma$ **(salvo por la ley de GOTO respecto a el label concreto que reemplaza a A1)**. Y, en criollo, si el valor de las variables concretas no esta en $D_P$, entonces no termina. Caso contrario,
    - si $P(s_i, \sigma_j) = 1$ (siendo $s_i$ y $\sigma_j$ el valor de la variable concreta con la cual se reemplazo V1 y W1) entonces luego de una cantidad finita de pasos, se direcciona a el label concreto que reemplaza a A1.
    - si $P(s_i, \sigma_j) = 0$ (siendo $s_i$ y $\sigma_j$ el valor de la variable concreta con la cual se reemplazo V1 y W1) entonces luego de una cantidad finita de pasos, el programa termina.

El programa (salvo la ley del GOTO para $L\overline{l}$) $\Large \epsilon \normalsize = [\text{IF P(N}\overline{i}\text{, P}\overline{j}\text{) GOTO L}\overline{l}]$, con $l, i, j \in \omega$ tales que son variables concretas, entonces $\Large \epsilon$ es llamado la expansion del macro M, con respecto a la elección de variables y labels realizada.


---
---
# Combo 17.
### Defina el concepto de función y desarrolle las tres Convenciones Notacionales asociadas a dicho concepto (Guı́a 1)

Una función es un conjunto f de pares ordenados con la siguiente propiedad: <br>
(F) Si $(x, y) \in f$ y $(x, z) \in f$, entonces $y = z$.

#### Convencion Notacional 1:
Como es usual, dado $x \in D_f$ , usaremos $f(x)$ para denotar al único $y \in I_f$ tal que $(x, y) \in f$.

#### Convencion Notacional 2:
Escribiremos $f : S \subseteq A \longmapsto B$ para expresar que f es una función tal que $D_f = S \subseteq A$ y $I_f \subseteq B$. También escribiremos $f : A \longmapsto B$ para expresar que f es una función tal que $D_f = A$ y $I_f \subseteq B$. En tal contexto llamaremos a B conjunto de llegada. Por supuesto B no esta determinado por f ya que solo debe cumplir $I_f \subseteq B$. Es decir que cualquier conjunto B que contenga a $I_f$ puede ser considerado conjunto de llegada de f.

#### Convencion Notacional 3:
Muchas veces para definir una función f, lo haremos dando su dominio y su regla de asignación, es decir especificaremos en forma precisa que conjunto es el dominio de f y ademas especificaremos en forma precisa quien es $f(x)$ para cada x de dicho dominio. Obviamente esto determina por completo a la función f ya que siempre se da que $f = \{ (x, f(x)) : x \in D_f \}$.


---
