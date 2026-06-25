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
