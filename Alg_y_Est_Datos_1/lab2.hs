-- ###################### Lab 2 ######################
-- ###################### 1 ######################
-- a
data Carrera = Matematica | Fisica | Computacion | Astronomia
    deriving (Show, Eq, Ord, Bounded)

-- b
{-
titulo :: Carrera -> String
titulo Matematica = "Licenciado en Matematica"
titulo Fisica = "Licenciado en Fisica"
titulo Computacion = "Licenciado en Computacion"
titulo Astronomia = "Licenciado en Astronomia"
-}

titulo :: Carrera -> String
titulo carrera = "Licenciado en " ++ show(carrera)
-- La funcion show funciona gracias a la propiedad Show en el derivering

-- c
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
    deriving (Show, Eq, Ord, Bounded)

-- d
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'


-- ###################### 2 ######################
{-
Realizado en la linea 38 del archivo
-}

-- ###################### 3 ######################3
-- a
minimoElemento :: Ord a => [a] -> a
minimoElemento [a] = a
minimoElemento (x:(y:xs)) = x `min` minimoElemento (y:xs)
-- minimoElemento ['H','A','a','b']             =>          'A'
-- minimoElemento [1,2,3,4,5,65]                =>           1

-- b
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = x `min` minimoElemento' xs

-- c
{-
Se agrego el deriving a la propiedad Bounded para obtener el minimo
minimoElemento' [Fa, La, Sol, Re, Fa]       =>      Re
-}

