# Combo 13
### (1) Defina "tipo"
Por un tipo entenderemos una 4-upla $\tau=(\mathcal{C},\mathcal{F},\mathcal{R},a)$ tal que:

1. Hay alfabetos finitos $\Sigma_{1}, \Sigma_{2}$ y $\Sigma_{3}$ tales:

    (a) $\mathcal{C}\subseteq\Sigma_{1}^{+}, \mathcal{F}\subseteq\Sigma_{2}^{+}$ y $\mathcal{R}\subseteq\Sigma_{3}^{+}$

    (b) $\Sigma_{1}, \Sigma_{2}$ y $\Sigma_{3}$ son disjuntos de a pares.

    (c) $\Sigma_{1}\cup\Sigma_{2}\cup\Sigma_{3}$ no contiene ningún símbolo de la lista

    $$
    \forall\ \exists\;\lnot\;\vee\;\wedge\;\rightarrow\;\leftrightarrow\;(\;)\;,\;\equiv\;\mathsf{X\;}\mathit{0}\;\mathit{1\;}...\;\mathit{9}\;\mathbf{0}\;\mathbf{1}\ ...\;\mathbf{9}
    $$

2. $a:\mathcal{F}\cup\mathcal{R}\rightarrow\mathbb{N}$ es una función que a cada $p\in\mathcal{F}\cup\mathcal{R}$ le asocia un número natural $a(p)$, llamado la aridad de $p$.

3. Ninguna palabra de $\mathcal{C}$ (resp. $\mathcal{F}, \mathcal{R}$) es subpalabra propia de otra palabra de $\mathcal{C}$ (resp. $\mathcal{F}, \mathcal{R}$).

### (2) Defina "Estructura de tipo $\tau$"
Una estructura o modelo de tipo $\tau$ será un par $\mathbf{A}=(A,i)$ tal que:

1. $A$ es un conjunto no vacío

2. $i$ es una función con dominio $\mathcal{C}\cup\mathcal{F}\cup\mathcal{R}$, tal que:

    (a) $i(c)$ es un elemento de $A$, para cada $c\in\mathcal{C}$

    (b) $i(f)$ es una operación n-aria sobre $A$, para cada $f\in\mathcal{F}_{n}, n\geq1$

    (c) $i(r)$ es una relación n-aria sobre $A$, para cada $r\in\mathcal{R}_{n}, n\geq1$
