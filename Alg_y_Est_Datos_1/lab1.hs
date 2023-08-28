-- ######################## 1 ########################
-- a
esCero :: Int -> Bool
esCero x = x == 0

-- b
esPositivo :: Int -> Bool
esPositivo x = x >= 0

-- c
esVocal :: Char -> Bool
esVocal c = c == 'a' || c== 'e' || c== 'i' || c== 'o' || c== 'u'

-- d
valorAbsoluto :: Int -> Int
valorAbsoluto x = if x >= 0 then x else (-x)


-- ######################## 2 ########################
-- a
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs

-- b
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- c
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- d
factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x - 1)

-- e
promedio :: [Int] -> Int
promedio xs = div (sumatoria xs) (length xs)


-- ######################## 3 ########################
pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) = n == x || pertenece n xs


-- ######################## 4 ########################
-- a
paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] fun = True
paratodo' (x:xs) fun = fun x && (paratodo' xs fun)

-- b
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] fun = False
existe' (x:xs) fun = fun x || (existe' xs fun)

-- c
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] fun = 0
sumatoria' (x:xs) fun = fun x + (sumatoria' xs fun)

-- d
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] fun = 1
productoria' (x:xs) fun = fun x * (productoria' xs fun)


-- ######################## 5 ########################
paratodo'' :: [Bool] -> Bool
paratodo'' l = paratodo' l id


-- ######################## 6 ########################
-- a
todosPares :: [Int] -> Bool
todosPares l = paratodo' l even

-- b
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n l = existe' l (\x -> mod x n == 0) -- Esto es una exprecion lambda del tipo (\x -> fn x)

-- c
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [0..(n - 1)] (^2)

-- d
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n l = existe' l (\x -> mod n x == 0)

-- e
esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n = not (existeDivisor n [2..(n-1)])

-- f
factorial' :: Int -> Int
factorial' n = productoria' [1..n] id

-- g
multiplicaPrimos :: [Int] -> Int
multiplicaPrimos l = productoria' (filter esPrimo l) id

-- h
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

generarListaFib :: Int -> Int -> [Int]
generarListaFib n x
    | n == fib x = fib x : []
    | n < fib x = []
    | fib x < n = fib x : generarListaFib n (x + 1)

esFib :: Int -> Bool
esFib n = existe' (generarListaFib n 0) (\x -> n == x)

-- i
todosFib :: [Int] -> Bool
todosFib [] = True
todosFib (x:xs) = esFib x && todosFib xs


-- ######################## 7 ########################
{-
-- a
La funcion map obtiene una lista y una funcion, y modifica/transforma cada elemento mediante la funcion recibida
La funcion filter obtiene una lista y una funcion, y retorna la lista con los elementos que cumplan que al pasarla por la funcion recibida den True

-- b
succ :: Int -> Int
succ n = n+1
map succ [1, -4, 6, 2, -8] => [2,-3,7,3,-7]

-- c
esPositivo :: Int -> Bool
esPositivo n = n >= 0
filter esPositivo [1, -4, 6, 2, -8] => [1,6,2]
-}


-- ######################## 8 ########################
dupElem :: Int -> Int
dupElem n = n*2

-- a
dupElemLista :: [Int] -> [Int]
dupElemLista [] = []
dupElemLista (x:xs) = dupElem x : dupElemLista xs

-- b
dupElemLista' :: [Int] -> [Int]
dupElemLista' xs = map dupElem xs


-- ######################## 9 ########################
-- a
soloPrimos :: [Int] -> [Int]
soloPrimos [] = []
soloPrimos (x:xs) = if esPrimo x then x : soloPrimos xs else soloPrimos xs

-- b
soloPrimos' :: [Int] -> [Int]
soloPrimos' xs = filter esPrimo xs

{-
-- c
Ya lo habia hecho con filter -.-
-}