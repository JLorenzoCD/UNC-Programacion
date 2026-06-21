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
(\overrightarrow{s}, \overrightarrow{\sigma}) = ((s_1 , s_2 , \cdots), (\sigma_1 , \sigma_2 , \cdots)) \in \omega^{[\mathbb{N}]} \times \Sigma^{*[\mathbb{N}]}
$$

### (2) "descripcion instantanea"
Es una terna $(i, \overrightarrow{s}, \overrightarrow{\sigma})$ tal que $(\overrightarrow{s}, \overrightarrow{\sigma})$ es un estado e $i \in \omega$.

### (3) $S_\mathcal{P}$ (dar la definición matemática)
Dado un programa $\mathcal{P}$ definiremos a continuación una función
$$
S_\mathcal{P} : \omega \times \omega^{[\mathbb{N}]} \times \Sigma^{*[\mathbb{N}]} \longmapsto \omega \times \omega^{[\mathbb{N}]} \times \Sigma^{*[\mathbb{N}]}
$$

la cual le asignara a una descripción instantánea $(i, \overrightarrow{s}, \overrightarrow{\sigma})$ la descripción instantánea sucesora de $(i, \overrightarrow{s}, \overrightarrow{\sigma})$ con respecto a $\mathcal{P}$.

> Faltan dar todos los casos de la definición

### (4) "estado obtenido luego de t pasos, partiendo del estado $(\overrightarrow{s}, \overrightarrow{\sigma})$"
Dado un programa $\mathcal{P}$ y un estado $(\overrightarrow{s}, \overrightarrow{\sigma})$ a la infinitupla
$$
((1,\overrightarrow{s}, \overrightarrow{\sigma}), S_\mathcal{P}(1,\overrightarrow{s}, \overrightarrow{\sigma} ), S_\mathcal{P}(S_\mathcal{P}(1,\overrightarrow{s}, \overrightarrow{\sigma})), S_\mathcal{P}(S_\mathcal{P}(S_\mathcal{P}(1,\overrightarrow{s}, \overrightarrow{\sigma} ))), \cdots )
$$
la llamaremos la computación partiendo de un estado.

Diremos que
$$
\overbrace{S_\mathcal{P}(\cdots S_\mathcal{P}(S_\mathcal{P}}^{\text{t veces}}(1, \overrightarrow{s}, \overrightarrow{\sigma}) \cdots)
$$
es la **descripción instantánea obtenida luego de $t$ pasos**, partiendo del estado $(\overrightarrow{s}, \overrightarrow{\sigma})$.

Si
$$
\overbrace{S_\mathcal{P}(\cdots S_\mathcal{P}(S_\mathcal{P}}^{\text{t veces}}(1, \overrightarrow{s}, \overrightarrow{\sigma}) \cdots) = (j, \overrightarrow{u}, \overrightarrow{\eta})
$$
diremos que $(\overrightarrow{u}, \overrightarrow{\eta})$ **es el estado obtenido luego de $t$ pasos**, partiendo del estado $(\overrightarrow{s}, \overrightarrow{\sigma})$.

### (5) "$\mathcal{P}$ se detiene (luego de t pasos), partiendo desde el estado $(\overrightarrow{s}, \overrightarrow{\sigma})$"
Cuando la primer coordenada de
$$
\overbrace{S_\mathcal{P}(\cdots S_\mathcal{P}(S_\mathcal{P}}^{\text{t veces}}(1, \overrightarrow{s}, \overrightarrow{\sigma}) \cdots)
$$
sea igual a $n(\mathcal{P}) + 1$, diremos que $\mathcal{P}$ se detiene (luego de $t$ pasos), partiendo desde el estado $(\overrightarrow{s}, \overrightarrow{\sigma})$. 
