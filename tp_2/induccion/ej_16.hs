-- concat (xss ++ yss) = (concat xss) ++ (concat yss)

{-
## Definiciones
concat : [[a]] -> [a]
concat [] = []                          -- Caso 1
concat (xs :xss) = xs ++ (concat xss)   -- Caso 2

(++) -> [a] -> [a] - [a]
[] ++ ys = ys                           -- Caso 3
(x:xs) ++ ys = x : (xs ++ ys)           -- Caso 4
-}

{-
## Caso base xss = []
concat ([] ++ yss) = (concat []) ++ (concat yss)

{Por concat - caso 1, y (++) - caso 3}
concat yss = [] ++ (concat yss)

{Por (++) - caso 3}
concat yss = concat yss
{Por reflexion es V}

## Caso base xss = (xs:xss)
concat ((xs:xss) ++ yss) = (concat (xs:xss)) ++ (concat yss)

{Por (++) - caso 4, y concat - caso 2}
concat (xs : (xss ++ yss)) = xs ++ (concat xss) ++ (concat yss)

{Por concat - caso 2}
xs ++ (concat xss) = xs ++ (concat xss) ++ (concat yss)

{Como (++) no es conmutativa, xs sera el primer elemento en ambas listas, por lo que si eliminamos el primer elemento, nos queda}
concat xss = (concat xss) ++ (concat yss)
{Es igual a lo que se deseaba demostrar, por lo que es V}
-}

