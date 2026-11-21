# Combo 6
### Explique la notación declaratoria para fórmulas con sus 3 convenciones notacionales (convenciones 3, 4 y 6 de la Guía 11). Puede asumir la notación declaratoria para términos

* **Convención Notacional 3:**
Cuando hayamos hecho la declaración $\varphi=_{d}\varphi(v_{1},...,v_{n})$, si $P_{1},...,P_{n}$ son palabras cualesquiera, entonces $\varphi(P_{1},...,P_{n})$ denotará la palabra que resulta de reemplazar simultáneamente cada ocurrencia libre de $v_{1}$ en $\varphi$, por $P_{1}$, cada ocurrencia libre de $v_{2}$ en $\varphi$, por $P_{2}$, etc.

* **Convención Notacional 4:**
Cuando hayamos declarado $\varphi=_{d}\varphi(v_{1},...,v_{n})$, si $\mathbb{A}$ es un modelo de tipo $\tau$ y $a_{1},...,a_{n}\in A$, entonces $\mathbb{A}\models\varphi[a_{1}...,a_{n}]$ significara que $\mathbb{A}\models\varphi[\vec{b}]$, donde $\vec{b}$ es una asignación tal que a cada $v_{i}$ le asigna el valor $a_{i}$. Note que esto nos dice que para el caso $n=0$, $\mathbb{A}\models\varphi[]$ significara que $\mathbb{A}\models\varphi[\vec{b}]$, donde $\vec{b}$ es una asignación cualquiera. (Nótese que esta convención es inambigua gracias al Lema 7.17). En gral $\mathbb{A}\not\models\varphi[a_{1},....,a_{n}]$ significara que no sucede $\mathbb{A}\models\varphi[a_{1},....,a_{n}]$.

* **Convención Notacional 6:**
    Cuando hayamos declarado $\varphi=_{d}\varphi(v_{1},...,v_{n})$, entonces:

    - Si se da el caso (1) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho las declaraciones $t=_{d}t(v_{1},...,v_{n})$ y $s=_{d}s(v_{1},...,v_{n})$.

    - Si se da el caso (2) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho las declaraciones $t_{1}=_{d}t_{1}(v_{1},...,v_{n}),...,t_{m}=_{d}t_{m}(v_{1},...,v_{n})$.

    - Si se el caso (3) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho las declaraciones $\varphi_{1}=_{d}\varphi_{1}(v_{1},...,v_{n})$ y $\varphi_{2}=_{d}\varphi_{2}(v_{1},...,v_{n})$.

    - Si se da el caso (4) o el (5) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho la declaración $\varphi_{1}=_{d}\varphi_{1}(v_{1},...,v_{n})$.

    - Si se da el caso (6) del Lema *"Lectura única de formulas declaradas"*, supondremos tácitamente que también hemos hecho la declaración $\varphi_{1}=_{d}\varphi_{1}(v_{1},...,v_{n},v)$.
