# Combo 16.
### Dado un predicado $P : D_P \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$, describa que tipo de objeto es y que propiedades debe tener (cuando exista) el macro:
$$ [\text{IF P(V1, W1) GOTO A1}] $$

Sea $M = [\text{IF P(V1, W1) GOTO A1}]$. Como objeto matematico, M es simplemente una palabra ($Ti(M) = \text{PALABRA}$).

Dado un alfabeto finito $\Sigma$ fijado previamente, tendríamos que M es una macro de $\mathcal{S}^\Sigma$, el cual cumple las siguientes propiedades:
1. Las variables oficiales de M son V1 y W1.
2. A1 es el único label oficial de M.
3. Si se reemplaza las variables oficiales de M por variables concretas del un programa, el label oficial po un label concreto, las variables auxiliares por variables concretas (no utilizadas en el resto del programa) y los labels auxiliares de M por labels concretos (no utilizados en el resto del programa), entonces, la palabra obtenida es un programa $\Large \epsilon$ de $\mathcal{S}^\Sigma$ **(salvo por la ley de GOTO respecto a el label concreto que reemplaza a A1)**. Y, en criollo, si el valor de las variables concretas no esta en $D_P$, entonces no termina. Caso contrario,
    - si $P(s_i, \sigma_j) = 1$ (siendo $s_i$ y $\sigma_j$ el valor de la variable concreta con la cual se reemplazo V1 y W1) entonces luego de una cantidad finita de pasos, se direcciona a el label concreto que reemplaza a A1.
    - si $P(s_i, \sigma_j) = 0$ (siendo $s_i$ y $\sigma_j$ el valor de la variable concreta con la cual se reemplazo V1 y W1) entonces luego de una cantidad finita de pasos, el programa termina.

El programa (salvo la ley del GOTO para $L\overline{l}$) $\Large \epsilon \normalsize = [\text{IF P(N}\overline{i}\text{, P}\overline{j}\text{) GOTO L}\overline{l}]$, con $l, i, j \in \omega$ tales que son variables concretas, entonces $\Large \epsilon$ es llamado la expansion del macro M, con respecto a la elección de variables y labels realizada.
