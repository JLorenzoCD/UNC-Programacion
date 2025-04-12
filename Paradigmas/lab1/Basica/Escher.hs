module Basica.Escher where
import Graphics.Gloss
import qualified Graphics.Gloss.Data.Point.Arithmetic as V
import Dibujo
import Interp
import Basica.Comun

data Escher = Fish | FishHD | Triangulo | TrianguloVioleta | F1 | F2 | F3 | F4 | Prueba | Vacio deriving (Eq, Show)
-- ############################################################################
-- Figuras
escherTrianguloVioleta :: Dibujo Escher
escherTrianguloVioleta = escher 5 TrianguloVioleta

figura1 :: Dibujo Escher
figura1 = escher 1 F1

figura2 :: Dibujo Escher
figura2 = escher 5 F2

figura3 :: Dibujo Escher
figura3 = escher 5 F3

figura4 :: Dibujo Escher
figura4 = escher 5 F4

-- Interpretación de las figuras de arriba
interpFigura1 :: ImagenFlotante
interpFigura1 d w h = color orange $ plotPolygon d w h [(0, 0), (1, 0), (1, 1), (0.5, 0.5), (0, 1), (0, 0)]

interpFigura2 :: ImagenFlotante
interpFigura2 d w h =
  pictures
    [ color orange $ plotPolygon d w h [(0, 0), (1, 0), (0, 1), (0, 0)],
      color blue $ plotPolygon d w h [(0, 0), (0.25, 0), (0.6, 0.4), (0.4, 0.6), (0, 0.25), (0, 0)]
    ]

interpFigura3 :: ImagenFlotante
interpFigura3 d w h =
  pictures
    [ color violet $ plotPolygon d w h [(0, 0), (0.4, 0.6), (0, 1), (-0.1, 0.5), (-0.2, 0.5), (0, 0.3), (0, 0)],
      color cyan $ plotPolygon d w h [(0, 0), (0.3, 0.1), (0.5, 0.2), (0.5, 0.5), (0.4, 0.6), (0, 0)],
      color violet $ plotPolygon d w h [(0.5, 0.2), (0.5, 0.1), (1 , 0), (0.5, 0.5)]
    ]

interpFigura4 :: ImagenFlotante
interpFigura4 d w h =
  pictures
    [ color (makeColorI 48 14 145 255) $ plotPolygon d w h [(0, 0), (1, 0), (0, 1), (0, 0)],
      color (makeColorI 218 247 166 255) $ plotPolygon d w h [(0.1, 0.2), (0.1, 0.75), (0.38, 0.47), (0.1, 0.2)],
      color (makeColorI 218 247 166 255) $ plotPolygon d w h [(0.2, 0.1), (0.75, 0.1), (0.47, 0.38), (0.2, 0.1)]
    ]

-- ##############################
-- Pruebas
figuraPrueba :: Dibujo Escher
figuraPrueba = escher 5 Prueba

interpFiguraPrueba :: ImagenFlotante
interpFiguraPrueba d w h =
  pictures
    [ color (makeColorI 48 14 145 255) $ plotPolygon d w h [(0, 0), (1, 0), (0, 1), (0, 0)],
      color (makeColorI 218 247 166 255) $ plotPolygon d w h [(0.1, 0.2), (0.1, 0.75), (0.38, 0.47), (0.1, 0.2)],
      color (makeColorI 218 247 166 255) $ plotPolygon d w h [(0.2, 0.1), (0.75, 0.1), (0.47, 0.38), (0.2, 0.1)]
    ]

-- ############################################################################

vacia :: Dibujo Escher
vacia = Basica Vacio

naranja :: Color
naranja = makeColorI 255 119 0 255

naranjaOsc :: Color
naranjaOsc = dark naranja

plotPolygon :: Vector -> Vector -> Vector -> [(Float, Float)] -> Picture
plotPolygon d w h ps = polygon $ map (\(x, y) -> d V.+ (x V.* w) V.+ (y V.* h)) ps

plot :: Vector -> Vector -> Vector -> [(Float, Float)] -> Picture
plot d w h ps = line $ map (\(x, y) -> d V.+ (x V.* w) V.+ (y V.* h)) ps

