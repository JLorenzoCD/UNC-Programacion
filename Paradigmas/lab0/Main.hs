--La intención de este documento y sus ejercicios es repasar brevemente algunos
--conceptos del paradigma funcional (en haskell) que sean útiles para luego
--realizar el lab1 tales como funciones recursivas, declaración de tipos,
--alto orden, polimorfismo, etc.

--Comenzamos repasando la estructura presente en la definición de una función
--recursiva:

factorial :: Int -> Int              --signatura de la función (declara cantidad
                                     --y tipo de cada input/output de la
                                     --función)
factorial 0 = 1                      --case base (pattern-matching con "0")
factorial n = n * factorial (n-1)    --caso recursivo (pattern-matching con "n!=0")


--Repasemos funciones recursivas sobre listas.  Podemos caracterizar (al menos)
--tres tipos de funciones recursivas sobre listas: "MAP", "FILTER", "FOLD".

--Funciones recursivas del tipo "MAP":
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x : xs) = (2*x) : duplica xs

--Las funciones del tipo "map" consisten en aplicar una función concreta a cada elemento
--de la lista, en el ejemplo de la función "duplica", la función sería f(x) = 2*x

--Otro ejemplo de función de tipo "map" es:
mas1 :: [Int] -> [Int]
mas1 [] = []
mas1 (x : xs) = (x+1) : mas1 xs

--Parece que "duplica" y "mas1" son funciones muy similares.
--Solo se diferencian en la función que aplican a cada elemento de la lista,
--mientras una aplica 2*x, la otra aplica x+1.
--Por lo tanto, surge la pregunta si podemos generalizar la funciones
--del tipo "map", de forma tal que, "duplica" y "mas1" (e inclusive cualquier otra)
--sean un caso particular de dicha generalización.

--Para lograr esto utilizaremos el concepto de "ALTO ORDEN" que consiste en permitir
--que una función pueda tomar como argumento de entrada o de salida una función propiamente dicha.
--Es decir, una función es un valor posible de nuestro lenguaje tan naturalmente como los es
--un Int, o un Float, o un String, etc.

--Entonces, la función que generaliza puede ser definida tomando como argumento la
--función que es aplicada a cada elemento de la lista.

generalMap:: [Int] -> (Int -> Int) ->  [Int]
generalMap [] f = []
generalMap (x:xs) f = f x : generalMap xs f

--Notar que "generalMap" claramente utiliza alto orden.
--Toma una lista de enteros como primer argumento,
--una función como segundo argumento (que toma un entero y devuelve un entero)
--y devuelve como output una lista de enteros.


--Más aún, podemos generalizar el tipo de la lista [Int]
--a traves del "POLIMORFISMO" que consiste en definir funciones que
--estén bien definidas para múltiples tipo de datos.
--Asi podemos dar una versión polimórfica de la función "generalMap" de
--la siguiente manera:

polGeneralMap :: [a] -> (a -> a) -> [a]
polGeneralMap [] f = []
polGeneralMap (x:xs) f = f x : polGeneralMap xs f

--De esta manera, podemos utilizar "polGeneralMap" para realizar cualquier mapeo
--independientemente del tipo de la lista.
--De hecho, podemos dar una versión aún más polimórfica observando que el dominio y la imagen
--de la función de mapeo no necesariamente deben ser del mismo tipo. Es decir:

morePolGeneralMap :: [a] -> (a -> b) -> [b]
morePolGeneralMap [] f = []
morePolGeneralMap (x:xs) f = f x : morePolGeneralMap xs f


--EJERCICIO 1:
--a) redefinir la función "duplica" y "mas1" en términos de "generalMap" y "polGeneralMap".
--b) definir la función esPar:: [Int] -> [Bool] en términos de "morePolGeneralMap".
--Donde la función "esPar" mapea cada elemento de la lista a un booleano que indica si el mismo es un numero par.
--Por ejemplo, esPar [2,9,4,5] = [True, False, True,False].


