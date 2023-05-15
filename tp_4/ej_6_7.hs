import Ej_1_2

{-
6. Construı una lista de figuras xs en las que se satisfagan progresivamente cada una de las siguientes
sentencias. Formaliza las oraciones con la logica de predicados.
-}

-- a) Alguna figura de xs es de tamaño mayor a 10.
-- < ∃x :  x ∈ℓ xs : Tam.x > 10 >
[(Circulo, Rojo, 20), (Triangulo, Verde, 2), (Cuadrado, Azul, 10), (Rombo, Rojo, 7)]

-- b) Hay un cuadrado en xs.
-- < ∃x :  x ∈ℓ xs : Cuadrado.x >
[(Triangulo, Verde, 2), (Cuadrado, Azul, 10), (Rombo, Rojo, 7)]

-- c) En xs hay un cuadrado de tamaño mayor a 10.
-- < ∃x :  x ∈ℓ xs ∧ Cuadrado.x : Tam.x > 10 >
[(Triangulo, Verde, 2), (Cuadrado, Azul, 15), (Rombo, Rojo, 7), (Cuadrado, Azul, 5)]

-- d) De las figuras de xs, un cuadrado azul es mas grande que alguno de los cırculos.
-- < ∃x,y :  x,y ∈ℓ xs ∧ Cuadrado.x ∧ Azul.x ∧ Circulo.y : Tam.x > Tam.y >
[(Triangulo, Verde, 2), (Cuadrado, Azul, 15), (Circulo, Rojo, 20), (Circulo, Azul, 5)]

-- e) Algun cırculo de xs no es azul.
-- < ∃x :  x ∈ℓ xs ∧ Circulo.x : ¬Azul.x >
[(Circulo, Azul, 2), (Cuadrado, Azul, 15), (Circulo, Rojo, 20), (Circulo, Azul, 5)]


{-
7. Da un ejemplo de una lista de figuras xs que satisfaga simultaneamente los siguientes predicados.
-}

-- a) ⟨∀x : x ∈ℓ xs ∧ (¬rojo.x ∨ triangulo.x) : tam.x > 10⟩
[(Circulo, Rojo, 2), (Triangulo, Azul, 15), (Circulo, Azul, 20)]

-- b) ⟨∃x : x ∈ℓ xs ∧ rojo.x : True⟩ ∧ ⟨∃y : y ∈ℓ xs : ¬rojo.y⟩
[(Triangulo, Verde, 2), (Cuadrado, Rojo, 15)]

-- c) ⟨∀x : x ∈ℓ xs ∧ rojo.x : cuadrado.x ∧ tam.x > 10⟩
[(Rombo, Verde, 2), (Cuadrado, Rojo, 15), (Cuadrado, Rojo, 30)]