-- rev (xs ++ ys) = (rev ys) ++ rev xs

{-
## Definiciones

rev :: [a] -> [a]
rev [] = []                             -- Caso 1
rev (x :xs) = rev xs ++ [x]             -- Caso 2

(++) -> [a] -> [a] - [a]
[] ++ ys = ys                           -- Caso 3
(x:xs) ++ ys = x : (xs ++ ys)           -- Caso 4
-}

{-
## Caso base xs = []
rev ([] ++ ys) = (rev ys) ++ rev []

{Por (++) - caso 3, y rev - caso 1}
rev ys = (rev ys) ++ []

{(++) no es conmutativa, por lo que el orden importa, aun asi, en caso de una lista vacia, esta actua como si fuese un operador neutro, por lo que se puede quitar}
rev ys = (rev ys)
{Por reflexion es V}

## Caso xs = (x:xs)
rev ((x:xs) ++ ys) = (rev ys) ++ rev (x:xs)

{Por (++) - caso 4, y rev - caso 2}
rev (x : (xs ++ ys)) = (rev ys) ++ rev xs ++ [x]

{Por rev - caso 2}
rev (xs ++ ys) ++ [x]  = (rev ys) ++ rev xs ++ [x]

{(++) no es conmutativa, por lo que si quitamos el ultimo elemento de la lista en ambos mimbros (o tomamos todos los elemntos menos el ultimo) de la igualdad nos queda}
rev (xs ++ ys) = (rev ys) ++ rev xs
{Es igual a lo que se deseaba demostrar, por lo que es V}
-}