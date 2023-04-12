-- length (repetir n x) = n

{-
## Definiciones
length :: [a] -> Int
length [] = 0                       -- Caso 1
length (x:xs) = 1 + length xs       -- Caso 2

repetir :: Int-> Int-> [Int]
repetir 0 x = [ ]                   -- Caso 3
repetir (n+1) x = x:(repetir n x)   -- Caso 4
-}

{-
## Caso base n = 0
length (repetir 0 x) = 0

{Por repetir - caso 3}
length [] = 0
{Por length - caso 1, es V}

## Caso base n = (y + 1)
length (repetir (y + 1) x) = (y + 1)

{Por repetir - caso 4}
length (x : (repetir y x)) = (y + 1)

{Por length - caso 2}
1 + length (repetir y x) = y + 1

{Si sumo (-1) a ambos miembros de la igualdad, el (+1) se cansela}
length (repetir y x) = y
{Es igual a lo que se deseaba demostrar, por lo que es V}
-}
