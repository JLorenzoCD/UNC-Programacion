{-
18. Demostrá por inducción las siguientes propiedades. Ayuda: Recordá la denición de cada uno de los
operadores implicados en cada expresión.

a) xs ++ (ys ++ zs) = (xs ++ ys) ++ zs (la concatenación es asociativa)
b) take (length xs) (xs ++ ys) = xs
c) drop (length xs) (xs ++ ys) = ys
d) xs ++ (y:ys) = (xs ++ [y]) ++ ys
-}

{-
## Definiciones
length :: [a] -> Int
length [] = 0                                                               -- Caso 1
length (x:xs) = 1 + length xs                                               -- Caso 2

(++) -> [a] -> [a] - [a]
[] ++ ys = ys                                                               -- Caso 3
(x:xs) ++ ys = x : (xs ++ ys)                                               -- Caso 4

take_propio :: Int -> [a] -> [a]
take_propio hasta_indice [] = []                                            -- Caso 5
take_propio 0 l = []                                                        -- Caso 6
take_propio (1 + hasta_indice) (x:xs) = x : take_propio hasta_indice xs     -- Caso 7


drop_propio :: Int -> [a] -> [a]
drop_propio hasta_indice [] = []                                            -- Caso 8
drop_propio 0 l = l                                                         -- Caso 9
drop_propio (1 + hasta_indice) (x:xs) = drop_propio hasta_indice xs         -- Caso 10
-}

-- a) xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

{-
## Caso base xs = []
[] ++ (ys ++ zs) = ([] ++ ys) ++ zs

{Por (++) - caso 3}
ys ++ zs = ys ++ zs
{Por reflexion es V}

## Caso xs = (x:xs)
(x:xs) ++ (ys ++ zs) = ((x:xs) ++ ys) ++ zs

{Por (++) - caso 4}
x : (xs ++ (ys ++ zs) =  x : ((xs ++ ys) ++ zs)

{Como (++) no es conmutativa, el primer elemento de la lista sigue siendo el primero, y el ultimo de la segunda lista, el ultio de la lista resultante, por lo que si quitamos el primer elemento de la lista en ambos miembros de la igualdad}
xs ++ (ys ++ zs) = (xs ++ ys) ++ zs
{Nos queda lo que deseabamos demostrar, por lo que es V}
-}

-- b) take (length xs) (xs ++ ys) = xs

{-
## Caso base xs = []
take (length []) ([] ++ ys) = []

{Por length - caso 1}
take 0 ([] ++ ys) = []

{Por (++) - caso 3}
take 0 ys = []
{Por take - caso 6 sabemos que es V}

## Caso xs = (x:xs)
take (length (x:xs)) ((x:xs) ++ ys) = (x:xs)

{Por length - caso 2}
take (1 + length xs) ((x:xs) ++ ys) = (x:xs)

{Por (++) - caso 4}
take (1 + length xs) (x : (xs ++ ys)) = (x:xs)

{Por take - caso 7}
x : take (length xs) (xs ++ ys) = (x:xs)

{Si eliminamos el primer elemento de la lsita de ambos miembros de la igualdad nos queda}
take (length xs) (xs ++ ys) = xs
{Es lo que desebamos demostrar, que es V}
-}

-- c) drop (length xs) (xs ++ ys) = ys

{-
## Caso base xs = []
drop (length []) ([] ++ ys) = ys

{Por length - caso 1}
drop 0 ([] ++ ys) = ys

{Por (++) - caso 3}
drop 0 ys = ys
{Por drop - caso 9, sabemos que la exprecion es V}

## Caso xs = (x:xs)
drop (length (x:xs)) ((x:xs) ++ ys) = ys

{Por length - caso 2}
drop (1 + length xs) ((x:xs) ++ ys) = ys

{Por (++) - caso 4}
drop (1 + length xs) x :(xs ++ ys) = ys

{Por drop - caso 10}
drop (length xs) (xs ++ ys) = ys
{Es lo que desebamos demostrar, que es V}
-}

-- d) xs ++ (y:ys) = (xs ++ [y]) ++ ys

{-
## Caso base xs = []
[] ++ (y:ys) = ([] ++ [y]) ++ ys

{Por (++) - caso 3}
(y:ys) = ([y]) ++ ys

{Si cambiamos la exprecion de la lista}
(y:ys) = (y:[]) ++ ys

{Por (++) - caso 4}
(y:ys) = x : ([] ++ ys)

{Como [] funciona como operador neutro para la funcion (++) podemos quitarlo y no quedara}
(y:ys) = (y:ys)
{Por reflexion es V}

## Caso xs = (x:xs)
(x:xs) ++ (y:ys) = ((x:xs) ++ [y]) ++ ys

{Por (++) - caso 4}
x : (xs ++ (y:ys)) = (x : (xs ++ [y]) ++ ys

{Como (++) no es comutativa, el primer elemento de la primera lista termina siendo el primer elemento de la lsita resultante, por lo que si eliminamos el primer elemento de ambos miembros de la igualdad, nos queda}
xs ++ (y:ys) = (xs ++ [y]) ++ ys
{Es lo que desebamos demostrar, que es V}
-}