-- a
duplica_GM :: [Int] -> [Int]
duplica_GM xs = generalMap xs (\x -> x*2)

duplica_PGM :: [Int] -> [Int]
duplica_PGM xs = polGeneralMap xs (\x -> x*2)

mas1_GM :: [Int] -> [Int]
mas1_GM xs = generalMap xs (\x -> x+1)

mas1_PGM :: [Int] -> [Int]
mas1_PGM xs = polGeneralMap xs (\x -> x+1)

-- b
esPar :: [Int] -> [Bool]
esPar xs = morePolGeneralMap xs (\x -> (mod x 2 == 0))

-- Ejemplos:
lista1 :: [Int]
lista1 = [2,9,4,5]

-- #####################################################

--Funciones recursivas del tipo "FILTER":
soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs)
                | mod x 2 == 0 = x : soloPares xs
                | mod x 2 /= 0 = soloPares xs

--Las funciones del tipo "FILTER" consisten en filtrar los elementos de una lista sujeto
--al cumplimiento de una condición booleana, en este ejemplo, la condición sería "x es un
--número par".

--EJERCICIO 2:
--a) generalizar la funciones de tipo "FILTER" sobre lista de enteros.
--b) dar una versión polimorfica de la misma.
--c) redefinir la función "soloPares" en términos de dicha generalización.

--a
generalFilter :: [Int] -> (Int -> Bool) ->  [Int]
generalFilter [] f = []
generalFilter (x:xs) f = if f x then x : (generalFilter xs f) else generalFilter xs f

-- b
polGeneralFilter :: [a] -> (a -> Bool) -> [a]
polGeneralFilter [] f = []
polGeneralFilter (x:xs) f = if f x then x : (polGeneralFilter xs f) else polGeneralFilter xs f

-- c
soloPares_PGF :: [Int] -> [Int]
soloPares_PGF xs = polGeneralFilter xs (\x-> (mod x 2 == 0))


-- #####################################################

--Funciones recursivas del tipo "FOLD":
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria (xs)

--Las funciones del tipo "fold" se caracterizan por calcular un valor (via una función) en base a todos los elementos de una
--lista, en este ejemplo, la función sería f(x,y) = x + y.

--EJERCICIO 3:
--a) generalizar la funciones de tipo "FOLD" sobre lista de enteros.
--b) dar una versión polimorfica de la misma.
--c) redefinir la función "sumatoria" en términos de dicha generalización.

-- a
generalFold :: [Int] -> (Int -> Int -> Int) -> Int -> Int
generalFold [] fun base = base
generalFold (x:xs) fun base = fun x (generalFold xs fun base)

-- b
polGeneralFold :: [a] -> (a -> b -> b) -> b -> b
polGeneralFold [] fun base = base
polGeneralFold (x:xs) fun base = fun x (polGeneralFold xs fun base)

-- c
sumatoria_PGF :: [Int] -> Int
sumatoria_PGF xs = polGeneralFold xs (\x y -> x + y) 0


-- #####################################################

--Otro concepto interesante del paradigma funcional, es que, podemos definir
--nuestros propios tipos:

type Radio = Float   --Define un "alias de tipo" (sinónimo)
type Lado = Float

--Vamos a definir 4 figuras
data Figura = Circulo Radio        --Cada uno de estos es un _constructor_
            | Cuadrado Lado        --define el constructor de un "Cuadrado"
            | Rectangulo Lado Lado --define el constructor de un "Rectangulo"
            | Punto                --define el constructor de un "Punto"
              deriving (Eq, Show)

--(esta última linea permite hacer que se impriman en pantalla los constructores
--de una Figura, y que se puedan comparar.)

--Y obviamente, podemos definir funciones sobre nuestros propios tipos de datos:

perimetro :: Figura -> Float
perimetro (Circulo radio) = 2 * pi * radio
perimetro (Cuadrado lado) = 4 * lado
perimetro (Rectangulo ancho alto) = 2 * ancho + 2 * alto
perimetro (Punto) = error "no se puede calcular el perimetro del punto"

