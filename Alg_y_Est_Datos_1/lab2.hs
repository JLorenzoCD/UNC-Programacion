-- ###################### Lab 2 ######################
-- ###################### 1 ######################
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


-- ###################### 2 ######################
{-
Realizado en la linea 38 del archivo.
-}

-- ###################### 3 ######################
-- a
minimoElemento :: Ord a => [a] -> a
minimoElemento [a] = a
minimoElemento (x:(y:xs)) = x `min` minimoElemento (y:xs)

{-
########################### EJEMPLO DE EJECUCION ###########################
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

-- ###################### 4 ######################
-- a
data Zona = Arco | Defensa | Mediocampo | Delantera
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha

type Altura = Int
type NumCamiseta = Int
type ManoHabil = PiernaHabil

data Deportista = Ajedrecista
                | Ciclista Modalidad
                | Velocista Altura
                | Tenista TipoReves ManoHabil Altura
                | Futbolista Zona NumCamiseta PiernaHabil Altura

-- b
-- :t Ciclista      =>      Ciclista :: Modalidad -> Deportista

-- c
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista _):xs) = 1 + contar_velocistas xs
contar_velocistas (_:xs) = contar_velocistas xs

{-
########################### EJEMPLO DE EJECUCION ###########################
contar_velocistas [Ajedrecista, Ciclista Carretera, Ciclista BMX, Velocista 500]    =>  1
-}

-- d
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas ((Futbolista Arco _ _ _) :xs) Arco = 1 + contar_futbolistas xs Arco
contar_futbolistas ((Futbolista Defensa _ _ _) :xs) Defensa =  1 + contar_futbolistas xs Defensa
contar_futbolistas ((Futbolista Mediocampo _ _ _) :xs) Mediocampo = 1 + contar_futbolistas xs Mediocampo
contar_futbolistas ((Futbolista Delantera _ _ _) :xs) Delantera =  1 + contar_futbolistas xs Delantera
contar_futbolistas (_:xs) z = contar_futbolistas xs z

{-
########################### EJEMPLO DE EJECUCION ###########################
contar_futbolistas [Futbolista Defensa 6 Derecha 180, Ajedrecista, Futbolista Arco 1 Derecha 190, Futbolista Defensa 15 Izquierda 175] Defensa      =>      2
-}

-- e
-- TODO: No funciona correctamente
es_futbolista_y_de_zona :: Deportista -> Zona -> Bool
es_futbolista_y_de_zona (Futbolista Arco _ _ _) Arco = True
es_futbolista_y_de_zona (Futbolista Defensa _ _ _) Defensa = True
es_futbolista_y_de_zona (Futbolista Mediocampo _ _ _) Mediocampo = True
es_futbolista_y_de_zona (Futbolista Delantera _ _ _) Delantera = True
es_futbolista_y_de_zona _ _ = False

contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' (x:xs) z = length (filter (\x -> es_futbolista_y_de_zona x z) xs)

{-
########################### EJEMPLO DE EJECUCION ###########################
TODO: No funciona correctamente
contar_futbolistas' [Futbolista Delantera 6 Derecha 180, Ajedrecista, Futbolista Arco 1 Derecha 190, Futbolista Delantera 15 Izquierda 175] Delantera
-}