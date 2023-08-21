module Ensayo_parcial_1 where

{-
##########################  1  ##########################
    Definir la función recursiva pegarEn3 :: [(String, String)] -> [(String, String, String)] que dada una lista de pares de String xs devuelve la lista de triplas obtenida al agregar una tercera componente con la concatenación de las dos primeras.
Ayuda: Puede usar, sin definir, la función ++. 

Ejemplo: pegarEn3 [("ab","cd"),("fg","hi")] = [("ab", "cd", "abcd"),("fg","hi", "fghi")]. 

Evaluar manualmente la función sobre el ejemplo dado en el punto anterior, utilizando la notación vista en clase, subrayando y justificando cada paso de substitución.
-}
pegar_en_3 :: [(String, String)] -> [(String, String, String)]
pegar_en_3 [] = []                                                  -- Caso 1
pegar_en_3 (( s1,s2 ):xs) = (s1, s2, s1 ++ s2) : (pegar_en_3 xs)    -- Caso 2

{-
## Evaluacion manual de pegar_en_3
pegar_en_3 [("ab","cd"),("fg","hi")]

{Notacion de constructor}
pegar_en_3 (("ab","cd"): ("fg","hi"): [])

{Por pegar_en_3 - caso 2}
("ab", "cd", "ab" ++ "cd") : (pegar_en_3 [("fg","hi")])

{Por pegar_en_3 - caso 2}
("ab", "cd", "ab" ++ "cd") : ("fg", "hi", "fg" ++ "hi") : (pegar_en_3 [])

{Por pegar_en_3 - caso 1}
("ab", "cd", "ab" ++ "cd") : ("fg", "hi", "fg" ++ "hi") : []

{aplicando (++)}
("ab", "cd", "abcd") : ("fg", "hi", "fghi") : []

{cambiando anotacion de la lista}
[("ab", "cd", "abcd") ,("fg", "hi", "fghi")]

{Nos queda igual que en el ejemplo}
pegar_en_3 [("ab","cd"),("fg","hi")] = [("ab", "cd", "abcd") ,("fg", "hi", "fghi")]
-}

{-
##########################  2  ##########################
    Definir la función recursiva cocientes :: Int -> [Int] -> [Int] que dados un entero n y una lista de enteros xs, la lista que resulta de la división    entera de los elementos de xs por n. 

Ejemplo: cocientes 3 [5, 6, 4, 1] = [1, 2, 1, 0] 

Evaluar manualmente la función sobre el ejemplo dado en el punto anterior, utilizando la notación vista en clase, subrayando y justificando cada paso de substitución
-}
cocientes :: Int -> [Int] -> [Int]
cocientes 0 xs = error "no se puede dividir por cero"
cocientes n [] = []                                     -- Caso 1
cocientes n (x:xs) = (div x n) : cocientes n xs         -- Caso 2

{-
## Evaluacion manual de cocientes
cocientes 3 [5, 6, 4, 1]

{Notacion de constructor}
cocientes 3 (5 : 6 : 4 : 1 : [])

{Por cocientes - caso 2}
(div 5 3) : cocientes 3 (6 : 4 : 1 : [])

{Por cocientes - caso 2}
(div 5 3) : (div 6 3) : cocientes 3 (4 : 1 : [])

{Por cocientes - caso 2}
(div 5 3) : (div 6 3) : (div 4 3) : cocientes 3 (1 : [])

{Por cocientes - caso 2}
(div 5 3) : (div 6 3) : (div 4 3) : (div 1 3) : cocientes 3 []

{Por cocientes - caso 1 (lista vacia)}
(div 5 3) : (div 6 3) : (div 4 3) : (div 1 3) : []

{aplicando (div)}
1 : 2 : 1 : 0 : []

{cambiando anotacion de la lista}
[1, 2, 1, 0]

{Nos queda igual que en el ejemplo}
cocientes 3 [5, 6, 4, 1] = [1, 2, 1, 0] 
-}