--EJERCICIO 4: definir una función que devuelva la superficie de una "Figura"

superficie :: Figura -> Float
superficie (Circulo radio) = pi * radio * radio
superficie (Cuadrado lado) = lado * lado
superficie (Rectangulo ancho alto) = ancho * alto
superficie (Punto) = 1

-- Ejemplo
lista2 :: [Figura]
lista2 = [(Circulo 1), (Cuadrado 2), (Circulo 2), (Rectangulo 1 2)]

-- #####################################################

--EJERCICIO 5:

--a) Asi como definimos el tipo "Figura" en el ejercicio anterior, ahora queremos definir
--un tipo "Expr" que permita representar una expresión aritmética sobre números enteros
--con nuestros propios constructores: suma, producto, resta, division.
--De esta manera, por ejemplo, la expresión "Resta (Producto (Suma 5 3) 2) 6" es una "Expr" válida.
--Definir el tipo "Expr".

data Expr =   Valor Int
            | Suma Expr Expr
            | Producto Expr Expr
            | Resta Expr Expr
            | Division Expr Expr
              deriving (Eq, Show)


--b)Luego, definir la semántica del tipo "Expr", i.e., definir una función que evalúa (en forma
--natural) una expresión aritmética "Expr". Por ejemplo:
--evaluar (Resta (Producto (Suma 5 3) 2) 6) = 10

evaluar :: Expr -> Int
evaluar (Valor x)             =  x
evaluar (Suma exp1 exp2)      = (evaluar exp1) + (evaluar exp2)
evaluar (Producto exp1 exp2)  = (evaluar exp1) * (evaluar exp2)
evaluar (Resta exp1 exp2)     = (evaluar exp1) - (evaluar exp2)
evaluar (Division exp1 exp2)
                              | divisor == 0 = error "No se puede dividir por cero."
                              | otherwise = div (evaluar exp1) divisor
                            where divisor = evaluar exp2

-- Ejemplo
expr1 :: Expr
expr1 = Resta (Producto (Suma (Valor 5) (Valor 3)) (Valor 2)) (Valor 6)

-- #####################################################

--EJERCICIO 6:
--a) Definir un tipo "BinTree" que permita representar un árbol binario
--polimorfico (i.e, en cuyos nodos se almacenen valores de tipo genérico "a").
--b) Definir una función recursiva que devuelva la profundidad de un "BinTree".
--c) Definir una función general de fold que opera sobre un "BinTree" y luego, redefinir la función
--de profundidad del item b en términos de esta última.
--d) Definir una función recursiva que devuelve una lista con los elementos del BinTree, y luego,
-- redefinirla en términos de la función fold del item c.

-- a
data BinTree a =  Empty
                | Node (BinTree a) a (BinTree a)
                deriving (Eq, Show)

-- b
profundidad :: BinTree a -> Int
profundidad (Empty) = 0
profundidad (Node bt1 _ bt2) = 1 + max (profundidad bt1) (profundidad bt2)

-- c
-- (BT -> (fun (acc, BT, acc) -> acc) -> acc) -> acc
foldBT :: BinTree a -> (b -> a -> b -> b) -> b -> b
foldBT (Empty) _ acc = acc
foldBT (Node bt1 x bt2) fun acc = fun (foldBT bt1 fun acc) x (foldBT bt2 fun acc)

profundidadFold :: BinTree a -> Int
profundidadFold bt = foldBT bt (\ acc_lft _ acc_rgt -> 1 + max acc_lft acc_rgt) 0

-- d
listBT :: BinTree a -> [a]
listBT Empty = []
listBT (Node bt1 a bt2) = listBT bt1 ++ [a] ++ listBT bt2

listBTFold :: BinTree a -> [a]
listBTFold bt = foldBT bt (\ acc_xs a acc_ys -> acc_xs ++ [a] ++ acc_ys) []
