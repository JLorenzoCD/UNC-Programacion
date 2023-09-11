-- ========================================== Lab 2 ==========================================
-- ############################################ 1 ############################################
-- a
data Carrera = Matematica | Fisica | Computacion | Astronomia
    deriving (Show, Eq, Ord, Bounded)

-- b
{-
titulo :: Carrera -> String
titulo Matematica = "Licenciado en Matematica"
titulo Fisica = "Licenciado en Fisica"
titulo Computacion = "Licenciado en Computacion"
titulo Astronomia = "Licenciado en Astronomia"
-}
titulo :: Carrera -> String
titulo carrera = "Licenciado en " ++ show(carrera)  -- La funcion show funciona gracias a la propiedad Show en el derivering.

-- c
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si
    deriving (Show, Eq, Ord, Bounded)

-- d
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'


-- ############################################ 2 ############################################
{-
Realizado en la linea 38 del archivo.
-}


-- ############################################ 3 ############################################
-- a
minimoElemento :: Ord a => [a] -> a
minimoElemento [a] = a
minimoElemento (x:(y:xs)) = x `min` minimoElemento (y:xs)

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- minimoElemento ['H','A','a','b']             =>          'A'
-- minimoElemento [1,2,3,4,5,65]                =>           1
-}

-- b
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = x `min` minimoElemento' xs

-- c
{-
Se agrego el deriving a la propiedad Bounded para obtener el minimo.
minimoElemento' [Fa, La, Sol, Re, Fa]       =>      Re
-}


-- ############################################ 4 ############################################
-- a
data Zona = Arco | Defensa | Mediocampo | Delantera deriving Show
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type Altura = Int
type NumCamiseta = Int
type ManoHabil = PiernaHabil

data Deportista = Ajedrecista
                | Ciclista Modalidad
                | Velocista Altura
                | Tenista TipoReves ManoHabil Altura
                | Futbolista Zona NumCamiseta PiernaHabil Altura
    deriving Show
-- b
-- :t Ciclista      =>      Ciclista :: Modalidad -> Deportista

-- c
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista _):xs) = 1 + contar_velocistas xs
contar_velocistas (_:xs) = contar_velocistas xs

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
contar_velocistas [Ajedrecista, Ciclista Carretera, Ciclista BMX, Velocista 500]    =>  1
-}

-- d
es_futbolista_y_de_zona :: Deportista -> Zona -> Bool
es_futbolista_y_de_zona (Futbolista Arco _ _ _) Arco = True
es_futbolista_y_de_zona (Futbolista Defensa _ _ _) Defensa = True
es_futbolista_y_de_zona (Futbolista Mediocampo _ _ _) Mediocampo = True
es_futbolista_y_de_zona (Futbolista Delantera _ _ _) Delantera = True
es_futbolista_y_de_zona _ _ = False

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas (x:xs) z
        | (es_futbolista_y_de_zona x z) = 1 + contar_futbolistas xs z
        | otherwise = contar_futbolistas xs z

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
contar_futbolistas [Futbolista Defensa 6 Derecha 180, Ajedrecista, Futbolista Arco 1 Derecha 190, Futbolista Defensa 15 Izquierda 175] Defensa      =>      2
-}

-- e
contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' xs z = length (filter (\x -> es_futbolista_y_de_zona x z) xs)

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
contar_futbolistas' [Futbolista Delantera 6 Derecha 180, Ajedrecista, Futbolista Arco 1 Derecha 190, Futbolista Delantera 15 Izquierda 175] Delantera       =>      2
-}


-- ############################################ 5 ############################################
-- a
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

-- b
data Alteracion = Bemol | Natural | Sostenido

-- c
data NotaMusical = NotaMusical NotaBasica Alteracion

-- d
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (NotaMusical n Bemol) = (sonidoNatural n) - 1
sonidoCromatico (NotaMusical n Natural) = (sonidoNatural n)
sonidoCromatico (NotaMusical n Sostenido) = (sonidoNatural n) + 1

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sonidoCromatico (NotaMusical Do Bemol)      =>  -1
sonidoCromatico (NotaMusical Re Natural)    =>  2
-}

-- e
instance Eq NotaMusical where
    x == y = sonidoCromatico x == sonidoCromatico y

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NotaMusical Do Sostenido == NotaMusical Do Natural          =>  False
NotaMusical Do Sostenido == NotaMusical Do Sostenido        =>  True
NotaMusical Do Sostenido == NotaMusical Re Sostenido        =>  False
-}

-- f
instance Ord NotaMusical where
    x <= y = sonidoCromatico x <= sonidoCromatico y

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
NotaMusical Do Bemol <= NotaMusical Do Natural              =>  True
NotaMusical Do Sostenido <= NotaMusical Do Natural          =>  False
NotaMusical Do Sostenido <= NotaMusical Do Sostenido        =>  True
NotaMusical Do Sostenido <= NotaMusical Re Sostenido        =>  True
-}


-- ############################################ 6 ############################################
-- a
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
primerElemento [1,2,3,4]      =>      Just 1
primerElemento [2,3,4]        =>      Just 2
primerElemento []             =>      Nothing
-}


-- ############################################ 7 ############################################
data Cola = VaciaC | Encolada Deportista Cola
    deriving Show

-- a - 1)
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender x = Just x

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
atender (Encolada Ajedrecista VaciaC)   =>   Just (Encolada Ajedrecista VaciaC)
-}

-- a - 2)
encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = Encolada d VaciaC
encolar d (Encolada d' c) = Encolada d' (encolar d c)

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
encolar (Ciclista BMX) (Encolada Ajedrecista (Encolada (Velocista 500) (Encolada Ajedrecista VaciaC)))      =>      Encolada Ajedrecista (Encolada (Velocista 500) (Encolada Ajedrecista (Encolada (Ciclista BMX) VaciaC)))
-}

-- a - 3)
busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC _  = Nothing
busca (Encolada d c) z
    | es_futbolista_y_de_zona d z = Just d
    | otherwise = busca c z

{-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ EJEMPLO DE EJECUCION ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
busca (Encolada Ajedrecista (Encolada (Velocista 500) (Encolada Ajedrecista (Encolada (Ciclista BMX) (Encolada (Futbolista Arco 1 Derecha 190) (Encolada (Futbolista Delantera 15 Izquierda 175) VaciaC)))))) Mediocampo        =>      Nothing

busca (Encolada Ajedrecista (Encolada (Velocista 500) (Encolada Ajedrecista (Encolada (Ciclista BMX) (Encolada (Futbolista Arco 1 Derecha 190) (Encolada (Futbolista Delantera 15 Izquierda 175) VaciaC)))))) Arco              =>      Just (Futbolista Arco 1 Derecha 190)

busca (Encolada Ajedrecista (Encolada (Velocista 500) (Encolada Ajedrecista (Encolada (Ciclista BMX) (Encolada (Futbolista Arco 1 Derecha 190) (Encolada (Futbolista Delantera 15 Izquierda 175) VaciaC)))))) Delantera              =>      Just (Futbolista Delantera 15 Izquierda 175)
-}

-- b
-- A una lista