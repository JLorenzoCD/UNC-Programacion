import Ej_1_2

{-
6. Construı una lista de figuras xs en las que se satisfagan progresivamente cada una de las siguientes
sentencias. Formaliza las oraciones con la logica de predicados.
-}

-- a) Alguna figura de xs es de tamaño mayor a 10.
-- < ∃x :  x ∈ℓ xs : Tam.x > 10 >
[(Circulo, Rojo, 20)]

-- b) Hay un cuadrado en xs.
-- < ∃x :  x ∈ℓ xs : Cuadrado.x >
[(Circulo, Rojo, 20), (Cuadrado, Azul, 11)]

-- c) En xs hay un cuadrado de tamaño mayor a 10.
-- < ∃x :  x ∈ℓ xs ∧ Cuadrado.x : Tam.x > 10 >
[(Circulo, Rojo, 20), (Cuadrado, Azul, 11)]

-- d) De las figuras de xs, un cuadrado azul es mas grande que alguno de los cırculos.
-- < ∃x,y :  x,y ∈ℓ xs ∧ Cuadrado.x ∧ Azul.x ∧ Circulo.y : Tam.x > Tam.y >
[(Circulo, Rojo, 20), (Cuadrado, Azul, 11), [(Circulo, Azul, 3)]

-- e) Algun cırculo de xs no es azul.
-- < ∃x :  x ∈ℓ xs ∧ Circulo.x : ¬Azul.x >
[(Circulo, Rojo, 20), (Cuadrado, Azul, 11), [(Circulo, Azul, 3)]


{-
7. Da un ejemplo de una lista de figuras xs que satisfaga simultaneamente los siguientes predicados.
a) ⟨∀x : x ∈ℓ xs ∧ (¬rojo.x ∨ triangulo.x) : tam.x > 10⟩
b) ⟨∃x : x ∈ℓ xs ∧ rojo.x : True⟩ ∧ ⟨∃y : y ∈ℓ xs : ¬rojo.y⟩
c) ⟨∀x : x ∈ℓ xs ∧ rojo.x : cuadrado.x ∧ tam.x > 10⟩
-}
[(Triangulo, Azul, 15), (Cuadrado, Rojo, 15)]