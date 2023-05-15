module Ej_1_2
  (module Ej_1_2)
  where

data Color = Rojo | Amarillo | Azul | Verde
    deriving (Show, Eq)
data Forma = Triangulo | Cuadrado | Rombo | Circulo
    deriving (Show, Eq)

type Figura = (Forma, Color, Int)

{-
########################### 1 ###########################
A cada figura se pueden asociar diferentes predicados que indiquen el color y la forma. Implementa en Haskell las funciones correspondientes a los predicados azul, amarillo, verde, circulo,
rombo, cuadrado y triangulo
-}
-- Es Color
rojo :: Figura ->Bool
rojo (f,c,t) = c == Rojo

azul :: Figura ->Bool
azul (f,c,t) = c == Azul

amarillo :: Figura ->Bool
amarillo (f,c,t) = c == Amarillo

verde :: Figura ->Bool
verde (f,c,t) = c == Verde

-- Es Forma
circulo :: Figura ->Bool
circulo (f,c,t) = f == Circulo

triangulo :: Figura ->Bool
triangulo (f,c,t) = f == Triangulo

cuadrado :: Figura ->Bool
cuadrado (f,c,t) = f == Cuadrado

rombo :: Figura ->Bool
rombo (f,c,t) = f == Rombo

{-
########################### 2 ###########################
Definı la funcion tam :: Figura -> Int, que dada una figura devuelve su tamaño
-}
tam :: Figura -> Int
tam (f,c,t) = t