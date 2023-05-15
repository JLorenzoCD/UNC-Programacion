import Ej_1_2

{-
########################### 3 y 4 ###########################
3- Dada una lista de figuras xs expresa las siguientes propiedades utilizando los cuantificadores y los predicados y funciones ya definidas
a) Todas las figuras de xs son rojas.
b) Todas las figuras de xs son de tamaño menor a 5.
c) Todos los triangulos de xs son rojos.
d) Existe un cuadrado verde en xs.
e) Todos los cırculos de xs son azules y de tamaño menor a 10.
f) Ningun triangulo de xs es azul.
g) En xs no hay cırculos amarillos ni verdes.
h) Existe (al menos) un cuadrado de tamaño menor a 5 en xs.
i) Si hay cırculos rojos en xs entonces hay cuadrados rojos.

4- Para cada propiedad del ejercicio 3 da un ejemplo de una lista xs que la cumpla y un ejemplo de una lista xs que no la cumpla


a) Todas las figuras de xs son rojas.
W = < ∀x : x ∈ℓ xs : Rojo.x >
W se cumple en xs = [(Circulo, Rojo, 7), (Cuadrado, Rojo, 2)]
W no se cumple en xs = [(Circulo, Azul, 7), (Cuadrado, Rojo, 2)]

b) Todas las figuras de xs son de tamaño menor a 5.
W = < ∀x : x ∈ℓ xs : Tam.x < 5 >
W se cumple en xs = [(Circulo, Azul, 3), (Cuadrado, Rojo, 2)]
W no cumple en xs = [(Circulo, Azul, 8), (Cuadrado, Rojo, 2)]

c) Todos los triangulos de xs son rojos.
W = < ∀x : x ∈ℓ xs : Triangulo.x ⇒ Rojo.x >
W se cumple en xs = [(Triangulo, Rojo, 3), (Circulo, Rojo, 2)]
W no cumple en xs = [(Triangulo, Azul, 8), (Triangulo, Rojo, 2)]

d) Existe un cuadrado verde en xs.
W = < ∃x : x ∈ℓ xs : Cuadrado.x ∧ Verde.x >
W se cumple en xs = [(Triangulo, Rojo, 3), (Cuadrado, Verde, 2)]
W no cumple en xs = [(Cuadrado, Azul, 8), (Cuadrado, Rojo, 2)]

e) Todos los cırculos de xs son azules y de tamaño menor a 10.
W = < ∀x : x ∈ℓ xs ∧ Circulos.x : Azul.x ∧ Tam.x < 10 >
W se cumple en xs = [(Triangulo, Rojo, 3), (Circulo, Verde, 2)]
W no cumple en xs = [(Circulo, Azul, 8), (Circulo, Rojo, 12)]

f) Ningun triangulo de xs es azul.
W = < ∀x : x ∈ℓ xs ∧ Triangulo.x : ¬Azul.x >
W se cumple en xs = [(Triangulo, Rojo, 3), (Triangulo, Verde, 2)]
W no cumple en xs = [(Circulo, Azul, 8), (Triangulo, Azul, 12)]

g) En xs no hay cırculos amarillos ni verdes.
W = < ∀x : x ∈ℓ xs ∧ Circulo.x : ¬(Amarillo.x ∨ Verde.x)>
W se cumple en xs = [(Circulo, Rojo, 3), (Triangulo, Verde, 2)]
W no cumple en xs = [(Circulo, Verde, 8), (Circulo, Amarillo, 12)]

h) Existe (al menos) un cuadrado de tamaño menor a 5 en xs.
W = < ∃x : x ∈ℓ xs ∧ Cuadrado.x : Tam.x < 5>
W se cumple en xs = [(Cuadrado, Rojo, 8), (Cuadrado, Verde, 2)]
W no cumple en xs = [(Circulo, Verde, 8), (Circulo, Amarillo, 12)]

