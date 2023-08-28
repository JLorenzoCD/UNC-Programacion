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

