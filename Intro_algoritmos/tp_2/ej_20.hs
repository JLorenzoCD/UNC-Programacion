-- a)
lista_iguales :: (Eq a) => [a] -> [a] -> Bool
lista_iguales [] [] = True
lista_iguales xs [] = False
lista_iguales [] ys = False
lista_iguales (x:xs) (y:ys) = if (x == y) then lista_iguales xs ys else False

-- b)
type NotasAlumno =  (String, Int, Int, Int)
type MejorNotaAlumno = (String, Int)

mejor_nota :: [NotasAlumno] -> [MejorNotaAlumno]
mejor_nota [] = []
mejor_nota ((nombre, n1, n2, n3) : lista_alumno) = (nombre, max n1 (max n2 n3)) : mejor_nota lista_alumno

-- c)
type Vector = (Int, Int)
inc_prim :: [Vector] -> [Vector]
inc_prim [] = []
inc_prim ((n1,n2):vs) = ((n1 + 1), n2) : inc_prim vs

-- d)
expandir :: String -> String
expandir [] = []
expandir (c:[]) = c : expandir []
expandir (c:cs) = c : ' ' : expandir cs