i) Si hay cırculos rojos en xs entonces hay cuadrados rojos.
W = < ∃x : x ∈ℓ xs ∧ Circulo.x ∧ Rojo.x : Cuadrado.x ∧ Rojo.x>
W se cumple en xs = [(Circulo, Rojo, 8), (Cuadrado, Rojo, 2)]
W no cumple en xs = [(Circulo, Rojo, 8), (Circulo, Amarillo, 12)]
-}

{-
########################### 5 ###########################
Para cada propiedad del ejercicio 3 definı una funcion recursiva que dada una lista devuelva verdadero si la propiedad se cumple para esa lista y falso en caso contrario
-}

-- a) Todas las figuras de xs son rojas.
todas_cr :: [Figura] -> Bool
todas_cr [] = True
todas_cr (x:xs) = rojo x && todas_cr xs


-- b) Todas las figuras de xs son de tamaño menor a 5.
todas_tam_menor_5 :: [Figura] -> Bool
todas_tam_menor_5 [] = True
todas_tam_menor_5 (x:xs) = (tam x < 5 ) && todas_tam_menor_5 xs

-- c) Todos los triangulos de xs son rojos.
todos_triangulos_cr :: [Figura] -> Bool
todos_triangulos_cr [] = True
todos_triangulos_cr (x:xs)
        | triangulo x = rojo x && todos_triangulos_cr xs
        | otherwise = todos_triangulos_cr xs

-- d) Existe un cuadrado verde en xs.
hay_cuadrado_cv :: [Figura] -> Bool
hay_cuadrado_cv [] = False
hay_cuadrado_cv (x:xs)
    | cuadrado x && verde x = True
    | otherwise = hay_cuadrado_cv xs

-- e) Todos los cırculos de xs son azules y de tamaño menor a 10.
todos_circulos_ca_tam_menor_10 :: [Figura] -> Bool
todos_circulos_ca_tam_menor_10 [] = True
todos_circulos_ca_tam_menor_10 (x:xs)
    | circulo x = azul x && (tam x < 10) && todos_circulos_ca_tam_menor_10 xs
    | otherwise = todos_circulos_ca_tam_menor_10 xs


-- f) Ningun triangulo de xs es azul.
ningun_triangulo_ca :: [Figura] -> Bool
ningun_triangulo_ca [] = True
ningun_triangulo_ca (x:xs)
    | triangulo x = azul x && ningun_triangulo_ca xs
    | otherwise = ningun_triangulo_ca xs


-- g) En xs no hay cırculos amarillos ni verdes.
no_circulos_ca_ni_cv :: [Figura] -> Bool
no_circulos_ca_ni_cv [] = True
no_circulos_ca_ni_cv (x:xs)
    | circulo x = not (amarillo x || verde x) && no_circulos_ca_ni_cv xs
    | otherwise = no_circulos_ca_ni_cv xs

-- h) Existe (al menos) un cuadrado de tamaño menor a 5 en xs.
hay_cuadrado_tam_menor_5 :: [Figura] -> Bool
hay_cuadrado_tam_menor_5 [] = False
hay_cuadrado_tam_menor_5 (x:xs)
    | cuadrado x && (tam x < 5) = True
    | otherwise = hay_cuadrado_tam_menor_5 xs

-- i) Si hay cırculos rojos en xs entonces hay cuadrados rojos.
hay_circulo_cr :: [Figura] -> Bool
hay_circulo_cr [] = False
hay_circulo_cr (x:xs)
    | (circulo x) && (rojo x) = True
    | otherwise = hay_circulo_cr xs

hay_cuadrado_cr :: [Figura] -> Bool
hay_cuadrado_cr [] = False
hay_cuadrado_cr (x:xs)
    | (cuadrado x) && (rojo x) = True
    | otherwise = hay_cuadrado_cr xs

hay_circulo_cr_entonces_hay_cuadrado_cr :: [Figura] -> Bool
hay_circulo_cr_entonces_hay_cuadrado_cr [] = True
hay_circulo_cr_entonces_hay_cuadrado_cr xs = (not (hay_circulo_cr xs)) || hay_cuadrado_cr xs