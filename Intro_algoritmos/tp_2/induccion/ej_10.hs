{-
10. Considerando las de?niciones de los ejercicios anteriores demostrá por inducción sobre xs las siguientes
propiedades:
a) sum (sumar1 xs) = sum xs + (length xs)
b) sum (duplica xs) = 2 * sum xs
c) length (duplica xs) = length xs
-}

-- a) sum (sumar1 xs) = sum xs + (length xs)

{-
## Definiciones
sumar_1:: Num a => [a] -> [a]
sumar_1 [] = []                         -- Caso 1
sumar1 (n:ns) = (n + 1) : sumar_1 ns    -- Caso 2

sum :: Num a => [a] -> a
sum [] = 0                              -- Caso 3
sum (n:ns) = n + sum ns                 -- Caso 4

length :: [a] -> Int
length [] = 0                           -- Caso 5
length (x:xs) = 1 + length xs           -- Caso 6
-}

{-
## Caso base xs = []

sum (sumar1 []) = sum [] + (length [])
sum ([]) = 0 + 0
0 = 0

## Caso xs = (x:xs)

sum ( sumar1 x:xs) = sum x:xs + length x:xs

{Por definicion de suma1 (caso 2), de sum (caso 4)} y de length (caso 6)
sum ( x + 1 : sumar1 xs) = (x + sum xs) + (1 + length xs)

{Quitando parentesis inecesarios}
x + 1 + sum(sumar1 xs) = x + sum xs + 1 + length xs

{Reordenando}
(x + 1) + sum(sumar1 xs) = (x + 1) + sum xs + length xs

{Por propiedades de la suma, puedo sumar -(x + 1) en ambos miembros, cancelado el (x + 1) y quedando con la igualadad a demostrar}
sum (sumar1 xs) = sum xs + length xs
-}


-- b) sum (duplica xs) = 2 * sum xs

{-
## Definiciones
duplica :: Num a => [a] -> [a]
duplica [] = []                         -- Caso 1
duplica (n:ns) = n * 2 : duplica ns     -- Caso 2


sum :: Num a => [a] -> a
sum [] = 0                              -- Caso 3
sum (n:ns) = n + sum ns                 -- Caso 4
-}

{-
## Caso base xs = []

sum (duplica []) = 2 * sum []

{Por definicion duplica (caso 1) y sum (caso 3)}
sum [] = 2 * 0

{Por definicion sum (caso 3)}
0 = 0

## Caso xs = (x:xs)
sum (duplica x:xs) = 2 * sum x:xs

{Por definicion duplica (caso 2) y sum (caso 4)}
sum (2 * x : duplica xs) = 2 * (x + sum xs)

{Por definicion sum (caso 4) y propieda dsitributiva de *}
2 * x + sum (duplica xs) = 2 * x + 2 * sum xs

{Por propiedades de la suma, puedo sumar -(2 * x) en ambos miembros, cancelado el (2 * x) y quedando con la igualadad a demostrar}
sum (duplica xs) = 2 * sum xs
-}

-- c) length (duplica xs) = length xs

{-
## Definiciones
duplica :: Num a => [a] -> [a]
duplica [] = []                         -- Caso 1
duplica (n:ns) = n * 2 : duplica ns     -- Caso 2

length :: [a] -> Int
length [] = 0                           -- Caso 3
length (x:xs) = 1 + length xs           -- Caso 4
-}

{-
## Caso base xs = []
length (duplica []) = length []

{Por definicioes duplica (caso 1) y length (caso3)}
length [] = 0 -- Por definicion de length (caso 3) queda demostrada la iguadad
-}

{-
## Caso base xs = (x:xs)
length (duplica (x:xs)) = length (x:xs)

{Por definiciones duplica (caso 2) y length (caso 4)}
length (x * 2 : duplica xs) = 1 + length xs

{Por definiciones length (caso 4)}
1 + length (duplica xs) = 1 + length xs

{Si sumamos -1 a ambos miembros, nos que da la igualdad a demostrar}
length (duplica xs) = length xs
-}