interpBas :: Escher -> ImagenFlotante
interpBas Vacio _ _ _ = Graphics.Gloss.Blank
interpBas Triangulo d w h = plot d w h [(0, 0), (1, 0), (0, 1), (0, 0)]
interpBas Fish d w h =
  pictures
    [ color naranjaOsc $ plotPolygon d w h [(0.3, 0.518), (0.376, 0.376), (0.5, 0.5), (0.5, 0.748), (0.372, 0.783), (0.191, 0.794)],
      color naranjaOsc $ plotPolygon d w h [(0.25, 0.248), (0, 0), (-0.248, 0.25), (-0.024, 0.571)],
      plot d w h [(0.3, 0.518), (0.376, 0.376), (0.5, 0.5), (0.5, 0.748), (0.372, 0.783), (0.191, 0.794)],
      plot d w h [(0.25, 0.248), (0, 0), (-0.248, 0.25), (-0.024, 0.571)],
      color naranja $ plotPolygon d w h [(-0.033, 0.425), (0, 1), (0.3, 0.677), (0.3, 0.518), (0.378, 0.374), (0.502, 0.25), (0.613, 0.219), (0.768, 0.204), (1, 0), (0.562, 0.031), (0.356, 0.192), (0.106, 0.332), (0.053, 0.387), (-0.033, 0.425)],
      plotPolygon d w h [(0.053, 0.657), (0.095, 0.697), (0.075, 0.796), (0.051, 0.816), (0.042, 0.741), (0.053, 0.657)],
      plotPolygon d w h [(0.126, 0.719), (0.111, 0.781), (0.109, 0.841), (0.188, 0.75), (0.126, 0.719)],
      plot d w h [(0.111, 0.699), (0.115, 0.681), (0.277, 0.361), (0.372, 0.274), (0.81, 0.077)],
      color white $ plot d w h [(0.301, 0.708), (0.356, 0.721), (0.412, 0.721), (0.478, 0.69)],
      color white $ plot d w h [(0.338, 0.608), (0.403, 0.637), (0.485, 0.626)],
      color white $ plot d w h [(0.345, 0.502), (0.4, 0.551), (0.431, 0.562), (0.485, 0.564)],
      color white $ plot d w h [(0.153, 0.281), (0.04, 0.168), (-0.024, 0.064)],
      color white $ plot d w h [(0.097, 0.325), (0, 0.246), (-0.086, 0.128)],
      color white $ plot d w h [(0.051, 0.37), (-0.058, 0.291), (-0.111, 0.201)],
      color white $ plot d w h [(-0.026, 0.405), (-0.123, 0.326), (-0.176, 0.236)]
    ]
