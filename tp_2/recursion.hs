module Tp_2_recursion where

-- Ejercicio 7 (funcion unzup)
type Persona = (String, String, Int) -- (Nombre, Apellido, Edad)
apellidos :: [Persona] -> [String]
apellidos [] = []
apellidos ( (_, apellido,_):personas ) = apellido : apellidos personas

-- Ejercicio 8
-- length propio
len_propio :: [a] -> Int
len_propio [] = 0
len_propio (x:xs) = 1 + len_propio xs


-- !! propio
{-
    Esta bien pero se pedia con recurcion
elem_de_indice :: Int -> Int -> [a] -> a
elem_de_indice indice_actual indice_buscado [] = error "la lista no posee dicho indice" 
elem_de_indice indice_actual indice_buscado (x:xs)
        | indice_buscado < 0 = error "no existe elementos de una lista con indice negativo"
        | otherwise = if indice_buscado == indice_actual then x else elem_de_indice (indice_actual+1) indice_buscado xs
-}
elem_de_indice :: Int -> [a] -> a
elem_de_indice indice_buscado [] = error "la lista no posee dicho indice"
elem_de_indice 0 (x:xs) = x
elem_de_indice indice_buscado (x:xs) = elem_de_indice (indice_buscado - 1) xs 

-- take proprio
{-
    Esta bien pero se pedia con recurcion
take_base :: Int -> Int -> [a] -> [a]
take_base indice_actual hasta_indice [] = []
take_base indice_actual hasta_indice (x:xs)
        | hasta_indice < 0 = error "no se puede extraer elementos hasta un indice negatio"
        | otherwise = if indice_actual <= hasta_indice then x : take_base (indice_actual +1) hasta_indice xs else []

take_propio :: Int -> [a] -> [a]
take_propio = take_base 1
-}
take_propio :: Int -> [a] -> [a]
take_propio hasta_indice [] = []
take_propio 0 l = []
take_propio hasta_indice (x:xs) = x : take_propio (hasta_indice - 1) xs

-- drop propio
{-
    Esta bien pero se pedia con recurcion
drop_base :: Int -> Int -> [a] -> [a]
drop_base indice_actual hasta_indice [] = []
drop_base indice_actual hasta_indice (x:xs)
        | hasta_indice < 0 = error "no se puede extraer elementos hasta un indice negatio"
        | otherwise = if (indice_actual < hasta_indice) then (drop_base (indice_actual +1) hasta_indice xs) else xs

drop_propio :: Int -> [a] -> [a]
drop_propio = drop_base 1
-}
drop_propio :: Int -> [a] -> [a]
drop_propio hasta_indice [] = []
drop_propio 0 l = l
drop_propio hasta_indice (x:xs) = drop_propio (hasta_indice - 1) xs

-- ++ propio
unir_propio :: [a] -> [a] -> [a]
unir_propio [] [] = []
unir_propio [] (x:xs) = x : unir_propio [] xs
unir_propio (x:xs) [] = x : unir_propio xs []
unir_propio (x:xs) (z:zs) = x : unir_propio xs (z:zs)

-- Ejercicio 9
{-
    Esta bien pero se pedia con recurcion
maximo_base :: Int -> [Int] -> Int
maximo_base maximo_anterior [] = maximo_anterior
maximo_base maximo_anterior (n:ns) = maximo_base (max maximo_anterior n) ns

maximo :: [Int] -> Int
maximo = maximo_base 0
-}
maximo :: [Int] -> Int
maximo [] = error "no se puede obtener el maximo de una lista vacia"
maximo (y:[]) = y
maximo (n:ns) = max n (maximo ns)


{-
    Esta bien pero se pedia con recurcion
suma_pares_base :: Int -> [(Int, Int)] -> Int
suma_pares_base total [] = total
suma_pares_base total ( (a, b):pares ) = suma_pares_base (total + a + b) pares

suma_pares :: [(Int, Int)] -> Int
suma_pares = suma_pares_base 0
-}
suma_pares :: [(Int, Int)] -> Int
suma_pares [] = 0
suma_pares ((a, b):pares) = a + b + suma_pares pares

todos_1_y_0 :: [Int] -> Bool
todos_1_y_0 [] = True
todos_1_y_0 (n:ns) = if n == 1 || n == 0 then todos_1_y_0 ns else False

quitar_0 :: [Int] -> [Int]
quitar_0 [] = []
quitar_0 (n:ns) = if n == 0 then quitar_0 ns else n : quitar_0 ns

{-
ultimo :: [a] -> a
ultimo [] = error "una lista vacia no posee ultimo elemnto"
ultimo (x:xs) = if length xs == 0 then x else ultimo xs
-}
ultimo :: [a] -> a
ultimo [] = error "una lista vacia no posee ultimo elemnto"
ultimo (x:[]) = x
ultimo (x:xs) = ultimo xs

repetir :: Int -> Int -> [Int]
repetir 0 a_repetir = []
repetir repeticion a_repetir = a_repetir : repetir (repeticion - 1) a_repetir

concat_propio :: [[a]] -> [a]
concat_propio [] = []
concat_propio (x:xs) = x ++ (concat_propio xs)

rev :: [a] -> [a]
rev [] = []
rev (x:xs) = (rev xs) ++ [x]