{-
##########################  3  ##########################
    Dadas las siguientes funciones 

concatena :: [[a]] -> [a]
concatena [] = []                               -- Caso 1
concatena (xs:xss) = xs ++ (concatena xss)      -- Caso 2 

sum :: [Int] -> Int 
sum [] = 0                                      -- Caso 3
sum (x:xs) = x + sum xs                         -- Caso 4

cuenta :: [[Int]] -> Int 
cuenta [] = 0                                   -- Caso 5
cuenta (xs:xss) = (sum xs) + (cuenta xss)       -- Caso 6

demuestre por inducción la siguiente propiedad ----> sum (concatena xss) = (cuenta xss). 

Ayuda: Pueden usar sin demostrar la propiedad vista en clase: 

sum (xs ++ ys) = sum xs + sum ys                -- Caso 7

Se debe indicar claramente la resolución del caso base, la hipótesis inductiva y la resolución del caso inductivo. Utilizar la notación vista en clase, subrayando y justificando cada paso.
-}

{-
## Caso base xss = []
sum (concatena []) = (cuenta [])

{Por concatena - caso 1, y cuenta - caso 5}
sum [] = 0
{Por definicion de la funcion sum - caso 3, es V}

## Caso xss = (xs:xss)
sum (concatena (xs:xss)) = (cuenta (xs:xss))

{Por concatena - caso 2}
sum (xs ++ (concatena xss)) = (cuenta (xs:xss))

{Por cuenta - caso 6}
sum (xs ++ (concatena xss)) = (sum xs) + (cuenta xss)

{Por caso 7}
sum xs + sum (concatena xss) = (sum xs) + (cuenta xss)

{Como (sum xs) nos devuelve un numero z, si sumo (-z) en ambos miembros de igualdad nos queda}
sum (concatena xss) = (cuenta xss)
{Es el caso inductivo que se queria mostrar, por lo que este es V}
-}


{-
##########################  4  ##########################
    Dadas las siguientes funciones 

sacaUnos :: [Int] -> [Int] 
sacaUnos [] = []                            -- Caso 1
sacaUnos (x:xs) 
  | x == 1 = sacaUnos xs                    -- Caso 2a
  | x != 1 = x:(sacaUnos xs)                -- Caso 2b

productoria :: [Int] -> Int 
productoria [] = 1                           -- Caso 3
productoria (x:xs) = x * (productoria xs)    -- Caso 4

demuestre por inducción la siguiente propiedad ---> productoria (sacaUnos xs) = productoria xs. 

Se debe indicar claramente la resolución del caso base, la hipótesis inductiva y la resolución del caso inductivo. Utilizar la notación vista en clase, subrayando y justificando cada paso
-}

{-
## Caso base xs = []
productoria (sacaUnos []) = productoria []

{Por sacaUnos - caso 1}
productoria [] = productoria []
{Por refleccion es V}

## Caso xs = (x:xs)
productoria (sacaUnos (x:xs)) = productoria (x:xs)

{Por productoria - caso 4}
productoria (sacaUnos (x:xs)) = x * (productoria xs)

### Como sacaUnos posse 2 caso, se debe evaluar cundo x == 1 y cuando x /= 1

#### Con x == 1
productoria (sacaUnos (x:xs)) = x * (productoria xs)

{Por sacaUnos - caso 2a}
productoria (sacaUnos xs) = x * (productoria xs)

{Como x esta multiplicando y 1 es el elemento neutro de la multiplicacion, se puede quitar, quedando}
productoria (sacaUnos xs) = productoria xs
{Es igual al lo que se deseaba demostrar, por lo que es V para x == 1}


#### Con x /= 1
productoria (sacaUnos (x:xs)) = x * (productoria xs)

{Por sacaUnos - caso 2b}
productoria (x : (sacaUnos xs)) = x * (productoria xs)

{Por productoria - caso 4}
x * (productoria (sacaUnos xs)) =  x * (productoria xs)

{Como x se esta multiplicando a ambos miebros, si multiplicamos ambos miembros de la igualdad por (1/x) nos queda}
productoria (sacaUnos xs) = productoria xs
{Es igual al lo que se deseaba demostrar, por lo que es V para x /= 1}
-}