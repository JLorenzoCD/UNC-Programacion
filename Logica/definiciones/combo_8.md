# Combo 8
### (1) Defina $(L, s, i, ^c, 0, 1)/\theta$ ($\theta$ una congruencia del reticulado complementado $(L, s, i, ^c, 0, 1)$). Justifique por qué la definición de las operaciones de $(L, s, i, ^c, 0, 1)/\theta$ es inambigua. (No hace falta que defina el concepto de congruencia.)
> Nota: Explicado en Combo 1 - item 5

### (2) Dados $\varphi =_d \varphi(v_1, \dots, v_n)$, $\mathbb{A}$ una estructura de tipo $\tau$ y $a_1, \dots, a_n \in A$, defina qué significa $\mathbb{A} \models \varphi[a_1, \dots, a_n]$ (i.e. Convención notacional 4 de la Guía 11)
> Nota: Explicado en Combo 1 - item 4

### (3) Dado un poset $(P, \le)$, defina "a es supremo de $S$ en $(P, \le)$"
Sea $(P, \le)$ un poset, un subconjunto $S \subseteq P$, diremos que un elemento $a\in P$ es cota superior de $S$ en $(P, \le)$ si para todo $x \in S$ se da $x \le a$. Decimos que **$a\in P$ es supremo de $S$** en $(P, \le)$ si:
1. $a$ es cota superior de $S$ en $(P, \le)$.
2. Para cada $b \in P$, si $b$ es cota superior de $S$ en $(P, \le)$, entonces $a \le b$.

### (4) Defina "$i$ es anterior a $j$ en $(\bm{\varphi}, \mathbf{J})$" (no hace falta que defina $\mathcal{B}^J$)
Sea $(\bm{\varphi}, \mathbf{J})$ un par adecuado de longitud $n$, y sean $1 \le i, j \le n$. Diremos que el paso $i$ es anterior a $j$ en $(\boldsymbol{\varphi},\mathbf{J})$ si:
1. $i\lt j$.
2. Para todo $B\in\mathcal{B}^{\mathbf{J}}$ se tiene que $i\in B\Rightarrow j\in B$.