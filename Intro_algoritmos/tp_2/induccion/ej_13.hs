{-
13. Considerando la función soloPares :: [Int] -> [Int] denida de la siguiente manera
soloPares [] = []
soloPares (x:xs)
    | x mod 2 == 0 = x:(soloPares xs)
    | x mod 2 /= 0 = soloPares xs

demostrá que        --------->  soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)
Ayuda: Tené en cuenta que como la función soloPares se dene por casos, el caso inductivo también
deberá dividirse en dos casos.
-}

-- soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)

{-
## Definiciones
soloPares :: [Int] -> [Int]
soloPares [] = []                           -- Caso 1
soloPares (x:xs)
        | x mod 2 == 0 = x:(soloPares xs)   -- Caso 2
        | x mod 2 /= 0 = soloPares xs       -- Caso 3

(++) -> [a] -> [a] - [a]
[] ++ ys = ys                               -- Caso 4
(x:xs) ++ ys = x : (xs ++ ys)               -- Caso 5
-}

{-
## Caso base xs = []
soloPares ([] ++ ys) = (soloPares []) ++ (soloPares ys)

{(++) - caso 4, y soloPares - caso 1}
soloPares ys = [] ++ (soloPares ys)

{(++) - caso 4}
soloPares ys = soloPares ys
{Por reflexion es V}

## Caso xs = (x:xs)
soloPares ((x:xs) ++ ys) = (soloPares (x:xs)) ++ (soloPares ys)

{(++) - caso 5}
soloPares (x : (xs ++ ys)) = (soloPares (x:xs)) ++ (soloPares ys)

## soloPares tiene 2 posibles casos segun si (x mod 2 == 0) || (x mod 2 /= 0)
### Caso a - (x mod 2 == 0)
soloPares (x : (xs ++ ys)) = (soloPares (x:xs)) ++ (soloPares ys)

{soloPares - caso 2}
x : (soloPares (xs ++ ys)) = (x : soloPares xs) ++ (soloPares ys)

{Como (++) no es conmutativa, por lo que (x : soloPares xs) ++ (soloPares ys) ==  x: ((soloPares xs) ++ (soloPares ys))}
x : (soloPares (xs ++ ys)) = x : ( (soloPares xs) ++ (soloPares ys) )

{Si eliminamos el primer elemento de ambas igualdades, por ejemplo con drop 1}
soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)
{Es lo que se buscaba demostrar, por lo que es V}

### Caso b - (x mod 2 /= 0)
soloPares (x : (xs ++ ys)) = (soloPares (x:xs)) ++ (soloPares ys)

{soloPares - caso 3}
soloPares (xs ++ ys) = (soloPares xs) ++ (soloPares ys)
{Es lo que se buscaba demostrar, por lo que es V}
-}