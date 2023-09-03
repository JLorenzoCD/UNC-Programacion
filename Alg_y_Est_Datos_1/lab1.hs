-- ejercicio 1
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

{-
########################### EJEMPLO DE EJECUCION ###########################
esCero 5                 ==>     False
esPositivo 10            ==>     True
-}


-- ejercicio 2
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


{-
########################### EJEMPLO DE EJECUCION ###########################
factorial 5                 ==>     120
promedio [5,3,7]            ==>     5
-}

-- ejercicio 3
pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) = n == x || pertenece n xs

{-
########################### EJEMPLO DE EJECUCION ###########################
pertenece 5 [5,3,7]         ==>     True
pertenece 1000 [5,3,7]      ==>     False
-}

-- ejercicio 4
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

{-
########################### EJEMPLO DE EJECUCION ###########################
sumatoria' [4,6,9,2] (1+)          ==>     25
paratodo'  [0,0,0,0] esCero        ==>     True
-}

-- ejercicio 5
paratodo'' :: [Bool] -> Bool
paratodo'' l = paratodo' l id

{-
########################### EJEMPLO DE EJECUCION ###########################
paratodo'' [True, False]            =>      False
paratodo'' []                       =>      True
-}

-- ejercicio 6
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

{-
########################### EJEMPLO DE EJECUCION ###########################
todosPares [2,4..10]        ==>     True
esFib 1597                  ==>     True
-}

-- ejercicio 7
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


-- ejercicio 8
dupElem :: Int -> Int
dupElem n = n*2

-- a
dupElemLista :: [Int] -> [Int]
dupElemLista [] = []
dupElemLista (x:xs) = dupElem x : dupElemLista xs

-- b
dupElemLista' :: [Int] -> [Int]
dupElemLista' xs = map dupElem xs

{-
########################### EJEMPLO DE EJECUCION ###########################
dupElemLista [5,3,7]                     ==>     [10,6,14]
dupElemLista' [5,3,7,1,2,3]              ==>     [10,6,14,2,4,6]
-}

-- ejercicio 9
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

{-
########################### EJEMPLO DE EJECUCION ###########################
soloPrimos' [1..100]      ==>     [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
soloPrimos' [5,3,7]       ==>     [5,3,7]
-}

-- ejercicio 10
-- a
primIgualesA :: (Eq a) => a -> [a] -> [a]
primIgualesA y [] = []
primIgualesA y (x:xs)
    | x == y = x : primIgualesA y xs
    | otherwise = []

-- b
primIgualesA' :: (Eq a) => a -> [a] -> [a]
primIgualesA' y xs = takeWhile (y ==) xs

{-
########################### EJEMPLO DE EJECUCION ###########################
primIgualesA 'A' "HOLAAAA"                  ==>     "" o []
primIgualesA' 'A' "AAAAAAAAPRUEBEME"        ==>     "AAAAAAAA" o ['A','A','A','A','A','A','A','A']
-}

-- ejercicio 11
-- a
primIguales :: (Eq a) => [a] -> [a]
primIguales [] = []
primIguales (y:(x:xs))
    | y == x = y : primIguales (x:xs)
    | otherwise = y : []

-- b
primIguales' :: (Eq a) => [a] -> [a]
primIguales' (x:xs) = x : primIgualesA' x xs

{-
########################### EJEMPLO DE EJECUCION ###########################
primIguales "333333357"     ==>     "3333333" o ['3','3','3','3','3','3','3']
primIguales' "asdabsnfk"     ==>     "a" o ['a']
-}

-- ejercicio 12
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = (t x) `op` (cuantGen op z xs t)

-- a
paratodo''' :: [a] -> (a -> Bool) -> Bool
paratodo''' xs fun = cuantGen (&&) True xs fun

-- b
existe'' :: [a] -> (a -> Bool) -> Bool
existe'' xs fun = cuantGen (||) False xs fun

-- c
sumatoria'' :: [a] -> (a -> Int) -> Int
sumatoria'' xs fun = cuantGen (+) 0 xs fun

-- d
productoria'' :: [a] -> (a -> Int) -> Int
productoria'' xs fun = cuantGen (*) 1 xs fun

{-
########################### EJEMPLO DE EJECUCION ###########################
existe'' [-100,-50,1] esPositivo         ==>     True
productoria'' [5,3,7] dupElem            ==>     840
-}

-- ejercicio 13
distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion [] ys = length ys
distanciaEdicion xs [] = length xs
distanciaEdicion (x:xs) (y:ys)
    | x == y = distanciaEdicion xs ys
    | x /= y = 1 + distanciaEdicion xs ys

{-
########################### EJEMPLO DE EJECUCION ###########################
distanciaEdicion "TEXTO DISTINTO" "A ESTE OTRO?"            ==>     14
distanciaEdicion "MI DOMINGOOOOO" "MI DOMINGO NOOOOO!"      ==>     6
-}

-- ejercicio 14
primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen xs fn = takeWhile fn xs

{-
########################### EJEMPLO DE EJECUCION ###########################
primQueCumplen [1,1,1,1,5,5,5,3,3,3,2,6,4] (\x -> (x + 1) `mod` 2 == 0)   => [1,1,1,1,5,5,5,3,3,3]
-}

-- ejercicio 15
{-
-- a
Bien tipado, puede ser una tupla que contenga cualquier tipo y cumple los casos de definicion

-- b
Esta mal tipado o mal definido, en caso de ser recursiva debe tener caso base ([]), la definicion con elementos seria ((a,b):xs), y si es directamente sin tocar los elementos (xs)

-- c
Bien tipado, falta caso base si es que utiliza recursion, si la funcion necesita utilizar los elementos de la tupla, entonces falta definir como ((a,b):xs)

-- d
Bien tipado, falta caso base si es que utiliza recursion, falta definir para caso ((a,b):[]) si #xs es impar

-- e
Como ( 1:2:[] == [1,2] = True, es decir, x:[] == [x] == True) entonces esta bien tipado, falta caso base si es que utiliza recursion, falta ((x,a) : xs), y si se busca tuplas que el primer elemento sea cero, tambien seria valido el caso ((0,a):xs)

-- f
Bien tipado siempre y cuando por el tipo de a este pueda ser 1, falta caso base si es que utiliza recursion y falta caso ((x,y):xs).

-- g
Como a puede ser el nombre de una funcion que cumpla a :: (Int -> Int), entonces es un tipado valido

-- h
El tipo esta bien (por lo mismo que el anterior), falta caso base si es que utiliza recursion, falta caso donde el segundo parametro pueda ser cualquier Int

-- i
Mal tipado o mal definido, el tipado esperaba una fun, mientras que la definicion espera 3 Int, falta caso donde todos los parametros pueda ser cualquier Int
-}


-- ejercicio 16
{-
-- a
f (x,y) = y
f (x,y) = id y          -- No si es valido para la consigna
f tupla = fst tupla     -- No si es valido para la consigna

-- b
                        -- Si a,b,c son del mismo tipo
f (x,y) = a + y         -- Numeros (con distintos tipos de operaciones)
f (xs,ys) = as ++ ys    -- Listas   (con distintos tipos de operaciones)

f (i,xs) = xs !! i      -- Distintos tipos  (puede ser i :: Int, xs :: [Char], c :: Char, etc..)

z :: Int                -- Retornando constante
z = 5
f (x,y) = z

-- c
f fn a = fn a           -- No se me ocurre otra forma debido a que no se el tipo de b

-- d
f fn as = fn as         -- No se me ocurre otra forma debido a que no se el tipo de b
-}