{-
12. Considerando la función quitarCeros :: [Int] -> [Int] de?nida de la siguiente manera
quitarCeros [] = []
quitarCeros (x:xs)
    | x /= 0 = x:quitarCeros xs
    | x == 0 = quitarCeros xs
    
demostrá que        ------->    sum (quitarCeros xs) = sum xs
Ayuda: Tené en cuenta que como la función quitarCeros se dene por casos, el caso inductivo también
deberá dividirse en dos casos.
-}

-- sum (quitarCeros xs) = sum xs

{-
## Definiciones
quitarCeros :: [Int] -> [Int]
quitarCeros [] = []                     -- Caso 1
quitarCeros (x:xs)
        | x /= 0 = x:quitarCeros xs     -- Caso 2
        | x == 0 = quitarCeros xs       -- Caso 3


sum :: Num a => [a] -> a
sum [] = 0                              -- Caso 4
sum (x:xs) = x + sum xs                 -- Caso 5
-}

{-
## Caso base xs = []
sum (quitarCeros []) = sum []

{quitarCeros - caso 1}
sum [] = sum []
{Por reflexion es V}

## Caso xs = (x:xs)
sum (quitarCeros (x:xs)) = sum (x:xs)

{sum - caso 5}
sum (quitarCeros (x:xs)) = x + sum xs

## quitarCeros tiene 2 posibles casos segun si (x == 0) || (x /= 0)
### Caso a - (x == 0)
{quitarCeros - caso 3}
sum (quitarCeros xs) = 0 + sum xs

{cero es neutro en suma por lo que}
sum (quitarCeros xs) = sum xs
{Es igual a lo que se buscaba demostrar, por lo que es V}

## Caso b - (x /=0)
{quitarCeros - caso 2}
sum (x:quitarCeros xs ) = x + sum xs

{sum - caso 5}
x + sum (quitarCeros xs) = x + sum xs

{si sumo (-x) a ambos miembros de la igualdad}
sum (quitarCeros xs) = sum xs
{Es igual a lo que se buscaba demostrar, por lo que es V}
-}