interpBas FishHD d w h =
  pictures
    [ plot d w h [(0.0, 1.0), (-0.0161, 0.9495), (-0.029, 0.8982), (-0.0386, 0.8461), (-0.0447, 0.7934), (-0.0471, 0.7405), (-0.0454, 0.6876), (-0.0395, 0.6349), (-0.0293, 0.583), (-0.0146, 0.5321), (0.0038, 0.4824), (0.0242, 0.4335), (0.0504, 0.3875), (0.0846, 0.3471), (0.1264, 0.3147), (0.1718, 0.2874), (0.2193, 0.264), (0.2673, 0.2418), (0.3137, 0.2161), (0.3588, 0.1884), (0.403, 0.1592), (0.446, 0.1282), (0.4879, 0.0958), (0.5289, 0.0622), (0.5688, 0.0274)],
      plot d w h [(0.7676, 0.2026), (0.7149, 0.207), (0.6625, 0.2133), (0.6103, 0.2216), (0.5586, 0.2326), (0.5078, 0.2472), (0.4612, 0.2717), (0.4228, 0.3078), (0.3914, 0.3502), (0.3635, 0.3951), (0.3394, 0.4421), (0.3194, 0.4911), (0.3036, 0.5415), (0.2927, 0.5931), (0.2857, 0.6455), (0.275, 0.6973), (0.2571, 0.7469), (0.2335, 0.7942), (0.205, 0.8387), (0.1718, 0.8798), (0.1341, 0.9167), (0.0925, 0.9493), (0.0476, 0.9771), (-0.0, 1.0)],
      plot d w h [(1.0, -0.0), (0.9536, 0.0237), (0.9097, 0.0519), (0.8688, 0.0842), (0.8313, 0.1203), (0.7974, 0.1599), (0.7676, 0.2027)],
      plot d w h [(0.5688, 0.0273), (0.6164, 0.0383), (0.6647, 0.0456), (0.7134, 0.049), (0.7623, 0.0484), (0.8109, 0.0441), (0.8592, 0.0367), (0.907, 0.0267), (0.9543, 0.0143), (1.0, -0.0)],
      plot d w h [(0.0, -0.0), (0.0357, 0.0357), (0.0714, 0.0715), (0.1072, 0.1072), (0.1429, 0.1429), (0.1786, 0.1787), (0.2144, 0.2144), (0.2501, 0.2501)],
      plot d w h [(-0.2144, 0.2144), (-0.1786, 0.1787), (-0.1429, 0.1429), (-0.1072, 0.1072), (-0.0714, 0.0715), (-0.0357, 0.0357), (0.0, -0.0)],
      plot d w h [(-0.0254, 0.5679), (-0.0582, 0.5318), (-0.0897, 0.4945), (-0.1199, 0.4562), (-0.1488, 0.4168), (-0.1763, 0.3765), (-0.2023, 0.3352), (-0.2269, 0.2931)],
      plot d w h [(0.5, 0.7497), (0.4564, 0.763), (0.4122, 0.7742), (0.3675, 0.7833), (0.3224, 0.7902), (0.2771, 0.795), (0.2316, 0.7976)],
      plot d w h [(0.5, 0.5), (0.5, 0.55), (0.5, 0.5999), (0.5, 0.6498), (0.5, 0.6998), (0.5, 0.7497)],
      plot d w h [(0.3753, 0.3753), (0.4065, 0.4065), (0.4376, 0.4377), (0.4688, 0.4688), (0.5, 0.5)],
      plot d w h [(0.4854, 0.6858), (0.4446, 0.6993), (0.4024, 0.7075), (0.3595, 0.7102), (0.3167, 0.7073), (0.2745, 0.6989)],
      plot d w h [(0.4843, 0.6242), (0.4352, 0.6308), (0.3858, 0.6285), (0.3375, 0.6174), (0.2919, 0.5979)],
      plot d w h [(0.4864, 0.5606), (0.4397, 0.5581), (0.3948, 0.5449), (0.3541, 0.5216), (0.32, 0.4895)],
      plot d w h [(-0.0322, 0.0477), (-0.0055, 0.093), (0.024, 0.1365), (0.0562, 0.1782), (0.0909, 0.2177), (0.128, 0.255), (0.1673, 0.2899)],
      plot d w h [(-0.078, 0.0906), (-0.0563, 0.1364), (-0.0318, 0.1806), (-0.0046, 0.2234), (0.0252, 0.2643), (0.0574, 0.3033), (0.0919, 0.3403)],
      plot d w h [(-0.1316, 0.1421), (-0.1124, 0.1909), (-0.089, 0.2378), (-0.0616, 0.2825), (-0.0304, 0.3246), (0.0043, 0.3639), (0.0423, 0.4001)],
      plot d w h [(-0.1835, 0.1946), (-0.1683, 0.2418), (-0.1489, 0.2873), (-0.1253, 0.3309), (-0.0979, 0.3722), (-0.0668, 0.4107), (-0.0323, 0.4463), (0.0053, 0.4785)],
      plot d w h [(0.0, 1.0), (0.013, 0.949), (0.0273, 0.8984), (0.0429, 0.8482), (0.0598, 0.7984), (0.0779, 0.749), (0.0973, 0.7001), (0.1179, 0.6517), (0.1396, 0.6037), (0.1615, 0.5559), (0.1839, 0.5083), (0.207, 0.4611), (0.2318, 0.4147), (0.2591, 0.3698), (0.2903, 0.3274), (0.3263, 0.2891), (0.3668, 0.2555), (0.4116, 0.2282), (0.4598, 0.207), (0.5091, 0.1887), (0.5586, 0.171), (0.6081, 0.1532), (0.6575, 0.1351), (0.7068, 0.1167), (0.7559, 0.0979), (0.8049, 0.0789), (0.8539, 0.0596), (0.9027, 0.04), (0.9514, 0.0201), (1.0, -0.0)],
      plot d w h [(0.0758, 0.6794), (0.0577, 0.7269), (0.033, 0.7714), (0.0023, 0.8119)],
      plot d w h [(-0.0005, 0.6263), (0.0405, 0.6488), (0.0758, 0.6794)],
      plot d w h [(0.0023, 0.812), (-0.0049, 0.7659), (-0.0078, 0.7193), (-0.0063, 0.6726), (-0.0005, 0.6263)],
      plot d w h [(0.09, 0.8565), (0.0964, 0.8068), (0.1085, 0.7581), (0.1261, 0.7111)],
      plot d w h [(0.2155, 0.7574), (0.1886, 0.7875), (0.1585, 0.8143), (0.1254, 0.8374), (0.09, 0.8565)],
      plot d w h [(0.1261, 0.7111), (0.1735, 0.7289), (0.2154, 0.7574)],
      plot d w h [(0.4082, 0.3832), (0.4351, 0.3581), (0.4642, 0.3354), (0.495, 0.3153)],
      plot d w h [(0.495, 0.367), (0.4643, 0.3892), (0.4381, 0.4166)],
      plot d w h [(0.4963, 0.4191), (0.4631, 0.4517)],
      plot d w h [(0.4958, 0.4632), (0.483, 0.4726)],
      plot d w h [(0.008, 0.7878), (0.0044, 0.7398), (0.004, 0.6918), (0.0067, 0.6438)],
      plot d w h [(0.063, 0.6826), (0.0484, 0.7195), (0.03, 0.7547), (0.008, 0.7878)],
      plot d w h [(0.0067, 0.6438), (0.0374, 0.6595), (0.063, 0.6826)],
      plot d w h [(0.1992, 0.7585), (0.1698, 0.7893), (0.1371, 0.8164), (0.1014, 0.8394)],
      plot d w h [(0.1322, 0.7241), (0.1668, 0.7392), (0.1992, 0.7585)],
      plot d w h [(0.1014, 0.8394), (0.1084, 0.8002), (0.1187, 0.7616), (0.1322, 0.7241)],
      plot d w h [(0.3677, 0.1828), (0.409, 0.1811), (0.4437, 0.2033), (0.4585, 0.2418), (0.4484, 0.2818)],
      plot d w h [(0.6274, 0.0799), (0.5905, 0.1067), (0.552, 0.1312), (0.5121, 0.1533), (0.471, 0.1729), (0.4287, 0.1899)],
      plot d w h [(0.7139, 0.1713), (0.6696, 0.1753), (0.6256, 0.1825), (0.5823, 0.1929), (0.5399, 0.2065), (0.4986, 0.2231), (0.4586, 0.2427)]
    ]
