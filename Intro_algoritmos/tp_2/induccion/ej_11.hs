{-
11. Demostrá por inducción las siguientes propiedades. Ayuda: Recordá la de?nición de cada uno de los
operadores implicados en cada expresión.
a) xs ++ [ ] = xs (la lista vacía es el elemento neutro de la concatenación)
b) length xs ⩾ 0
-}

-- a) xs ++ [ ] = xs

{-
## Definiciones
(++) -> [a] -> [a] - [a]
[] ++ ys = ys                   -- Caso 1
(x:xs) ++ ys = x : (xs ++ ys)   -- Caso 2
-}

{-
## Caso base xs = []
[] ++ [] = [] 

{Por definicion (++) (caso 1), considerando a la segunda lista vacia como ys}
[] = []
{Por refflexio nos da verdadero}
-}

-- b) length xs >= 0
{-
## Definiciones
length :: [a] -> Int
length [] = 0                   -- Caso 1
length (x:xs) = 1 + length xs   -- Caso 2
-}

{
## Caso base xs = []
length [] >= 0

{length - caso 1}
0 >= 0
{Por reflexion es V}

## Caso xs = (x:xs)
length (x:xs) >= 0

{length - caso 2}
1 + length xs >= 0
{si xs posee mas elementos, entonces apareceran mas (+1), si xs = 0, entonces me queda (1 >= 0); por lo que cumple la condicion}
}