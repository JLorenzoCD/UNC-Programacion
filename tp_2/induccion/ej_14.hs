-- sum (xs ++ ys) = sum xs + sum ys

{-
## Definiciones 
sum :: Num a => [a] -> a
sum [] = 0                        -- Caso 1
sum (x:xs) = x + sum xs           -- Caso 2

(++) -> [a] -> [a] - [a]
[] ++ ys = ys                     -- Caso 3
(x:xs) ++ ys = x : (xs ++ ys)     -- Caso 4
-}

{-
## Caso base xs = []
sum ([] ++ ys) = sum [] + sum ys

{(++) - caso 3, y sum - caso 1}
sum ys = 0 + sum ys

{Como 0 es el elemento neutro en la suma}
sum ys = sum ys
{Por reflexion es V}

## Caso base xs = (x:xs)
sum ((x:xs) ++ ys) = sum (x:xs) + sum ys

{Por sum - caso 2, y (++) - caso 4}
sum (x : (xs ++ ys)) =  x + sum xs + sum ys

{Por sum - caso 2}
x + sum (xs ++ ys) =  x + sum xs + sum ys

{Si sumamos (-x) a ambos miebros de la igualdad se canselan las x}
sum (xs ++ ys) =  sum xs + sum ys
{Es igual a lo que se deseaba demostrar, por lo que es V}
-}