interpBas TrianguloVioleta d w h = trianguloVioleta d w h
interpBas F1 d w h = interpFigura1 d w h
interpBas F2 d w h = interpFigura2 d w h
interpBas F3 d w h = interpFigura3 d w h
interpBas F4 d w h = interpFigura4 d w h
interpBas Prueba d w h = interpFiguraPrueba d w h

-- El dibujo u.
dibujoU :: Dibujo Escher -> Dibujo Escher
dibujoU fish = Encimar (Encimar fish2 $ Rotar fish2) (Encimar (r180 fish2) (r270 fish2))
  where
    fish2 = Espejar $ Rotar45 fish

-- El dibujo t.
dibujoT :: Dibujo Escher -> Dibujo Escher
dibujoT fish = Encimar fish $ Encimar fish2 fish3
  where
    fish2 = Espejar $ Rotar45 fish
    fish3 = r270 fish2

-- Esquina con nivel de detalle en base a la figura p.
esquina :: Int -> Dibujo Escher -> Dibujo Escher
esquina 0 _ = vacia
esquina n p = cuarteto (esquina (n - 1) p) (lado (n - 1) p) (Rotar $ lado (n - 1) p) u
  where
    u = dibujoU p

-- Lado con nivel de detalle.
lado :: Int -> Dibujo Escher -> Dibujo Escher
lado 0 _ = vacia
lado n p = cuarteto (lado (n - 1) p) (lado (n - 1) p) (Rotar t) t
  where
    t = dibujoT p

-- Por suerte no tenemos que poner el tipo!
noneto :: Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a
noneto p q r s t u v w x =
  Apilar
    1
    2
    (Juntar 1 2 p (Juntar 1 1 q r))
    (Apilar 1 1 (Juntar 1 2 s (Juntar 1 1 t u)) (Juntar 1 2 v (Juntar 1 1 w x)))

-- El dibujo de Escher:
escher :: Int -> Escher -> Dibujo Escher
-- escher _ Prueba = Basica Prueba
escher n p = noneto e l (r270 e) (Rotar l) u (r270 l) (Rotar e) (r180 l) (r180 e)
  where
    e = esquina n $ Basica p
    l = lado n $ Basica p
    u = dibujoU $ Basica p

