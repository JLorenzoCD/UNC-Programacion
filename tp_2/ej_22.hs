-- ###################  Tipos   ###################
type Fecha = (Int, Int, Int) -- (dia, mes, año)
type Componente = (String, Int) -- (Nombre componente, precio)

type Venta = (Fecha, String, [String]) -- (Fecha, vendedor, lista de componentes de la máquina)

-- ###################  Datos   ###################
-- Datos Vendedores
vendedores :: [String]
vendedores = ["Martin", "Diego", "Çlaudio", "José"]

-- Datos Precios
precios :: [Componente]
precios = [("Monitor GPRS 3000", 200), ("Motherboard ASUS 1500", 120), ("Monitor ASC 543", 250), ("Motherboard ASUS 1200", 100), ("Motherboard Pindorcho", 30)]

-- Datos Ventas
ventas :: [Venta]
ventas = [((1,2,2006), "Martin", ["Monitor GPRS 3000", "Motherboard ASUS 1500"]), ((1,2,2006), "Diego", ["Monitor ASC 543", "Motherboard Pindorcho"]), ((10,2,2006), "Martin", ["Monitor ASC 543", "Motherboard ASUS 1200"]), ((12,2,2006), "Diego", ["Monitor GPRS 3000", "Motherboard ASUS 1200"]), ((4,3,2006), "Diego", ["Monitor GPRS 3000", "Motherboard ASUS 1500"])]

-- Funcionalidades

-- a)
{-
Se encarga de recorrer una lista de elementos de tipo Componente, comparar con el nombre de un componente dado y devolver el precio del mismo, en caso de que no se encuentre, devuelve cero

buscar_precio_componente :: [Componente] -> nombre del componente -> precio
-}
buscar_precio_componente :: [Componente] -> String -> Int
buscar_precio_componente [] nombre_componente = 0
buscar_precio_componente ((nombre, precio) : cs) nombre_componente
        | nombre_componente == nombre = precio
        | otherwise = buscar_precio_componente cs nombre_componente

{-
Se encarga de recorrer una lista de nombres de componentes y devolver la suma de el precio de estos

precio_maquina :: [Nombres de los componentes] -> Total
-}
precio_maquina:: [String] -> Int
precio_maquina [] = 0
precio_maquina (nombre : cs) = (buscar_precio_componente precios nombre) + precio_maquina cs

-- b)
{-
Se recorre una lista de nombres de componentes y se lo compara con un nombre de componente, si esta en la lsita devuelve True, de lo contrario devuelve false

componente_en_lista :: [nombres de componentes] -> nombre de componente -> Bool
-}
componente_en_lista :: [String] -> String -> Bool
componente_en_lista [] nombre_componente = False
componente_en_lista (nombre:cs) nombre_componente
        | nombre == nombre_componente = True
        | otherwise = componente_en_lista cs nombre_componente

{-
Devuelve una lista de ventas del tipo [Venta], en el cual se encuetra un componente en especifico

ver_ventas_de_componente :: [Venta] -> String -> [Venta]
-}
ver_ventas_de_componente :: [Venta] -> String -> [Venta]
ver_ventas_de_componente [] nombre_componente = []
ver_ventas_de_componente ( (fecha, vendedor, lista_componentes) : vs) nombre_componente
        | (componente_en_lista lista_componentes nombre_componente) = (fecha, vendedor, lista_componentes) : (ver_ventas_de_componente vs nombre_componente)
        | otherwise = (ver_ventas_de_componente vs nombre_componente)

{-
Devuelve el numero de veces que se vendio un componente
-}
cant_ventas_componente :: String -> Int
cant_ventas_componente nombre_componente = length (ver_ventas_de_componente ventas nombre_componente)

-- c)
{-
Devuelve una lista de todas las ventas hechas en un mes de cierto año
-}
ventas_del_mes :: [Venta] -> (Int, Int) -> [Venta]
ventas_del_mes [] (mes, año) = []
ventas_del_mes ( ((dia_v, mes_v, año_v), vendedor, lista_componentes ): vs ) (mes, año)
        | (mes == mes_v) && (año == año_v) = ((dia_v, mes_v, año_v), vendedor, lista_componentes ) : ventas_del_mes vs (mes, año)
        | otherwise = ventas_del_mes vs (mes, año)



{-
Devuelve una lista de todas las ventas hechas por un vendedor en especifico
-}
ventas_de_vendedor :: [Venta] -> String -> [Venta]
ventas_de_vendedor [] nombre_vendedor = []
ventas_de_vendedor ( (fecha, vendedor, lista_componentes): vs ) nombre_vendedor
        | vendedor == nombre_vendedor = (fecha, vendedor, lista_componentes ) : ventas_de_vendedor vs nombre_vendedor
        | otherwise = ventas_de_vendedor vs nombre_vendedor



{-
Dada una lista de ventas del tipo [Venta], retorna el total ganado de dicha ventas

total_ganado_ventas :: [Venta] -> total ganado
-}
total_ganado_ventas :: [Venta] -> Int
total_ganado_ventas [] = 0
total_ganado_ventas ((fecha, vendedor, lista_componentes) : vs) = (precio_maquina lista_componentes) + (total_ganado_ventas vs)



{-
Dada una lista de ventas, regresa el nombre y el total de ganancia del vendedor que mas dinero gano en dicha lista

mejor_vendedor :: [Venta] -> [vendedores] -> (total ganado, mejor vendedor)
-}
mejor_vendedor :: [Venta] -> [String] -> (Int, String) -> (Int, String)
mejor_vendedor [] vendedores (mayor_venta, nombre_vendedor) = (mayor_venta, nombre_vendedor)
mejor_vendedor ventas [] (mayor_venta, nombre_vendedor) = (mayor_venta, nombre_vendedor)
mejor_vendedor ventas (vendedor: vs) (mayor_venta, nombre_vendedor)
        | mayor_venta < ( total_ganado_ventas (ventas_de_vendedor ventas vendedor)) = mejor_vendedor ventas vs (( total_ganado_ventas (ventas_de_vendedor ventas vendedor)), vendedor)
        | otherwise = mejor_vendedor ventas vs (mayor_venta, nombre_vendedor)



{-
Dado un mes y año, devuelve al vendeor que mas dinero genero en un dicha fecha

vendedor_del_mes :: (mes, año) -> nombre del vendedor
-}
vendedor_del_mes :: (Int, Int) -> String -- (mes, año) -> nombre del vendedor
vendedor_del_mes (mes, año) = snd (mejor_vendedor (ventas_del_mes ventas (mes, año)) vendedores (0, ""))



-- d)
{-
Retorna el total de las ganancias en ventas de un mes, en un año en especifico

ganancias_totales_del_mes :: (mes, año) -> total ganado en el mes
-}
ganancias_totales_del_mes :: (Int, Int) -> Int
ganancias_totales_del_mes (mes, año) = total_ganado_ventas (ventas_del_mes ventas (mes, año))



-- e)
{-
Retorna las ganancias totales de un vendedor
-}
ganancia_total_del_vendedor :: String -> Int
ganancia_total_del_vendedor vendedor = total_ganado_ventas (ventas_de_vendedor ventas vendedor)



-- f)
{-
Dado un mes y año determinado, retonra True si hubo ventas o False si no las hubo

hubo_ventas_en_mes :: (mes, año) -> Bool
-}
hubo_ventas_en_mes :: (Int, Int) -> Bool
hubo_ventas_en_mes (mes, año) = length (ventas_del_mes ventas (mes, año)) /= 0