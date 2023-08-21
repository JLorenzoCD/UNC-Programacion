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
paratodo_4 :: [a] -> (a -> Bool) -> Bool
paratodo_4 [] fun = True
paratodo_4 (x:xs) fun = fun x && (paratodo_4 xs fun)

-- b
existe_4 :: [a] -> (a -> Bool) -> Bool
existe_4 [] fun = False
existe_4 (x:xs) fun = fun x || (existe_4 xs fun)

-- c
sumatoria_4 :: [a] -> (a -> Int) -> Int
sumatoria_4 [] fun = 0
sumatoria_4 (x:xs) fun = fun x + (sumatoria_4 xs fun)

-- d
productoria_4 :: [a] -> (a -> Int) -> Int
productoria_4 [] fun = 1
productoria_4 (x:xs) fun = fun x * (productoria_4 xs fun)


-- ######################## 5 ########################
paratodo_5 :: [Bool] -> Bool
paratodo_5 l = paratodo_4 l id