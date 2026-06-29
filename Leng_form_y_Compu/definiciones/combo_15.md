# Combo 15.
### Dada una función $f : D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$, describa que tipo de objeto es y que propiedades debe tener (cuando exista) el macro:
$$ [V2 \longleftarrow f(V1, W1)] $$

Sea $M = [V2 \longleftarrow f(V1, W1)]$. Como objeto matematico, M es simplemente una palabra ($Ti(M) = \text{PALABRA}$).

Dado un alfabeto finito $\Sigma$ fijado previamente, tendríamos que M es una macro de $\mathcal{S}^\Sigma$, el cual cumple las siguientes propiedades:
1. Las variables oficiales de M son V1, V2 y W1.
2. M no tiene labels oficiales.
3. Si se reemplaza las variables oficiales de M por variables concretas del un programa, las variables auxiliares por variables concretas (no utilizadas en el resto del programa) y los labels auxiliares de M por labels concretos (no utilizados en el resto del programa), entonces, la palabra obtenida es un programa $\Large \epsilon$ de $\mathcal{S}^\Sigma$. Y, en criollo, si el valor de las variables concretas no esta en $D_f$, entonces no termina. Caso contrario, asigna en la variable concreta que reemplaza a V2 el valor de correr el programa obtenido.

El programa $\Large \epsilon \normalsize = [N\overline{l} \longleftarrow f(N\overline{n}, P\overline{m})]$, con $l, n, m \in \omega$ tales que son variables concretas, entonces $\Large \epsilon$ es llamado la expansion del macro M, con respecto a la elección de variables y labels realizada.
