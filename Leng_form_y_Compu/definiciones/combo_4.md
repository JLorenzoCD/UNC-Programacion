# Combo 4.
### Defina cuando una función $f : D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$ es llamada $\Sigma$-efectivamente computable y defina ”el procedimiento $\mathbb{P}$ computa a la función $f$”

Una función $\Sigma$-mixta $f : D_f \subseteq \omega^n \times \Sigma^{*m} \longmapsto \omega$ sera llamada $\Sigma$-efectivamente computable si hay un procedimiento efectivo $\mathbb{P}$ tal que
1. El conjunto de datos de entrada de $\mathbb{P}$ es $\omega^n \times \Sigma^{*m}$
2. El conjunto de datos de salida esta contenido en $\omega$.
3. Si $(\overrightarrow{x}, \overrightarrow{\alpha}) \in D_f$ , entonces $\mathbb{P}$ se detiene partiendo de $(\overrightarrow{x}, \overrightarrow{\alpha})$, dando como dato de salida $f(\overrightarrow{x}, \overrightarrow{\alpha})$.
4. Si $(\overrightarrow{x}, \overrightarrow{\alpha}) \in ((\omega^n \times \Sigma^{*m}) − D_f)$, equivalentemente $(\overrightarrow{x}, \overrightarrow{\alpha}) \notin D_f$, entonces $\mathbb{P}$ no se detiene partiendo desde $(\overrightarrow{x}, \overrightarrow{\alpha})$.

Cuando un procedimiento $\mathbb{P}$ cumpla los items (1), (2), (3) y (4) de arriba diremos que $\mathbb{P}$ computa a la funcion $f$ o que $f$ es computada por $\mathbb{P}$.
